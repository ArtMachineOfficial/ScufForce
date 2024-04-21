// Cristian Pop - https://boxophobic.com/

using UnityEngine;
using Boxophobic.StyledGUI;
using UnityEngine.Rendering;
using System.Collections.Generic;

#if UNITY_EDITOR
using UnityEditor;
#endif

namespace TheVegetationEngine
{
    [HelpURL("https://docs.google.com/document/d/145JOVlJ1tE-WODW45YoJ6Ixg23mFc56EnB_8Tbwloz8/edit#heading=h.a39m1w5ouu94")]
    [ExecuteInEditMode]
    [AddComponentMenu("BOXOPHOBIC/The Vegetation Engine/TVE Global Volume")]
    public class TVEGlobalVolume : StyledMonoBehaviour
    {
        [StyledBanner(0.890f, 0.745f, 0.309f, "Global Volume")]
        public bool styledBanner;

        [StyledCategory("Camera Settings", 5, 10)]
        public bool cameraCat;

        [StyledMessage("Error", "Main Camera not found! Make sure you have a main camera with Main Camera tag in your scene! Particle elements updating will be skipped without it. Enter play mode to update the status!", 0, 10)]
        public bool styledCameraMessaage = false;

        [Tooltip("Sets the main camera used for scene rendering.")]
        public Camera mainCamera;

        [StyledCategory("Render Settings")]
        public bool textureCat;

        [Tooltip("Use the Seasons slider to control the element properties when the element is set to Seasons mode.")]
        [StyledRangeOptions("Texture Scale", 0, 2, new string[] { "Small", "0.5x", "Default", "1.5x", "Double" })]
        public float renderScale = 1f;

        [StyledCategory("Elements Settings")]
        public bool elementsCat;

#if UNITY_EDITOR
        [StyledMessage("Info", "Realtime Sorting is not supported for elements with GPU Instanceing enabled!", 0, 10)]
        public bool styledSortingMessaage = true;
#endif

        [Tooltip("Controls the elements visibility in scene and game view.")]
        public TVEElementsVisibilityMode elementsVisibility = TVEElementsVisibilityMode.HiddenAtRuntime;
        [HideInInspector]
        public TVEElementsVisibilityMode elementsVisibilityOld = TVEElementsVisibilityMode.HiddenAtRuntime;
        [Tooltip("Controls the elements sorting by element position. Always on in edit mode.")]
        public TVEElementsSortingMode elementsSorting = TVEElementsSortingMode.SortInEditMode;
        [Tooltip("Controls the elements fading at the volume edges if the Enable Volume Edge Fading support is toggled on the element material.")]
        [Range(0.0f, 1.0f)]
        public float elementsEdgeFade = 0.75f;

        [StyledCategory("Advanced Settings")]
        public bool dataCat;

        [Tooltip("Render mode used for Colors elements rendering.")]
        public TVEVolumeData renderColors = new TVEVolumeData();

        [Tooltip("Render mode used for Extras elements rendering.")]
        public TVEVolumeData renderExtras = new TVEVolumeData();

        [Tooltip("Render mode used for Motion elements rendering.")]
        public TVEVolumeData renderMotion = new TVEVolumeData();

        [Tooltip("Render mode used for Size elements rendering.")]
        public TVEVolumeData renderVertex = new TVEVolumeData();

        [System.NonSerialized]
        public List<TVERenderData> renderDataSet = new List<TVERenderData>();

        [System.NonSerialized]
        public List<TVEElementData> renderElements = new List<TVEElementData>();

        [System.NonSerialized]
        public List<TVEInstancedData> renderInstanced = new List<TVEInstancedData>();

        [StyledSpace(10)]
        public bool styledSpace0;

        [System.NonSerialized]
        public TVERenderData colorsData = new TVERenderData();
        [System.NonSerialized]
        public TVERenderData extrasData = new TVERenderData();
        [System.NonSerialized]
        public TVERenderData motionData = new TVERenderData();
        [System.NonSerialized]
        public TVERenderData vertexData = new TVERenderData();

        MaterialPropertyBlock propertyBlock;
        int propertyBlockArrCount = 0;

        Matrix4x4 projectionMatrix;
        Matrix4x4 modelViewMatrix = new Matrix4x4
        (
            new Vector4(1f, 0f, 0f, 0f),
            new Vector4(0f, 0f, -1f, 0f),
            new Vector4(0f, -1f, 0f, 0f),
            new Vector4(0f, 0f, 0f, 1f)
        );

        void Start()
        {
            gameObject.name = "Global Volume";
            gameObject.transform.SetSiblingIndex(3);

            CreateRenderBuffers();

            SortElementObjects();
            SetElementsVisibility();
        }

        void LateUpdate()
        {
            if (mainCamera == null)
            {
                mainCamera = Camera.main;
            }

            if (propertyBlock == null)
            {
                propertyBlock = new MaterialPropertyBlock();
            }

            if (elementsSorting == TVEElementsSortingMode.SortAtRuntime)
            {
                SortElementObjects();
            }

            if (elementsVisibilityOld != elementsVisibility)
            {
                SetElementsVisibility();

                elementsVisibilityOld = elementsVisibility;
            }

            UpdateRenderBuffers();
            ExecuteRenderBuffers();

            SetGlobalShaderParameters();

#if UNITY_EDITOR
            if (elementsSorting == TVEElementsSortingMode.SortAtRuntime)
            {
                styledSortingMessaage = true;
            }
            else
            {
                styledSortingMessaage = false;
            }

            if (mainCamera == null)
            {
                styledCameraMessaage = true;
            }
            else
            {
                styledCameraMessaage = false;
            }
#endif
        }

        public void InitVolumeRendering()
        {
            renderDataSet = new List<TVERenderData>();
            renderElements = new List<TVEElementData>();
            renderInstanced = new List<TVEInstancedData>();

            InitRenderData(colorsData, "TVE_Colors", "ColorsElement");
            InitRenderData(extrasData, "TVE_Extras", "ExtrasElement");
            InitRenderData(motionData, "TVE_Motion", "MotionElement");
            InitRenderData(vertexData, "TVE_Vertex", "VertexElement");

            UpdateRenderData(colorsData, renderColors);
            UpdateRenderData(extrasData, renderExtras);
            UpdateRenderData(motionData, renderMotion);
            UpdateRenderData(vertexData, renderVertex);

            renderDataSet.Add(colorsData);
            renderDataSet.Add(extrasData);
            renderDataSet.Add(motionData);
            renderDataSet.Add(vertexData);
        }

        void InitRenderData(TVERenderData renderData, string rendererName, string materialTag)
        {
            renderData.renderName = rendererName;
            renderData.texName = rendererName + "Tex";
            renderData.texParams = rendererName + "Params";
            renderData.texCoords = rendererName + "Coords";
            renderData.texLayers = rendererName + "Layers";
            renderData.texUsage = rendererName + "Usage";

            renderData.materialTag = materialTag;
            renderData.materialPass = 0;

            renderData.renderDataID = materialTag.GetHashCode();
            //renderData.textureWidth = 1024;
            //renderData.textureHeight = 1024;
            renderData.bufferSize = -1;
            renderData.useRenderTextureArray = true;
            renderData.texureFormat = RenderTextureFormat.ARGBHalf;
        }

        void UpdateRenderData(TVERenderData renderData, TVEVolumeData volumeData)
        {
            if (volumeData.renderMode == TVEVolumeDataMode.Off)
            {
                renderData.renderMode = TVERenderDataMode.Off;
            }
            else if (volumeData.renderMode == TVEVolumeDataMode.InsideGlobalVolume)
            {
                renderData.renderMode = TVERenderDataMode.InsideGlobalVolume;
            }
            else if (volumeData.renderMode == TVEVolumeDataMode.FollowCameraVolume)
            {
                renderData.renderMode = TVERenderDataMode.FollowCameraVolume;
            }

            renderData.textureWidth = volumeData.textureWidth;
            renderData.textureHeight = volumeData.textureHeight;
            renderData.textureScale = volumeData.textureScale;

            renderData.volumeScale = volumeData.volumeScale;
            renderData.volumeOffset = volumeData.volumeOffset;
        }

        void CreateRenderBuffers()
        {
            for (int i = 0; i < renderDataSet.Count; i++)
            {
                var renderData = renderDataSet[i];

                if (renderData == null)
                {
                    continue;
                }

                CreateRenderBuffer(renderData);
            }
        }

        public void CreateRenderBuffer(TVERenderData renderData)
        {
            if (renderData.texObject != null)
            {
                renderData.texObject.Release();
            }

            if (renderData.commandBuffers != null)
            {
                for (int b = 0; b < renderData.commandBuffers.Length; b++)
                {
                    renderData.commandBuffers[b].Clear();
                }
            }

            renderData.bufferUsage = new float[9];
            Shader.SetGlobalFloatArray(renderData.texUsage, renderData.bufferUsage);

            if (renderData.renderMode != TVERenderDataMode.Off && renderData.bufferSize > -1)
            {
                int texWidth;
                int texHeight;

                if (renderData.useScreenResolution)
                {
                    texWidth = Mathf.Max(Mathf.RoundToInt(Screen.currentResolution.width * renderData.textureScale * renderScale), 32);
                    texHeight = Mathf.Max(Mathf.RoundToInt(Screen.currentResolution.height * renderData.textureScale * renderScale), 32);
                }
                else
                {
                    texWidth = Mathf.Max(Mathf.RoundToInt(renderData.textureWidth * renderData.textureScale * renderScale), 32);
                    texHeight = Mathf.Max(Mathf.RoundToInt(renderData.textureHeight * renderData.textureScale * renderScale), 32);
                }

                renderData.texObject = new RenderTexture(texWidth, texHeight, 0, renderData.texureFormat, 0);

                if (renderData.useRenderTextureArray)
                {
                    renderData.texObject.dimension = TextureDimension.Tex2DArray;
                }
                else
                {
                    renderData.texObject.dimension = TextureDimension.Tex2D;
                }

                renderData.texObject.volumeDepth = renderData.bufferSize + 1;
                renderData.texObject.name = renderData.texName;
                renderData.texObject.wrapMode = TextureWrapMode.Clamp;

                renderData.commandBuffers = new CommandBuffer[renderData.bufferSize + 1];

                for (int b = 0; b < renderData.commandBuffers.Length; b++)
                {
                    renderData.commandBuffers[b] = new CommandBuffer();
                    renderData.commandBuffers[b].name = renderData.texName;
                }

                Shader.SetGlobalTexture(renderData.texName, renderData.texObject);
                Shader.SetGlobalInt(renderData.texLayers, renderData.bufferSize + 1);
            }
            else
            {
                if (renderData.useRenderTextureArray)
                {
                    Shader.SetGlobalTexture(renderData.texName, Resources.Load<Texture2DArray>("Internal ArrayTex"));
                }
                else
                {
                    Shader.SetGlobalTexture(renderData.texName, Texture2D.whiteTexture);
                }

                Shader.SetGlobalInt(renderData.texLayers, 1);
            }
        }

        void UpdateRenderBuffers()
        {
            for (int d = 0; d < renderDataSet.Count; d++)
            {
                var renderData = renderDataSet[d];

                if (renderData == null || renderData.commandBuffers == null || renderData.renderMode == TVERenderDataMode.Off || !renderData.isRendering)
                {
                    continue;
                }

                var bufferParams = Shader.GetGlobalVector(renderData.texParams);

                for (int b = 0; b < renderData.commandBuffers.Length; b++)
                {
                    renderData.commandBuffers[b].Clear();
                    renderData.commandBuffers[b].ClearRenderTarget(true, true, bufferParams);
                    renderData.bufferUsage[b] = 0;

                    for (int e = 0; e < renderElements.Count; e++)
                    {
                        var elementData = renderElements[e];

                        if (renderData.renderDataID == elementData.renderDataID)
                        {
                            if (elementData.layers[b] == 1)
                            {
                                Camera.SetupCurrent(mainCamera);

                                propertyBlock.SetVector("_ElementParams", elementData.element.elementParams);
                                elementData.element.elementRenderer.SetPropertyBlock(propertyBlock);

                                renderData.commandBuffers[b].DrawRenderer(elementData.element.elementRenderer, elementData.element.elementMaterial, 0, renderData.materialPass);
                                renderData.bufferUsage[b] = 1;
                            }
                        }

                    }

                    for (int e = 0; e < renderInstanced.Count; e++)
                    {
                        var elementData = renderInstanced[e];

                        if (!elementData.material.enableInstancing)
                        {
                            continue;
                        }

                        if (elementData.renderers.Count == 0)
                        {
                            continue;
                        }

                        if (renderData.renderDataID == elementData.renderDataID)
                        {
                            if (elementData.layers[b] == 1)
                            {
                                var elementsCount = elementData.renderers.Count;

                                if (elementData.matrices == null || elementData.matrices.Length != elementsCount)
                                {
                                    elementData.matrices = new Matrix4x4[elementsCount];
                                    elementData.parameters = new Vector4[elementsCount];
                                }

                                //Matrix4x4[] matrix4X4s = new Matrix4x4[elementData.renderers.Count];
                                //float[] fadeValues = new float[elementData.renderers.Count];

                                for (int p = 0; p < elementsCount; p++)
                                {
                                    elementData.matrices[p] = elementData.renderers[p].localToWorldMatrix;
                                    elementData.parameters[p] = elementData.elements[p].elementParams;
                                }

                                if (elementsCount != propertyBlockArrCount)
                                {
                                    elementData.propertyBlock = new MaterialPropertyBlock();
                                    propertyBlockArrCount = elementsCount;
                                }

                                elementData.propertyBlock.SetVectorArray("_ElementParams", elementData.parameters);

                                renderData.commandBuffers[b].DrawMeshInstanced(elementData.mesh, 0, elementData.material, renderData.materialPass, elementData.matrices, elementsCount, elementData.propertyBlock);
                                renderData.bufferUsage[b] = 1;
                            }
                        }
                    }
                }

                Shader.SetGlobalFloatArray(renderData.texUsage, renderData.bufferUsage);

                //for (int u = 0; u < renderData.bufferUsage.Length; u++)
                //{
                //    Debug.Log(renderData.texUsage + " Index: " + u + " Usage: " + renderData.bufferUsage[u]);
                //}
            }
        }

        void ExecuteRenderBuffers()
        {
            for (int i = 0; i < renderDataSet.Count; i++)
            {
                var renderData = renderDataSet[i];

                if (renderData == null || renderData.commandBuffers == null || renderData.renderMode == TVERenderDataMode.Off || !renderData.isRendering)
                {
                    continue;
                }

                GL.PushMatrix();
                RenderTexture currentRenderTexture = RenderTexture.active;

                var position = Vector3.zero;
                var scale = Vector3.zero;

                if (renderData.renderMode == TVERenderDataMode.FollowCameraVolume)
                {
                    if (mainCamera != null)
                    {
                        var offsetX = renderData.volumeScale.x / 2 * mainCamera.transform.forward.x * renderData.volumeOffset;
                        var offsetZ = renderData.volumeScale.z / 2 * mainCamera.transform.forward.z * renderData.volumeOffset;
                        var cameraPos = mainCamera.transform.position + new Vector3(offsetX, 1, offsetZ);

                        float gridX = renderData.volumeScale.x / renderData.textureWidth;
                        float gridZ = renderData.volumeScale.z / renderData.textureHeight;
                        float posX = Mathf.Round(cameraPos.x / gridX) * gridX;
                        float posZ = Mathf.Round(cameraPos.z / gridZ) * gridZ;

                        position = new Vector3(posX, mainCamera.transform.position.y, posZ);
                        scale = new Vector3(renderData.volumeScale.x, renderData.volumeScale.y, renderData.volumeScale.z);
                    }
                }
                else
                {
                    position = gameObject.transform.position;
                    scale = gameObject.transform.lossyScale;
                }

                if (renderData.renderMode == TVERenderDataMode.ScreenSpaceProjection)
                {
                    if (mainCamera != null)
                    {
                        projectionMatrix = mainCamera.projectionMatrix;
                    }
                }
                else
                {
                    GL.modelview = modelViewMatrix;

                    projectionMatrix = Matrix4x4.Ortho(-scale.x / 2 + position.x,
                                                        scale.x / 2 + position.x,
                                                        scale.z / 2 - position.z,
                                                       -scale.z / 2 - position.z,
                                                       -scale.y / 2 + position.y,
                                                        scale.y / 2 + position.y);
                }

                var x = 1 / scale.x;
                var y = 1 / scale.z;
                var z = 1 / scale.x * position.x - 0.5f;
                var w = 1 / scale.z * position.z - 0.5f;
                var coords = new Vector4(x, y, -z, -w);

                renderData.internalPosition = position;
                renderData.internalScale = scale;

                Shader.SetGlobalVector(renderData.texCoords, coords);

                GL.LoadProjectionMatrix(projectionMatrix);

                for (int b = 0; b < renderData.commandBuffers.Length; b++)
                {
                    Graphics.SetRenderTarget(renderData.texObject, 0, CubemapFace.Unknown, b);
                    Graphics.ExecuteCommandBuffer(renderData.commandBuffers[b]);
                }

                RenderTexture.active = currentRenderTexture;
                GL.PopMatrix();
            }
        }

        void SetGlobalShaderParameters()
        {
            Shader.SetGlobalFloat("TVE_ElementsFadeValue", elementsEdgeFade);
        }

        public void SortElementObjects()
        {
            for (int i = 0; i < renderElements.Count - 1; i++)
            {
                for (int j = 0; j < renderElements.Count - 1; j++)
                {
                    if (renderElements[j] != null && renderElements[j].element.gameObject.transform.position.y > renderElements[j + 1].element.gameObject.transform.position.y)
                    {
                        var next = renderElements[j + 1];
                        renderElements[j + 1] = renderElements[j];
                        renderElements[j] = next;
                    }
                }
            }
        }

        void SetElementsVisibility()
        {
            if (elementsVisibility == TVEElementsVisibilityMode.AlwaysHidden)
            {
                DisableElementsVisibility();
            }
            else if (elementsVisibility == TVEElementsVisibilityMode.AlwaysVisible)
            {
                EnableElementsVisibility();
            }
            else if (elementsVisibility == TVEElementsVisibilityMode.HiddenAtRuntime)
            {
                if (Application.isPlaying)
                {
                    DisableElementsVisibility();
                }
                else
                {
                    EnableElementsVisibility();
                }
            }
        }

        void EnableElementsVisibility()
        {
            for (int i = 0; i < renderElements.Count; i++)
            {
                var elementData = renderElements[i];

                if (elementData != null && elementData.useGlobalVolumeVisibility)
                {
                    elementData.element.elementRenderer.enabled = true;
                }
            }
        }

        void DisableElementsVisibility()
        {
            for (int i = 0; i < renderElements.Count; i++)
            {
                var elementData = renderElements[i];

                if (elementData != null && elementData.useGlobalVolumeVisibility)
                {
                    elementData.element.elementRenderer.enabled = false;
                }
            }
        }

#if UNITY_EDITOR        
        void OnDrawGizmosSelected()
        {
            Gizmos.color = Color.black;
            Gizmos.DrawWireCube(transform.position, transform.lossyScale);
        }

        void OnDrawGizmos()
        {
            Gizmos.color = new Color(0.0f, 0.0f, 0.0f, 0.1f);
            Gizmos.DrawWireCube(transform.position, transform.lossyScale);

            if (mainCamera != null)
            {
                if (Selection.Contains(mainCamera.gameObject))
                {
                    Gizmos.color = Color.black;
                }
            }

            for (int i = 0; i < renderDataSet.Count; i++)
            {
                var renderData = renderDataSet[i];

                if (renderData == null || renderData.renderMode == TVERenderDataMode.Off)
                {
                    continue;
                }

                if (renderData.renderMode == TVERenderDataMode.FollowCameraVolume)
                {
                    var offsetX = renderData.volumeScale.x / 2 * mainCamera.transform.forward.x * renderData.volumeOffset;
                    var offsetZ = renderData.volumeScale.z / 2 * mainCamera.transform.forward.z * renderData.volumeOffset;
                    var cameraPos = mainCamera.transform.position + new Vector3(offsetX, 1, offsetZ);

                    float gridX = renderData.volumeScale.x / renderData.textureWidth;
                    float gridZ = renderData.volumeScale.z / renderData.textureHeight;
                    float posX = Mathf.Round(cameraPos.x / gridX) * gridX;
                    float posZ = Mathf.Round(cameraPos.z / gridZ) * gridZ;

                    var volumePosition = new Vector3(posX, mainCamera.transform.position.y, posZ);
                    var volumeScale = new Vector3(renderData.volumeScale.x, renderData.volumeScale.y, renderData.volumeScale.z);

                    Gizmos.DrawWireCube(volumePosition, volumeScale);
                }
            }
        }

        void OnValidate()
        {
            if (renderDataSet == null)
            {
                return;
            }

            if (colorsData == null || extrasData == null || motionData == null || vertexData == null)
            {
                return;
            }

            UpdateRenderData(colorsData, renderColors);
            UpdateRenderData(extrasData, renderExtras);
            UpdateRenderData(motionData, renderMotion);
            UpdateRenderData(vertexData, renderVertex);

            CreateRenderBuffers();
        }
#endif
    }
}

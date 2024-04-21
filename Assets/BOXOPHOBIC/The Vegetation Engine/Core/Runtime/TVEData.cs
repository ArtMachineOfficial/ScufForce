// Cristian Pop - https://boxophobic.com/

using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Rendering;
#if UNITY_EDITOR
using UnityEditor;
#endif

namespace TheVegetationEngine
{
    public class TVEConstants
    {
        public const string ElementName = "Element";
        public const string ElementTypeTag = "ElementType";
        public const string ElementLayerMask = "_ElementLayerMask";
        public const string ElementDirectionMode = "_ElementDirectionMode";
        public const string ElementRaycastMode = "_ElementRaycastMode";
        public const string RaycastLayerMask = "_RaycastLayerMask";
        public const string RaycastDistanceEndValue = "_RaycastDistanceEndValue";
    }

    public enum TVEPropertyType
    {
        Texture = 0,
        Vector = 1,
        Value = 2,
    }

    public enum TVEElementsVisibilityMode
    {
        AlwaysHidden = 0,
        AlwaysVisible = 10,
        HiddenAtRuntime = 20,
    }

    public enum TVEElementsSortingMode
    {
        SortInEditMode = 0,
        SortAtRuntime = 10,
    }

    public enum TVEVolumeDataMode
    {
        Off = -1,
        InsideGlobalVolume = 10,
        FollowCameraVolume = 20,
    }

    public enum TVERenderDataMode
    {
        Off = -1,
        InsideGlobalVolume = 10,
        FollowCameraVolume = 20,
        ScreenSpaceProjection = 50,
    }

    public enum TVETerrainDataMode
    {
        None = -1,
        HeightTexture = 10,
        NormalTexture = 20,
        HolesTexture = 30,
    }

#if UNITY_EDITOR
    public enum TVEPrefabMode
    {
        Undefined = -1,
        Converted = 10,
        Supported = 20,
        Backup = 25,
        Unsupported = 30,
        ConvertedMissingBackup = 40,
        Collected = 50,
    }
#endif


#if UNITY_EDITOR
    [System.Serializable]
    public class TVEPathData
    {
        public string folder = "";
        public string name = "";
        public string GUID = "";
        public string suffix = "";
        public string type = "";
        public string extention = "";

        public TVEPathData()
        {

        }
    }

    [System.Serializable]
    public class TVEPrefabData
    {
        public string prefabPath = "";
        public GameObject gameObject;
        public TVEPrefabMode status;
        public string attributes = "";
        public bool isShared = false;
        public bool isNested = false;

        public TVEPrefabData()
        {

        }
    }

    [System.Serializable]
    public class TVETransformData
    {
        public Vector3 position = Vector3.zero;
        public Quaternion rotation = Quaternion.identity;
        public Vector3 scale = Vector3.one;

        public TVETransformData()
        {

        }
    }

    [System.Serializable]
    public class TVEGameObjectData
    {
        public GameObject gameObject;
        public MeshFilter meshFilter;
        public Mesh originalMesh;
        public Mesh instanceMesh;
        public List<MeshCollider> meshColliders = new List<MeshCollider>();
        public List<Mesh> originalColliders = new List<Mesh>();
        public List<Mesh> instanceColliders = new List<Mesh>();
        public MeshRenderer meshRenderer;
        public Material[] originalMaterials;
        public Material[] instanceMaterials;

        public TVEGameObjectData()
        {

        }
    }

    [System.Serializable]
    public class TVEMaterialData
    {
        public enum PropertyType
        {
            Value = 0,
            Range = 1,
            Vector = 2,
            Color = 3,
            Enum = 4,
            Toggle = 5,
            Space = 90,
            Category = 91,
            Message = 92,
        }

        public PropertyType type;
        public string prop;
        public string name;
        public float value;
        public float min;
        public float max;
        public bool snap;
        public Vector4 vector;
        public string file;
        public string options;
        public bool hdr;
        public bool space;
        public int spaceTop;
        public int spaceDown;
        public string category;
        public string message;
        public MessageType messageType = MessageType.Info;

        public TVEMaterialData(string prop)
        {
            type = PropertyType.Space;
            this.prop = prop;
            //this.valid = valid;
        }

        public TVEMaterialData(string prop, string category)
        {
            type = PropertyType.Category;
            this.prop = prop;
            this.category = category;
            //this.valid = valid;
        }

        public TVEMaterialData(string prop, string message, int spaceTop, int spaceDown, MessageType messageType)
        {
            type = PropertyType.Message;
            this.prop = prop;
            this.message = message;
            this.spaceTop = spaceTop;
            this.spaceDown = spaceDown;
            this.messageType = messageType;
        }

        public TVEMaterialData(string prop, string name, float value, bool snap, bool space)
        {
            type = PropertyType.Value;
            this.prop = prop;
            this.name = name;
            this.value = value;
            this.snap = snap;
            this.space = space;
        }

        public TVEMaterialData(string prop, string name, float value, int min, int max, bool snap, bool space)
        {
            type = PropertyType.Range;
            this.prop = prop;
            this.name = name;
            this.value = value;
            this.min = min;
            this.max = max;
            this.snap = snap;
            this.space = space;
        }

        public TVEMaterialData(string prop, string name, Vector4 vector, bool space)
        {
            type = PropertyType.Vector;
            this.prop = prop;
            this.name = name;
            this.vector = vector;
            this.space = space;
        }

        public TVEMaterialData(string prop, string name, Vector4 vector, bool hdr, bool space)
        {
            type = PropertyType.Color;
            this.prop = prop;
            this.name = name;
            this.vector = vector;
            this.hdr = hdr;
            this.space = space;
        }

        public TVEMaterialData(string prop, string name, float value, string options, bool space)
        {
            type = PropertyType.Enum;
            this.prop = prop;
            this.name = name;
            this.value = value;
            this.options = options;
            this.space = space;
        }

        public TVEMaterialData(string prop, string name, float value, string file, string options, bool space)
        {
            type = PropertyType.Enum;
            this.prop = prop;
            this.name = name;
            this.value = value;
            this.file = file;
            this.options = options;
            this.space = space;
        }

        public TVEMaterialData(string prop, string name, float value, bool space)
        {
            type = PropertyType.Toggle;
            this.prop = prop;
            this.name = name;
            this.value = value;
            this.space = space;
        }
    }

    [System.Serializable]
    public class TVEPackerData
    {
        public Material blitMaterial;
        public Mesh blitMesh;
        public Texture[] maskTextures;
        public int[] maskChannels;
        public int[] maskCoords;
        //int[] maskLayers;
        public int[] maskActions0;
        public int[] maskActions1;
        public int[] maskActions2;
        public bool saveAsSRGB = true;
        public bool saveAsDefault = true;
        public int transformSpace;

        public TVEPackerData()
        {

        }
    }

    public class TVEModelSettings
    {
        public bool requiresProcessing = false;
        public string meshPath;
        public bool isReadable = false;
        public bool keepQuads = false;
        public ModelImporterMeshCompression meshCompression;

        public TVEModelSettings()
        {

        }
    }

    public class TVETextureSettings
    {
        public string texturePath;
        public TextureImporterSettings textureSettings = new TextureImporterSettings();
        public TextureImporterCompression textureCompression;
        public int maxTextureSize;

        public TVETextureSettings()
        {

        }
    }

    public class TVEShaderSettings
    {
        public string shaderPath;
        public string renderEngine = "Unity Default Renderer";
        public string shaderModel = "Shader Model 4.5";

        public TVEShaderSettings()
        {

        }
    }
#endif

    [System.Serializable]
    public class TVEElementMaterialData
    {
        public Shader shader;
        public string shaderName = "";
        public List<TVEElementPropertyData> props;

        public TVEElementMaterialData()
        {

        }
    }

    [System.Serializable]
    public class TVEElementPropertyData
    {
        public TVEPropertyType type;
        public string prop;
        public Texture texture;
        public Vector4 vector;
        public float value;

        public TVEElementPropertyData()
        {

        }
    }

    [System.Serializable]
    public class TVEElementData
    {
        public TVEElement element;
        public int elementDataID = 0;
        public int instancedDataID = 0;
        public int renderDataID = 0;
        public List<int> layers;
        public bool useGlobalVolumeVisibility = true;

        public TVEElementData()
        {

        }
    }

    [System.Serializable]
    public class TVEInstancedData
    {
        public int instancedDataID = 0;
        public int renderDataID = 0;
        public List<int> layers;
        public Material material;
        public Mesh mesh;
        public List<TVEElement> elements = new List<TVEElement>();
        public List<Renderer> renderers = new List<Renderer>();
        public Matrix4x4[] matrices;
        public Vector4[] parameters;
        public MaterialPropertyBlock propertyBlock = new MaterialPropertyBlock();

        public TVEInstancedData()
        {

        }
    }

    [System.Serializable]
    public class TVERenderData
    {
        public TVERenderDataMode renderMode = TVERenderDataMode.InsideGlobalVolume;
        [Tooltip("The name used for the global shader parameters.")]
        public string renderName = "CustomRenderer";

        [Space(10)]
        [Tooltip("When enabled, the elements are rendered in realtime.")]
        public bool isRendering = true;

        [Space(10)]
        [Tooltip("Sets the render texture format.")]
        public RenderTextureFormat texureFormat = RenderTextureFormat.ARGBHalf;
        [Tooltip("Sets the render texture width.")]
        public int textureWidth = 1024;
        [Tooltip("Sets the render texture height.")]
        public int textureHeight = 1024;
        [Tooltip("Sets the render texture resolution scale.")]
        public float textureScale = 1;
        [ColorUsage(true, true)]
        [Tooltip("Sets render texture background color.")]
        public Color textureColor = Color.black;

        [Space(10)]
        [Tooltip("The material ElementType tag used for elements filtering.")]
        public string materialTag = "CustomElement";
        [Tooltip("Sets the shader rendering passes.")]
        public int materialPass = 0;

        [Space(10)]
        [Tooltip("The volume size when the rendering is set to follow the main camera.")]
        public Vector3 volumeScale = new Vector3(100, 100, 100);
        [Tooltip("Pushes the follow main camera volume in the camera forward direction to avoid rendering elements behind the camera.")]
        [Range(0, 1)]
        public float volumeOffset = 1.0f;

        [Space(10)]
        [Tooltip("When enabled, the render texture resolution will match the screen resolution.")]
        public bool useScreenResolution = false;
        [Tooltip("When enabled, the active color space will be applied to the background color.")]
        public bool useActiveColorSpace = true;
        [Tooltip("When enabled, the render texture will render elements based on their layer.")]
        public bool useRenderTextureArray = true;

        [System.NonSerialized]
        public int renderDataID = 0;
        [System.NonSerialized]
        public int bufferSize = 0;
        [System.NonSerialized]
        public float[] bufferUsage;
        [System.NonSerialized]
        public RenderTexture texObject;
        [System.NonSerialized]
        public CommandBuffer[] commandBuffers;
        [System.NonSerialized]
        public Vector3 internalPosition;
        [System.NonSerialized]
        public Vector3 internalScale;

        [HideInInspector]
        public string texName;
        [HideInInspector]
        public string texCoords;
        [HideInInspector]
        public string texParams;
        [HideInInspector]
        public string texLayers;
        [HideInInspector]
        public string texUsage;

        public TVERenderData()
        {

        }
    }

    [System.Serializable]
    public class TVEVolumeData
    {
        public TVEVolumeDataMode renderMode = TVEVolumeDataMode.InsideGlobalVolume;

        [Tooltip("Sets the render texture scale.")]
        [Range(0, 2)]
        public float textureScale = 1;
        [Tooltip("Sets the render texture width.")]
        public int textureWidth = 1024;
        [Tooltip("Sets the render texture height.")]
        public int textureHeight = 1024;

        [Tooltip("The volume size when the rendering is set to follow the main camera.")]
        public Vector3 volumeScale = new Vector3(100, 100, 100);
        [Tooltip("Pushes the follow main camera volume in the camera forward direction to avoid rendering elements behind the camera.")]
        [Range(0, 1)]
        public float volumeOffset = 1.0f;

        public TVEVolumeData()
        {

        }
    }

    [System.Serializable]
    public class TVEMeshData
    {
        public Mesh mesh;
        public List<Vector3> vertices;
        public List<Color> colors;
        public List<Vector3> normals;
        public List<Vector4> tangents;
        public List<Vector4> UV0;
        public List<Vector4> UV2;
        public List<Vector4> UV4;

        public TVEMeshData()
        {

        }
    }

    [System.Serializable]
    public class TVEModelData
    {
        public Mesh mesh;
        public List<float> variationMask;
        public List<float> occlusionMask;
        public List<float> detailMask;
        public List<float> heightMask;
        public List<Vector2> detailCoord;
        public List<float> motion2Mask;
        public List<float> motion3Mask;
        public List<Vector3> pivotPositions;

        public TVEModelData()
        {

        }
    }
}
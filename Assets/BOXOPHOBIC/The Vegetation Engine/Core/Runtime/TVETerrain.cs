// Cristian Pop - https://boxophobic.com/

using UnityEngine;
using UnityEditor;
using Boxophobic.StyledGUI;

namespace TheVegetationEngine
{
#if UNITY_EDITOR
    [HelpURL("https://docs.google.com/document/d/145JOVlJ1tE-WODW45YoJ6Ixg23mFc56EnB_8Tbwloz8/edit#heading=h.q4fstlrr3cw4")]
    [ExecuteInEditMode]
    [AddComponentMenu("BOXOPHOBIC/The Vegetation Engine/TVE Terrain")]
#endif
    public class TVETerrain : StyledMonoBehaviour
    {
        [StyledBanner(0.890f, 0.745f, 0.309f, "Terrain")]
        public bool styledBanner;

        public bool syncTerrainData = false;

        Terrain terrain;
        MaterialPropertyBlock materialPropertyBlock;

        [StyledSpace(5)]
        public bool styledSpace0;

        void OnEnable()
        {
            InitializeTerrain();
        }

        void Start()
        {
            CopyTerrainDataToMaterial();
        }

#if UNITY_EDITOR
        void Update()
        {
            if (Selection.Contains(gameObject) || syncTerrainData)
            {
                CopyTerrainDataToMaterial();
            }
        }
#endif

        void InitializeTerrain()
        {
            terrain = GetComponent<Terrain>();
        }

        void CopyTerrainDataToMaterial()
        {
            if (materialPropertyBlock == null)
            {
                materialPropertyBlock = new MaterialPropertyBlock();
            }

            var holesTexture = terrain.terrainData.holesTexture;

            if (holesTexture != null)
            {
                materialPropertyBlock.SetTexture("_HolesTex", holesTexture);
            }

            for (int i = 0; i < terrain.terrainData.alphamapTextures.Length; i++)
            {
                var id = i + 1;
                var texture = terrain.terrainData.alphamapTextures[i];

                if (texture != null)
                {
                    materialPropertyBlock.SetTexture("_ControlTex" + id, texture);
                }
            }

            for (int i = 0; i < terrain.terrainData.terrainLayers.Length; i++)
            {
                var id = i + 1;
                var layer = terrain.terrainData.terrainLayers[i];

                if (layer.diffuseTexture != null)
                {
                    materialPropertyBlock.SetTexture("_AlbedoTex" + id, layer.diffuseTexture);
                }

                if (layer.normalMapTexture != null)
                {
                    materialPropertyBlock.SetTexture("_NormalTex" + id, layer.normalMapTexture);
                }

                if (layer.maskMapTexture != null)
                {
                    materialPropertyBlock.SetTexture("_MaskTex" + id, layer.maskMapTexture);
                }

                materialPropertyBlock.SetVector("_MaskMin" + id, layer.maskMapRemapMin);
                materialPropertyBlock.SetVector("_MaskMax" + id, layer.maskMapRemapMax);
                materialPropertyBlock.SetVector("_SpecularColor" + id, layer.specular);
                materialPropertyBlock.SetFloat("_NormalValue" + id, layer.normalScale);
                materialPropertyBlock.SetFloat("_MetallicValue" + id, layer.metallic);
                materialPropertyBlock.SetFloat("_SmoothnessValue" + id, layer.smoothness);

                materialPropertyBlock.SetVector("_Coords" + id, new Vector4(1 / layer.tileSize.x, 1 / layer.tileSize.y, -layer.tileOffset.x, -layer.tileOffset.y));
            }

            terrain.SetSplatMaterialPropertyBlock(materialPropertyBlock);
        }

#if UNITY_EDITOR
        void OnValidate()
        {
            InitializeTerrain();
        }
#endif
    }
}



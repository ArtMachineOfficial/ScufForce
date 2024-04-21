// Cristian Pop - https://boxophobic.com/

using UnityEngine;
using UnityEditor;
using System.Collections.Generic;
using Boxophobic.StyledGUI;
using Boxophobic.Utils;
using System.IO;
using System.Linq;
using System.Globalization;
using UnityEditor.SceneManagement;

namespace TheVegetationEngine
{
    public class TVEPrefabConverter : EditorWindow
    {
        const int GUI_SPACE_SMALL = 5;
        const int GUI_SELECTION_HEIGHT = 24;
        const int GUI_SQUARE_BUTTON_WIDTH = 20;
        const int GUI_SQUARE_BUTTON_HEIGHT = 18;
        float GUI_HALF_EDITOR_WIDTH = 200;

        const string PREFABS_DATA_PATH = "/Assets Data/Prefabs Data";
        const string SHARED_DATA_PATH = "/Assets Data/Shared Data";
        const string TEXTURE_DATA_PATH = "/Assets Data/Texture Data";

        string[] SourceMaskEnum = new string[]
        {
        "None", "Channel", "Procedural", "Texture", "3rd Party",
        };

        string[] SourceMaskMeshEnum = new string[]
        {
        "[0]  Vertex R", "[1]  Vertex G", "[2]  Vertex B", "[3]  Vertex A",
        "[4]  UV 0 X", "[5]  UV 0 Y", "[6]  UV 0 Z", "[7]  UV 0 W",
        "[8]  UV 2 X", "[9]  UV 2 Y", "[10]  UV 2 Z", "[11]  UV 2 W",
        "[12]  UV 3 X", "[13]  UV 3 Y", "[14]  UV 3 Z", "[16]  UV 3 W",
        "[16]  UV 4 X", "[17]  UV 4 Y", "[18]  UV 4 Z", "[19]  UV 4 W",
        };

        string[] SourceMaskProceduralEnum = new string[]
        {
        "[0]  Constant Black", "[1]  Constant White", "[2]  Random Element Variation", "[3]  Predictive Element Variation", "[4]  Height", "[5]  Sphere", "[6]  Cylinder", "[7]  Capsule",
        "[8]  Base To Top", "[9]  Bottom Projection", "[10]  Top Projection", "[11]  Height Offset (Low)", "[12]  Height Offset (Medium)", "[13]  Height Offset (High)",
        "[14]  Height Grass", "[15]  Sphere Plant", "[16]  Cylinder Tree", "[17]  Capsule Tree", "[18]  Normalized Pos X", "[19]  Normalized Pos Y", "[20]  Normalized Pos Z",
        "[21]  Diagonal UV0",
        };

        string[] SourceMask3rdPartyEnum = new string[]
        {
        "[0]  CTI Leaves Mask", "[1]  CTI Leaves Variation", "[2]  ST8 Leaves Mask", "[3]  NM Leaves Mask", "[4]  Nicrom Leaves Mask", "[5]  Nicrom Detail Mask",
        };

        string[] SourceFromTextureEnum = new string[]
        {
        "[0]  Channel R", "[1]  Channel G", "[2]  Channel B", "[3]  Channel A"
        };

        string[] SourceCoordEnum = new string[]
        {
        "None", "Channel", "Procedural", "3rd Party",
        };

        string[] SourceCoordMeshEnum = new string[]
        {
        "[0]  UV 0", "[1]  UV 2", "[2]  UV 3", "[3]  UV 4",
        };

        string[] SourceCoordProceduralEnum = new string[]
        {
        "[0]  Automatic", "[1]  Planar XZ", "[2]  Planar XY", "[3]  Planar ZY",
        };

        string[] SourceCoord3rdPartyEnum = new string[]
        {
        "[0]  NM Trunk Blend"
        };

        string[] SourcePivotsEnum = new string[]
        {
        "None", "Procedural",
        };

        string[] SourcePivotsProceduralEnum = new string[]
        {
        "[0]  Procedural Pivots",
        };

        string[] SourceNormalsEnum = new string[]
        {
        "From Mesh", "Procedural",
        };

        string[] SourceNormalsProceduralEnum = new string[]
        {
        "[0]  Recalculate Normals",
        "[1]  Flat Shading (Low)", "[2]  Flat Shading (Medium)", "[3]  Flat Shading (Full)",
        "[4]  Spherical Shading (Low)", "[5]  Spherical Shading (Medium)", "[6]  Spherical Shading (Full)",
        "[7]  Flat To Spherical Shading (Low)", "[8]  Flat To Spherical Shading (Medium)", "[9]  Flat To Spherical Shading (Full)",
        };

        string[] SourceBoundsEnum = new string[]
        {
        "From Mesh", "Procedural",
        };

        string[] SourceBoundsProceduralEnum = new string[]
        {
        "[0]  Expand Bounds (Small)", "[1]  Expand Bounds (Medium)", "[2]  Expand Bounds (Large)", "[3]  Expand Bounds (Conservative)",
        };

        string[] SourceActionEnum = new string[]
        {
        "None", "One Minus", "Negative", "Remap 0-1", "Power Of 2", "Multiply by Height",
        };

        string[] ReadWriteModeEnum = new string[]
        {
        "Mark Meshes As Non Readable", "Mark Meshes As Readable",
        };

        enum OutputMeshes
        {
            Off = 0,
            Default = 10,
            Custom = 20,
        }

        enum OutputMaterials
        {
            Off = 0,
            Default = 10,
        }

        enum OutputTextures
        {
            SaveTexturesAsPNG = 0,
            SaveTexturesAsTGA = 10,
        }

        enum OutputTransforms
        {
            UseOriginalTransforms = 0,
            TransformToWorldSpace = 10,
        }

        OutputMeshes outputMeshesIndex = OutputMeshes.Default;
        OutputMaterials outputMaterialsIndex = OutputMaterials.Default;
        OutputTextures outputTexturesIndex = OutputTextures.SaveTexturesAsPNG;
        OutputTransforms outputTransformsIndex = OutputTransforms.TransformToWorldSpace;
        string outputPipelines = "";
        string outputSuffix = "TVE";
        bool outputValid = true;
        int readWriteMode = 0;

        string infoTitle = "";
        string infoPreset = "";
        string infoStatus = "";
        string infoOnline = "";
        string infoMessage = "";
        string infoWarning = "";
        string infoError = "";

        int sourceVariation = 0;
        int optionVariation = 0;
        int actionVariation = 0;
        int coordVariation = 0;
        Texture2D textureVariation;
        List<Texture2D> textureVariationList;

        int sourceOcclusion = 0;
        int optionOcclusion = 0;
        int actionOcclusion = 0;
        int coordOcclusion = 0;
        Texture2D textureOcclusion;
        List<Texture2D> textureOcclusionList;

        int sourceDetail = 0;
        int optionDetail = 0;
        int actionDetail = 0;
        int coordDetail = 0;
        Texture2D textureDetail;
        List<Texture2D> textureDetailList;

        int sourceHeight = 0;
        int optionHeight = 0;
        int actionHeight = 0;
        int coordHeight = 0;
        Texture2D textureHeight;
        List<Texture2D> textureHeightList;

        int sourceMotion2 = 0;
        int optionMotion2 = 0;
        int actionMotion2 = 0;
        int coordMotion2 = 0;
        Texture2D textureMotion2;
        List<Texture2D> textureMotion2List;

        int sourceMotion3 = 0;
        int optionMotion3 = 0;
        int actionMotion3 = 0;
        int coordMotion3 = 0;
        Texture2D textureMotion3;
        List<Texture2D> textureMotion3List;

        int sourceMainCoord = 1;
        int optionMainCoord = 0;

        int sourceDetailCoord = 1;
        int optionDetailCoord = 0;

        int sourcePivots = 0;
        int optionPivots = 0;

        int sourceNormals = 0;
        int optionNormals = 0;

        int sourceBounds = 0;
        int optionBounds = 0;

        string collectDataFolder;
        string prefabDataFolder;
        string userFolder = "Assets/BOXOPHOBIC/User";

        List<TVEPrefabData> prefabObjects;
        int convertedPrefabCount;
        int supportedPrefabCount;
        int collectiblePrefabCount;
        //int unsupportedPrefabCount;
        int validPrefabCount;

        GameObject prefabObject;
        GameObject prefabInstance;
        GameObject prefabBackup;
        string prefabName;

        List<TVEGameObjectData> gameObjectsData;
        List<TVEModelSettings> uniqueMeshSettings;
        Vector4 maxBoundsInfo;

        int presetIndex = 0;
        int optionIndex = 0;
        bool presetAutoDetected = false;
        bool presetMixedValues = false;
        List<int> overrideIndices;
        List<bool> overrideGlobals;

        bool showAdvancedSettings = false;
        bool shareCommonMaterials = true;
        bool keepConvertedMaterials = false;
        bool keepConvertedMaterialsIsSet = false;
        bool keepPrefabSharing = false;
        bool hasOutputModifications = false;
        bool hasMeshModifications = false;

        string[] allPresetPaths;
        List<string> presetPaths;
        List<string> presetLines;
        List<string> overridePaths;
        List<string> detectLines;
        string[] PresetsEnum;
        string[] OptionsEnum;
        string[] OverridesEnum;

        Shader shaderBark;
        Shader shaderPlant;
        Shader shaderProp;

        List<bool> useMaterialLines;
        List<bool> useOptionLines;
        bool isValid = true;
        bool showSelection = true;
        float seed = 1;

        string renderPipeline;

        GUIStyle stylePopup;
        GUIStyle styleCenteredHelpBox;
        GUIStyle styleMiniToggleButton;
        Color bannerColor;
        string bannerText;
        static TVEPrefabConverter window;
        Vector2 scrollPosition = Vector2.zero;

        [MenuItem("Window/BOXOPHOBIC/The Vegetation Engine/Prefab Converter", false, 2000)]
        public static void ShowWindow()
        {
            window = GetWindow<TVEPrefabConverter>(false, "Prefab Converter", true);
            window.minSize = new Vector2(400, 280);
        }

        void OnEnable()
        {
            bannerColor = new Color(0.890f, 0.745f, 0.309f);
            bannerText = "Prefab Converter";

            if (TVEManager.Instance == null)
            {
                isValid = false;
            }

            string[] searchFolders = AssetDatabase.FindAssets("User");

            for (int i = 0; i < searchFolders.Length; i++)
            {
                if (AssetDatabase.GUIDToAssetPath(searchFolders[i]).EndsWith("User.pdf"))
                {
                    userFolder = AssetDatabase.GUIDToAssetPath(searchFolders[i]);
                    userFolder = userFolder.Replace("/User.pdf", "");
                    userFolder += "/The Vegetation Engine/";
                }
            }

            string sharing = SettingsUtils.LoadSettingsData(userFolder + "Converter Sharing.asset", "True");

            if (sharing == "True")
            {
                shareCommonMaterials = true;
            }
            else
            {
                shareCommonMaterials = false;
            }

            string pipeline = SettingsUtils.LoadSettingsData(userFolder + "/Pipeline.asset", "Standard");

            if (pipeline.Contains("Standard"))
            {
                renderPipeline = "Standard";
            }
            else if (pipeline.Contains("Universal"))
            {
                renderPipeline = "Universal";
            }
            else if (pipeline.Contains("High"))
            {
                renderPipeline = "HD";
            }

            int intSeed = UnityEngine.Random.Range(1, 99);
            float floatSeed = UnityEngine.Random.Range(0.1f, 0.9f);
            seed = intSeed + floatSeed;

            GetDefaultShaders();

            GetPresets();
            Initialize();
        }

        void OnDisable()
        {
            Shader.SetGlobalInt("TVE_ShowIcons", 0);
        }

        void OnDestroy()
        {
            Shader.SetGlobalInt("TVE_ShowIcons", 0);
        }

        void OnSelectionChange()
        {
            GetPrefabObjects();
            GetPrefabPresets();
            GetAllPresetInfo();

            Repaint();
        }

        void OnFocus()
        {
            GetPrefabObjects();
            GetPrefabPresets();
            GetAllPresetInfo();

            Repaint();
        }

        void Initialize()
        {
            overrideIndices = new List<int>();
            overrideGlobals = new List<bool>();

            GetPrefabObjects();
            GetGlobalOverrides();
            GetPrefabPresets();

            if (overrideIndices.Count == 0)
            {
                overrideIndices.Add(0);
                overrideGlobals.Add(false);
            }

            GetAllPresetInfo(true);
        }

        void OnGUI()
        {
            SetGUIStyles();

            Shader.SetGlobalInt("TVE_ShowIcons", 1);

            GUI_HALF_EDITOR_WIDTH = this.position.width / 2.0f - 24;

            StyledGUI.DrawWindowBanner(bannerColor, bannerText);

            GUILayout.BeginHorizontal();
            GUILayout.Space(15);

            GUILayout.BeginVertical();

            DrawMessage();

            if (isValid)
            {
                scrollPosition = GUILayout.BeginScrollView(scrollPosition, false, false, GUILayout.Width(this.position.width - 28), GUILayout.Height(this.position.height - 230));

                DrawPrefabObjects();

                if (validPrefabCount == 0)
                {
                    GUI.enabled = false;
                }

                DrawConversionSettings();
                DrawConversionButtons();

                GUILayout.EndScrollView();
            }

            GUILayout.EndVertical();

            GUILayout.Space(13);
            GUILayout.EndHorizontal();
        }

        void SetGUIStyles()
        {
            stylePopup = new GUIStyle(EditorStyles.popup)
            {
                alignment = TextAnchor.MiddleCenter
            };

            styleCenteredHelpBox = new GUIStyle(GUI.skin.GetStyle("HelpBox"))
            {
                richText = true,
                alignment = TextAnchor.MiddleCenter,
            };

            styleMiniToggleButton = new GUIStyle(GUI.skin.GetStyle("Button"))
            {
                richText = true,
                alignment = TextAnchor.MiddleCenter,
            };
        }

        void DrawMessage()
        {
            GUILayout.Space(-2);

            if (isValid && validPrefabCount > 0)
            {
                if (presetIndex != 0)
                {
                    var preset = "";
                    var status = "";

                    if (infoPreset != "")
                    {
                        preset = "\n" + infoPreset + " Please note, after conversion, material adjustments might be needed!" + "\n";
                    }

                    if (infoStatus != "")
                    {
                        status = "\n" + infoStatus + "\n";
                    }

                    if (GUILayout.Button("\n<size=14>" + infoTitle + "</size>\n"
                                        + preset
                                        + status
                                        , styleCenteredHelpBox))
                    {
                        Application.OpenURL(infoOnline);
                    }

                    if (infoError != "")
                    {
                        GUILayout.Space(10);
                        EditorGUILayout.HelpBox(infoError, MessageType.Error, true);
                    }
                    else
                    {
                        if (infoMessage != "")
                        {
                            GUILayout.Space(10);
                            EditorGUILayout.HelpBox(infoMessage, MessageType.Info, true);
                        }

                        if (infoWarning != "")
                        {
                            GUILayout.Space(10);
                            EditorGUILayout.HelpBox(infoWarning, MessageType.Warning, true);
                        }
                    }
                }
                else
                {
                    if (presetMixedValues)
                    {
                        GUILayout.Button("\n<size=14>Multiple conversion presets detected!</size>\n", styleCenteredHelpBox);
                    }
                    else
                    {
                        GUILayout.Button("\n<size=14>Choose a preset to convert the selected prefabs!</size>\n", styleCenteredHelpBox);
                    }
                }
            }
            else
            {
                if (isValid == false)
                {
                    GUILayout.Button("\n<size=14>The Vegetation Engine manager is missing from your scene!</size>\n", styleCenteredHelpBox);

                    GUILayout.Space(10);

                    if (GUILayout.Button("Create Scene Manager", GUILayout.Height(24)))
                    {
                        if (GameObject.Find("The Vegetation Engine") != null)
                        {
                            Debug.Log("<b>[The Vegetation Engine]</b> " + "The Vegetation Engine Manager is already set in your scene!");
                            isValid = true;
                            return;
                        }

                        GameObject manager = new GameObject();
                        manager.AddComponent<TVEManager>();
                        manager.name = "The Vegetation Engine";

                        UnityEditor.SceneManagement.EditorSceneManager.MarkSceneDirty(UnityEditor.SceneManagement.EditorSceneManager.GetActiveScene());

                        Debug.Log("<b>[The Vegetation Engine]</b> " + "The Vegetation Engine is set in the current scene!");

                        isValid = true;
                    }
                }
                else if (validPrefabCount == 0)
                {
                    GUILayout.Button("\n<size=14>Select one or multiple prefabs to get started!</size>\n", styleCenteredHelpBox);
                }
            }
        }

        void DrawPrefabObjects()
        {
            if (prefabObjects.Count > 0)
            {
                GUILayout.Space(10);

                if (showSelection)
                {
                    if (StyledButton("Hide Prefab Selection"))
                        showSelection = !showSelection;
                }
                else
                {
                    if (StyledButton("Show Prefab Selection"))
                        showSelection = !showSelection;
                }

                if (showSelection)
                {
                    for (int i = 0; i < prefabObjects.Count; i++)
                    {
                        StyledPrefab(prefabObjects[i]);
                    }
                }
            }
        }

        //void DrawPrefabCreation()
        //{
        //    if (unsupportedPrefabCount > 0)
        //    {
        //        GUILayout.Space(10);

        //        if (GUILayout.Button("Create Prefabs for Unsupported Assets", GUILayout.Height(24)))
        //        {
        //            for (int i = 0; i < prefabObjects.Count; i++)
        //            {
        //                var data = prefabObjects[i];

        //                if (data.status == TVEPrefabMode.Unsupported)
        //                {
        //                    prefabData = prefabObjects[i].gameObject;

        //                    var prefabInstance = Instantiate(prefabData);
        //                    var prefabPath = AssetDatabase.GetAssetPath(prefabData);
        //                    var prefabExtension = Path.GetExtension(prefabPath);
        //                    var prefabaAltPath = prefabPath.Replace(prefabExtension, " Prefab.prefab");

        //                    PrefabUtility.SaveAsPrefabAssetAndConnect(prefabInstance, prefabaAltPath, InteractionMode.AutomatedAction);

        //                    AssetDatabase.SaveAssets();
        //                    AssetDatabase.Refresh();

        //                    DestroyImmediate(prefabInstance);
        //                }
        //            }

        //            GetPrefabObjects();
        //        }
        //    }
        //}

        void DrawConversionSettings()
        {
            GUILayout.Space(10);

            EditorGUI.BeginChangeCheck();

            GUILayout.BeginHorizontal();

            presetIndex = StyledPresetPopup("Conversion Preset", "The preset used to convert the selected prefab or prefabs.", presetIndex, PresetsEnum);

            if (presetIndex != 0)
            {
                if (StyledMiniToggleButton("", "Select the preset file.", 12, false))
                {
                    EditorGUIUtility.PingObject(AssetDatabase.LoadAssetAtPath<UnityEngine.Object>(presetPaths[presetIndex]));
                }

                var lastRect = GUILayoutUtility.GetLastRect();
                var iconRect = new Rect(lastRect.x, lastRect.y - 1, GUI_SQUARE_BUTTON_WIDTH, GUI_SQUARE_BUTTON_WIDTH);
                GUI.Label(iconRect, EditorGUIUtility.IconContent("Preset.Context"));
            }

            GUILayout.EndHorizontal();

            if (EditorGUI.EndChangeCheck())
            {
                presetAutoDetected = false;

                GetAllPresetInfo(true);
            }

            if (presetIndex != 0 && OptionsEnum.Length > 1)
            {
                EditorGUI.BeginChangeCheck();

                GUILayout.BeginHorizontal();

                optionIndex = StyledPresetPopup("Conversion Option", "The preset used to convert the selected prefab or prefabs.", optionIndex, OptionsEnum);
                GUILayout.Label("", GUILayout.Width(GUI_SQUARE_BUTTON_WIDTH - 2));

                GUILayout.EndHorizontal();

                if (EditorGUI.EndChangeCheck())
                {
                    GetAllPresetInfo(false);
                }
            }

            if (presetIndex != 0)
            {
                EditorGUI.BeginChangeCheck();

                for (int i = 0; i < overrideIndices.Count; i++)
                {
                    GUILayout.BeginHorizontal();

                    overrideIndices[i] = StyledPresetPopup("Conversion Override", "Adds extra functionality over the currently used preset.", overrideIndices[i], OverridesEnum);

                    if (overrideIndices[i] == 0)
                    {
                        GUI.enabled = false;
                    }

                    overrideGlobals[i] = StyledMiniToggleButton("", "Set Override as global for future conversions.", 11, overrideGlobals[i]);

                    var lastRect = GUILayoutUtility.GetLastRect();
                    var iconRect = new Rect(lastRect.x - 1, lastRect.y - 1, GUI_SQUARE_BUTTON_WIDTH, GUI_SQUARE_BUTTON_WIDTH);
                    GUI.Label(iconRect, EditorGUIUtility.IconContent("InspectorLock"));

                    if (overrideIndices[i] == 0)
                    {
                        overrideGlobals[i] = false;
                    }

                    GUI.enabled = true;

                    GUILayout.EndHorizontal();
                }

                var overridesCount = overrideIndices.Count;

                if (overrideIndices[0] != 0 || overridesCount > 1)
                {
                    GUILayout.BeginHorizontal();

                    GUILayout.Label("");

                    if (overridesCount > 1)
                    {
                        if (GUILayout.Button(new GUIContent("-", "Remove the last override."), GUILayout.MaxWidth(GUI_SQUARE_BUTTON_WIDTH), GUILayout.MaxHeight(GUI_SQUARE_BUTTON_HEIGHT)))
                        {
                            overrideIndices.RemoveAt(overridesCount - 1);
                            overrideGlobals.RemoveAt(overridesCount - 1);
                        }
                    }

                    if (GUILayout.Button(new GUIContent("+", "Add a new override."), GUILayout.MaxWidth(GUI_SQUARE_BUTTON_WIDTH), GUILayout.MaxHeight(GUI_SQUARE_BUTTON_HEIGHT)))
                    {
                        overrideIndices.Add(0);
                        overrideGlobals.Add(false);
                    }

                    GUILayout.EndHorizontal();

                    if (EditorGUI.EndChangeCheck())
                    {
                        GetAllPresetInfo(false);
                        SaveGlobalOverrides();
                    }
                }
            }

            if (presetIndex != 0 && (supportedPrefabCount > 0 || convertedPrefabCount > 0))
            {
                GUILayout.Space(10);

                EditorGUI.BeginChangeCheck();

                GUILayout.BeginHorizontal();
                GUILayout.Label(new GUIContent("Share Common Materials", "When enabled, the converter will share the materials across multiple prefabs."), GUILayout.Width(GUI_HALF_EDITOR_WIDTH - 5));
                shareCommonMaterials = EditorGUILayout.Toggle(shareCommonMaterials);
                GUILayout.EndHorizontal();

                if (EditorGUI.EndChangeCheck())
                {
#if !THE_VEGETATION_ENGINE_DEVELOPMENT
                    SettingsUtils.SaveSettingsData(userFolder + "Converter Sharing.asset", shareCommonMaterials.ToString());
#endif
                }

                GUILayout.BeginHorizontal();
                GUILayout.Label("Show Advanced Settings", GUILayout.Width(GUI_HALF_EDITOR_WIDTH - 5));
                showAdvancedSettings = EditorGUILayout.Toggle(showAdvancedSettings);
                GUILayout.EndHorizontal();

                if (showAdvancedSettings)
                {
                    GUILayout.Space(10);
                    StyledGUI.DrawWindowCategory("Output Settings");
                    GUILayout.Space(10);

                    if (hasOutputModifications)
                    {
                        EditorGUILayout.HelpBox("The output settings have been overriden and they will not update when changing the preset or adding overrides!", MessageType.Info, true);
                        GUILayout.Space(10);
                    }

                    EditorGUI.BeginChangeCheck();

                    GUILayout.BeginHorizontal();
                    GUILayout.Label(new GUIContent("Output Meshes", "Mesh packing for the current preset."), GUILayout.Width(GUI_HALF_EDITOR_WIDTH - 5));
                    outputMeshesIndex = (OutputMeshes)EditorGUILayout.EnumPopup(outputMeshesIndex, stylePopup);
                    GUILayout.EndHorizontal();

                    GUILayout.BeginHorizontal();
                    GUILayout.Label(new GUIContent("Output Materials", "Material conversion for the current preset."), GUILayout.Width(GUI_HALF_EDITOR_WIDTH - 5));
                    outputMaterialsIndex = (OutputMaterials)EditorGUILayout.EnumPopup(outputMaterialsIndex, stylePopup);
                    GUILayout.EndHorizontal();

                    GUILayout.BeginHorizontal();
                    GUILayout.Label(new GUIContent("Output Textures", "Texture encoding for the current preset."), GUILayout.Width(GUI_HALF_EDITOR_WIDTH - 5));
                    outputTexturesIndex = (OutputTextures)EditorGUILayout.EnumPopup(outputTexturesIndex, stylePopup);
                    GUILayout.EndHorizontal();

                    GUILayout.BeginHorizontal();
                    GUILayout.Label(new GUIContent("Output Transforms", "Transform meshes to world space."), GUILayout.Width(GUI_HALF_EDITOR_WIDTH - 5));
                    outputTransformsIndex = (OutputTransforms)EditorGUILayout.EnumPopup(outputTransformsIndex, stylePopup);
                    GUILayout.EndHorizontal();

                    GUILayout.BeginHorizontal();
                    GUILayout.Label(new GUIContent("Output Suffix", "Suffix used when saving assets to disk."), GUILayout.Width(GUI_HALF_EDITOR_WIDTH - 5));
                    outputSuffix = EditorGUILayout.TextField(outputSuffix);
                    GUILayout.EndHorizontal();

                    if (EditorGUI.EndChangeCheck())
                    {
                        hasOutputModifications = true;
                    }

                    if (outputMeshesIndex == OutputMeshes.Default)
                    {
                        GUILayout.Space(10);
                        StyledGUI.DrawWindowCategory("Mesh Settings");
                        GUILayout.Space(10);

                        if (hasMeshModifications)
                        {
                            EditorGUILayout.HelpBox("The originalMesh settings have been overriden and they will not update when changing the preset or adding overrides!", MessageType.Info, true);
                            GUILayout.Space(10);
                        }

                        EditorGUI.BeginChangeCheck();

                        readWriteMode = StyledPopup("ReadWrite Mode", "Set meshes readable mode.", readWriteMode, ReadWriteModeEnum);

                        sourceBounds = StyledSourcePopup("Bounds", "Mesh vertex bounds override.", sourceBounds, SourceBoundsEnum);
                        optionBounds = StyledBoundsOptionEnum("Bounds", "", sourceBounds, optionBounds);

                        sourceNormals = StyledSourcePopup("Normals", "Mesh vertex normals override.", sourceNormals, SourceNormalsEnum);
                        optionNormals = StyledNormalsOptionEnum("Normals", "", sourceNormals, optionNormals);

                        GUILayout.Space(10);

                        sourceMainCoord = StyledSourcePopup("Main UVs", "Main UVs used for the main texture set. Stored in UV0.XY.", sourceMainCoord, SourceCoordEnum);
                        optionMainCoord = StyledCoordOptionEnum("Main UVs", "", sourceMainCoord, optionMainCoord);

                        sourceDetailCoord = StyledSourcePopup("Detail UVs", "Detail UVs used for layer blending for bark and props. Stored in UV2.ZW.", sourceDetailCoord, SourceCoordEnum);
                        optionDetailCoord = StyledCoordOptionEnum("Detail UVs", "", sourceDetailCoord, optionDetailCoord);

                        GUILayout.Space(10);

                        sourceVariation = StyledSourcePopup("Variation", "Variation mask used for wind animation and global effects. Stored in Vertex Red.", sourceVariation, SourceMaskEnum);
                        textureVariation = StyledTexture("Variation", "", sourceVariation, textureVariation);
                        optionVariation = StyledMaskOptionEnum("Variation", "", sourceVariation, optionVariation, false);
                        coordVariation = StyledTextureCoord("Variation", "", sourceVariation, coordVariation);
                        actionVariation = StyledActionOptionEnum("Variation", "", sourceVariation, actionVariation, true);

                        sourceOcclusion = StyledSourcePopup("Occlusion", "Vertex Occlusion mask used to add depth and light scattering mask. Stored in Vertex Green.", sourceOcclusion, SourceMaskEnum);
                        textureOcclusion = StyledTexture("Occlusion", "", sourceOcclusion, textureOcclusion);
                        optionOcclusion = StyledMaskOptionEnum("Occlusion", "", sourceOcclusion, optionOcclusion, false);
                        coordOcclusion = StyledTextureCoord("Occlsuion", "", sourceOcclusion, coordOcclusion);
                        actionOcclusion = StyledActionOptionEnum("Occlusion", "", sourceOcclusion, actionOcclusion, true);

                        sourceDetail = StyledSourcePopup("Detail Mask", "Detail mask used for layer blending for bark. Stored in Vertex Blue.", sourceDetail, SourceMaskEnum);
                        textureDetail = StyledTexture("Detail Mask", "", sourceDetail, textureDetail);
                        optionDetail = StyledMaskOptionEnum("Detail Mask", "", sourceDetail, optionDetail, false);
                        coordDetail = StyledTextureCoord("Detail Mask", "", sourceDetail, coordDetail);
                        actionDetail = StyledActionOptionEnum("Detail Mask", "", sourceDetail, actionDetail, true);

                        GUILayout.Space(10);

                        sourceHeight = StyledSourcePopup("Height Mask", "Multi mask used for bending motion, gradient colors for leaves and subsurface/overlay mask for grass. The default value is set to height. Stored in Vertex Alpha.", sourceHeight, SourceMaskEnum);
                        textureHeight = StyledTexture("Height Mask", "", sourceHeight, textureHeight);
                        optionHeight = StyledMaskOptionEnum("Height Mask", "", sourceHeight, optionHeight, false);
                        coordHeight = StyledTextureCoord("Height Mask", "", sourceHeight, coordHeight);
                        actionHeight = StyledActionOptionEnum("Height Mask", "", sourceHeight, actionHeight, true);

                        sourceMotion2 = StyledSourcePopup("Branch Mask", "Motion mask used for squash animations. Stored in UV0.Z as a packed mask.", sourceMotion2, SourceMaskEnum);
                        textureMotion2 = StyledTexture("Branch Mask", "", sourceMotion2, textureMotion2);
                        optionMotion2 = StyledMaskOptionEnum("Branch Mask", "", sourceMotion2, optionMotion2, false);
                        coordMotion2 = StyledTextureCoord("Branch Mask", "", sourceMotion2, coordMotion2);
                        actionMotion2 = StyledActionOptionEnum("Branch Mask", "", sourceMotion2, actionMotion2, true);

                        sourceMotion3 = StyledSourcePopup("Flutter Mask", "Motion mask used for flutter animation. Stored in UV0.Z as a packed mask.", sourceMotion3, SourceMaskEnum);
                        textureMotion3 = StyledTexture("Flutter Mask", "", sourceMotion3, textureMotion3);
                        optionMotion3 = StyledMaskOptionEnum("Flutter Mask", "", sourceMotion3, optionMotion3, false);
                        coordMotion3 = StyledTextureCoord("Flutter Mask", "", sourceMotion3, coordMotion3);
                        actionMotion3 = StyledActionOptionEnum("Flutter Mask", "", sourceMotion3, actionMotion3, true);

                        GUILayout.Space(10);

                        sourcePivots = StyledSourcePopup("Pivot Positions", "Pivots storing for grass when multiple grass blades are combined into a single originalMesh. Stored in UV4.XZY.", sourcePivots, SourcePivotsEnum);
                        optionPivots = StyledPivotsOptionEnum("Pivot Positions", "", sourcePivots, optionPivots);

                        GUILayout.Space(10);

                        if (EditorGUI.EndChangeCheck())
                        {
                            hasMeshModifications = true;
                        }
                    }

                    if (outputMeshesIndex == OutputMeshes.Custom)
                    {
                        GUILayout.Space(10);
                        StyledGUI.DrawWindowCategory("Mesh Settings");
                        GUILayout.Space(10);

                        if (hasMeshModifications)
                        {
                            EditorGUILayout.HelpBox("The originalMesh settings have been overriden and they will not update when changing the preset or adding overrides!", MessageType.Info, true);
                            GUILayout.Space(10);
                        }

                        EditorGUI.BeginChangeCheck();

                        readWriteMode = StyledPopup("ReadWrite Mode", "Set meshes readable mode.", readWriteMode, ReadWriteModeEnum);

                        sourceBounds = StyledSourcePopup("Bounds", "Mesh vertex bounds override.", sourceBounds, SourceBoundsEnum);
                        optionBounds = StyledBoundsOptionEnum("Bounds", "", sourceBounds, optionBounds);

                        sourceNormals = StyledSourcePopup("Normals", "", sourceNormals, SourceNormalsEnum);
                        optionNormals = StyledNormalsOptionEnum("Normals", "", sourceNormals, optionNormals);

                        GUILayout.Space(10);

                        sourceVariation = StyledSourcePopup("Vertex Red", "", sourceVariation, SourceMaskEnum);
                        textureVariation = StyledTexture("Vertex Red", "", sourceVariation, textureVariation);
                        optionVariation = StyledMaskOptionEnum("Vertex Red", "", sourceVariation, optionVariation, false);
                        coordVariation = StyledTextureCoord("Vertex Red", "", sourceVariation, coordVariation);
                        actionVariation = StyledActionOptionEnum("Vertex Red", "", sourceVariation, actionVariation, true);

                        sourceOcclusion = StyledSourcePopup("Vertex Green", "", sourceOcclusion, SourceMaskEnum);
                        textureOcclusion = StyledTexture("Vertex Green", "", sourceOcclusion, textureOcclusion);
                        optionOcclusion = StyledMaskOptionEnum("Vertex Green", "", sourceOcclusion, optionOcclusion, false);
                        coordOcclusion = StyledTextureCoord("Vertex Green", "", sourceOcclusion, coordOcclusion);
                        actionOcclusion = StyledActionOptionEnum("Vertex Green", "", sourceOcclusion, actionOcclusion, true);

                        sourceDetail = StyledSourcePopup("Vertex Blue", "", sourceDetail, SourceMaskEnum);
                        textureDetail = StyledTexture("Vertex Blue", "", sourceDetail, textureDetail);
                        optionDetail = StyledMaskOptionEnum("Vertex Blue", "", sourceDetail, optionDetail, false);
                        coordDetail = StyledTextureCoord("Vertex Blue", "", sourceDetail, coordDetail);
                        actionDetail = StyledActionOptionEnum("Vertex Blue", "", sourceDetail, actionDetail, true);

                        sourceHeight = StyledSourcePopup("Vertex Alpha", "", sourceHeight, SourceMaskEnum);
                        textureHeight = StyledTexture("Vertex Blue", "", sourceHeight, textureHeight);
                        optionHeight = StyledMaskOptionEnum("Vertex Alpha", "", sourceHeight, optionHeight, false);
                        coordHeight = StyledTextureCoord("Vertex Alpha", "", sourceHeight, coordHeight);
                        actionHeight = StyledActionOptionEnum("Vertex Alpha", "", sourceHeight, actionHeight, true);

                        if (EditorGUI.EndChangeCheck())
                        {
                            hasMeshModifications = true;
                        }
                    }
                }
            }
        }

        void DrawConversionButtons()
        {
            GUILayout.Space(10);
            GUILayout.BeginHorizontal();

            if (convertedPrefabCount == 0)
            {
                GUI.enabled = false;
            }
            else
            {
                GUI.enabled = true;
            }

            if (GUILayout.Button("Revert", GUILayout.Width(GUI_HALF_EDITOR_WIDTH - 2)))
            {
                for (int i = 0; i < prefabObjects.Count; i++)
                {
                    var data = prefabObjects[i];

                    if (data.status == TVEPrefabMode.Converted)
                    {
                        prefabObject = prefabObjects[i].gameObject;

                        RevertPrefab(false);
                    }
                }

                GetPrefabObjects();
            }

            if (supportedPrefabCount + convertedPrefabCount == 0)
            {
                GUI.enabled = false;
            }
            else
            {
                if (presetIndex == 0 || outputValid == false || !isValid)
                {
                    GUI.enabled = false;
                }
                else
                {
                    GUI.enabled = true;
                }
            }

            if (GUILayout.Button("Convert"))
            {
                keepConvertedMaterials = false;
                keepConvertedMaterialsIsSet = false;

                //shareCommonMaterials = EditorUtility.DisplayDialog("Share Common Materials?", "When Share Common Materials is used, the materials are shared across multiple prefabs!", "Share Common Materials", "Unique");

                for (int i = 0; i < prefabObjects.Count; i++)
                {
                    var data = prefabObjects[i];

                    if (data.status == TVEPrefabMode.Converted || data.status == TVEPrefabMode.Supported)
                    {
                        prefabObject = prefabObjects[i].gameObject;

                        if (data.status == TVEPrefabMode.Converted)
                        {
                            RevertPrefab(false);
                        }

                        ConvertPrefab();
                    }
                }

                GetPrefabObjects();

                EditorUtility.ClearProgressBar();
            }

            //if (collectiblePrefabCount == 0)
            //{
            //    GUI.enabled = false;
            //}
            //else
            //{
                GUI.enabled = true;
            //}

            if (StyledMiniToggleButton("", "Collect Converted Data", 12, false))
            {
                keepPrefabSharing = false;

                var keep = EditorUtility.DisplayDialogComplex("Share Common Materials?", "When Get Sharing From Prefab is used, the materials are collected based on the prefab material sharing!", "Get Sharing From Prefab", "Cancel", "Use Converter Sharing");

                // Get Sharing From Prefab
                if (keep == 0)
                {
                    keepPrefabSharing = true;
                }
                // Cancel
                else if (keep == 1)
                {
                    GUIUtility.ExitGUI();
                    return;
                }
                // Use Converter Sharing
                else if (keep == 2)
                {
                    keepPrefabSharing = false;
                }

                var latestDataFolder = SettingsUtils.LoadSettingsData(userFolder + "Converter Latest.asset", "Assets");

                if (!Directory.Exists(latestDataFolder))
                {
                    latestDataFolder = "Assets";
                }

                collectDataFolder = EditorUtility.OpenFolderPanel("Save Converted Assets to Folder", latestDataFolder, "");

                if (collectDataFolder != "")
                {
                    collectDataFolder = "Assets" + collectDataFolder.Substring(Application.dataPath.Length);
                }

                if (collectDataFolder != "")
                {
                    if (!Directory.Exists(collectDataFolder))
                    {
                        Directory.CreateDirectory(collectDataFolder);
                        AssetDatabase.Refresh();
                    }



#if !THE_VEGETATION_ENGINE_DEVELOPMENT

                    SettingsUtils.SaveSettingsData(userFolder + "Converter Latest.asset", collectDataFolder);

#endif
                    CreateAssetsDataSubFolders();
                }
                else
                {
                    GUIUtility.ExitGUI();
                    return;
                }

                for (int i = 0; i < prefabObjects.Count; i++)
                {
                    var prefabData = prefabObjects[i];

                    //if (prefabData.status == TVEPrefabMode.Converted || prefabData.status == TVEPrefabMode.ConvertedMissingBackup)
                    {
                        prefabObject = prefabObjects[i].gameObject;

                        CollectPrefab();
                    }
                }

                GetPrefabObjects();
            }

            var lastRect = GUILayoutUtility.GetLastRect();
            var iconRect = new Rect(lastRect.x, lastRect.y - 1, GUI_SQUARE_BUTTON_WIDTH, GUI_SQUARE_BUTTON_WIDTH);

            if (EditorGUIUtility.isProSkin)
            {
                GUI.color = new Color(0.2f, 1f, 1f);
            }
            else
            {
                GUI.color = new Color(0.2f, 1f, 1f);
            }

            GUI.Label(iconRect, EditorGUIUtility.IconContent("d_Package Manager@2x"));
            GUI.color = Color.white;

            GUILayout.EndHorizontal();
            GUI.enabled = true;
        }

        void StyledPrefab(TVEPrefabData prefabData)
        {
            if (prefabData.status == TVEPrefabMode.Converted)
            {
                if (EditorGUIUtility.isProSkin)
                {
                    GUILayout.Label("<size=10><b><color=#f6d161>" + prefabData.gameObject.name + "</color></b></size>", styleCenteredHelpBox, GUILayout.Height(GUI_SELECTION_HEIGHT));
                }
                else
                {
                    GUILayout.Label("<size=10><b><color=#e16f00>" + prefabData.gameObject.name + "</color></b></size>", styleCenteredHelpBox, GUILayout.Height(GUI_SELECTION_HEIGHT));
                }
            }

            if (prefabData.status == TVEPrefabMode.Supported)
            {
                if (EditorGUIUtility.isProSkin)
                {
                    GUILayout.Label("<size=10><b><color=#87b8ff>" + prefabData.gameObject.name + "</color></b></size>", styleCenteredHelpBox, GUILayout.Height(GUI_SELECTION_HEIGHT));
                }
                else
                {
                    GUILayout.Label("<size=10><b><color=#0b448b>" + prefabData.gameObject.name + "</color></b></size>", styleCenteredHelpBox, GUILayout.Height(GUI_SELECTION_HEIGHT));
                }
            }

            if (prefabData.status == TVEPrefabMode.Collected)
            {
                if (EditorGUIUtility.isProSkin)
                {
                    GUILayout.Label("<size=10><b><color=#62d7d7>" + prefabData.gameObject.name + "</color></b></size>", styleCenteredHelpBox, GUILayout.Height(GUI_SELECTION_HEIGHT));
                }
                else
                {
                    GUILayout.Label("<size=10><b><color=#009090>" + prefabData.gameObject.name + "</color></b></size>", styleCenteredHelpBox, GUILayout.Height(GUI_SELECTION_HEIGHT));
                }
            }

            if (prefabData.status == TVEPrefabMode.Unsupported || prefabData.status == TVEPrefabMode.Backup || prefabData.status == TVEPrefabMode.ConvertedMissingBackup)
            {
                GUILayout.Label("<size=10><b><color=#808080>" + prefabData.gameObject.name + "</color></b></size>", styleCenteredHelpBox, GUILayout.Height(GUI_SELECTION_HEIGHT));
            }

            var lastRect = GUILayoutUtility.GetLastRect();

            if (GUI.Button(lastRect, "", GUIStyle.none))
            {
                EditorGUIUtility.PingObject(prefabData.gameObject);
            }

            var iconRect = new Rect(lastRect.width - 18, lastRect.y + 2, 20, 20);

            if (prefabData.status == TVEPrefabMode.Supported)
            {
                if (prefabData.isNested)
                {
                    GUI.color = new Color(0.9f, 0.9f, 1f);
                    GUI.Label(iconRect, EditorGUIUtility.IconContent("PrefabVariant Icon"));
                    GUI.color = Color.white;
                    //GUI.Label(iconRect, EditorGUIUtility.IconContent("console.warnicon.sml"));
                    GUI.Label(iconRect, new GUIContent("", "The prefab contains other prefabs! It is recommened to convert each individual prefab separately to keep the prefab nesting intact!"));
                }
            }

            if (prefabData.status == TVEPrefabMode.Unsupported)
            {
                GUI.Label(iconRect, EditorGUIUtility.IconContent("console.warnicon.sml"));
                GUI.Label(iconRect, new GUIContent("", "SpeedTree, Tree Creator, Models or any other asset type prefabs cannot be converted directly, you will need to create a regular prefab first! Drag the prefab into hierarchy then back to project window or from the hierarchy to project window."));
            }

            if (prefabData.status == TVEPrefabMode.Backup)
            {
                GUI.Label(iconRect, EditorGUIUtility.IconContent("console.warnicon.sml"));
                GUI.Label(iconRect, new GUIContent("", "The prefab is a backup file used to revert the converted prefab!"));
            }

            if (prefabData.status == TVEPrefabMode.Converted)
            {
                if (prefabData.isShared)
                {
                    if (EditorGUIUtility.isProSkin)
                    {
                        GUI.color = new Color(1f, 0.83f, 0.33f);
                    }
                    else
                    {
                        GUI.color = new Color(1f, 0.6f, 0.2f);
                    }

                    GUI.Label(iconRect, EditorGUIUtility.IconContent("d_Material On Icon"));
                    GUI.color = Color.white;
                    GUI.Label(iconRect, new GUIContent("", "The prefab is converted using shared materials!"));
                }
            }

            if (prefabData.status == TVEPrefabMode.Collected)
            {
                if (prefabData.isShared)
                {
                    if (EditorGUIUtility.isProSkin)
                    {
                        GUI.color = new Color(0.2f, 0.85f, 0.85f);
                    }
                    else
                    {
                        GUI.color = new Color(0.2f, 0.8f, 0.8f);
                    }

                    GUI.Label(iconRect, EditorGUIUtility.IconContent("d_Material On Icon"));
                    GUI.color = Color.white;
                    GUI.Label(iconRect, new GUIContent("", "The prefab is collected using shared materials!"));
                }
            }

            if (prefabData.status == TVEPrefabMode.ConvertedMissingBackup)
            {
                GUI.Label(iconRect, EditorGUIUtility.IconContent("console.erroricon.sml"));
                GUI.Label(iconRect, new GUIContent("", "The prefab cannot be reverted or reconverted because the backup file is missing!"));
            }
        }

        int StyledPopup(string name, string tooltip, int index, string[] options)
        {
            if (index >= options.Length)
            {
                index = 0;
            }

            GUILayout.BeginHorizontal();
            GUILayout.Label(new GUIContent(name, tooltip), GUILayout.Width(GUI_HALF_EDITOR_WIDTH - 5));
            index = EditorGUILayout.Popup(index, options, stylePopup);
            GUILayout.EndHorizontal();

            return index;
        }

        int StyledPresetPopup(string name, string tooltip, int index, string[] options)
        {
            if (index >= options.Length)
            {
                index = 0;
            }

            GUILayout.BeginHorizontal();
            GUILayout.Label(new GUIContent(name, tooltip), GUILayout.Width(GUI_HALF_EDITOR_WIDTH - 5));
            index = EditorGUILayout.Popup(index, options, stylePopup);

            var lastRect = GUILayoutUtility.GetLastRect();
            GUI.Label(lastRect, new GUIContent("", options[index]));

            GUILayout.EndHorizontal();

            return index;
        }

        int StyledSourcePopup(string name, string tooltip, int index, string[] options)
        {
            index = StyledPopup(name + " Source", tooltip, index, options);

            return index;
        }

        int StyledActionOptionEnum(string name, string tooltip, int source, int option, bool space)
        {
            if (source > 0)
            {
                option = StyledPopup(name + " Action", tooltip, option, SourceActionEnum);
            }

            if (space)
            {
                GUILayout.Space(GUI_SPACE_SMALL);
            }

            return option;
        }

        int StyledMaskOptionEnum(string name, string tooltip, int source, int option, bool space)
        {
            if (source == 1)
            {
                option = StyledPopup(name + " Channel", tooltip, option, SourceMaskMeshEnum);
            }
            if (source == 2)
            {
                option = StyledPopup(name + " Procedural", tooltip, option, SourceMaskProceduralEnum);
            }
            if (source == 3)
            {
                option = StyledPopup(name + " Channel", tooltip, option, SourceFromTextureEnum);
            }
            if (source == 4)
            {
                option = StyledPopup(name + " 3rd Party", tooltip, option, SourceMask3rdPartyEnum);
            }

            if (space)
            {
                GUILayout.Space(GUI_SPACE_SMALL);
            }

            return option;
        }

        Texture2D StyledTexture(string name, string tooltip, int source, Texture2D texture)
        {
            if (source == 3)
            {
                GUILayout.BeginHorizontal();
                GUILayout.Label(new GUIContent(name + " Texture", ""), GUILayout.Width(GUI_HALF_EDITOR_WIDTH - 5));
                texture = (Texture2D)EditorGUILayout.ObjectField(texture, typeof(Texture2D), false);
                GUILayout.EndHorizontal();
            }

            return texture;
        }

        int StyledTextureCoord(string name, string tooltip, int sourceTexture, int option)
        {
            if (sourceTexture == 3)
            {
                option = StyledPopup(name + " Coord", tooltip, option, SourceCoordMeshEnum);
            }

            return option;
        }

        int StyledCoordOptionEnum(string name, string tooltip, int source, int option)
        {
            if (source == 1)
            {
                option = StyledPopup(name + " Channel", tooltip, option, SourceCoordMeshEnum);
            }
            if (source == 2)
            {
                option = StyledPopup(name + " Procedural", tooltip, option, SourceCoordProceduralEnum);
            }
            if (source == 3)
            {
                option = StyledPopup(name + " 3rd Party", tooltip, option, SourceCoord3rdPartyEnum);
            }

            GUILayout.Space(GUI_SPACE_SMALL);

            return option;
        }

        int StyledPivotsOptionEnum(string name, string tooltip, int source, int option)
        {
            if (source == 1)
            {
                option = StyledPopup(name + " Procedural", tooltip, option, SourcePivotsProceduralEnum);
                GUILayout.Space(GUI_SPACE_SMALL);
            }

            return option;
        }

        int StyledNormalsOptionEnum(string name, string tooltip, int source, int option)
        {
            if (source == 1)
            {
                option = StyledPopup(name + " Procedural", tooltip, option, SourceNormalsProceduralEnum);
                GUILayout.Space(GUI_SPACE_SMALL);
            }

            return option;
        }

        int StyledBoundsOptionEnum(string name, string tooltip, int source, int option)
        {
            if (source == 1)
            {
                option = StyledPopup(name + " Procedural", tooltip, option, SourceBoundsProceduralEnum);
                GUILayout.Space(GUI_SPACE_SMALL);
            }

            return option;
        }

        bool StyledButton(string text)
        {
            bool value = GUILayout.Button("<b>" + text + "</b>", styleCenteredHelpBox, GUILayout.Height(GUI_SELECTION_HEIGHT));

            return value;
        }

        bool StyledMiniToggleButton(string text, string tooltip, int size, bool value)
        {
            value = GUILayout.Toggle(value, new GUIContent("<size=" + size + ">" + text + "</size>", tooltip), styleMiniToggleButton, GUILayout.MaxWidth(GUI_SQUARE_BUTTON_WIDTH), GUILayout.MaxHeight(GUI_SQUARE_BUTTON_HEIGHT));

            return value;
        }

        /// <summary>
        /// Convert and Revert Macros
        /// </summary>

        void ConvertPrefab()
        {
            prefabName = prefabObject.name;

            string dataPath;
            string savePath = "/" + prefabName + ".prefab";

            dataPath = AssetDatabase.GetAssetPath(prefabObject);
            dataPath = Path.GetDirectoryName(dataPath);
            dataPath = dataPath + savePath;
            prefabDataFolder = dataPath;

            EditorUtility.DisplayProgressBar("The Vegetation Engine", prefabObject.name + ": Prepare Prefab", 0.0f);

            var prefabScale = prefabObject.transform.localScale;

            prefabInstance = Instantiate(prefabObject);
            prefabInstance.transform.localPosition = Vector3.zero;
            prefabInstance.transform.rotation = Quaternion.identity;
            prefabInstance.transform.localScale = Vector3.one;
            prefabInstance.AddComponent<TVEPrefab>();

            var prefabComponent = prefabInstance.GetComponent<TVEPrefab>();

            prefabComponent.storedPreset = PresetsEnum[presetIndex] + ";" + OptionsEnum[optionIndex];

            for (int i = 0; i < overrideIndices.Count; i++)
            {
                if (overrideIndices[i] != 0)
                {
                    prefabComponent.storedOverrides = prefabComponent.storedOverrides + OverridesEnum[overrideIndices[i]] + ";";
                }
            }

            prefabComponent.storedOverrides.Replace("None", "");

            EditorUtility.DisplayProgressBar("The Vegetation Engine", prefabObject.name + ": Create Backup", 0.1f);

            CreatePrefabDataFolder(false);
            CreatePrefabBackupFile();

            prefabComponent.storedPrefabBackupGUID = AssetDatabase.AssetPathToGUID(AssetDatabase.GetAssetPath(prefabBackup));

            EditorUtility.DisplayProgressBar("The Vegetation Engine", prefabObject.name + ": Prepare Assets", 0.2f);

            GetGameObjectsInPrefab();
            FixInvalidPrefabScripts();

            DisableInvalidGameObjectsInPrefab();

            GetMeshRenderersInPrefab();
            GetMaterialArraysInPrefab();

            EditorUtility.DisplayProgressBar("The Vegetation Engine", prefabObject.name + ": Convert Materials", 0.4f);

            if (outputMaterialsIndex != OutputMaterials.Off)
            {
                CreateMaterialArraysInstances();
                ConvertMaterials();
            }

            if (outputMeshesIndex != OutputMeshes.Off)
            {
                GetMeshFiltersInPrefab();
                GetMeshesInPrefab();
                GetMeshCollidersInPrefab();
                GetCollidersInPrefab();

                PreProcessMeshes();
                CreateMeshInstances();
                CreateColliderInstances();
                PostProcessMeshes();

                EditorUtility.DisplayProgressBar("The Vegetation Engine", prefabObject.name + ": Transform Space", 0.5f);

                if (outputTransformsIndex == OutputTransforms.TransformToWorldSpace)
                {
                    TransformMeshesToWorldSpace();
                }

                EditorUtility.DisplayProgressBar("The Vegetation Engine", prefabObject.name + ": Get Bounds", 0.6f);

                GetMaxBoundsInPrefab();

                EditorUtility.DisplayProgressBar("The Vegetation Engine", prefabObject.name + ": Convert Meshes", 0.8f);

                ConvertMeshes();
                ConvertColliders();
            }

            prefabInstance.transform.localScale = prefabScale;

            EnableInvalidGameObjectsInPrefab();

            EditorUtility.DisplayProgressBar("The Vegetation Engine", prefabObject.name + ": Save Prefab", 0.9f);

            SavePrefab(prefabInstance, prefabObject, true);

            AssetDatabase.SaveAssets();
            AssetDatabase.Refresh();

            EditorUtility.DisplayProgressBar("The Vegetation Engine", prefabObject.name + ": Finish Conversion", 1.0f);

            DestroyImmediate(prefabInstance);
        }

        void CollectPrefab()
        {
            prefabName = prefabObject.name;

            string dataPath;
            string savePath = "/" + prefabName + ".prefab";

            dataPath = collectDataFolder + savePath;

            prefabInstance = Instantiate(prefabObject);
            var prefabComponent = prefabInstance.GetComponent<TVEPrefab>();

            prefabComponent.storedPrefabBackupGUID = AssetDatabase.AssetPathToGUID(AssetDatabase.GetAssetPath(prefabObject));
            prefabComponent.isCollected = true;

            CreatePrefabDataFolder(true);
            GetGameObjectsInPrefab();

            GetMeshRenderersInPrefab();
            GetMaterialArraysInPrefab();

            GetMeshFiltersInPrefab();
            GetMeshesInPrefab();
            GetMeshCollidersInPrefab();
            GetCollidersInPrefab();

            CollectMaterials();
            CollectMeshes();
            CollectColliders();

            if (File.Exists(dataPath))
            {
                PrefabUtility.SaveAsPrefabAssetAndConnect(prefabInstance, dataPath, InteractionMode.AutomatedAction);
            }
            else
            {
                PrefabUtility.SaveAsPrefabAsset(prefabInstance, dataPath);
            }

            AssetDatabase.SetLabels(AssetDatabase.LoadAssetAtPath<UnityEngine.Object>(dataPath), new string[] { outputSuffix + " Prefab" });

            AssetDatabase.SaveAssets();
            AssetDatabase.Refresh();

            DestroyImmediate(prefabInstance);
        }

        void RevertPrefab(bool deleteConvertedAssets)
        {
            var prefabBackup = GetPrefabBackupFile(prefabObject);

            prefabInstance = Instantiate(prefabBackup);

            GetGameObjectsInPrefab();
            FixInvalidPrefabScripts();

            SavePrefab(prefabInstance, prefabObject, false);

            if (deleteConvertedAssets)
            {
                // Cleaup converted data on revert
                var prefabPath = AssetDatabase.GetAssetPath(prefabObject);
                var standalonePath = prefabPath.Replace(Path.GetFileName(prefabPath), "") + prefabObject.name;

                try
                {
                    FileUtil.DeleteFileOrDirectory(standalonePath);
                    FileUtil.DeleteFileOrDirectory(standalonePath + ".meta");
                }
                catch
                {
                    Debug.Log("<b>[The Vegetation Engine]</b> " + "The converted prefab data cannot be deleted on revert!");
                }
            }

            AssetDatabase.Refresh();

            DestroyImmediate(prefabInstance);
        }

        void SavePrefab(GameObject prefabInstance, GameObject prefabObject, bool setLabel)
        {
            var prefabPath = AssetDatabase.GetAssetPath(prefabObject);

            PrefabUtility.SaveAsPrefabAssetAndConnect(prefabInstance, prefabPath, InteractionMode.AutomatedAction);

            if (setLabel)
            {
                AssetDatabase.SetLabels(AssetDatabase.LoadAssetAtPath<UnityEngine.Object>(prefabPath), new string[] { outputSuffix + " Prefab" });
            }
        }

        /// <summary>
        /// Get GameObjects, Materials and MeshFilters in Prefab
        /// </summary>

        void CreateAssetsDataSubFolders()
        {
            if (!Directory.Exists(collectDataFolder + PREFABS_DATA_PATH))
            {
                Directory.CreateDirectory(collectDataFolder + PREFABS_DATA_PATH);
            }

            if (!Directory.Exists(collectDataFolder + SHARED_DATA_PATH))
            {
                Directory.CreateDirectory(collectDataFolder + SHARED_DATA_PATH);
            }

            if (!Directory.Exists(collectDataFolder + TEXTURE_DATA_PATH))
            {
                Directory.CreateDirectory(collectDataFolder + TEXTURE_DATA_PATH);
            }

            AssetDatabase.Refresh();
        }

        void GetPrefabObjects()
        {
            prefabObjects = new List<TVEPrefabData>();
            convertedPrefabCount = 0;
            supportedPrefabCount = 0;
            collectiblePrefabCount = 0;
            //unsupportedPrefabCount = 0;
            validPrefabCount = 0;

            GameObject[] selectionObjects;

#if UNITY_2021_3_OR_NEWER
            var prefabStage = PrefabStageUtility.GetCurrentPrefabStage();

            if (prefabStage != null)
            {
                selectionObjects = new GameObject[1];
                selectionObjects[0] = prefabStage.openedFromInstanceObject;
            }
            else
            {
                selectionObjects = Selection.gameObjects;
            }
#else
            selectionObjects = Selection.gameObjects;
#endif
            for (int i = 0; i < selectionObjects.Length; i++)
            {
                var selection = selectionObjects[i];
                var prefabData = GetPrefabData(selection);

                bool prefabDataExists = false;

                for (int j = 0; j < prefabObjects.Count; j++)
                {
                    if (prefabObjects[j].gameObject == prefabData.gameObject)
                    {
                        prefabDataExists = true;
                    }
                }

                if (!prefabDataExists)
                {
                    prefabObjects.Add(prefabData);
                }

                if (prefabData.status == TVEPrefabMode.Converted)
                {
                    convertedPrefabCount++;
                }

                if (prefabData.status == TVEPrefabMode.Supported)
                {
                    supportedPrefabCount++;
                }

                if (prefabData.status == TVEPrefabMode.Converted || prefabData.status == TVEPrefabMode.ConvertedMissingBackup)
                {
                    collectiblePrefabCount++;
                }

                //if (prefabData.status == TVEPrefabMode.Unsupported)
                //{
                //    unsupportedPrefabCount++;
                //}

                validPrefabCount = convertedPrefabCount + supportedPrefabCount + collectiblePrefabCount;
            }
        }

        void GetPrefabPresets()
        {
            presetMixedValues = false;
            presetAutoDetected = false;

            var presetIndices = new int[prefabObjects.Count];

            if (prefabObjects.Count > 0)
            {
                for (int o = 0; o < prefabObjects.Count; o++)
                {
                    var prefabObject = prefabObjects[o];
                    var prefabComponent = prefabObject.gameObject.GetComponent<TVEPrefab>();

                    if (prefabComponent != null)
                    {
                        if (prefabComponent.storedPreset != "")
                        {
                            // Get new style presets
                            if (prefabComponent.storedPreset.Contains(";"))
                            {
                                var splitLine = prefabComponent.storedPreset.Split(char.Parse(";"));

                                var preset = splitLine[0];
                                var option = splitLine[1];

                                for (int i = 0; i < PresetsEnum.Length; i++)
                                {
                                    if (PresetsEnum[i] == preset)
                                    {
                                        presetIndex = i;
                                        presetIndices[o] = i;

                                        GetAllPresetInfo();

                                        for (int j = 0; j < OptionsEnum.Length; j++)
                                        {
                                            if (OptionsEnum[j] == option)
                                            {
                                                optionIndex = j;
                                            }
                                        }
                                    }
                                }
                            }
                            // Try get old style presets
                            else
                            {
                                var splitLine = prefabComponent.storedPreset.Split(char.Parse("/"));

                                var option = splitLine[splitLine.Length - 1];
                                var preset = prefabComponent.storedPreset.Replace("/" + option, "");

                                for (int i = 0; i < PresetsEnum.Length; i++)
                                {
                                    if (PresetsEnum[i] == prefabComponent.storedPreset || PresetsEnum[i] == preset)
                                    {
                                        presetIndex = i;
                                        presetIndices[o] = i;

                                        GetAllPresetInfo();

                                        for (int j = 0; j < OptionsEnum.Length; j++)
                                        {
                                            if (OptionsEnum[j] == option)
                                            {
                                                optionIndex = j;
                                            }
                                        }
                                    }
                                }
                            }
                        }

                        if (prefabComponent.storedOverrides != "")
                        {
                            var splitLine = prefabComponent.storedOverrides.Split(char.Parse(";"));

                            for (int i = 0; i < splitLine.Length; i++)
                            {
                                for (int j = 0; j < OverridesEnum.Length; j++)
                                {
                                    if (OverridesEnum[j] == splitLine[i])
                                    {
                                        if (!overrideIndices.Contains(j))
                                        {
                                            overrideIndices.Add(j);
                                            overrideGlobals.Add(false);
                                        }
                                    }
                                }
                            }
                        }

                        presetAutoDetected = false;
                    }
                    else
                    {
                        // Try to autodetect preset
                        for (int i = 0; i < detectLines.Count; i++)
                        {
                            if (detectLines[i].StartsWith("Detect"))
                            {
                                var detect = detectLines[i].Replace("Detect ", "").Split(new string[] { " && " }, System.StringSplitOptions.None);
                                var preset = detectLines[i + 1].Replace("Preset ", "").Replace(" - ", "/");

                                int detectCount = 0;

                                for (int d = 0; d < detect.Length; d++)
                                {
                                    var element = detect[d].ToUpperInvariant();

                                    if (element.StartsWith("!"))
                                    {
                                        element = element.Replace("!", "");

                                        if (!prefabObject.attributes.Contains(element))
                                        {
                                            detectCount++;
                                        }
                                    }
                                    else
                                    {
                                        if (prefabObject.attributes.Contains(element))
                                        {
                                            detectCount++;
                                        }
                                    }
                                }

                                if (detectCount == detect.Length)
                                {
                                    for (int j = 0; j < PresetsEnum.Length; j++)
                                    {
                                        if (PresetsEnum[j] == preset)
                                        {
                                            presetIndex = j;
                                            presetIndices[o] = (j);
                                            presetAutoDetected = true;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                for (int i = 1; i < presetIndices.Length; i++)
                {
                    if (presetIndices[i - 1] != presetIndices[i])
                    {
                        presetIndex = 0;
                        presetMixedValues = true;

                        break;
                    }
                }
            }
        }

        TVEPrefabData GetPrefabData(GameObject selection)
        {
            TVEPrefabData prefabData = new TVEPrefabData();

            prefabData.gameObject = selection;
            prefabData.status = TVEPrefabMode.Undefined;

            if (PrefabUtility.GetPrefabAssetPathOfNearestInstanceRoot(selection).Length > 0)
            {
                var prefabPath = PrefabUtility.GetPrefabAssetPathOfNearestInstanceRoot(selection);
                var prefabAsset = AssetDatabase.LoadAssetAtPath<GameObject>(prefabPath);
                var prefabAssets = AssetDatabase.LoadAllAssetRepresentationsAtPath(prefabPath);
                var prefabType = PrefabUtility.GetPrefabAssetType(prefabAsset);

                if (prefabAssets.Length == 0)
                {
                    if (prefabType == PrefabAssetType.Regular || prefabType == PrefabAssetType.Variant)
                    {
                        var prefabComponent = prefabAsset.GetComponent<TVEPrefab>();

                        if (prefabComponent != null)
                        {
                            if (prefabComponent.isCollected)
                            {
                                prefabData.status = TVEPrefabMode.Collected;
                            }
                            else
                            {
                                var prefabBackupGO = GetPrefabBackupFile(prefabAsset);

                                if (prefabBackupGO != null)
                                {
                                    prefabData.status = TVEPrefabMode.Converted;
                                }
                                else
                                {
                                    prefabData.status = TVEPrefabMode.ConvertedMissingBackup;
                                }
                            }
                        }
                        else
                        {
                            if (prefabPath.Contains("TVE Backup"))
                            {
                                prefabData.status = TVEPrefabMode.Backup;
                            }
                            else
                            {
                                prefabData.status = TVEPrefabMode.Supported;
                            }
                        }
                    }
                    else if (prefabType == PrefabAssetType.MissingAsset || prefabType == PrefabAssetType.NotAPrefab)
                    {
                        prefabData.status = TVEPrefabMode.Undefined;
                    }
                }
                else
                {
                    if (prefabType == PrefabAssetType.Model || prefabPath.EndsWith(".st") || prefabPath.EndsWith(".spm") || prefabPath.EndsWith(".prefab"))
                    {
                        prefabData.status = TVEPrefabMode.Unsupported;

                        //var prefabExtension = Path.GetExtension(prefabPath);
                        //var prefabaAltPath = prefabPath.Replace(prefabExtension, " Prefab.prefab");

                        //if (File.Exists(prefabaAltPath))
                        //{
                        //    prefabData.status = TVEPrefabMode.Supported;
                        //    prefabAsset = AssetDatabase.LoadAssetAtPath<GameObject>(prefabaAltPath);
                        //}
                    }
                }

                prefabData.prefabPath = prefabPath;
                prefabData.gameObject = prefabAsset;
            }
            else
            {
                prefabData.gameObject = selection;
                prefabData.status = TVEPrefabMode.Undefined;
            }

            if (prefabData.status == TVEPrefabMode.Supported || prefabData.status == TVEPrefabMode.Converted || prefabData.status == TVEPrefabMode.Collected)
            {
                prefabData = GetPrefabAttributes(prefabData);
            }

            return prefabData;
        }

        TVEPrefabData GetPrefabAttributes(TVEPrefabData prefabData)
        {
            string attributes = "";
            bool isNested = false;
            bool isShared = true;

            var rootPath = AssetDatabase.GetAssetPath(prefabData.gameObject);

            attributes += rootPath + ";";

            var gameObjects = new List<GameObject>();
            var meshRenderers = new List<MeshRenderer>();

            gameObjects.Add(prefabData.gameObject);
            TVEUtils.GetChildRecursive(prefabData.gameObject, gameObjects);

            for (int i = 0; i < gameObjects.Count; i++)
            {
                var prefabPath = PrefabUtility.GetPrefabAssetPathOfNearestInstanceRoot(gameObjects[i]);
                var prefabAsset = AssetDatabase.LoadAssetAtPath<GameObject>(prefabPath);
                var prefabType = PrefabUtility.GetPrefabAssetType(prefabAsset);

                if ((prefabType == PrefabAssetType.Regular || prefabType == PrefabAssetType.Variant) && rootPath != prefabPath)
                {
                    isNested = true;
                }
            }

            for (int i = 0; i < gameObjects.Count; i++)
            {
                if (gameObjects[i].GetComponent<MeshRenderer>() != null)
                {
                    meshRenderers.Add(gameObjects[i].GetComponent<MeshRenderer>());
                }
            }

            for (int i = 0; i < meshRenderers.Count; i++)
            {
                if (meshRenderers[i].sharedMaterials != null)
                {
                    for (int j = 0; j < meshRenderers[i].sharedMaterials.Length; j++)
                    {
                        var material = meshRenderers[i].sharedMaterials[j];

                        if (material != null)
                        {
                            if (!attributes.Contains(material.shader.name))
                            {
                                attributes += material.shader.name + ",";

                                if (isShared == true && material.name.Contains("TVE Material"))
                                {
                                    var materialPath = AssetDatabase.GetAssetPath(material);

                                    if (materialPath.Contains(prefabData.gameObject.name))
                                    {
                                        isShared = false;
                                    }
                                }
                            }
                        }
                    }
                }
            }

            prefabData.attributes = attributes.ToUpperInvariant();
            prefabData.isNested = isNested;
            prefabData.isShared = isShared;

            return prefabData;
        }

        void CreatePrefabDataFolder(bool isCollected)
        {
            string dataPath;
            string savePath = "/" + prefabName;

            if (isCollected)
            {
                dataPath = collectDataFolder + PREFABS_DATA_PATH + savePath;
            }
            else
            {
                dataPath = AssetDatabase.GetAssetPath(prefabObject);
                dataPath = Path.GetDirectoryName(dataPath);
                dataPath = dataPath + savePath;
                prefabDataFolder = dataPath;
            }

            if (!Directory.Exists(dataPath))
            {
                Directory.CreateDirectory(dataPath);
                AssetDatabase.Refresh();
            }
        }

        void CreatePrefabBackupFile()
        {
            string dataPath;
            string savePath = "/" + prefabName + " (" + outputSuffix + " Backup).prefab";

            dataPath = prefabDataFolder + savePath;

            AssetDatabase.CopyAsset(AssetDatabase.GetAssetPath(prefabObject), dataPath);
            AssetDatabase.Refresh();

            prefabBackup = AssetDatabase.LoadAssetAtPath<GameObject>(dataPath);
        }

        GameObject GetPrefabBackupFile(GameObject prefabInstance)
        {
            GameObject prefabBackupGO = null;

            var prefabBackupGUID = prefabInstance.GetComponent<TVEPrefab>().storedPrefabBackupGUID;

            if (prefabBackupGUID != null || prefabBackupGUID != "")
            {
                var prefabBackupPath = AssetDatabase.GUIDToAssetPath(prefabBackupGUID);
                prefabBackupGO = AssetDatabase.LoadAssetAtPath<GameObject>(prefabBackupPath);
            }

            // Get the backup if serialization changed
            if (prefabBackupGO == null)
            {
                var prefabPath = AssetDatabase.GetAssetPath(prefabInstance);
                var prefabName = Path.GetFileNameWithoutExtension(prefabPath);
                var prefabBackupName = prefabName + " (TVE Backup)";
                var prefabBackupAssets = AssetDatabase.FindAssets(prefabBackupName);

                if (prefabBackupAssets != null && prefabBackupAssets.Length > 0)
                {
                    var prefabBackupPath = AssetDatabase.GUIDToAssetPath(prefabBackupAssets[0]);
                    prefabBackupGO = AssetDatabase.LoadAssetAtPath<GameObject>(prefabBackupPath);
                }
            }

            return prefabBackupGO;
        }

        void GetGameObjectsInPrefab()
        {
            gameObjectsData = new List<TVEGameObjectData>();

            var gameObjectData = new TVEGameObjectData();
            gameObjectData.gameObject = prefabInstance;

            gameObjectsData.Add(gameObjectData);

            TVEUtils.GetChildRecursive(prefabInstance, gameObjectsData);
        }

        void DisableInvalidGameObjectsInPrefab()
        {
            for (int i = 0; i < gameObjectsData.Count; i++)
            {
                var gameObject = gameObjectsData[i].gameObject;

                if (gameObject.name.Contains("Impostor") == true)
                {
                    gameObject.SetActive(false);
                    Debug.Log("<b>[The Vegetation Engine]</b> " + "Impostor Mesh are not supported! The " + gameObject.name + " gameobject remains unchanged!");
                }

                if (gameObject.GetComponent<BillboardRenderer>() != null)
                {
                    gameObject.SetActive(false);
                    Debug.Log("<b>[The Vegetation Engine]</b> " + "Billboard Renderers are not supported! The " + gameObject.name + " gameobject has been disabled. You can manually enable them after the conversion is done!");
                }

                if (gameObject.GetComponent<MeshRenderer>() != null)
                {
                    var material = gameObject.GetComponent<MeshRenderer>().sharedMaterial;

                    if (material != null)
                    {
                        if (material.shader.name.Contains("BK/Billboards"))
                        {
                            gameObject.SetActive(false);
                            Debug.Log("<b>[The Vegetation Engine]</b> " + "BK Billboard Renderers are not supported! The " + gameObject.name + " gameobject has been disabled. You can manually enable them after the conversion is done!");
                        }
                    }
                }

                if (gameObject.GetComponent<Tree>() != null)
                {
                    DestroyImmediate(gameObject.GetComponent<Tree>());
                }
            }
        }

        void EnableInvalidGameObjectsInPrefab()
        {
            for (int i = 0; i < gameObjectsData.Count; i++)
            {
                var gameObject = gameObjectsData[i].gameObject;

                if (gameObject.name.Contains("Impostor") == true)
                {
                    gameObject.SetActive(true);
                }
            }
        }

        void FixInvalidPrefabScripts()
        {
            for (int i = 0; i < gameObjectsData.Count; i++)
            {
                var gameObject = gameObjectsData[i].gameObject;

                GameObjectUtility.RemoveMonoBehavioursWithMissingScript(gameObject);
            }
        }

        void GetMeshRenderersInPrefab()
        {
            for (int i = 0; i < gameObjectsData.Count; i++)
            {
                var gameObjectData = gameObjectsData[i];
                var meshRenderer = gameObjectData.gameObject.GetComponent<MeshRenderer>();

                if (IsValidGameObject(gameObjectData.gameObject) && meshRenderer != null)
                {
                    gameObjectData.meshRenderer = meshRenderer;
                }
            }
        }

        void GetMaterialArraysInPrefab()
        {
            for (int i = 0; i < gameObjectsData.Count; i++)
            {
                var gameObjectData = gameObjectsData[i];

                if (gameObjectData.meshRenderer != null)
                {
                    gameObjectData.originalMaterials = gameObjectData.meshRenderer.sharedMaterials;
                }
            }
        }

        void CreateMaterialArraysInstances()
        {
            for (int i = 0; i < gameObjectsData.Count; i++)
            {
                var gameObjectData = gameObjectsData[i];

                if (gameObjectData.originalMaterials != null)
                {
                    var originalMaterials = gameObjectData.originalMaterials;
                    var instanceMaterials = new Material[originalMaterials.Length];

                    for (int j = 0; j < originalMaterials.Length; j++)
                    {
                        var originalMaterial = originalMaterials[j];

                        if (IsValidMaterial(originalMaterial))
                        {
                            var dataName = GetConvertedAssetName(originalMaterial, "Material");
                            var dataPath = GetConvertedAssetPath(originalMaterial, dataName, "mat", shareCommonMaterials);

                            if (File.Exists(dataPath))
                            {
                                if (keepConvertedMaterialsIsSet == false)
                                {
                                    keepConvertedMaterials = EditorUtility.DisplayDialog("Keep Converted Materials?", "Converted materials found! Would you like to use the converted materials or replace them?", "Keep Converted Materials", "Replace");
                                    keepConvertedMaterialsIsSet = true;
                                }

                                if (keepConvertedMaterials)
                                {
                                    instanceMaterials[j] = AssetDatabase.LoadAssetAtPath<Material>(dataPath);
                                }
                                else
                                {
                                    instanceMaterials[j] = CreateMaterialInstance(dataName, shareCommonMaterials);
                                }

                            }
                            else
                            {
                                instanceMaterials[j] = CreateMaterialInstance(dataName, shareCommonMaterials);
                            }
                        }
                        else
                        {
                            instanceMaterials[j] = originalMaterial;
                        }
                    }

                    gameObjectData.instanceMaterials = instanceMaterials;
                }
            }
        }

        Material CreateMaterialInstance(string dataName, bool shareCommonAssets)
        {
            var instance = new Material(shaderPlant);
            instance.name = dataName;
            instance.enableInstancing = true;

            instance.SetInt("_IsIdentifier", (int)Random.Range(1, 1000));

            if (shareCommonAssets)
            {
                instance.SetInt("_IsShared", 1);
            }
            else
            {
                instance.SetInt("_IsShared", 0);
            }

            return instance;
        }

        void GetMeshFiltersInPrefab()
        {
            for (int i = 0; i < gameObjectsData.Count; i++)
            {
                var gameObjectData = gameObjectsData[i];
                var meshFilter = gameObjectData.gameObject.GetComponent<MeshFilter>();

                if (IsValidGameObject(gameObjectData.gameObject) && meshFilter != null)
                {
                    gameObjectData.meshFilter = meshFilter;
                }
            }
        }

        void GetMeshesInPrefab()
        {
            for (int i = 0; i < gameObjectsData.Count; i++)
            {
                var gameObjectData = gameObjectsData[i];

                if (gameObjectData.meshFilter != null)
                {
                    gameObjectData.originalMesh = gameObjectData.meshFilter.sharedMesh;
                }
            }
        }

        void CreateMeshInstances()
        {
            for (int i = 0; i < gameObjectsData.Count; i++)
            {
                var gameObjectData = gameObjectsData[i];
                var originalMesh = gameObjectData.originalMesh;

                if (originalMesh != null)
                {
                    var dataName = GetConvertedAssetName(originalMesh, "Model");

                    var meshInstance = Instantiate(originalMesh);
                    meshInstance.name = dataName;
                    gameObjectData.instanceMesh = meshInstance;
                }
            }
        }

        void GetMeshCollidersInPrefab()
        {
            for (int i = 0; i < gameObjectsData.Count; i++)
            {
                var gameObjectData = gameObjectsData[i];

                var allMeshCollider = gameObjectData.gameObject.GetComponents<MeshCollider>();

                if (IsValidGameObject(gameObjectData.gameObject))
                {
                    for (int j = 0; j < allMeshCollider.Length; j++)
                    {
                        gameObjectData.meshColliders.Add(allMeshCollider[j]);
                    }
                }
            }
        }

        void GetCollidersInPrefab()
        {
            for (int i = 0; i < gameObjectsData.Count; i++)
            {
                var gameObjectData = gameObjectsData[i];

                for (int j = 0; j < gameObjectData.meshColliders.Count; j++)
                {
                    var meshCollider = gameObjectData.meshColliders[j];

                    gameObjectData.originalColliders.Add(meshCollider.sharedMesh);
                }
            }
        }

        void CreateColliderInstances()
        {
            for (int i = 0; i < gameObjectsData.Count; i++)
            {
                var gameObjectData = gameObjectsData[i];

                for (int j = 0; j < gameObjectData.meshColliders.Count; j++)
                {
                    var originalCollider = gameObjectData.originalColliders[j];

                    if (originalCollider != null)
                    {
                        var dataName = GetConvertedAssetName(originalCollider, "Model");
                        var dataPath = GetConvertedAssetPath(originalCollider, dataName, "asset", true);

                        if (File.Exists(dataPath))
                        {
                            var instanceCollider = AssetDatabase.LoadAssetAtPath<Mesh>(dataPath);
                            gameObjectData.instanceColliders.Add(instanceCollider);
                        }
                        else
                        {
                            var instanceCollider = Instantiate(originalCollider);
                            instanceCollider.name = dataName;

                            gameObjectData.instanceColliders.Add(instanceCollider);
                        }
                    }
                    else
                    {
                        gameObjectData.instanceColliders.Add(null);
                    }
                }
            }
        }

        void PreProcessMeshes()
        {
            uniqueMeshSettings = new List<TVEModelSettings>();

            for (int i = 0; i < gameObjectsData.Count; i++)
            {
                var originalMesh = gameObjectsData[i].originalMesh;

                if (originalMesh != null)
                {
                    var meshPath = AssetDatabase.GetAssetPath(originalMesh);

                    bool exists = false;

                    for (int s = 0; s < uniqueMeshSettings.Count; s++)
                    {
                        var meshSettings = uniqueMeshSettings[s];

                        if (meshSettings.meshPath == meshPath)
                        {
                            exists = true;
                            break;
                        }
                    }

                    if (!exists)
                    {
                        var meshSettings = TVEUtils.PreProcessMesh(meshPath);
                        uniqueMeshSettings.Add(meshSettings);
                    }
                }
            }

            for (int i = 0; i < gameObjectsData.Count; i++)
            {
                var originalColliders = gameObjectsData[i].originalColliders;

                for (int j = 0; j < originalColliders.Count; j++)
                {
                    var originalMesh = originalColliders[j];

                    var meshPath = AssetDatabase.GetAssetPath(originalMesh);

                    bool exists = false;

                    for (int s = 0; s < uniqueMeshSettings.Count; s++)
                    {
                        var meshSettings = uniqueMeshSettings[s];

                        if (meshSettings.meshPath == meshPath)
                        {
                            exists = true;
                            break;
                        }
                    }

                    if (!exists)
                    {
                        var meshSettings = TVEUtils.PreProcessMesh(meshPath);
                        uniqueMeshSettings.Add(meshSettings);
                    }
                }
            }
        }

        void PostProcessMeshes()
        {
            for (int i = 0; i < uniqueMeshSettings.Count; i++)
            {
                //var meshPath = uniqueMeshPaths[i];
                var meshSettings = uniqueMeshSettings[i];
                TVEUtils.PostProcessMesh(meshSettings.meshPath, meshSettings);
            }
        }

        void TransformMeshesToWorldSpace()
        {
            for (int i = 0; i < gameObjectsData.Count; i++)
            {
                var gameObjectData = gameObjectsData[i];

                if (gameObjectData.instanceMesh != null)
                {
                    var instance = gameObjectData.instanceMesh;
                    var transform = gameObjectData.meshFilter.transform;

                    Vector3[] verticesOS = instance.vertices;
                    Vector3[] verticesWS = new Vector3[instance.vertices.Length];

                    // Transform vertioces OS pos to WS pos
                    for (int j = 0; j < verticesOS.Length; j++)
                    {
                        var trans = transform.TransformDirection(verticesOS[j]);

                        verticesWS[j] = new Vector3(transform.lossyScale.x * trans.x + transform.position.x, transform.lossyScale.y * trans.y + transform.position.y, transform.lossyScale.z * trans.z + transform.position.z);
                    }

                    gameObjectData.instanceMesh.vertices = verticesWS;

                    //Some meshes don't have normals, check is needed
                    if (instance.normals != null && instance.normals.Length > 0)
                    {
                        Vector3[] normalsOS = instance.normals;
                        Vector3[] normalsWS = new Vector3[instance.vertices.Length];

                        for (int j = 0; j < normalsOS.Length; j++)
                        {
                            normalsWS[j] = transform.TransformDirection(normalsOS[j]);
                            //normalsWS[j] = new Vector3(transform.lossyScale.x * trans.x, transform.lossyScale.y * trans.y, transform.lossyScale.z * trans.z);
                        }

                        gameObjectData.instanceMesh.normals = normalsWS;
                    }

                    //Some meshes don't have tangenst, check is needed
                    if (instance.tangents != null && instance.tangents.Length > 0)
                    {
                        Vector4[] tangentsOS = instance.tangents;
                        Vector4[] tangentsWS = new Vector4[instance.vertices.Length];

                        for (int j = 0; j < tangentsOS.Length; j++)
                        {
                            tangentsWS[j] = transform.TransformDirection(tangentsOS[j]);
                            tangentsWS[j].w = tangentsOS[j].w;
                        }

                        gameObjectData.instanceMesh.tangents = tangentsWS;
                    }

                    //gameObjectData.mesh.RecalculateTangents();
                    gameObjectData.instanceMesh.RecalculateBounds();
                }
            }

            for (int i = 0; i < gameObjectsData.Count; i++)
            {
                var gameObjectData = gameObjectsData[i];

                for (int j = 0; j < gameObjectData.originalColliders.Count; j++)
                {
                    if (gameObjectData.originalColliders[j] != null && !EditorUtility.IsPersistent(gameObjectData.instanceColliders[j]))
                    {
                        var instance = gameObjectData.instanceColliders[j];
                        var transform = gameObjectData.meshColliders[j].gameObject.transform;

                        Vector3[] verticesOS = instance.vertices;
                        Vector3[] verticesWS = new Vector3[instance.vertices.Length];

                        // Transform vertioces OS pos to WS pos
                        for (int v = 0; v < verticesOS.Length; v++)
                        {
                            var trans = transform.TransformDirection(verticesOS[v]);

                            verticesWS[v] = verticesWS[v] = new Vector3(transform.lossyScale.x * trans.x + transform.position.x, transform.lossyScale.y * trans.y + transform.position.y, transform.lossyScale.z * trans.z + transform.position.z);
                        }

                        gameObjectData.instanceColliders[j].vertices = verticesWS;

                        // Some meshes don't have normals, check is needed
                        if (instance.normals != null && instance.normals.Length > 0)
                        {
                            Vector3[] normalsOS = instance.normals;
                            Vector3[] normalsWS = new Vector3[instance.vertices.Length];

                            for (int v = 0; v < normalsOS.Length; v++)
                            {
                                normalsWS[j] = transform.TransformDirection(normalsOS[j]);
                                //normalsWS[j] = new Vector3(transform.lossyScale.x * trans.x, transform.lossyScale.y * trans.y, transform.lossyScale.z * trans.z);
                            }

                            gameObjectData.instanceColliders[j].normals = normalsWS;
                        }

                        //Some meshes don't have tangenst, check is needed
                        if (instance.tangents != null && instance.tangents.Length > 0)
                        {
                            Vector4[] tangentsOS = instance.tangents;
                            Vector4[] tangentsWS = new Vector4[instance.vertices.Length];

                            for (int t = 0; t < tangentsOS.Length; t++)
                            {
                                tangentsWS[t] = transform.TransformDirection(tangentsOS[t]);
                                tangentsWS[j].w = tangentsOS[j].w;
                            }

                            gameObjectData.instanceColliders[j].tangents = tangentsWS;
                        }

                        gameObjectData.instanceColliders[j].RecalculateBounds();
                    }
                }
            }

            for (int i = 0; i < gameObjectsData.Count; i++)
            {
                var gameObject = gameObjectsData[i].gameObject;

                gameObject.transform.localPosition = Vector3.zero;
                gameObject.transform.localEulerAngles = Vector3.zero;
                gameObject.transform.localScale = Vector3.one;
            }
        }

        void GetMaxBoundsInPrefab()
        {
            maxBoundsInfo = Vector4.zero;

            var bounds = new Bounds(Vector3.zero, Vector3.zero);

            for (int i = 0; i < gameObjectsData.Count; i++)
            {
                var meshInstance = gameObjectsData[i].instanceMesh;

                if (meshInstance != null)
                {
                    bounds.Encapsulate(meshInstance.bounds);
                }
            }

            var maxX = Mathf.Max(Mathf.Abs(bounds.min.x), Mathf.Abs(bounds.max.x));
            var maxZ = Mathf.Max(Mathf.Abs(bounds.min.z), Mathf.Abs(bounds.max.z));

            var maxR = Mathf.Max(maxX, maxZ);
            var maxH = Mathf.Max(Mathf.Abs(bounds.min.y), Mathf.Abs(bounds.max.y));
            var maxS = Mathf.Max(maxR, maxH);

            maxBoundsInfo = new Vector4(maxR, maxH, maxS, 0.0f);
        }

        bool IsValidGameObject(GameObject gameObject)
        {
            bool valid = true;

            if (gameObject.activeInHierarchy == false)
            {
                valid = false;
            }

            return valid;
        }

        /// <summary>
        /// Mesh Packing Macros
        /// </summary>

        void ConvertColliders()
        {
            for (int i = 0; i < gameObjectsData.Count; i++)
            {
                var meshColliders = gameObjectsData[i].meshColliders;
                var originalColliders = gameObjectsData[i].originalColliders;
                var instanceColliders = gameObjectsData[i].instanceColliders;

                for (int j = 0; j < meshColliders.Count; j++)
                {
                    var meshCollider = meshColliders[j];
                    var originalCollider = originalColliders[j];
                    var instanceCollider = instanceColliders[j];

                    if (instanceCollider != null)
                    {
                        if (EditorUtility.IsPersistent(instanceCollider))
                        {
                            meshCollider.sharedMesh = instanceCollider;
                        }
                        else
                        {
                            var dataPath = GetConvertedAssetPath(originalCollider, instanceCollider.name, "asset", true);

                            meshCollider.sharedMesh = SaveMesh(instanceCollider, dataPath);
                        }
                    }
                }
            }
        }

        void ConvertMeshes()
        {
            for (int i = 0; i < gameObjectsData.Count; i++)
            {
                var meshFilter = gameObjectsData[i].meshFilter;
                var originalMesh = gameObjectsData[i].originalMesh;
                var instanceMesh = gameObjectsData[i].instanceMesh;

                if (instanceMesh != null)
                {
                    GetMeshConversionWithTextures(i);

                    if (outputMeshesIndex == OutputMeshes.Default)
                    {
                        ConvertMeshDefault(instanceMesh, i);
                    }
                    else if (outputMeshesIndex == OutputMeshes.Custom)
                    {
                        ConvertMeshCustom(instanceMesh, i);
                    }

                    ConvertMeshNormals(instanceMesh, i, sourceNormals, optionNormals);
                    ConvertMeshBounds(instanceMesh, sourceBounds, optionBounds);

                    var dataPath = GetConvertedAssetPath(originalMesh, instanceMesh.name, "asset", true);

                    meshFilter.sharedMesh = SaveMesh(instanceMesh, dataPath);
                }
            }
        }

        void ConvertMeshDefault(Mesh mesh, int index)
        {
            var vertexCount = mesh.vertexCount;

            var colors = new Color[vertexCount];
            var UV0 = GetCoordData(mesh, 0, 0);
            var UV2 = GetCoordData(mesh, 1, 1);
            var UV4 = GetCoordData(mesh, 0, 0);

            var mainCoord = GetCoordData(mesh, sourceMainCoord, optionMainCoord);
            var detailCoord = GetCoordData(mesh, sourceDetailCoord, optionDetailCoord);

            List<float> height;

            if (sourceHeight == 0)
            {
                height = GetMaskData(mesh, index, 2, 4, 0, null, null, 0, 1.0f);
            }
            else
            {
                height = GetMaskData(mesh, index, sourceHeight, optionHeight, coordHeight, textureHeight, textureHeightList, actionHeight, 1.0f);
            }

            var occlusion = GetMaskData(mesh, index, sourceOcclusion, optionOcclusion, coordOcclusion, textureOcclusion, textureOcclusionList, actionOcclusion, 1.0f);
            var variation = GetMaskData(mesh, index, sourceVariation, optionVariation, coordVariation, textureVariation, textureVariationList, actionVariation, 1.0f);
            var detailMask = GetMaskData(mesh, index, sourceDetail, optionDetail, coordDetail, textureDetail, textureDetailList, actionDetail, 1.0f);

            var motion2 = GetMaskData(mesh, index, sourceMotion2, optionMotion2, coordMotion2, textureMotion2, textureMotion2List, actionMotion2, 1.0f);
            var motion3 = GetMaskData(mesh, index, sourceMotion3, optionMotion3, coordMotion3, textureMotion3, textureMotion3List, actionMotion3, 1.0f);

            var pivots = GetPivotsData(mesh, sourcePivots, optionPivots);

            for (int i = 0; i < vertexCount; i++)
            {
                colors[i] = new Color(variation[i], occlusion[i], detailMask[i], height[i]);
                UV0[i] = new Vector4(mainCoord[i].x, mainCoord[i].y, TVEUtils.MathVector2ToFloat(motion2[i], motion3[i]), TVEUtils.MathVector2ToFloat(maxBoundsInfo.y / 100f, maxBoundsInfo.x / 100f));
                UV2[i] = new Vector4(UV2[i].x, UV2[i].y, detailCoord[i].x, detailCoord[i].y);
                UV4[i] = pivots[i];
            }

            if (mesh.normals == null)
            {
                mesh.RecalculateNormals();
            }

            if (mesh.tangents == null)
            {
                mesh.RecalculateTangents();
            }

            mesh.SetColors(colors);
            mesh.SetUVs(0, UV0);
            mesh.SetUVs(1, UV2);
            mesh.SetUVs(3, UV4);
        }

        void ConvertMeshCustom(Mesh mesh, int index)
        {
            var vertexCount = mesh.vertexCount;

            var colors = new Color[vertexCount];

            var red = GetMaskData(mesh, index, sourceVariation, optionVariation, coordVariation, textureVariation, textureVariationList, actionVariation, 1.0f);
            var green = GetMaskData(mesh, index, sourceOcclusion, optionOcclusion, coordOcclusion, textureOcclusion, textureOcclusionList, actionOcclusion, 1.0f);
            var blue = GetMaskData(mesh, index, sourceDetail, optionDetail, coordDetail, textureDetail, textureDetailList, actionDetail, 1.0f);
            var alpha = GetMaskData(mesh, index, sourceHeight, optionHeight, coordHeight, textureHeight, textureHeightList, actionHeight, 1.0f);

            for (int i = 0; i < vertexCount; i++)
            {
                colors[i] = new Color(red[i], green[i], blue[i], alpha[i]);
            }

            mesh.SetColors(colors);
        }

        void GetMeshConversionFromPreset()
        {
            if (presetIndex == 0)
            {
                return;
            }

            for (int i = 0; i < presetLines.Count; i++)
            {
                var useLine = GetConditionFromLine(presetLines[i]);

                if (useLine)
                {
                    if (presetLines[i].StartsWith("Mesh"))
                    {
                        string[] splitLine = presetLines[i].Split(char.Parse(" "));
                        string name = "";
                        string source = "";
                        int sourceIndex = 0;
                        string option = "";
                        int optionIndex = 0;
                        string action = "";
                        int actionIndex = 0;
                        int coordIndex = 0;

                        if (splitLine.Length > 1)
                        {
                            name = splitLine[1];
                        }

                        if (splitLine.Length > 2)
                        {
                            source = splitLine[2];

                            if (source == "NONE")
                            {
                                sourceIndex = 0;
                            }

                            if (source == "AUTO")
                            {
                                sourceIndex = 0;
                            }

                            // Available options for Float masks
                            if (source == "GET_MASK_FROM_CHANNEL")
                            {
                                sourceIndex = 1;
                            }

                            if (source == "GET_MASK_PROCEDURAL")
                            {
                                sourceIndex = 2;
                            }

                            if (source == "GET_MASK_FROM_TEXTURE")
                            {
                                sourceIndex = 3;
                            }

                            if (source == "GET_MASK_3RD_PARTY")
                            {
                                sourceIndex = 4;
                            }

                            // Available options for Coord masks
                            if (source == "GET_COORD_FROM_CHANNEL")
                            {
                                sourceIndex = 1;
                            }

                            if (source == "GET_COORD_PROCEDURAL")
                            {
                                sourceIndex = 2;
                            }

                            if (source == "GET_COORD_3RD_PARTY")
                            {
                                sourceIndex = 3;
                            }

                            if (source == "GET_NORMALS_PROCEDURAL")
                            {
                                sourceIndex = 1;
                            }

                            if (source == "GET_BOUNDS_PROCEDURAL")
                            {
                                sourceIndex = 1;
                            }

                            if (source == "MARK_MESHES_AS_NON_READABLE")
                            {
                                sourceIndex = 0;
                            }

                            if (source == "MARK_MESHES_AS_READABLE")
                            {
                                sourceIndex = 1;
                            }

                            if (source == "GET_PIVOTS_PROCEDURAL")
                            {
                                sourceIndex = 1;
                            }
                        }

                        if (splitLine.Length > 3)
                        {
                            option = splitLine[3];

                            if (splitLine[3] == "GET_RED")
                            {
                                optionIndex = 1;
                            }
                            else if (option == "GET_GREEN")
                            {
                                optionIndex = 2;
                            }
                            else if (option == "GET_BLUE")
                            {
                                optionIndex = 3;
                            }
                            else if (option == "GET_ALPHA")
                            {
                                optionIndex = 4;
                            }
                            else
                            {
                                optionIndex = int.Parse(option);
                            }
                        }

                        if (splitLine.Length > 5)
                        {
                            if (splitLine[5] == "GET_COORD")
                            {
                                coordIndex = int.Parse(splitLine[6]);
                            }
                        }

                        action = splitLine[splitLine.Length - 1];

                        if (action == "ACTION_ONE_MINUS")
                        {
                            actionIndex = 1;
                        }

                        if (action == "ACTION_NEGATIVE")
                        {
                            actionIndex = 2;
                        }

                        if (action == "ACTION_REMAP_01")
                        {
                            actionIndex = 3;
                        }

                        if (action == "ACTION_POWER_2")
                        {
                            actionIndex = 4;
                        }

                        if (action == "ACTION_MULTIPLY_BY_HEIGHT")
                        {
                            actionIndex = 5;
                        }

                        if (action == "ACTION_APPLY_VARIATION_ID")
                        {
                            actionIndex = 6;
                        }

                        if (name == "SetVariation" || name == "SetRed")
                        {
                            sourceVariation = sourceIndex;
                            optionVariation = optionIndex;
                            actionVariation = actionIndex;
                            coordVariation = coordIndex;
                        }

                        if (name == "SetOcclusion" || name == "SetGreen")
                        {
                            sourceOcclusion = sourceIndex;
                            optionOcclusion = optionIndex;
                            actionOcclusion = actionIndex;
                            coordOcclusion = coordIndex;
                        }

                        if (name == "SetDetailMask" || name == "SetBlue")
                        {
                            sourceDetail = sourceIndex;
                            optionDetail = optionIndex;
                            actionDetail = actionIndex;
                            coordDetail = coordIndex;
                        }

                        if (name == "SetDetailCoord")
                        {
                            sourceDetailCoord = sourceIndex;
                            optionDetailCoord = optionIndex;
                        }

                        if (name == "SetHeight" || name == "SetAlpha")
                        {
                            sourceHeight = sourceIndex;
                            optionHeight = optionIndex;
                            actionHeight = actionIndex;
                            coordHeight = coordIndex;
                        }

                        if (name == "SetMotion2")
                        {
                            sourceMotion2 = sourceIndex;
                            optionMotion2 = optionIndex;
                            actionMotion2 = actionIndex;
                            coordMotion2 = coordIndex;
                        }

                        if (name == "SetMotion3")
                        {
                            sourceMotion3 = sourceIndex;
                            optionMotion3 = optionIndex;
                            actionMotion3 = actionIndex;
                            coordMotion3 = coordIndex;
                        }

                        if (name == "SetPivots")
                        {
                            sourcePivots = sourceIndex;
                            optionPivots = optionIndex;
                        }

                        if (name == "SetNormals")
                        {
                            sourceNormals = sourceIndex;
                            optionNormals = optionIndex;
                        }

                        if (name == "SetBounds")
                        {
                            sourceBounds = sourceIndex;
                            optionBounds = optionIndex;
                        }

                        if (name == "SetReadWrite")
                        {
                            readWriteMode = sourceIndex;
                        }
                    }
                }
            }
        }

        void GetMeshConversionWithTextures(int index)
        {
            if (presetIndex == 0)
            {
                return;
            }

            for (int i = 0; i < presetLines.Count; i++)
            {
                var useLine = GetConditionFromLine(presetLines[i]);

                if (useLine)
                {
                    if (presetLines[i].StartsWith("Mesh"))
                    {
                        string[] splitLine = presetLines[i].Split(char.Parse(" "));
                        string name = "";
                        string source = "";

                        string prop = "";
                        List<Texture2D> textures = new List<Texture2D>();

                        if (splitLine.Length > 1)
                        {
                            name = splitLine[1];
                        }

                        if (splitLine.Length > 4)
                        {
                            source = splitLine[2];
                            prop = splitLine[4];

                            if (source == "GET_MASK_FROM_TEXTURE")
                            {
                                for (int t = 0; t < gameObjectsData[index].originalMaterials.Length; t++)
                                {
                                    var materialArray = gameObjectsData[index].originalMaterials;

                                    if (materialArray != null)
                                    {
                                        var material = materialArray[t];

                                        if (material != null && material.HasProperty(prop))
                                        {
                                            textures.Add((Texture2D)material.GetTexture(prop));
                                        }
                                        else
                                        {
                                            textures.Add(null);
                                        }
                                    }
                                }

                                if (name == "SetVariation" || name == "SetRed")
                                {
                                    textureVariationList = textures;
                                }

                                if (name == "SetOcclusion" || name == "SetGreen")
                                {
                                    textureOcclusionList = textures;
                                }

                                if (name == "SetDetailMask" || name == "SetBlue")
                                {
                                    textureDetailList = textures;
                                }

                                if (name == "SetMultiMask" || name == "SetAlpha")
                                {
                                    textureHeightList = textures;
                                }

                                if (name == "SetMotion2")
                                {
                                    textureMotion2List = textures;
                                }

                                if (name == "SetMotion3")
                                {
                                    textureMotion3List = textures;
                                }
                            }
                        }
                    }
                }
            }
        }

        // Get Float data
        List<float> GetMaskData(Mesh mesh, int index, int source, int option, int coord, Texture2D texture, List<Texture2D> textures, int action, float defaulValue)
        {
            var meshChannel = new List<float>();

            if (source == 0)
            {
                meshChannel = GetMaskDefaultValue(mesh, defaulValue);
            }

            else if (source == 1)
            {
                meshChannel = GetMaskMeshData(mesh, option, defaulValue);
            }

            else if (source == 2)
            {
                meshChannel = GetMaskProceduralData(mesh, option);
            }

            else if (source == 3)
            {
                meshChannel = GetMaskFromTextureData(mesh, index, option, coord, texture, textures);
            }

            else if (source == 4)
            {
                meshChannel = GetMask3rdPartyData(mesh, option);
            }

            if (action > 0)
            {
                meshChannel = MeshAction(meshChannel, mesh, action);
            }

            return meshChannel;
        }

        List<float> GetMaskDefaultValue(Mesh mesh, float defaulValue)
        {
            var vertexCount = mesh.vertexCount;

            var meshChannel = new List<float>(vertexCount);

            for (int i = 0; i < vertexCount; i++)
            {
                meshChannel.Add(defaulValue);
            }

            return meshChannel;
        }

        List<float> GetMaskMeshData(Mesh mesh, int option, float defaulValue)
        {
            var vertexCount = mesh.vertexCount;

            var meshChannel = new List<float>(vertexCount);

            // Vertex Color Data
            if (option == 0)
            {
                var channel = new List<Color>(vertexCount);
                mesh.GetColors(channel);
                var channelCount = channel.Count;

                for (int i = 0; i < channelCount; i++)
                {
                    meshChannel.Add(channel[i].r);
                }
            }

            else if (option == 1)
            {
                var channel = new List<Color>(vertexCount);
                mesh.GetColors(channel);
                var channelCount = channel.Count;

                for (int i = 0; i < channelCount; i++)
                {
                    meshChannel.Add(channel[i].g);
                }
            }

            else if (option == 2)
            {
                var channel = new List<Color>(vertexCount);
                mesh.GetColors(channel);
                var channelCount = channel.Count;

                for (int i = 0; i < channelCount; i++)
                {
                    meshChannel.Add(channel[i].b);
                }
            }

            else if (option == 3)
            {
                var channel = new List<Color>(vertexCount);
                mesh.GetColors(channel);
                var channelCount = channel.Count;

                for (int i = 0; i < channelCount; i++)
                {
                    meshChannel.Add(channel[i].a);
                }
            }

            // UV 0 Data
            else if (option == 4)
            {
                var channel = new List<Vector4>(vertexCount);
                mesh.GetUVs(0, channel);
                var channelCount = channel.Count;

                for (int i = 0; i < channelCount; i++)
                {
                    meshChannel.Add(channel[i].x);
                }
            }

            else if (option == 5)
            {
                var channel = new List<Vector4>(vertexCount);
                mesh.GetUVs(0, channel);
                var channelCount = channel.Count;

                for (int i = 0; i < channelCount; i++)
                {
                    meshChannel.Add(channel[i].y);
                }
            }

            else if (option == 6)
            {
                var channel = new List<Vector4>(vertexCount);
                mesh.GetUVs(0, channel);
                var channelCount = channel.Count;

                for (int i = 0; i < channelCount; i++)
                {
                    meshChannel.Add(channel[i].z);
                }
            }

            else if (option == 7)
            {
                var channel = new List<Vector4>(vertexCount);
                mesh.GetUVs(0, channel);
                var channelCount = channel.Count;

                for (int i = 0; i < channelCount; i++)
                {
                    meshChannel.Add(channel[i].w);
                }
            }

            // UV 2 Data
            else if (option == 8)
            {
                var channel = new List<Vector4>(vertexCount);
                mesh.GetUVs(1, channel);
                var channelCount = channel.Count;

                for (int i = 0; i < channelCount; i++)
                {
                    meshChannel.Add(channel[i].x);
                }
            }

            else if (option == 9)
            {
                var channel = new List<Vector4>(vertexCount);
                mesh.GetUVs(1, channel);
                var channelCount = channel.Count;

                for (int i = 0; i < channelCount; i++)
                {
                    meshChannel.Add(channel[i].y);
                }
            }

            else if (option == 10)
            {
                var channel = new List<Vector4>(vertexCount);
                mesh.GetUVs(1, channel);
                var channelCount = channel.Count;

                for (int i = 0; i < channelCount; i++)
                {
                    meshChannel.Add(channel[i].z);
                }
            }

            else if (option == 11)
            {
                var channel = new List<Vector4>(vertexCount);
                mesh.GetUVs(1, channel);
                var channelCount = channel.Count;

                for (int i = 0; i < channelCount; i++)
                {
                    meshChannel.Add(channel[i].w);
                }
            }

            // UV 3 Data
            else if (option == 12)
            {
                var channel = new List<Vector4>(vertexCount);
                mesh.GetUVs(2, channel);
                var channelCount = channel.Count;

                for (int i = 0; i < channelCount; i++)
                {
                    meshChannel.Add(channel[i].x);
                }
            }

            else if (option == 13)
            {
                var channel = new List<Vector4>(vertexCount);
                mesh.GetUVs(2, channel);
                var channelCount = channel.Count;

                for (int i = 0; i < channelCount; i++)
                {
                    meshChannel.Add(channel[i].y);
                }
            }

            else if (option == 14)
            {
                var channel = new List<Vector4>(vertexCount);
                mesh.GetUVs(2, channel);
                var channelCount = channel.Count;

                for (int i = 0; i < channelCount; i++)
                {
                    meshChannel.Add(channel[i].z);
                }
            }

            else if (option == 15)
            {
                var channel = new List<Vector4>(vertexCount);
                mesh.GetUVs(2, channel);
                var channelCount = channel.Count;

                for (int i = 0; i < channelCount; i++)
                {
                    meshChannel.Add(channel[i].w);
                }
            }

            // UV 4 Data
            else if (option == 16)
            {
                var channel = new List<Vector4>(vertexCount);
                mesh.GetUVs(3, channel);
                var channelCount = channel.Count;

                for (int i = 0; i < channelCount; i++)
                {
                    meshChannel.Add(channel[i].x);
                }
            }

            else if (option == 17)
            {
                var channel = new List<Vector4>(vertexCount);
                mesh.GetUVs(3, channel);
                var channelCount = channel.Count;

                for (int i = 0; i < channelCount; i++)
                {
                    meshChannel.Add(channel[i].y);
                }
            }

            else if (option == 18)
            {
                var channel = new List<Vector4>(vertexCount);
                mesh.GetUVs(3, channel);
                var channelCount = channel.Count;

                for (int i = 0; i < channelCount; i++)
                {
                    meshChannel.Add(channel[i].z);
                }
            }

            else if (option == 19)
            {
                var channel = new List<Vector4>(vertexCount);
                mesh.GetUVs(3, channel);
                var channelCount = channel.Count;

                for (int i = 0; i < channelCount; i++)
                {
                    meshChannel.Add(channel[i].w);
                }
            }

            if (meshChannel.Count == 0)
            {
                meshChannel = GetMaskDefaultValue(mesh, defaulValue);
            }

            return meshChannel;
        }

        List<float> GetMaskProceduralData(Mesh mesh, int option)
        {
            var vertexCount = mesh.vertexCount;
            var vertices = mesh.vertices;
            var normals = mesh.normals;

            var meshChannel = new List<float>(vertexCount);

            if (option == 0)
            {
                for (int i = 0; i < vertexCount; i++)
                {
                    meshChannel.Add(0.0f);
                }
            }
            else if (option == 1)
            {
                for (int i = 0; i < vertexCount; i++)
                {
                    meshChannel.Add(1.0f);
                }
            }
            // Random Variation
            else if (option == 2)
            {
                // Good Enough approach
                var triangles = mesh.triangles;
                var trianglesCount = mesh.triangles.Length;

                for (int i = 0; i < vertexCount; i++)
                {
                    meshChannel.Add(-99);
                }

                for (int i = 0; i < trianglesCount; i += 3)
                {
                    var index1 = triangles[i + 0];
                    var index2 = triangles[i + 1];
                    var index3 = triangles[i + 2];

                    float variation = 0;

                    if (meshChannel[index1] != -99)
                    {
                        variation = meshChannel[index1];
                    }
                    else if (meshChannel[index2] != -99)
                    {
                        variation = meshChannel[index2];
                    }
                    else if (meshChannel[index3] != -99)
                    {
                        variation = meshChannel[index3];
                    }
                    else
                    {
                        variation = UnityEngine.Random.Range(0.0f, 1.0f);
                    }

                    meshChannel[index1] = variation;
                    meshChannel[index2] = variation;
                    meshChannel[index3] = variation;
                }
            }
            // Predictive Variation
            else if (option == 3)
            {
                var triangles = mesh.triangles;
                var trianglesCount = mesh.triangles.Length;

                var elementIndices = new List<int>(vertexCount);
                int elementCount = 0;

                for (int i = 0; i < vertexCount; i++)
                {
                    elementIndices.Add(-99);
                }

                for (int i = 0; i < trianglesCount; i += 3)
                {
                    var index1 = triangles[i + 0];
                    var index2 = triangles[i + 1];
                    var index3 = triangles[i + 2];

                    int element = 0;

                    if (elementIndices[index1] != -99)
                    {
                        element = elementIndices[index1];
                    }
                    else if (elementIndices[index2] != -99)
                    {
                        element = elementIndices[index2];
                    }
                    else if (elementIndices[index3] != -99)
                    {
                        element = elementIndices[index3];
                    }
                    else
                    {
                        element = elementCount;
                        elementCount++;
                    }

                    elementIndices[index1] = element;
                    elementIndices[index2] = element;
                    elementIndices[index3] = element;
                }

                for (int i = 0; i < elementIndices.Count; i++)
                {
                    var variation = (float)elementIndices[i] / elementCount;
                    variation = Mathf.Repeat(variation * seed, 1.0f);
                    meshChannel.Add(variation);
                }
            }
            // Normalized in bounds height
            else if (option == 4)
            {
                for (int i = 0; i < vertexCount; i++)
                {
                    var mask = Mathf.Clamp01(vertices[i].y / maxBoundsInfo.y);

                    meshChannel.Add(mask);
                }
            }
            // Procedural Sphere
            else if (option == 5)
            {
                for (int i = 0; i < vertexCount; i++)
                {
                    var mask = Mathf.Clamp01(Vector3.Distance(vertices[i], Vector3.zero) / maxBoundsInfo.x);

                    meshChannel.Add(mask);
                }
            }
            // Procedural Cylinder no Cap
            else if (option == 6)
            {
                for (int i = 0; i < vertexCount; i++)
                {
                    var mask = Mathf.Clamp01(TVEUtils.MathRemap(Vector3.Distance(vertices[i], new Vector3(0, vertices[i].y, 0)), maxBoundsInfo.x * 0.1f, maxBoundsInfo.x, 0f, 1f));

                    meshChannel.Add(mask);
                }
            }
            // Procedural Capsule
            else if (option == 7)
            {
                for (int i = 0; i < vertexCount; i++)
                {
                    var maskCyl = Mathf.Clamp01(TVEUtils.MathRemap(Vector3.Distance(vertices[i], new Vector3(0, vertices[i].y, 0)), maxBoundsInfo.x * 0.1f, maxBoundsInfo.x, 0f, 1f));
                    var maskCap = Vector3.Magnitude(new Vector3(0, Mathf.Clamp01(TVEUtils.MathRemap(vertices[i].y / maxBoundsInfo.y, 0.8f, 1f, 0f, 1f)), 0));
                    var maskBase = Mathf.Clamp01(TVEUtils.MathRemap(vertices[i].y / maxBoundsInfo.y, 0f, 0.1f, 0f, 1f));
                    var mask = Mathf.Clamp01(maskCyl + maskCap) * maskBase;

                    meshChannel.Add(mask);
                }
            }
            // Base To Top
            else if (option == 8)
            {
                for (int i = 0; i < vertexCount; i++)
                {
                    var mask = 1.0f - Mathf.Clamp01(vertices[i].y / maxBoundsInfo.y);

                    meshChannel.Add(mask);
                }
            }
            // Bottom Projection
            else if (option == 9)
            {
                for (int i = 0; i < vertexCount; i++)
                {
                    var mask = Mathf.Clamp01(Vector3.Dot(new Vector3(0, -1, 0), normals[i]) * 0.5f + 0.5f);

                    meshChannel.Add(mask);
                }
            }
            // Top Projection
            else if (option == 10)
            {
                for (int i = 0; i < vertexCount; i++)
                {
                    var mask = Mathf.Clamp01(Vector3.Dot(new Vector3(0, 1, 0), normals[i]) * 0.5f + 0.5f);

                    meshChannel.Add(mask);
                }
            }
            // Normalized in bounds height with black Offset at the bottom
            else if (option == 11)
            {
                for (int i = 0; i < vertexCount; i++)
                {
                    var height = Mathf.Clamp01(vertices[i].y / maxBoundsInfo.y);
                    var mask = Mathf.Clamp01((height - 0.2f) / (1 - 0.2f));

                    meshChannel.Add(mask);
                }
            }
            // Normalized in bounds height with black Offset at the bottom
            else if (option == 12)
            {
                for (int i = 0; i < vertexCount; i++)
                {
                    var height = Mathf.Clamp01(vertices[i].y / maxBoundsInfo.y);
                    var mask = Mathf.Clamp01((height - 0.4f) / (1 - 0.4f));

                    meshChannel.Add(mask);
                }
            }
            // Normalized in bounds height with black Offset at the bottom
            else if (option == 13)
            {
                for (int i = 0; i < vertexCount; i++)
                {
                    var height = Mathf.Clamp01(vertices[i].y / maxBoundsInfo.y);
                    var mask = Mathf.Clamp01((height - 0.6f) / (1 - 0.6f));

                    meshChannel.Add(mask);
                }
            }
            // Height Grass
            else if (option == 14)
            {
                for (int i = 0; i < vertexCount; i++)
                {
                    var oneMinusMask = 1 - Mathf.Clamp01(vertices[i].y / maxBoundsInfo.y);
                    var powerMask = oneMinusMask * oneMinusMask * oneMinusMask * oneMinusMask;
                    var mask = 1 - powerMask;

                    meshChannel.Add(mask);
                }
            }
            // Procedural Sphere
            else if (option == 15)
            {
                for (int i = 0; i < vertexCount; i++)
                {
                    var sphere = Mathf.Clamp01(Vector3.Distance(vertices[i], Vector3.zero) / maxBoundsInfo.x);
                    var mask = sphere * sphere;

                    meshChannel.Add(mask);
                }
            }
            // Procedural Cylinder no Cap
            else if (option == 16)
            {
                for (int i = 0; i < vertexCount; i++)
                {
                    var cylinder = Mathf.Clamp01(TVEUtils.MathRemap(Vector3.Distance(vertices[i], new Vector3(0, vertices[i].y, 0)), maxBoundsInfo.x * 0.1f, maxBoundsInfo.x, 0f, 1f));
                    var mask = cylinder * cylinder;

                    meshChannel.Add(mask);
                }
            }
            // Procedural Capsule
            else if (option == 17)
            {
                for (int i = 0; i < vertexCount; i++)
                {
                    var maskCyl = Mathf.Clamp01(TVEUtils.MathRemap(Vector3.Distance(vertices[i], new Vector3(0, vertices[i].y, 0)), maxBoundsInfo.x * 0.1f, maxBoundsInfo.x, 0f, 1f));
                    var maskCap = Vector3.Magnitude(new Vector3(0, Mathf.Clamp01(TVEUtils.MathRemap(vertices[i].y / maxBoundsInfo.y, 0.8f, 1f, 0f, 1f)), 0));
                    var maskBase = Mathf.Clamp01(TVEUtils.MathRemap(vertices[i].y / maxBoundsInfo.y, 0f, 0.1f, 0f, 1f));
                    var maskFinal = Mathf.Clamp01(maskCyl + maskCap) * maskBase;
                    var mask = maskFinal * maskFinal;

                    meshChannel.Add(mask);
                }
            }
            // Normalized pos X
            else if (option == 18)
            {
                for (int i = 0; i < vertexCount; i++)
                {
                    var mask = vertices[i].x / maxBoundsInfo.x;

                    meshChannel.Add(mask);
                }
            }
            // Normalized pos Y
            else if (option == 19)
            {
                for (int i = 0; i < vertexCount; i++)
                {
                    var mask = vertices[i].y / maxBoundsInfo.y;

                    meshChannel.Add(mask);
                }
            }
            // Normalized pos Z
            else if (option == 20)
            {
                for (int i = 0; i < vertexCount; i++)
                {
                    var mask = vertices[i].z / maxBoundsInfo.x;

                    meshChannel.Add(mask);
                }
            }
            // Diagonal UV0
            else if (option == 21)
            {
                var channel = new List<Vector2>(vertexCount);
                mesh.GetUVs(0, channel);
                var channelCount = channel.Count;

                for (int i = 0; i < channelCount; i++)
                {
                    var mask = Vector3.SqrMagnitude(channel[i]);

                    meshChannel.Add(mask);
                }
            }

            return meshChannel;
        }

        List<float> GetMask3rdPartyData(Mesh mesh, int option)
        {
            var vertexCount = mesh.vertexCount;
            var vertices = mesh.vertices;

            var meshChannel = new List<float>();

            // CTI Leaves Mask
            if (option == 0)
            {
                var UV3 = mesh.uv3;

                if (UV3 != null && UV3.Length > 0)
                {
                    for (int i = 0; i < vertexCount; i++)
                    {
                        var pivotX = (Mathf.Repeat(UV3[i].x, 1.0f) * 2.0f) - 1.0f;
                        var pivotZ = (Mathf.Repeat(32768.0f * UV3[i].x, 1.0f) * 2.0f) - 1.0f;
                        var pivotY = Mathf.Sqrt(1.0f - Mathf.Clamp01(Vector2.Dot(new Vector2(pivotX, pivotZ), new Vector2(pivotX, pivotZ))));

                        var pivot = new Vector3(pivotX * UV3[i].y, pivotY * UV3[i].y, pivotZ * UV3[i].y);
                        var pos = vertices[i];

                        var mask = Vector3.Magnitude(pos - pivot) / (maxBoundsInfo.x * 1f);

                        meshChannel.Add(mask);
                    }
                }
                else
                {
                    Debug.Log("<b>[The Vegetation Engine]</b> " + "The current originalMesh does not use CTI masks! Please use a procedural mask for flutter!");
                }
            }
            // CTI Leaves Variation
            else if (option == 1)
            {
                var UV3 = mesh.uv3;

                if (UV3 != null && UV3.Length > 0)
                {
                    for (int i = 0; i < vertexCount; i++)
                    {
                        var pivotX = (Mathf.Repeat(UV3[i].x, 1.0f) * 2.0f) - 1.0f;
                        var pivotZ = (Mathf.Repeat(32768.0f * UV3[i].x, 1.0f) * 2.0f) - 1.0f;
                        var pivotY = Mathf.Sqrt(1.0f - Mathf.Clamp01(Vector2.Dot(new Vector2(pivotX, pivotZ), new Vector2(pivotX, pivotZ))));

                        var pivot = new Vector3(pivotX * UV3[i].y, pivotY * UV3[i].y, pivotZ * UV3[i].y);

                        var variX = Mathf.Repeat(pivot.x * 33.3f, 1.0f);
                        var variY = Mathf.Repeat(pivot.y * 33.3f, 1.0f);
                        var variZ = Mathf.Repeat(pivot.z * 33.3f, 1.0f);

                        var mask = variX + variY + variZ;

                        if (UV3[i].x < 0.01f)
                        {
                            mask = 0.0f;
                        }

                        meshChannel.Add(mask);
                    }
                }
                else
                {
                    Debug.Log("<b>[The Vegetation Engine]</b> " + "The current originalMesh does not use CTI masks! Please use a procedural mask for variation!");
                }
            }
            // ST8 Leaves Mask
            else if (option == 2)
            {
                var UV2 = new List<Vector4>();
                var UV3 = new List<Vector4>();
                var UV4 = new List<Vector4>();

                mesh.GetUVs(1, UV2);
                mesh.GetUVs(2, UV3);
                mesh.GetUVs(3, UV4);

                if (UV4.Count != 0)
                {
                    for (int i = 0; i < vertexCount; i++)
                    {
                        var anchor = new Vector3(UV2[i].z - vertices[i].x, UV2[i].w - vertices[i].y, UV3[i].w - vertices[i].z);
                        var length = Vector3.Magnitude(anchor);
                        var leaves = UV2[i].w * UV4[i].w;

                        var mask = (length * leaves) / maxBoundsInfo.x;

                        meshChannel.Add(mask);
                    }
                }
                else
                {
                    for (int i = 0; i < vertexCount; i++)
                    {
                        var mask = Mathf.Clamp01(vertices[i].y / maxBoundsInfo.y);

                        meshChannel.Add(mask);
                    }
                }
            }
            // NM Leaves Mask
            else if (option == 3)
            {
                var colors = new List<Color>(vertexCount);
                mesh.GetColors(colors);

                if (colors.Count != 0)
                {
                    for (int i = 0; i < vertexCount; i++)
                    {
                        if (colors[i].a > 0.99f)
                        {
                            meshChannel.Add(0.0f);
                        }
                        else
                        {
                            meshChannel.Add(colors[i].a);
                        }
                    }
                }
                else
                {
                    for (int i = 0; i < vertexCount; i++)
                    {
                        var mask = Mathf.Clamp01(vertices[i].y / maxBoundsInfo.y);

                        meshChannel.Add(mask);
                    }
                }
            }

            // Nicrom Leaves Mask
            else if (option == 4)
            {
                var UV0 = new List<Vector4>();

                mesh.GetUVs(0, UV0);

                for (int i = 0; i < vertexCount; i++)
                {
                    var mask = 0;

                    if (UV0[i].x > 1.5)
                    {
                        mask = 1;
                    }

                    meshChannel.Add(mask);
                }
            }

            // Nicrom Detail Mask
            else if (option == 5)
            {
                var UV0 = new List<Vector4>();

                mesh.GetUVs(0, UV0);

                for (int i = 0; i < vertexCount; i++)
                {
                    var mask = 0;

                    if (UV0[i].y > 0)
                    {
                        mask = 1;
                    }

                    meshChannel.Add(1 - mask);
                }
            }

            // BOTD Branch Variation
            else if (option == 6)
            {
                var UV3 = new List<Vector4>();

                mesh.GetUVs(3, UV3);

                for (int i = 0; i < vertexCount; i++)
                {
                    var pivot = UnpackPivot0(UV3[i]);

                    var variX = Mathf.Repeat(pivot.x * 33.3f, 1.0f);
                    var variY = Mathf.Repeat(pivot.y * 33.3f, 1.0f);
                    var variZ = Mathf.Repeat(pivot.z * 33.3f, 1.0f);

                    var mask = pivot.x;

                    meshChannel.Add(mask);
                }
            }

            return meshChannel;
        }

        Vector3 UnpackPivot0(Vector3 packedData)
        {
            Vector3 pivotPos0;

            //if (packedData.y & 0xFFFF0000)
            {
                pivotPos0.x = UnpackFixedToSFloat((uint)packedData.x, 8f, 10, 22);
                pivotPos0.y = UnpackFixedToUFloat((uint)packedData.x, 32f, 12, 10);
                pivotPos0.z = UnpackFixedToSFloat((uint)packedData.x, 8f, 10, 0);
            }

            return pivotPos0;
        }

        Vector3 UnpackPivot1(Vector3 packedData)
        {
            Vector3 pivotPos1;

            //if (packedData.y & 0x0000FFFF)
            {
                pivotPos1.x = UnpackFixedToSFloat((uint)(packedData.z), 8f, 10, 22);
                pivotPos1.y = UnpackFixedToUFloat((uint)(packedData.z), 32f, 12, 10);
                pivotPos1.z = UnpackFixedToSFloat((uint)(packedData.z), 8f, 10, 0);

            }
            return pivotPos1;
        }

        float UnpackFixedToSFloat(uint val, float range, uint bits, uint shift)
        {
            uint BitMask = (1u << (int)bits) - 1u;
            val = (val >> (int)shift) & BitMask;
            float fval = val / (float)BitMask;
            return (fval * 2f - 1f) * range;
        }

        float UnpackFixedToUFloat(uint val, float range, uint bits, uint shift)
        {
            uint BitMask = (1u << (int)bits) - 1u;
            val = (val >> (int)shift) & BitMask;
            float fval = val / (float)BitMask;
            return fval * range;
        }

        List<float> GetMaskFromTextureData(Mesh mesh, int index, int option, int coord, Texture2D userTexture, List<Texture2D> textures)
        {
            var vertexCount = mesh.vertexCount;
            var subMeshMaterials = gameObjectsData[index].originalMaterials;
            var subMeshIndices = new List<int>(subMeshMaterials.Length + 1);

            for (int i = 0; i < subMeshMaterials.Length; i++)
            {
                var subMeshDescriptor = mesh.GetSubMesh(i);

                subMeshIndices.Add(subMeshDescriptor.firstVertex);
            }

            subMeshIndices.Add(vertexCount);

            var meshChannel = new List<float>(vertexCount);

            if (textures == null || textures.Count == 0)
            {
                textures = new List<Texture2D>(subMeshMaterials.Length);

                if (userTexture != null)
                {
                    for (int i = 0; i < subMeshMaterials.Length; i++)
                    {
                        textures.Add(userTexture);
                    }
                }
                else
                {
                    textures.Add(null);
                }
            }

            for (int i = 0; i < vertexCount; i++)
            {
                meshChannel.Add(0);
            }

            for (int s = 0; s < subMeshIndices.Count - 1; s++)
            {
                var texture = textures[s];

                if (texture != null)
                {
                    string texPath = AssetDatabase.GetAssetPath(texture);
                    TextureImporter texImporter = AssetImporter.GetAtPath(texPath) as TextureImporter;

                    texImporter.isReadable = true;
                    texImporter.SaveAndReimport();
                    AssetDatabase.Refresh();

                    var meshCoord = GetCoordMeshData(mesh, coord);

                    if (meshCoord.Count == 0)
                    {
                        for (int i = 0; i < vertexCount; i++)
                        {
                            meshCoord.Add(Vector4.zero);
                        }
                    }

                    if (option == 0)
                    {
                        for (int i = subMeshIndices[s]; i < subMeshIndices[s + 1]; i++)
                        {
                            var pixel = texture.GetPixelBilinear(meshCoord[i].x, meshCoord[i].y);
                            meshChannel[i] = pixel.r;
                        }
                    }
                    else if (option == 1)
                    {
                        for (int i = subMeshIndices[s]; i < subMeshIndices[s + 1]; i++)
                        {
                            var pixel = texture.GetPixelBilinear(meshCoord[i].x, meshCoord[i].y);
                            meshChannel[i] = pixel.g;
                        }
                    }
                    else if (option == 2)
                    {
                        for (int i = subMeshIndices[s]; i < subMeshIndices[s + 1]; i++)
                        {
                            var pixel = texture.GetPixelBilinear(meshCoord[i].x, meshCoord[i].y);
                            meshChannel[i] = pixel.b;
                        }
                    }
                    else if (option == 3)
                    {
                        for (int i = subMeshIndices[s]; i < subMeshIndices[s + 1]; i++)
                        {
                            var pixel = texture.GetPixelBilinear(meshCoord[i].x, meshCoord[i].y);
                            meshChannel[i] = pixel.a;
                        }
                    }

                    texImporter.isReadable = false;
                    texImporter.SaveAndReimport();
                    AssetDatabase.Refresh();
                }
            }

            return meshChannel;
        }

        List<Color> GetVertexColors(Mesh mesh)
        {
            var vertexCount = mesh.vertexCount;

            var colors = new List<Color>(vertexCount);

            mesh.GetColors(colors);

            if (colors.Count == 0)
            {
                for (int i = 0; i < vertexCount; i++)
                {
                    colors.Add(Color.white);
                }
            }

            return colors;
        }

        List<Vector4> GetCoordData(Mesh mesh, int source, int option)
        {
            var vertexCount = mesh.vertexCount;

            var meshCoord = new List<Vector4>(vertexCount);

            if (source == 0)
            {
                mesh.GetUVs(0, meshCoord);
            }
            else if (source == 1)
            {
                meshCoord = GetCoordMeshData(mesh, option);
            }
            else if (source == 2)
            {
                meshCoord = GetCoordProceduralData(mesh, option);
            }
            else if (source == 3)
            {
                meshCoord = GetCoord3rdPartyData(mesh, option);
            }

            if (meshCoord.Count == 0)
            {
                for (int i = 0; i < vertexCount; i++)
                {
                    meshCoord.Add(Vector4.zero);
                }

                //if (vertexCount != 0)
                //{
                //    Unwrapping.GenerateSecondaryUVSet(originalMesh);
                //    originalMesh.GetUVs(1, meshCoord);
                //}
            }

            return meshCoord;
        }

        List<Vector4> GetCoordMeshData(Mesh mesh, int option)
        {
            var vertexCount = mesh.vertexCount;

            var meshCoord = new List<Vector4>(vertexCount);

            if (option == 0)
            {
                mesh.GetUVs(0, meshCoord);
            }

            else if (option == 1)
            {
                mesh.GetUVs(1, meshCoord);
            }

            else if (option == 2)
            {
                mesh.GetUVs(2, meshCoord);
            }

            else if (option == 3)
            {
                mesh.GetUVs(3, meshCoord);
            }

            return meshCoord;
        }

        List<Vector4> GetCoordProceduralData(Mesh mesh, int option)
        {
            var vertexCount = mesh.vertexCount;
            var vertices = mesh.vertices;

            var meshCoord = new List<Vector4>(vertexCount);

            // Automatic (Get LightmapUV)
            if (option == 0)
            {
                mesh.GetUVs(1, meshCoord);

                if (meshCoord.Count == 0)
                {
                    if (vertexCount != 0)
                    {
                        Unwrapping.GenerateSecondaryUVSet(mesh);
                        mesh.GetUVs(1, meshCoord);
                    }
                }
            }
            // Planar XZ
            else if (option == 1)
            {
                for (int i = 0; i < vertexCount; i++)
                {
                    meshCoord.Add(new Vector4(vertices[i].x, vertices[i].z, 0, 0));
                }
            }
            // Planar XY
            else if (option == 2)
            {
                for (int i = 0; i < vertexCount; i++)
                {
                    meshCoord.Add(new Vector4(vertices[i].x, vertices[i].y, 0, 0));
                }
            }
            // Planar ZY
            else if (option == 3)
            {
                for (int i = 0; i < vertexCount; i++)
                {
                    meshCoord.Add(new Vector4(vertices[i].z, vertices[i].y, 0, 0));
                }
            }

            return meshCoord;
        }

        List<Vector4> GetCoord3rdPartyData(Mesh mesh, int option)
        {
            var vertexCount = mesh.vertexCount;

            var meshCoord = new List<Vector4>(vertexCount);

            // NM Trunk Blend
            if (option == 0)
            {
                mesh.GetUVs(2, meshCoord);

                if (meshCoord.Count == 0)
                {
                    mesh.GetUVs(1, meshCoord);
                }
            }

            return meshCoord;
        }

        List<Vector4> GetPivotsData(Mesh mesh, int source, int option)
        {
            var vertexCount = mesh.vertexCount;

            var meshPivots = new List<Vector4>(vertexCount);

            if (source == 0)
            {
                for (int i = 0; i < vertexCount; i++)
                {
                    meshPivots.Add(Vector4.zero);
                }
            }
            else if (source == 1)
            {
                meshPivots = GetPivotsProceduralData(mesh, option);
            }

            if (meshPivots.Count == 0)
            {
                for (int i = 0; i < vertexCount; i++)
                {
                    meshPivots.Add(Vector4.zero);
                }
            }

            return meshPivots;
        }

        List<Vector4> GetPivotsProceduralData(Mesh mesh, int option)
        {
            var vertexCount = mesh.vertexCount;

            var meshPivots = new List<Vector4>(vertexCount);

            // Procedural Pivots XZ
            if (option == 0)
            {
                meshPivots = GenerateElementPivots(mesh);
            }

            return meshPivots;
        }

        List<float> GeneratePredictiveVariation(Mesh mesh)
        {
            var vertexCount = mesh.vertexCount;
            var meshChannel = new List<float>(vertexCount);

            var triangles = mesh.triangles;
            var trianglesCount = mesh.triangles.Length;

            var elementIndices = new List<int>(vertexCount);
            int elementCount = 0;

            for (int i = 0; i < vertexCount; i++)
            {
                elementIndices.Add(-99);
            }

            for (int i = 0; i < trianglesCount; i += 3)
            {
                var index1 = triangles[i + 0];
                var index2 = triangles[i + 1];
                var index3 = triangles[i + 2];

                int element = 0;

                if (elementIndices[index1] != -99)
                {
                    element = elementIndices[index1];
                }
                else if (elementIndices[index2] != -99)
                {
                    element = elementIndices[index2];
                }
                else if (elementIndices[index3] != -99)
                {
                    element = elementIndices[index3];
                }
                else
                {
                    element = elementCount;
                    elementCount++;
                }

                elementIndices[index1] = element;
                elementIndices[index2] = element;
                elementIndices[index3] = element;
            }

            for (int i = 0; i < elementIndices.Count; i++)
            {
                var variation = (float)elementIndices[i] / elementCount;
                variation = Mathf.Repeat(variation * seed, 1.0f);
                meshChannel.Add(variation);
            }

            return meshChannel;
        }

        List<Vector4> GenerateElementPivots(Mesh mesh)
        {
            var vertexCount = mesh.vertexCount;
            var vertices = mesh.vertices;
            var triangles = mesh.triangles;
            var trianglesCount = mesh.triangles.Length;

            var elementIndices = new List<int>(vertexCount);
            var meshPivots = new List<Vector4>(vertexCount);
            int elementCount = 0;

            for (int i = 0; i < vertexCount; i++)
            {
                elementIndices.Add(-99);
            }

            for (int i = 0; i < vertexCount; i++)
            {
                meshPivots.Add(Vector4.zero);
            }

            for (int i = 0; i < trianglesCount; i += 3)
            {
                var index1 = triangles[i + 0];
                var index2 = triangles[i + 1];
                var index3 = triangles[i + 2];

                int element = 0;

                if (elementIndices[index1] != -99)
                {
                    element = elementIndices[index1];
                }
                else if (elementIndices[index2] != -99)
                {
                    element = elementIndices[index2];
                }
                else if (elementIndices[index3] != -99)
                {
                    element = elementIndices[index3];
                }
                else
                {
                    element = elementCount;
                    elementCount++;
                }

                elementIndices[index1] = element;
                elementIndices[index2] = element;
                elementIndices[index3] = element;
            }

            for (int e = 0; e < elementCount; e++)
            {
                var positions = new List<Vector3>();

                for (int i = 0; i < elementIndices.Count; i++)
                {
                    if (elementIndices[i] == e)
                    {
                        positions.Add(vertices[i]);
                    }
                }

                float x = 0;
                float z = 0;

                for (int p = 0; p < positions.Count; p++)
                {
                    x = x + positions[p].x;
                    z = z + positions[p].z;
                }

                for (int i = 0; i < elementIndices.Count; i++)
                {
                    if (elementIndices[i] == e)
                    {
                        meshPivots[i] = new Vector4(x / positions.Count, z / positions.Count, 0, 0);
                    }
                }
            }

            return meshPivots;
        }

        void ConvertMeshNormals(Mesh mesh, int index, int source, int option)
        {
            if (source == 1)
            {
                var vertexCount = mesh.vertexCount;
                var vertices = mesh.vertices;
                var normals = mesh.normals;
                var subMeshMaterials = gameObjectsData[index].instanceMaterials;
                var subMeshIndices = new List<int>(subMeshMaterials.Length + 1);

                for (int i = 0; i < subMeshMaterials.Length; i++)
                {
                    var subMeshDescriptor = mesh.GetSubMesh(i);

                    subMeshIndices.Add(subMeshDescriptor.firstVertex);
                }

                subMeshIndices.Add(vertexCount);

                if (option == 0 || normals == null)
                {
                    mesh.RecalculateNormals();
                }

                Vector3[] customNormals = mesh.normals;

                for (int s = 0; s < subMeshIndices.Count - 1; s++)
                {
                    //Debug.Log(subMeshIndices[s] + "  " + subMeshIndices[s + 1] + "  " + subMeshMaterials[s].shader.name);

                    if (subMeshMaterials[s] == null)
                    {
                        continue;
                    }

                    if (subMeshMaterials[s].shader.name.Contains("Bark") || subMeshMaterials[s].shader.name.Contains("Prop"))
                    {
                        for (int i = subMeshIndices[s]; i < subMeshIndices[s + 1]; i++)
                        {
                            customNormals[i] = normals[i];
                        }
                    }
                    else
                    {
                        // Flat Shading Low
                        if (option == 1)
                        {
                            for (int i = subMeshIndices[s]; i < subMeshIndices[s + 1]; i++)
                            {
                                var height = Mathf.Clamp01(vertices[i].y / maxBoundsInfo.y);

                                customNormals[i] = Vector3.Lerp(normals[i], new Vector3(0, 1, 0), height);
                            }
                        }

                        // Flat Shading Medium
                        else if (option == 2)
                        {
                            for (int i = subMeshIndices[s]; i < subMeshIndices[s + 1]; i++)
                            {
                                var height = Mathf.Clamp01(Mathf.Clamp01(vertices[i].y / maxBoundsInfo.y) + 0.5f);

                                customNormals[i] = Vector3.Lerp(normals[i], new Vector3(0, 1, 0), height);
                            }
                        }

                        // Flat Shading Full
                        else if (option == 3)
                        {
                            for (int i = subMeshIndices[s]; i < subMeshIndices[s + 1]; i++)
                            {
                                customNormals[i] = new Vector3(0, 1, 0);
                            }
                        }

                        // Spherical Shading Low
                        else if (option == 4)
                        {
                            for (int i = subMeshIndices[s]; i < subMeshIndices[s + 1]; i++)
                            {
                                var spherical = Vector3.Normalize(vertices[i]);

                                customNormals[i] = Vector3.Lerp(normals[i], spherical, 0.5f);
                            }
                        }

                        // Spherical Shading Medium
                        else if (option == 5)
                        {
                            for (int i = subMeshIndices[s]; i < subMeshIndices[s + 1]; i++)
                            {
                                var spherical = Vector3.Normalize(vertices[i]);

                                customNormals[i] = Vector3.Lerp(normals[i], spherical, 0.75f);
                            }
                        }

                        // Spherical Shading Full
                        else if (option == 6)
                        {
                            for (int i = subMeshIndices[s]; i < subMeshIndices[s + 1]; i++)
                            {
                                customNormals[i] = Vector3.Normalize(vertices[i]);
                            }
                        }

                        // Flat To Spherical Shading (Low)
                        else if (option == 7)
                        {
                            for (int i = subMeshIndices[s]; i < subMeshIndices[s + 1]; i++)
                            {
                                var height = Mathf.Clamp01(vertices[i].y / maxBoundsInfo.y);
                                var spherical = Vector3.Normalize(vertices[i]);

                                customNormals[i] = Vector3.Lerp(new Vector3(0, 1, 0), spherical, Mathf.Lerp(0.0f, 0.5f, height));
                            }
                        }

                        // Flat To Spherical Shading (Medium)
                        else if (option == 8)
                        {
                            for (int i = subMeshIndices[s]; i < subMeshIndices[s + 1]; i++)
                            {
                                var height = Mathf.Clamp01(vertices[i].y / maxBoundsInfo.y);
                                var spherical = Vector3.Normalize(vertices[i]);

                                customNormals[i] = Vector3.Lerp(new Vector3(0, 1, 0), spherical, Mathf.Lerp(0.0f, 0.75f, height));
                            }
                        }

                        // Flat To Spherical Shading (Full)
                        else if (option == 9)
                        {
                            for (int i = subMeshIndices[s]; i < subMeshIndices[s + 1]; i++)
                            {
                                var height = Mathf.Clamp01(vertices[i].y / maxBoundsInfo.y);
                                var spherical = Vector3.Normalize(vertices[i]);

                                customNormals[i] = Vector3.Lerp(new Vector3(0, 1, 0), spherical, height);
                            }
                        }
                    }
                }

                mesh.normals = customNormals;
                mesh.RecalculateTangents();
            }
        }

        void ConvertMeshBounds(Mesh mesh, int source, int option)
        {
            if (source == 1)
            {
                float expand = 1.0f;

                if (option == 0)
                    expand = 1.2f;

                if (option == 1)
                    expand = 1.4f;

                if (option == 2)
                    expand = 1.6f;

                if (option == 3)
                    expand = 2.0f;

                Bounds bounds = new Bounds();
                Vector3 min = new Vector3(-maxBoundsInfo.x * expand, mesh.bounds.min.y, -maxBoundsInfo.x * expand);
                Vector3 max = new Vector3(maxBoundsInfo.x * expand, maxBoundsInfo.y + (maxBoundsInfo.y * 0.25f), maxBoundsInfo.x * expand);
                bounds.SetMinMax(min, max);

                mesh.bounds = bounds;
            }
        }

        /// <summary>
        /// Mesh Actions
        /// </summary>

        List<float> MeshAction(List<float> source, Mesh mesh, int action)
        {
            if (action == 1)
            {
                source = MeshActionInvert(source);
            }
            else if (action == 2)
            {
                source = MeshActionNegate(source);
            }
            else if (action == 3)
            {
                source = MeshActionRemap01(source);
            }
            else if (action == 4)
            {
                source = MeshActionPower2(source);
            }
            else if (action == 5)
            {
                source = MeshActionMultiplyByHeight(source, mesh);
            }
            else if (action == 6)
            {
                source = MeshActionUseBranchID(source, mesh);
            }

            return source;
        }

        List<float> MeshActionInvert(List<float> source)
        {
            for (int i = 0; i < source.Count; i++)
            {
                source[i] = 1.0f - source[i];
            }

            return source;
        }

        List<float> MeshActionNegate(List<float> source)
        {
            for (int i = 0; i < source.Count; i++)
            {
                source[i] = source[i] * -1.0f;
            }

            return source;
        }

        List<float> MeshActionRemap01(List<float> source)
        {
            float min = source[0];
            float max = source[0];

            for (int i = 0; i < source.Count; i++)
            {
                if (source[i] < min)
                    min = source[i];

                if (source[i] > max)
                    max = source[i];
            }

            // Avoid divide by 0
            if (min != max)
            {
                for (int i = 0; i < source.Count; i++)
                {
                    source[i] = (source[i] - min) / (max - min);
                }
            }
            else
            {
                for (int i = 0; i < source.Count; i++)
                {
                    source[i] = 0.0f;
                }
            }

            return source;
        }

        List<float> MeshActionPower2(List<float> source)
        {
            for (int i = 0; i < source.Count; i++)
            {
                source[i] = Mathf.Pow(source[i], 2.0f);
            }

            return source;
        }

        List<float> MeshActionMultiplyByHeight(List<float> source, Mesh mesh)
        {
            var vertices = mesh.vertices;

            for (int i = 0; i < source.Count; i++)
            {
                var mask = Mathf.Clamp01(vertices[i].y / maxBoundsInfo.y);

                source[i] = source[i] * mask;
            }

            return source;
        }

        List<float> MeshActionUseBranchID(List<float> source, Mesh mesh)
        {
            var variation = GeneratePredictiveVariation(mesh);

            for (int i = 0; i < source.Count; i++)
            {
                source[i] = source[i] * 99 + variation[i] + 1;
            }

            return source;
        }

        /// <summary>
        /// Convert Macros
        /// </summary>

        void ConvertMaterials()
        {
            for (int i = 0; i < gameObjectsData.Count; i++)
            {
                var originalMaterials = gameObjectsData[i].originalMaterials;
                var instanceMaterials = gameObjectsData[i].instanceMaterials;

                if (originalMaterials != null)
                {
                    for (int j = 0; j < originalMaterials.Length; j++)
                    {
                        var originalMaterial = originalMaterials[j];
                        var instanceMaterial = instanceMaterials[j];

                        if (IsValidMaterial(instanceMaterial))
                        {
                            ConvertMaterial(originalMaterial, instanceMaterial, i);

                            var dataPath = GetConvertedAssetPath(originalMaterial, instanceMaterial.name, "mat", shareCommonMaterials);

                            instanceMaterials[j] = SaveMaterial(instanceMaterial, dataPath);
                        }
                    }
                }
            }

            for (int i = 0; i < gameObjectsData.Count; i++)
            {
                var meshRenderer = gameObjectsData[i].meshRenderer;
                var materialArrayInstances = gameObjectsData[i].instanceMaterials;

                if (meshRenderer != null)
                {
                    meshRenderer.sharedMaterials = materialArrayInstances;
                }
            }
        }

        void ConvertMaterial(Material originalMaterial, Material instanceMaterial, int index)
        {
            GetMaterialConversionFromPreset(originalMaterial, instanceMaterial, index);
            SetMaterialPostSettings(instanceMaterial);
            TVEUtils.SetMaterialSettings(instanceMaterial);
        }

        void GetDefaultShadersFromPreset()
        {
            for (int i = 0; i < presetLines.Count; i++)
            {
                if (presetLines[i].StartsWith("Shader"))
                {
                    string[] splitLine = presetLines[i].Split(char.Parse(" "));

                    var type = "";

                    if (splitLine.Length > 1)
                    {
                        type = splitLine[1];
                    }

                    if (type == "SHADER_DEFAULT_BARK")
                    {
                        var shader = presetLines[i].Replace("Shader SHADER_DEFAULT_BARK ", "");

                        if (Shader.Find(shader) != null)
                        {
                            shaderBark = Shader.Find(shader);
                        }
                    }
                    else if (type == "SHADER_DEFAULT_PLANT")
                    {
                        var shader = presetLines[i].Replace("Shader SHADER_DEFAULT_PLANT ", "");

                        if (Shader.Find(shader) != null)
                        {
                            shaderPlant = Shader.Find(shader);
                        }
                    }
                    else if (type == "SHADER_DEFAULT_PROP")
                    {
                        var shader = presetLines[i].Replace("Shader SHADER_DEFAULT_PROP ", "");

                        if (Shader.Find(shader) != null)
                        {
                            shaderProp = Shader.Find(shader);
                        }
                    }
                }
            }
        }

        void GetMaterialConversionFromPreset(Material originalMaterial, Material instanceMaterial, int index)
        {
            if (presetIndex == 0)
            {
                return;
            }

            bool doPostProcessing = false;
            bool doPacking = false;

            if (!EditorUtility.IsPersistent(instanceMaterial))
            {
                doPostProcessing = true;
            }

            var material = originalMaterial;
            var texName = "_MainMaskTex";

            int maskIndex = 0;
            int packChannel = 0;
            int coordChannel = 0;
            ////int layerChannel = 0;
            int action0Index = 0;
            int action1Index = 0;
            int action2Index = 0;

            TVEPackerData packerData = TVEUtils.CreatePackerData();

            InitMaterialConditionFromLine();

            for (int i = 0; i < presetLines.Count; i++)
            {
                var useLine = GetConditionFromLine(presetLines[i], material);

                if (useLine)
                {
                    if (presetLines[i].StartsWith("Utility"))
                    {
                        string[] splitLine = presetLines[i].Split(char.Parse(" "));

                        var type = "";
                        var file = "";

                        if (splitLine.Length > 1)
                        {
                            type = splitLine[1];
                        }

                        if (splitLine.Length > 2)
                        {
                            file = splitLine[2];
                        }

                        // Create a copy of the material instance at this point
                        if (type == "USE_CONVERTED_MATERIAL_AS_BASE")
                        {
                            material = new Material(instanceMaterial);
                        }

                        // Use the currently converted material
                        if (type == "USE_CURRENT_MATERIAL_AS_BASE")
                        {
                            material = instanceMaterial;
                        }

                        // Reset material to original
                        if (type == "USE_ORIGINAL_MATERIAL_AS_BASE")
                        {
                            material = originalMaterial;
                        }

                        // Allow material conversion even if Keep Converted is on
                        if (type == "USE_MATERIAL_POST_PROCESSING")
                        {
                            doPostProcessing = true;
                        }

                        if (type == "START_TEXTURE_PACKING")
                        {
                            doPacking = true;
                        }

                        if (type == "DELETE_FILES_BY_NAME")
                        {
                            string dataPath;

                            dataPath = prefabDataFolder;

                            if (Directory.Exists(dataPath) && file != "")
                            {
                                var allFolderFiles = Directory.GetFiles(dataPath);

                                for (int f = 0; f < allFolderFiles.Length; f++)
                                {
                                    if (allFolderFiles[f].Contains(file))
                                    {
                                        FileUtil.DeleteFileOrDirectory(allFolderFiles[f]);
                                    }
                                }

                                AssetDatabase.Refresh();
                            }
                        }
                    }

                    if (presetLines[i].StartsWith("Material") && doPostProcessing)
                    {
                        string[] splitLine = presetLines[i].Split(char.Parse(" "));

                        var type = "";
                        var src = "";
                        var dst = "";
                        var val = "";
                        var set = "";

                        var x = "0";
                        var y = "0";
                        var z = "0";
                        var w = "0";

                        if (splitLine.Length > 1)
                        {
                            type = splitLine[1];
                        }

                        if (splitLine.Length > 2)
                        {
                            src = splitLine[2];
                            set = splitLine[2];
                        }

                        if (splitLine.Length > 3)
                        {
                            dst = splitLine[3];
                            x = splitLine[3];
                        }

                        if (splitLine.Length > 4)
                        {
                            val = splitLine[4];
                            y = splitLine[4];
                        }

                        if (splitLine.Length > 5)
                        {
                            z = splitLine[5];
                        }

                        if (splitLine.Length > 6)
                        {
                            w = splitLine[6];
                        }

                        if (type == "SET_SHADER")
                        {
                            instanceMaterial.shader = GetShaderFromPreset(set);
                        }
                        else if (type == "SET_SHADER_BY_NAME")
                        {
                            var shader = presetLines[i].Replace("Material SET_SHADER_BY_NAME ", "");

                            if (Shader.Find(shader) != null)
                            {
                                instanceMaterial.shader = Shader.Find(shader);
                            }
                        }
                        else if (type == "SET_SHADER_BY_LIGHTING")
                        {
                            var lighting = presetLines[i].Replace("Material SET_SHADER_BY_LIGHTING ", "");

                            var newShaderName = material.shader.name;
                            newShaderName = newShaderName.Replace("Vertex", "XXX");
                            newShaderName = newShaderName.Replace("Simple", "XXX");
                            newShaderName = newShaderName.Replace("Standard", "XXX");
                            newShaderName = newShaderName.Replace("Subsurface", "XXX");
                            newShaderName = newShaderName.Replace("XXX", lighting);

                            if (Shader.Find(newShaderName) != null)
                            {
                                material.shader = Shader.Find(newShaderName);
                            }
                        }
                        else if (type == "SET_SHADER_BY_REPLACE")
                        {
                            var shader = material.shader.name.Replace(src, dst);

                            if (Shader.Find(shader) != null)
                            {
                                material.shader = Shader.Find(shader);
                            }
                        }
                        else if (type == "SET_FLOAT")
                        {
                            instanceMaterial.SetFloat(set, float.Parse(x, CultureInfo.InvariantCulture));
                        }
                        else if (type == "SET_COLOR")
                        {
                            instanceMaterial.SetColor(set, new Color(float.Parse(x, CultureInfo.InvariantCulture), float.Parse(y, CultureInfo.InvariantCulture), float.Parse(z, CultureInfo.InvariantCulture), float.Parse(w, CultureInfo.InvariantCulture)));
                        }
                        else if (type == "SET_VECTOR")
                        {
                            instanceMaterial.SetVector(set, new Vector4(float.Parse(x, CultureInfo.InvariantCulture), float.Parse(y, CultureInfo.InvariantCulture), float.Parse(z, CultureInfo.InvariantCulture), float.Parse(w, CultureInfo.InvariantCulture)));
                        }
                        else if (type == "COPY_PROPS")
                        {
                            TVEUtils.CopyMaterialProperties(material, instanceMaterial);
                        }
                        else if (type == "COPY_FLOAT")
                        {
                            if (material.HasProperty(src))
                            {
                                instanceMaterial.SetFloat(dst, material.GetFloat(src));
                            }
                        }
                        else if (type == "COPY_TEX")
                        {
                            if (material.HasProperty(src) && material.GetTexture(src) != null)
                            {
                                GetOrCopyTexture(material, instanceMaterial, src, dst);
                            }
                        }
                        else if (type == "COPY_TEX_FIRST_VALID")
                        {
                            var shader = material.shader;

                            for (int s = 0; s < ShaderUtil.GetPropertyCount(material.shader); s++)
                            {
                                var propName = ShaderUtil.GetPropertyName(shader, s);
                                var propType = ShaderUtil.GetPropertyType(shader, s);

                                if (propType == ShaderUtil.ShaderPropertyType.TexEnv)
                                {
                                    if (material.GetTexture(propName) != null)
                                    {
                                        GetOrCopyTexture(material, instanceMaterial, propName, set);
                                        break;
                                    }
                                }
                            }
                        }
                        else if (type == "COPY_TEX_BY_NAME")
                        {
                            var shader = material.shader;

                            for (int s = 0; s < ShaderUtil.GetPropertyCount(material.shader); s++)
                            {
                                var propName = ShaderUtil.GetPropertyName(shader, s);
                                var propType = ShaderUtil.GetPropertyType(shader, s);

                                if (propType == ShaderUtil.ShaderPropertyType.TexEnv)
                                {
                                    var propNameCheck = propName.ToUpperInvariant();

                                    if (propNameCheck.Contains(src.ToUpperInvariant()) && material.GetTexture(propName) != null)
                                    {
                                        GetOrCopyTexture(material, instanceMaterial, propName, dst);
                                    }
                                }
                            }
                        }
                        else if (type == "COPY_COLOR")
                        {
                            if (material.HasProperty(src))
                            {
                                instanceMaterial.SetColor(dst, material.GetColor(src).linear);
                            }
                        }
                        else if (type == "COPY_VECTOR")
                        {
                            if (material.HasProperty(src))
                            {
                                instanceMaterial.SetVector(dst, material.GetVector(src));
                            }
                        }
                        else if (type == "COPY_ST_AS_VECTOR")
                        {
                            if (material.HasProperty(src))
                            {
                                Vector4 uvs = new Vector4(material.GetTextureScale(src).x, material.GetTextureScale(src).y,
                                                          material.GetTextureOffset(src).x, material.GetTextureOffset(src).y);

                                instanceMaterial.SetVector(dst, uvs);
                            }
                        }
                        else if (type == "COPY_FLOAT_AS_VECTOR_X")
                        {
                            if (material.HasProperty(src) && instanceMaterial.HasProperty(dst))
                            {
                                var vec = instanceMaterial.GetVector(dst);
                                vec.x = material.GetFloat(src);
                                instanceMaterial.SetVector(dst, vec);
                            }
                        }
                        else if (type == "COPY_FLOAT_AS_VECTOR_Y")
                        {
                            if (material.HasProperty(src) && instanceMaterial.HasProperty(dst))
                            {
                                var vec = instanceMaterial.GetVector(dst);
                                vec.y = material.GetFloat(src);
                                instanceMaterial.SetVector(dst, vec);
                            }
                        }
                        else if (type == "COPY_FLOAT_AS_VECTOR_Z")
                        {
                            if (material.HasProperty(src) && instanceMaterial.HasProperty(dst))
                            {
                                var vec = instanceMaterial.GetVector(dst);
                                vec.z = material.GetFloat(src);
                                instanceMaterial.SetVector(dst, vec);
                            }
                        }
                        else if (type == "COPY_FLOAT_AS_VECTOR_W")
                        {
                            if (material.HasProperty(src) && instanceMaterial.HasProperty(dst))
                            {
                                var vec = instanceMaterial.GetVector(dst);
                                vec.w = material.GetFloat(src);
                                instanceMaterial.SetVector(dst, vec);
                            }
                        }
                        else if (type == "COPY_VECTOR_X_AS_FLOAT")
                        {
                            if (material.HasProperty(src))
                            {
                                instanceMaterial.SetFloat(dst, material.GetVector(src).x);
                            }
                        }
                        else if (type == "COPY_VECTOR_Y_AS_FLOAT")
                        {
                            if (material.HasProperty(src))
                            {
                                instanceMaterial.SetFloat(dst, material.GetVector(src).y);
                            }
                        }
                        else if (type == "COPY_VECTOR_Z_AS_FLOAT")
                        {
                            if (material.HasProperty(src))
                            {
                                instanceMaterial.SetFloat(dst, material.GetVector(src).z);
                            }
                        }
                        else if (type == "COPY_VECTOR_W_AS_FLOAT")
                        {
                            if (material.HasProperty(src))
                            {
                                instanceMaterial.SetFloat(dst, material.GetVector(src).w);
                            }
                        }
                        else if (type == "ENABLE_KEYWORD")
                        {
                            instanceMaterial.EnableKeyword(set);
                        }
                        else if (type == "DISABLE_KEYWORD")
                        {
                            instanceMaterial.DisableKeyword(set);
                        }
                        else if (type == "ENABLE_INSTANCING")
                        {
                            instanceMaterial.enableInstancing = true;
                        }
                        else if (type == "DISABLE_INSTANCING")
                        {
                            instanceMaterial.enableInstancing = false;
                        }
                    }

                    if (presetLines[i].StartsWith("Texture") && doPostProcessing)
                    {
                        string[] splitLine = presetLines[i].Split(char.Parse(" "));
                        string type = "";
                        string value = "";
                        string pack = "";
                        string tex = "";

                        if (splitLine.Length > 2)
                        {
                            type = splitLine[1];
                            value = splitLine[2];

                            if (type == "PropName")
                            {
                                if (value != "")
                                {
                                    texName = value;
                                }
                            }

                            if (type == "ImportType")
                            {
                                if (value == "DEFAULT")
                                {
                                    packerData.saveAsDefault = true;
                                }
                                else if (value == "NORMALMAP")
                                {
                                    packerData.saveAsDefault = false;
                                }
                            }

                            if (type == "ImportSpace")
                            {
                                if (value == "SRGB")
                                {
                                    packerData.saveAsSRGB = true;
                                }
                                else if (value == "LINEAR")
                                {
                                    packerData.saveAsSRGB = false;
                                }
                            }

                            if (type == "TransformSpace")
                            {
                                if (value == "NONE")
                                {
                                    packerData.transformSpace = 0;
                                }
                                else if (value == "GAMMA_TO_LINEAR")
                                {
                                    packerData.transformSpace = 1;
                                }
                                else if (value == "LINEAR_TO_GAMMA")
                                {
                                    packerData.transformSpace = 2;
                                }
                                else if (value == "OBJECT_TO_TANGENT")
                                {
                                    packerData.transformSpace = 3;
                                    packerData.blitMesh = gameObjectsData[index].instanceMesh;
                                }
                                else if (value == "TANGENT_TO_OBJECT")
                                {
                                    packerData.transformSpace = 4;
                                    packerData.blitMesh = gameObjectsData[index].instanceMesh;
                                }
                            }
                        }

                        if (splitLine.Length > 3)
                        {
                            tex = splitLine[3];
                        }

                        if (material.HasProperty(tex) && material.GetTexture(tex) != null)
                        {
                            if (splitLine.Length > 1)
                            {
                                type = splitLine[1];

                                if (type == "SetRed")
                                {
                                    maskIndex = 0;
                                }
                                else if (type == "SetGreen")
                                {
                                    maskIndex = 1;
                                }

                                else if (type == "SetBlue")
                                {
                                    maskIndex = 2;
                                }
                                else if (type == "SetAlpha")
                                {
                                    maskIndex = 3;
                                }
                            }

                            if (splitLine.Length > 2)
                            {
                                pack = splitLine[2];

                                if (pack == "NONE")
                                {
                                    packChannel = 0;
                                }
                                else if (pack == "GET_RED")
                                {
                                    packChannel = 1;
                                }
                                else if (pack == "GET_GREEN")
                                {
                                    packChannel = 2;
                                }
                                else if (pack == "GET_BLUE")
                                {
                                    packChannel = 3;
                                }
                                else if (pack == "GET_ALPHA")
                                {
                                    packChannel = 4;
                                }
                                else if (pack == "GET_MAX")
                                {
                                    packChannel = 111;
                                }
                                else if (pack == "GET_GRAY")
                                {
                                    packChannel = 555;
                                }
                                else if (pack == "GET_GREY")
                                {
                                    packChannel = 555;
                                }
                                else
                                {
                                    packChannel = int.Parse(pack);
                                }
                            }

                            if (splitLine.Length > 4)
                            {
                                if (splitLine[4] == "GET_COORD")
                                {
                                    coordChannel = int.Parse(splitLine[5]);
                                    packerData.blitMesh = gameObjectsData[index].originalMesh;
                                }
                            }

                            //if (splitLine.Length > 6)
                            //{
                            //    if (splitLine[6] == "GET_LAYER")
                            //    {
                            //        layerChannel = int.Parse(splitLine[7]);
                            //    }
                            //}

                            if (presetLines[i].Contains("ACTION_ONE_MINUS"))
                            {
                                action0Index = 1;
                            }

                            if (presetLines[i].Contains("ACTION_MULTIPLY_0"))
                            {
                                action1Index = 1;
                            }

                            if (presetLines[i].Contains("ACTION_MULTIPLY_2"))
                            {
                                action1Index = 2;
                            }

                            if (presetLines[i].Contains("ACTION_MULTIPLY_3"))
                            {
                                action1Index = 3;
                            }

                            if (presetLines[i].Contains("ACTION_MULTIPLY_05"))
                            {
                                action1Index = 5;
                            }

                            if (presetLines[i].Contains("ACTION_POWER_0"))
                            {
                                action2Index = 1;
                            }

                            if (presetLines[i].Contains("ACTION_POWER_2"))
                            {
                                action2Index = 2;
                            }

                            if (presetLines[i].Contains("ACTION_POWER_3"))
                            {
                                action2Index = 3;
                            }

                            if (presetLines[i].Contains("ACTION_POWER_4"))
                            {
                                action2Index = 4;
                            }

                            packerData.maskTextures[maskIndex] = material.GetTexture(tex);
                            packerData.maskChannels[maskIndex] = packChannel;
                            packerData.maskCoords[maskIndex] = coordChannel;
                            //maskLayers[maskIndex] = layerChannel;
                            packerData.maskActions0[maskIndex] = action0Index;
                            packerData.maskActions1[maskIndex] = action1Index;
                            packerData.maskActions2[maskIndex] = action2Index;
                        }
                    }
                }

                if (doPacking)
                {
                    //var validTexturesFound = false;
                    //var additionalTexturesFound = false;
                    //var additionalChannelsFound = false;
                    //var additionalCoordsFound = false;
                    //var additionalAction0Found = false;
                    //var validTextureName = "";
                    //var validTextureCoord = -1;
                    //var validTextureAction0 = -1;

                    //for (int t = 0; t < maskTextures.Length; t++)
                    //{
                    //    if (maskTextures[t] != null)
                    //    {
                    //        validTexturesFound = true;

                    //        if (validTextureName == "")
                    //        {
                    //            validTextureName = maskTextures[t].name;
                    //        }

                    //        if (maskTextures[t].name != validTextureName)
                    //        {
                    //            additionalTexturesFound = true;
                    //        }

                    //        if (validTextureCoord == -1)
                    //        {
                    //            validTextureCoord = maskCoords[t];
                    //        }

                    //        if (maskCoords[t] != validTextureCoord)
                    //        {
                    //            additionalCoordsFound = true;
                    //        }

                    //        if (validTextureAction0 == -1)
                    //        {
                    //            validTextureAction0 = maskActions0[t];
                    //        }

                    //        if (maskActions0[t] != validTextureAction0)
                    //        {
                    //            additionalAction0Found = true;
                    //        }

                    //        if (!additionalTexturesFound)
                    //        {
                    //            if (maskChannels[t] != t + 1)
                    //            {
                    //                additionalChannelsFound = true;
                    //            }
                    //        }
                    //    }
                    //}

                    //if (validTexturesFound && (additionalTexturesFound || additionalChannelsFound || additionalCoordsFound || additionalAction0Found))
                    //{

                    //}


                    var packedTexturePath = GetPackedTexturePath(packerData);

                    if (packedTexturePath != "")
                    {
                        if (File.Exists(packedTexturePath))
                        {
                            var packedTexure = AssetDatabase.LoadAssetAtPath<Texture2D>(packedTexturePath);
                            instanceMaterial.SetTexture(texName, packedTexure);
                        }
                        else
                        {
                            var packedTexure = TVEUtils.PackAndSaveTexture(packedTexturePath, packerData, outputSuffix);
                            instanceMaterial.SetTexture(texName, packedTexure);
                        }

                        texName = "_MainMaskTex";
                        packerData = TVEUtils.CreatePackerData();

                        doPacking = false;
                    }
                }
            }
        }

        Shader GetShaderFromPreset(string check)
        {
            var shader = shaderPlant;

            if (check == "SHADER_DEFAULT_BARK")
            {
                shader = shaderBark;
            }
            else if (check == "SHADER_DEFAULT_PLANT")
            {
                shader = shaderPlant;
            }
            else if (check == "SHADER_DEFAULT_PROP")
            {
                shader = shaderProp;
            }

            return shader;
        }

        void SetMaterialPostSettings(Material material)
        {
            if (sourcePivots > 0 && optionPivots == 0)
            {
                material.SetFloat("_VertexPivotMode", 1);
            }

            if (sourceVariation > 0 && (optionVariation == 2 || optionVariation == 3))
            {
                material.SetFloat("_VertexVariationMode", 1);
            }

            // Guess best values for squash motion
            var scale = Mathf.Round((1.0f / maxBoundsInfo.y * 10.0f * 0.5f) * 10);

            if (scale > 1)
            {
                scale = Mathf.Clamp(Mathf.FloorToInt(scale), 0, 20);
            }

            material.SetFloat("_MotionScale_20", scale);
        }

        void GetOrCopyTexture(Material material, Material instanceMaterial, string src, string dst)
        {
            var srcTex = material.GetTexture(src);

            instanceMaterial.SetTexture(dst, srcTex);
        }

        bool IsValidMaterial(Material material)
        {
            bool valid = true;
            int i = 0;

            if (material == null)
            {
                i++;
            }

            if (material != null && material.name.Contains("Impostor") == true)
            {
                i++;
            }

            if (i > 0)
            {
                valid = false;
            }

            return valid;
        }

        /// <summary>
        /// Saving Utils
        /// </summary>

        string GetConvertedAssetName(Object asset, string type)
        {
            var name = GetAssetSafeName(asset);
            var path = AssetDatabase.GetAssetPath(asset);
            var subAssets = AssetDatabase.LoadAllAssetsAtPath(path);

            int id = 0;

            if (subAssets != null)
            {
                for (int i = 0; i < subAssets.Length; i++)
                {
                    if (asset == subAssets[i])
                    {
                        id = i;
                        break;
                    }
                }
            }

            // Multiple meshes can have the same name in fbx
            if (id != 0 && asset.GetType() == typeof(Mesh))
            {
                return name + " " + id.ToString("00") + " (" + outputSuffix + " " + type + ")";
            }
            else
            {
                return name + " (" + outputSuffix + " " + type + ")";
            }
        }

        string GetConvertedAssetPath(Object asset, string name, string extention, bool shareCommonAssets)
        {
            string savePath;

            string saveName = "/" + name + "." + extention;

            if (shareCommonAssets)
            {
                var originalPath = AssetDatabase.GetAssetPath(asset);

                if (originalPath == "" || originalPath.Contains("unity default resources"))
                {
                    savePath = prefabDataFolder + saveName;
                }
                else
                {
                    var originalFolder = Path.GetDirectoryName(originalPath);

                    savePath = originalFolder + saveName;
                }
            }
            else
            {
                savePath = prefabDataFolder + saveName;
            }

            return savePath;
        }

        string GetCollectedMeshPath(Object asset)
        {
            string savePath;

            string assetPath = AssetDatabase.GetAssetPath(asset);
            string saveName = "/" + Path.GetFileNameWithoutExtension(assetPath) + ".asset";

            savePath = collectDataFolder + SHARED_DATA_PATH + saveName;

            return savePath;
        }

        string GetCollectedMaterialPath(Object asset)
        {
            string savePath;

            string assetPath = AssetDatabase.GetAssetPath(asset);
            string saveName = "/" + Path.GetFileName(assetPath);

            string sharedPath = collectDataFolder + SHARED_DATA_PATH + saveName;
            string uniquePath = collectDataFolder + PREFABS_DATA_PATH + "/" + prefabName + saveName;

            if (keepPrefabSharing)
            {
                if (!assetPath.Contains(prefabName))
                {
                    savePath = sharedPath;
                }
                else
                {
                    savePath = uniquePath;
                }
            }
            else
            {
                if (shareCommonMaterials)
                {
                    savePath = sharedPath;
                }
                else
                {
                    savePath = uniquePath;
                }
            }

            return savePath;
        }

        string GetCollectedTexturePath(Object asset)
        {
            string savePath;

            string saveName = "/" + Path.GetFileName(AssetDatabase.GetAssetPath(asset));

            savePath = collectDataFolder + TEXTURE_DATA_PATH + saveName;

            return savePath;
        }

        string GetPackedTexturePath(TVEPackerData packerData)
        {
            string savePath = "";

            Texture firstValidTexture = null;

            for (int i = 0; i < packerData.maskTextures.Length; i++)
            {
                var texture = packerData.maskTextures[i];

                if (texture != null)
                {
                    firstValidTexture = texture;
                    break;
                }
            }

            if (firstValidTexture != null)
            {
                //string guid = "";

                //for (int i = 0; i < packerData.maskTextures.Length; i++)
                //{
                //    var texture = packerData.maskTextures[i];

                //    if (texture != null)
                //    {
                //        var path = AssetDatabase.GetAssetPath(texture);
                //        guid = guid + AssetDatabase.AssetPathToGUID(path).Substring(0, 1).ToUpper();
                //    }
                //    else
                //    {
                //        guid = guid + "0";
                //    }
                //}

                string extension;

                if (outputTexturesIndex == OutputTextures.SaveTexturesAsPNG)
                {
                    extension = ".png";
                }
                else
                {
                    extension = ".tga";
                }

                string texName = firstValidTexture.name + " (" + outputSuffix + " Texture)" + extension;

                string texFullPath = AssetDatabase.GetAssetPath(firstValidTexture);
                string texFolderPath = Path.GetDirectoryName(texFullPath);

                savePath = texFolderPath + "/" + texName;
            }

            return savePath;
        }

        Mesh SaveMesh(Mesh mesh, string savePath)
        {
            if (readWriteMode == 0)
            {
                mesh.UploadMeshData(true);
            }

            if (File.Exists(savePath))
            {
                var asset = AssetDatabase.LoadAssetAtPath<Mesh>(savePath);
                asset.Clear();
                EditorUtility.CopySerialized(mesh, asset);
            }
            else
            {
                AssetDatabase.CreateAsset(mesh, savePath);
            }

            AssetDatabase.SaveAssets();
            AssetDatabase.Refresh();

            AssetDatabase.SetLabels(AssetDatabase.LoadAssetAtPath<UnityEngine.Object>(savePath), new string[] { outputSuffix + " Model" });

            return AssetDatabase.LoadAssetAtPath<Mesh>(savePath);
        }

        Material SaveMaterial(Material material, string savePath)
        {
            if (File.Exists(savePath))
            {
                var asset = AssetDatabase.LoadAssetAtPath<Material>(savePath);
                EditorUtility.CopySerialized(material, asset);
            }
            else
            {
                AssetDatabase.CreateAsset(material, savePath);
            }

            AssetDatabase.SaveAssets();
            AssetDatabase.Refresh();

            AssetDatabase.SetLabels(AssetDatabase.LoadAssetAtPath<UnityEngine.Object>(savePath), new string[] { outputSuffix + " Material" });

            return AssetDatabase.LoadAssetAtPath<Material>(savePath);
        }

        Texture SaveTexture(Texture texture, string savePath)
        {
            if (!File.Exists(savePath))
            {
                var texturePath = AssetDatabase.GetAssetPath(texture);

                AssetDatabase.CopyAsset(texturePath, savePath);
                AssetDatabase.SaveAssets();
                AssetDatabase.Refresh();
            }

            return AssetDatabase.LoadAssetAtPath<Texture>(savePath);
        }

        string GetAssetSafeName(Object asset)
        {
            return System.Text.RegularExpressions.Regex.Replace(asset.name, "[^\\w\\._ ()]", "");
        }

        string GetAssetGUIDAndID(Object asset)
        {
            var path = AssetDatabase.GetAssetPath(asset);
            var guid = AssetDatabase.AssetPathToGUID(path).Substring(0, 2).ToUpper();

            var subAssets = AssetDatabase.LoadAllAssetsAtPath(path);

            int id = 0;

            if (subAssets != null)
            {
                for (int i = 0; i < subAssets.Length; i++)
                {
                    if (asset == subAssets[i])
                    {
                        id = i;
                        break;
                    }
                }
            }

            return guid + id.ToString("00");
        }


        /// <summary>
        /// Collect Utils
        /// </summary>

        void CollectMaterials()
        {
            for (int i = 0; i < gameObjectsData.Count; i++)
            {
                var meshRenderer = gameObjectsData[i].meshRenderer;

                if (meshRenderer != null)
                {
                    var sharedMaterials = meshRenderer.sharedMaterials;

                    if (sharedMaterials != null)
                    {
                        for (int m = 0; m < sharedMaterials.Length; m++)
                        {
                            if (sharedMaterials[m] != null)
                            {
                                var materialPath = GetCollectedMaterialPath(sharedMaterials[m]);

                                var instanceMaterial = Instantiate(sharedMaterials[m]);
                                instanceMaterial.name = sharedMaterials[m].name;

                                instanceMaterial.SetInt("_IsCollected", 1);
                                instanceMaterial.SetInt("_IsIdentifier", (int)Random.Range(1, 1000));

                                sharedMaterials[m] = SaveMaterial(instanceMaterial, materialPath);

                                var shader = sharedMaterials[m].shader;

                                for (int s = 0; s < ShaderUtil.GetPropertyCount(shader); s++)
                                {
                                    var propName = ShaderUtil.GetPropertyName(shader, s);
                                    var propType = ShaderUtil.GetPropertyType(shader, s);

                                    if (propType == ShaderUtil.ShaderPropertyType.TexEnv)
                                    {
                                        var texture = sharedMaterials[m].GetTexture(propName);

                                        if (texture != null)
                                        {
                                            var texturePath = GetCollectedTexturePath(texture);

                                            sharedMaterials[m].SetTexture(propName, SaveTexture(texture, texturePath));
                                        }
                                    }
                                }
                            }
                        }

                        meshRenderer.sharedMaterials = sharedMaterials;
                    }
                }
            }
        }

        void CollectMeshes()
        {
            for (int i = 0; i < gameObjectsData.Count; i++)
            {
                var meshFilter = gameObjectsData[i].meshFilter;
                var originalMesh = gameObjectsData[i].originalMesh;

                if (meshFilter != null)
                {
                    if (originalMesh != null)
                    {
                        var instanceMesh = Instantiate(originalMesh);
                        instanceMesh.name = originalMesh.name;

                        var meshPath = GetCollectedMeshPath(originalMesh);

                        meshFilter.sharedMesh = SaveMesh(instanceMesh, meshPath);
                    }
                }
            }
        }

        void CollectColliders()
        {
            for (int i = 0; i < gameObjectsData.Count; i++)
            {
                var meshColliders = gameObjectsData[i].meshColliders;
                var originalColliders = gameObjectsData[i].originalColliders;

                for (int j = 0; j < meshColliders.Count; j++)
                {
                    var meshCollider = meshColliders[j];
                    var originalCollider = originalColliders[j];

                    if (meshCollider != null)
                    {
                        if (originalCollider != null)
                        {
                            var instanceCollider = Instantiate(originalCollider);
                            instanceCollider.name = originalCollider.name;

                            var colliderPath = GetCollectedMeshPath(originalCollider);

                            meshCollider.sharedMesh = SaveMesh(instanceCollider, colliderPath);
                        }
                    }
                }
            }
        }

        /// <summary>
        /// Get Project Presets
        /// </summary>

        void GetDefaultShaders()
        {

            shaderBark = Shader.Find("BOXOPHOBIC/The Vegetation Engine/Default/Bark Standard Lit");
            shaderPlant = Shader.Find("BOXOPHOBIC/The Vegetation Engine/Default/Plant Subsurface Lit");
            shaderProp = Shader.Find("BOXOPHOBIC/The Vegetation Engine/Default/Prop Standard Lit");
        }

        void GetPresets()
        {
            presetPaths = new List<string>();
            presetPaths.Insert(0, "");

            overridePaths = new List<string>();
            overridePaths.Insert(0, "");

            detectLines = new List<string>();

            // FindObjectsOfTypeAll not working properly for unloaded assets
            allPresetPaths = Directory.GetFiles(Application.dataPath, "*.tvepreset", SearchOption.AllDirectories);
            allPresetPaths = allPresetPaths.OrderBy(f => new FileInfo(f).Name).ToArray();

            for (int i = 0; i < allPresetPaths.Length; i++)
            {
                string assetPath = "Assets" + allPresetPaths[i].Replace(Application.dataPath, "").Replace('\\', '/');

                if (assetPath.Contains("[PRESET]"))
                {
                    presetPaths.Add(assetPath);
                }

                if (assetPath.Contains("[OVERRIDE]") == true)
                {
                    overridePaths.Add(assetPath);
                }

                if (assetPath.Contains("[DETECT]") == true)
                {
                    StreamReader reader = new StreamReader(assetPath);

                    while (!reader.EndOfStream)
                    {
                        detectLines.Add(reader.ReadLine());
                    }

                    reader.Close();
                }
            }

            PresetsEnum = new string[presetPaths.Count];
            PresetsEnum[0] = "Choose a preset";

            OverridesEnum = new string[overridePaths.Count];
            OverridesEnum[0] = "None";

            for (int i = 1; i < presetPaths.Count; i++)
            {
                PresetsEnum[i] = AssetDatabase.LoadAssetAtPath<UnityEngine.Object>(presetPaths[i]).name;
                PresetsEnum[i] = PresetsEnum[i].Replace("[PRESET] ", "");
                PresetsEnum[i] = PresetsEnum[i].Replace(" - ", "/");
            }

            for (int i = 1; i < overridePaths.Count; i++)
            {
                OverridesEnum[i] = AssetDatabase.LoadAssetAtPath<UnityEngine.Object>(overridePaths[i]).name;
                OverridesEnum[i] = OverridesEnum[i].Replace("[OVERRIDE] ", "");
                OverridesEnum[i] = OverridesEnum[i].Replace(" - ", "/");
            }
        }

        void GetPresetLines()
        {
            presetLines = new List<string>();

            StreamReader reader = new StreamReader(presetPaths[presetIndex]);

            while (!reader.EndOfStream)
            {
                var line = reader.ReadLine().TrimStart();

                presetLines.Add(line);

                if (line.Contains("Include"))
                {
                    GetIncludeLines(line);
                }
            }

            reader.Close();

            for (int i = 0; i < overrideIndices.Count; i++)
            {
                if (overrideIndices[i] != 0)
                {
                    reader = new StreamReader(overridePaths[overrideIndices[i]]);

                    while (!reader.EndOfStream)
                    {
                        var line = reader.ReadLine().TrimStart();

                        presetLines.Add(line);

                        if (line.Contains("Include"))
                        {
                            GetIncludeLines(line);
                        }
                    }

                    reader.Close();
                }
            }
        }

        void GetIncludeLines(string include)
        {
            var import = include.Replace("Include ", "");

            for (int i = 0; i < allPresetPaths.Length; i++)
            {
                if (allPresetPaths[i].Contains(import))
                {
                    StreamReader reader = new StreamReader(allPresetPaths[i]);

                    while (!reader.EndOfStream)
                    {
                        var line = reader.ReadLine().TrimStart();

                        presetLines.Add(line);
                    }

                    reader.Close();
                }
            }
        }

        void GetOptionsFromPreset(bool usePrefered)
        {
            if (presetIndex == 0)
            {
                return;
            }

            useOptionLines = new List<bool>();
            useOptionLines.Add(true);

            var options = new List<string>();
            var splitPrefered = new string[0];

            for (int i = 0; i < presetLines.Count; i++)
            {
                if (presetLines[i].StartsWith("OutputOptions"))
                {
                    var splitLine = presetLines[i].Replace("OutputOptions ", "").Split(char.Parse("/"));
                    splitPrefered = presetLines[i].Split(char.Parse(" "));

                    for (int j = 0; j < splitLine.Length; j++)
                    {
                        options.Add(splitLine[j]);
                    }
                }
            }

            if (options.Count == 0)
            {
                options.Add("");

                OptionsEnum = options.ToArray();


            }
            else
            {
                int prefered = 0;

                if (int.TryParse(splitPrefered[splitPrefered.Length - 1], out prefered))
                {
                    if (usePrefered)
                    {
                        optionIndex = prefered;
                    }

                    options[options.Count - 1] = options[options.Count - 1].Replace(" " + prefered, "");
                }

                OptionsEnum = new string[options.Count];

                for (int i = 0; i < options.Count; i++)
                {
                    OptionsEnum[i] = options[i];
                }
            }

            if (optionIndex >= OptionsEnum.Length)
            {
                optionIndex = 0;
            }

            //for (int i = 0; i < ModelOptions.Length; i++)
            //{
            //    Debug.Log(ModelOptions[i]);
            //}
        }

        void GetDescriptionFromPreset()
        {
            infoTitle = "Preset";
            infoPreset = "";
            infoStatus = "";
            infoOnline = "";
            infoMessage = "";
            infoWarning = "";
            infoError = "";

            for (int i = 0; i < presetLines.Count; i++)
            {
                var useLine = GetConditionFromLine(presetLines[i]);

                if (useLine)
                {
                    if (presetLines[i].StartsWith("InfoTitle"))
                    {
                        infoTitle = presetLines[i].Replace("InfoTitle ", "");
                    }
                    else if (presetLines[i].StartsWith("InfoPreset"))
                    {
                        infoPreset = presetLines[i].Replace("InfoPreset ", "");
                    }
                    else if (presetLines[i].StartsWith("InfoStatus"))
                    {
                        infoStatus = presetLines[i].Replace("InfoStatus ", "");
                    }
                    else if (presetLines[i].StartsWith("InfoOnline"))
                    {
                        infoOnline = presetLines[i].Replace("InfoOnline ", "");
                    }
                    else if (presetLines[i].StartsWith("InfoMessage"))
                    {
                        infoMessage = presetLines[i].Replace("InfoMessage ", "").Replace("NONE", "");
                    }
                    else if (presetLines[i].StartsWith("InfoWarning"))
                    {
                        infoWarning = presetLines[i].Replace("InfoWarning ", "").Replace("NONE", "");
                    }
                    else if (presetLines[i].StartsWith("InfoError"))
                    {
                        infoError = presetLines[i].Replace("InfoError ", "").Replace("NONE", "");
                    }
                }
            }

            if (presetAutoDetected)
            {
                infoTitle = infoTitle + " (Auto Detected)";
            }
        }

        void GetOutputsFromPreset()
        {
            if (presetIndex == 0)
            {
                return;
            }

            outputValid = true;

            for (int i = 0; i < presetLines.Count; i++)
            {
                var useLine = GetConditionFromLine(presetLines[i]);

                if (useLine)
                {
                    if (presetLines[i].StartsWith("OutputMeshes"))
                    {
                        string source = presetLines[i].Replace("OutputMeshes ", "");

                        if (source == "NONE")
                        {
                            outputMeshesIndex = OutputMeshes.Off;
                        }
                        else if (source == "DEFAULT")
                        {
                            outputMeshesIndex = OutputMeshes.Default;
                        }
                        else if (source == "CUSTOM")
                        {
                            outputMeshesIndex = OutputMeshes.Custom;
                        }
                    }
                    else if (presetLines[i].StartsWith("OutputTransforms"))
                    {
                        string source = presetLines[i].Replace("OutputTransforms ", "");

                        if (source == "USE_ORIGINAL_TRANSFORMS")
                        {
                            outputTransformsIndex = OutputTransforms.UseOriginalTransforms;
                        }
                        else if (source == "TRANSFORM_TO_WORLD_SPACE")
                        {
                            outputTransformsIndex = OutputTransforms.TransformToWorldSpace;
                        }
                    }
                    else if (presetLines[i].StartsWith("OutputMaterials"))
                    {
                        string source = presetLines[i].Replace("OutputMaterials ", "");

                        if (source == "NONE")
                        {
                            outputMaterialsIndex = OutputMaterials.Off;
                        }
                        else if (source == "DEFAULT")
                        {
                            outputMaterialsIndex = OutputMaterials.Default;
                        }
                    }
                    else if (presetLines[i].StartsWith("OutputTextures"))
                    {
                        string source = presetLines[i].Replace("OutputTextures ", "");

                        if (source == "SAVE_TEXTURES_AS_PNG")
                        {
                            outputTexturesIndex = OutputTextures.SaveTexturesAsPNG;
                        }
                        else if (source == "SAVE_TEXTURES_AS_TGA")
                        {
                            outputTexturesIndex = OutputTextures.SaveTexturesAsTGA;
                        }
                    }
                    else if (presetLines[i].StartsWith("OutputPipelines"))
                    {
                        outputPipelines = presetLines[i].Replace("OutputPipelines ", "");
                    }
                    else if (presetLines[i].StartsWith("OutputSuffix"))
                    {
                        outputSuffix = presetLines[i].Replace("OutputSuffix ", "");
                    }
                    else if (presetLines[i].StartsWith("OutputValid"))
                    {
                        string source = presetLines[i].Replace("OutputValid ", "");

                        if (source == "TRUE")
                        {
                            outputValid = true;
                        }
                        else if (source == "FALSE")
                        {
                            outputValid = false;
                        }
                    }

                    if (outputPipelines != "")
                    {
                        if (outputPipelines.Contains(renderPipeline))
                        {
                            outputValid = true;
                            infoError = "";
                        }
                        else
                        {
                            outputValid = false;
                            infoError = "The current asset can only be converted in the " + outputPipelines + " render pipeline and then exported to you project using the Collect Converted Data feature! Check the documentation for more details.";
                        }
                    }
                }
            }
        }

        void GetAllPresetInfo()
        {
            GetAllPresetInfo(false);
        }

        void GetAllPresetInfo(bool usePrefered)
        {
            if (presetIndex == 0)
            {
                return;
            }

            outputMeshesIndex = OutputMeshes.Default;
            outputMaterialsIndex = OutputMaterials.Default;
            outputPipelines = "";
            outputSuffix = "TVE";

            sourceNormals = 0;

            GetDefaultShaders();

            GetPresetLines();
            GetOptionsFromPreset(usePrefered);
            GetDescriptionFromPreset();

            if (!hasOutputModifications)
            {
                GetOutputsFromPreset();
            }

            if (!hasMeshModifications)
            {
                GetMeshConversionFromPreset();
            }

            GetDefaultShadersFromPreset();
        }

        void SaveGlobalOverrides()
        {
            var globalOverrides = "";

            for (int i = 0; i < overrideIndices.Count; i++)
            {
                if (overrideGlobals[i])
                {
                    globalOverrides = globalOverrides + OverridesEnum[overrideIndices[i]] + ";";
                }
            }

            globalOverrides.Replace("None", "");

            SettingsUtils.SaveSettingsData(userFolder + "Converter Overrides.asset", globalOverrides);
        }

        void GetGlobalOverrides()
        {
            var globalOverrides = SettingsUtils.LoadSettingsData(userFolder + "Converter Overrides.asset", "");

            if (globalOverrides != "")
            {
                var splitLine = globalOverrides.Split(char.Parse(";"));

                for (int o = 0; o < OverridesEnum.Length; o++)
                {
                    for (int s = 0; s < splitLine.Length; s++)
                    {
                        if (OverridesEnum[o] == splitLine[s])
                        {
                            if (!overrideIndices.Contains(o))
                            {
                                overrideIndices.Add(o);
                                overrideGlobals.Add(true);
                            }
                        }
                    }
                }
            }
        }

        void InitMaterialConditionFromLine()
        {
            useMaterialLines = new List<bool>();
            useMaterialLines.Add(true);
        }

        bool GetConditionFromLine(string line)
        {
            var valid = true;

            if (line.StartsWith("if"))
            {
                valid = false;

                string[] splitLine = line.Split(char.Parse(" "));

                var type = "";
                var check = "";

                if (splitLine.Length > 1)
                {
                    type = splitLine[1];
                }

                if (splitLine.Length > 2)
                {
                    check = splitLine[2];
                }

                if (type.Contains("OUTPUT_OPTION_CONTAINS"))
                {
                    if (OptionsEnum[optionIndex].Contains(check))
                    {
                        valid = true;
                    }
                }
                else if (type.Contains("PROJECT_HAS_DEFINE_SYMBOL"))
                {
                    var defineSymbols = PlayerSettings.GetScriptingDefineSymbolsForGroup(EditorUserBuildSettings.selectedBuildTargetGroup);

                    if (defineSymbols.Contains(check.ToUpperInvariant()))
                    {
                        valid = true;
                    }
                }
                else if (type.Contains("PREFAB_PATH_CONTAINS"))
                {
                    var path = AssetDatabase.GetAssetPath(prefabObject).ToUpperInvariant();

                    if (path.Contains(check.ToUpperInvariant()))
                    {
                        valid = true;
                    }
                }
                else if (type.Contains("ANY_PREFAB_PATH_CONTAINS"))
                {
                    for (int i = 0; i < prefabObjects.Count; i++)
                    {
                        var prefab = prefabObjects[i].gameObject;

                        var path = AssetDatabase.GetAssetPath(prefab).ToUpperInvariant();

                        if (path.Contains(check.ToUpperInvariant()))
                        {
                            valid = true;
                        }
                    }
                }
                else if (type.Contains("ANY_PREFAB_ATTRIBUTE_CONTAINS"))
                {
                    for (int i = 0; i < prefabObjects.Count; i++)
                    {
                        var attribute = prefabObjects[i].attributes;

                        if (attribute.Contains(check.ToUpperInvariant()))
                        {
                            valid = true;

                        }
                    }
                }

                useOptionLines.Add(valid);
            }

            if (line.StartsWith("if") && line.Contains("!"))
            {
                valid = !valid;
                useOptionLines[useOptionLines.Count - 1] = valid;
            }

            if (line.StartsWith("endif") || line.StartsWith("}"))
            {
                useOptionLines.RemoveAt(useOptionLines.Count - 1);
            }

            var useLine = true;

            for (int i = 1; i < useOptionLines.Count; i++)
            {
                if (useOptionLines[i] == false)
                {
                    useLine = false;
                    break;
                }
            }

            return useLine;
        }

        bool GetConditionFromLine(string line, Material material)
        {
            var valid = true;

            if (line.StartsWith("if"))
            {
                valid = false;

                string[] splitLine = line.Split(char.Parse(" "));

                var type = "";
                var check = "";
                var val = splitLine[splitLine.Length - 1];

                if (splitLine.Length > 1)
                {
                    type = splitLine[1];
                }

                if (splitLine.Length > 2)
                {
                    for (int i = 2; i < splitLine.Length; i++)
                    {
                        if (!float.TryParse(splitLine[i], out _))
                        {
                            check = check + splitLine[i] + " ";
                        }
                    }

                    check = check.TrimEnd();
                }

                if (type.Contains("OUTPUT_OPTION_CONTAINS"))
                {
                    if (OptionsEnum[optionIndex].Contains(check))
                    {
                        valid = true;
                    }
                }
                else if (type.Contains("PROJECT_HAS_DEFINE_SYMBOL"))
                {
                    var defineSymbols = PlayerSettings.GetScriptingDefineSymbolsForGroup(EditorUserBuildSettings.selectedBuildTargetGroup);

                    if (defineSymbols.Contains(check.ToUpperInvariant()))
                    {
                        valid = true;
                    }
                }
                else if (type.Contains("PREFAB_PATH_CONTAINS"))
                {
                    var path = AssetDatabase.GetAssetPath(prefabObject).ToUpperInvariant();

                    if (path.Contains(check.ToUpperInvariant()))
                    {
                        valid = true;
                    }
                }
                else if (type.Contains("ANY_PREFAB_PATH_CONTAINS"))
                {
                    for (int i = 0; i < prefabObjects.Count; i++)
                    {
                        var prefab = prefabObjects[i].gameObject;

                        var path = AssetDatabase.GetAssetPath(prefab).ToUpperInvariant();

                        if (path.Contains(check.ToUpperInvariant()))
                        {
                            valid = true;
                        }
                    }
                }
                else if (type.Contains("ANY_PREFAB_ATTRIBUTE_CONTAINS"))
                {
                    for (int i = 0; i < prefabObjects.Count; i++)
                    {
                        var attribute = prefabObjects[i].attributes;

                        if (attribute.Contains(check.ToUpperInvariant()))
                        {
                            valid = true;
                        }
                    }
                }
                else if (type.Contains("SHADER_PATH_CONTAINS"))
                {
                    var path = AssetDatabase.GetAssetPath(material.shader).ToUpperInvariant();

                    if (path.Contains(check.ToUpperInvariant()))
                    {
                        valid = true;
                    }
                }
                else if (type.Contains("SHADER_NAME_CONTAINS"))
                {
                    var name = material.shader.name.ToUpperInvariant();

                    if (name.Contains(check.ToUpperInvariant()))
                    {
                        valid = true;
                    }
                }
                else if (type.Contains("SHADER_IS_UNITY_LIT"))
                {
                    var name = material.shader.name;

                    if (name.StartsWith("Standard") || name.StartsWith("Universal Render Pipeline") || name.StartsWith("HDRP"))
                    {
                        valid = true;
                    }
                }
                else if (type.Contains("SHADER_PIPELINE_IS_STANDARD"))
                {
                    if (material.GetTag("RenderPipeline", false) == "")
                    {
                        valid = true;
                    }
                }
                else if (type.Contains("SHADER_PIPELINE_IS_UNIVERSAL"))
                {
                    if (material.GetTag("RenderPipeline", false) == "UniversalPipeline")
                    {
                        valid = true;
                    }
                }
                else if (type.Contains("SHADER_PIPELINE_IS_HD"))
                {
                    if (material.GetTag("RenderPipeline", false) == "HDRenderPipeline")
                    {
                        valid = true;
                    }
                }
                else if (type.Contains("SHADER_PIPELINE_IS_SRP"))
                {
                    if (material.GetTag("RenderPipeline", false) == "HDRenderPipeline" || material.GetTag("RenderPipeline", false) == "UniversalPipeline")
                    {
                        valid = true;
                    }
                }
                else if (type.Contains("MATERIAL_PATH_CONTAINS"))
                {
                    var path = AssetDatabase.GetAssetPath(material).ToUpperInvariant();

                    if (path.Contains(check.ToUpperInvariant()))
                    {
                        valid = true;
                    }
                }
                else if (type.Contains("MATERIAL_NAME_CONTAINS"))
                {
                    var name = material.name.ToUpperInvariant();

                    if (name.Contains(check.ToUpperInvariant()))
                    {
                        valid = true;
                    }
                }
                else if (type.Contains("MATERIAL_RENDERTYPE_TAG_CONTAINS"))
                {
                    if (material.GetTag("RenderType", false).Contains(check))
                    {
                        valid = true;
                    }
                }
                else if (type.Contains("MATERIAL_HAS_PROP"))
                {
                    if (material.HasProperty(check))
                    {
                        valid = true;
                    }
                }
                else if (type.Contains("MATERIAL_HAS_TEX"))
                {
                    if (material.HasProperty(check))
                    {
                        if (material.GetTexture(check) != null)
                        {
                            valid = true;
                        }
                    }
                }
                else if (type.Contains("MATERIAL_FLOAT_EQUALS"))
                {
                    var min = float.Parse(val, CultureInfo.InvariantCulture) - 0.1f;
                    var max = float.Parse(val, CultureInfo.InvariantCulture) + 0.1f;

                    if (material.HasProperty(check) && material.GetFloat(check) > min && material.GetFloat(check) < max)
                    {
                        valid = true;
                    }
                }
                else if (type.Contains("MATERIAL_FLOAT_SMALLER"))
                {
                    var value = float.Parse(val, CultureInfo.InvariantCulture);

                    if (material.HasProperty(check) && material.GetFloat(check) < value)
                    {
                        valid = true;
                    }
                }
                else if (type.Contains("MATERIAL_FLOAT_GREATER"))
                {
                    var value = float.Parse(val, CultureInfo.InvariantCulture);

                    if (material.HasProperty(check) && material.GetFloat(check) > value)
                    {
                        valid = true;
                    }
                }
                else if (type.Contains("MATERIAL_KEYWORD_ENABLED"))
                {
                    if (material.IsKeywordEnabled(check))
                    {
                        valid = true;
                    }
                }

                useMaterialLines.Add(valid);
            }

            if (line.StartsWith("if") && line.Contains("!"))
            {
                valid = !valid;
                useMaterialLines[useMaterialLines.Count - 1] = valid;
            }

            if (line.StartsWith("endif") || line.StartsWith("}"))
            {
                useMaterialLines.RemoveAt(useMaterialLines.Count - 1);
            }

            var useLine = true;

            for (int i = 1; i < useMaterialLines.Count; i++)
            {
                if (useMaterialLines[i] == false)
                {
                    useLine = false;
                    break;
                }
            }

            return useLine;
        }
    }
}

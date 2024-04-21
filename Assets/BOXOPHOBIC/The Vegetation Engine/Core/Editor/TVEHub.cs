// Cristian Pop - https://boxophobic.com/

using UnityEngine;
using UnityEditor;
using System.Collections.Generic;
using Boxophobic.StyledGUI;
using Boxophobic.Utils;
using System.IO;
using System.Globalization;
using UnityEngine.SceneManagement;
using UnityEditor.SceneManagement;

namespace TheVegetationEngine
{
    public class TVEHub : EditorWindow
    {
        float GUI_HALF_EDITOR_WIDTH = 220;
        const int VERSION_REQUIRES_UPDATE = 900;
        const int VERSION_REQUIRES_BACKUP = 900;

        string autorunPath;
        List<string> activeScenePaths;
        string assetFolder = "Assets/BOXOPHOBIC/The Vegetation Engine";
        string userFolder = "Assets/BOXOPHOBIC/User";

        string[] allMaterialGUIDs;
        string[] allMeshGUIDs;

        List<string> settingsLines;
        List<int> vertexLayers;

        string[] pipelinePaths;
        string[] pipelineOptions;
        string pipelinesPath;
        int pipelineIndex = 0;
        string pipelinePath;
        string pipelineCurrent = "Standard";

        int assetVersion;
        int userVersion;
        int validatorVersion;

        bool requiresCompressionUpgrade = false;
        bool requiresMaterialUpgrade = false;
        bool requiresMeshUpgrade = false;
        bool requiresPipelineSetup = false;
        bool requiresSceneRestart = false;
        bool requiresProjectBackup = false;
        bool upgradeIsValid = false;

        GUIStyle stylePopup;
        GUIStyle styledToolbar;
        GUIStyle styleLabelCentered;

        Color bannerColor;
        string bannerText;
        string bannerVersion;
        static TVEHub window;
        //Vector2 scrollPosition = Vector2.zero;

        [MenuItem("Window/BOXOPHOBIC/The Vegetation Engine/Hub/The Vegetation Engine", false, 1000)]
        public static void ShowWindow()
        {
            window = GetWindow<TVEHub>(false, "The Vegetation Engine", true);
            window.minSize = new Vector2(800, 300);
        }

        void OnEnable()
        {
            //Safer search, there might be many user folders
            string[] searchFolders;

            searchFolders = AssetDatabase.FindAssets("The Vegetation Engine");

            for (int i = 0; i < searchFolders.Length; i++)
            {
                if (AssetDatabase.GUIDToAssetPath(searchFolders[i]).EndsWith("The Vegetation Engine.pdf"))
                {
                    assetFolder = AssetDatabase.GUIDToAssetPath(searchFolders[i]);
                    assetFolder = assetFolder.Replace("/The Vegetation Engine.pdf", "");
                }
            }

            searchFolders = AssetDatabase.FindAssets("User");

            for (int i = 0; i < searchFolders.Length; i++)
            {
                if (AssetDatabase.GUIDToAssetPath(searchFolders[i]).EndsWith("User.pdf"))
                {
                    userFolder = AssetDatabase.GUIDToAssetPath(searchFolders[i]);
                    userFolder = userFolder.Replace("/User.pdf", "");
                    userFolder += "/The Vegetation Engine";
                }
            }

            pipelinesPath = assetFolder + "/Core/Pipelines";
            pipelinePath = userFolder + "/Pipeline.asset";
            autorunPath = assetFolder + "/Core/Editor/TVEHubAutoRun.cs";

            // GetUser Settings
            assetVersion = SettingsUtils.LoadSettingsData(assetFolder + "/Core/Editor/Version.asset", -99);
            userVersion = SettingsUtils.LoadSettingsData(userFolder + "/Version.asset", -99);

            // Validator was previously saved as a bool in 6.5.0
            var validatorString = SettingsUtils.LoadSettingsData(assetFolder + "/Core/Editor/Validator.asset", "");

            if (validatorString == "")
            {
                validatorVersion = assetVersion;
            }
            else if (validatorString == "True")
            {
                validatorVersion = 660;
            }
            else
            {
                validatorVersion = SettingsUtils.LoadSettingsData(assetFolder + "/Core/Editor/Validator.asset", assetVersion);
            }

            GetPackages();
            GetVertexChannelCompression();

            allMaterialGUIDs = AssetDatabase.FindAssets("t:material", null);
            allMeshGUIDs = AssetDatabase.FindAssets("t:mesh", null);

            // Find first user mesh
            for (int i = 0; i < allMeshGUIDs.Length; i++)
            {
                var path = AssetDatabase.GUIDToAssetPath(allMeshGUIDs[i]);

                if ((path.Contains("TVE Mesh") || path.Contains("TVE_Mesh")) && !path.Contains("The Vegetation Engine"))
                {
                    requiresMeshUpgrade = true;
                    requiresProjectBackup = true;
                    break;
                }
            }

            string userMaterialPath = "";
            //string userMeshPath = "";

            // Find first user material
            for (int i = 0; i < allMaterialGUIDs.Length; i++)
            {
                var path = AssetDatabase.GUIDToAssetPath(allMaterialGUIDs[i]);

                if ((path.Contains("TVE Material") || path.Contains("TVE_Material")) && !path.Contains("The Vegetation Engine"))
                {
                    userMaterialPath = path;
                    break;
                }
            }

            // Check if material upgrade is needed
            if (userMaterialPath != "")
            {
                var material = AssetDatabase.LoadAssetAtPath<Material>(userMaterialPath);

                if (material.HasProperty("_IsVersion"))
                {
                    userVersion = material.GetInt("_IsVersion");

                    if (material.GetInt("_IsVersion") < VERSION_REQUIRES_UPDATE)
                    {
                        requiresMaterialUpgrade = true;
                    }

                    if (material.GetInt("_IsVersion") < VERSION_REQUIRES_BACKUP)
                    {
                        requiresProjectBackup = true;
                    }
                }
            }

            GetPipeline();

            bannerVersion = assetVersion.ToString();
            bannerVersion = bannerVersion.Insert(1, ".");
            bannerVersion = bannerVersion.Insert(3, ".");

            bannerColor = new Color(0.890f, 0.745f, 0.309f);
            bannerText = "The Vegetation Engine " + bannerVersion;

            // Check for latest version
            //StartBackgroundTask(StartRequest("https://boxophobic.com/s/thevegetationengine", () =>
            //{
            //    int.TryParse(www.downloadHandler.text, out latestVersion);
            //    Debug.Log("hubhub" + latestVersion);
            //}));
        }

        void OnFocus()
        {
            GetVertexChannelCompression();
        }

        void OnGUI()
        {
            GUI_HALF_EDITOR_WIDTH = this.position.width / 2.0f - 24;

            SetGUIStyles();
            DrawToolbar();

            StyledGUI.DrawWindowBanner(bannerColor, bannerText);

            GUILayout.BeginHorizontal();
            GUILayout.Space(15);

            GUILayout.BeginVertical();

            //scrollPosition = GUILayout.BeginScrollView(scrollPosition, false, false, GUILayout.Width(this.position.width - 28), GUILayout.Height(this.position.height - 120));

            if (EditorApplication.isCompiling)
            {
                GUI.enabled = false;
            }

            if (validatorVersion < assetVersion)
            {
                EditorGUILayout.HelpBox("Previous version detected! You must delete the Vegetation Engine folder before installing the new version!", MessageType.Error, true);

                GUILayout.Space(15);

                if (GUILayout.Button("Show Upgrading Steps", GUILayout.Height(24)))
                {
                    Application.OpenURL("https://docs.google.com/document/d/145JOVlJ1tE-WODW45YoJ6Ixg23mFc56EnB_8Tbwloz8/edit#heading=h.cm34ujnxxd9d");
                }

                EndLayout();

                return;
            }

            if (requiresCompressionUpgrade)
            {
                if (EditorSettings.serializationMode == UnityEditor.SerializationMode.ForceText)
                {
                    EditorGUILayout.HelpBox("The Vertex Compression for Tex Coord 0 and Tex Coord 3 under Project Settings > Player Settings > Other Settings must be disabled in order for the converted meshes to render in build! Optimize Mesh Data will be enabled to support the shaders as terrain details! Make sure to save the project settings for the chnages to take effect!", MessageType.Warning, true);

                    GUILayout.Space(15);

                    if (GUILayout.Button("Disable Vertex Compression", GUILayout.Height(24)))
                    {
                        SetVertexChannelCompression();
                    }

                    EndLayout();

                    return;
                }
            }

            if (File.Exists(autorunPath) || requiresPipelineSetup)
            {
                EditorGUILayout.HelpBox("Welcome to the Vegetation Engine! Choose the render pipeline used in your project to make the shaders compatible with the current pipeline! Please note, deprecated pipelines are not officially supported and they will be removed in future versions!", MessageType.Info, true);

                GUILayout.Space(15);

                GUILayout.BeginHorizontal();

                GUILayout.Label("Render Pipeline Support", GUILayout.Width(GUI_HALF_EDITOR_WIDTH));
                pipelineIndex = EditorGUILayout.Popup(pipelineIndex, pipelineOptions, stylePopup);

                GUILayout.EndHorizontal();

                GUILayout.Space(15);

                if (GUILayout.Button("Choose Render Pipeline Support", GUILayout.Height(24)))
                {
                    SettingsUtils.SaveSettingsData(pipelinePath, pipelineOptions[pipelineIndex]);

                    if (requiresPipelineSetup || pipelineOptions[pipelineIndex].Contains("High") || pipelineOptions[pipelineIndex].Contains("Universal"))
                    {
                        ImportPackage();

                        requiresPipelineSetup = false;
                        requiresMaterialUpgrade = true;
                    }

                    GetPipeline();
                    InstallAsset();

                    GUIUtility.ExitGUI();
                }
            }
            else
            {
                if (requiresMaterialUpgrade || requiresMeshUpgrade)
                {
                    EditorGUILayout.HelpBox("The setup is not done yet! The Vegetation Engine will upgrade all project materials and meshes if needed. The current scene will be closed and re-opened after the upgrade. Do not close Unity during the upgrading step!", MessageType.Info, true);

                    GUILayout.Space(15);

                    if (GUILayout.Button("Upgrade Assets And Finish Setup", GUILayout.Height(24)))
                    {
                        if (requiresProjectBackup)
                        {
                            upgradeIsValid = EditorUtility.DisplayDialog("Backup Recommended", "The Vegetation Engine " + bannerVersion + " is a major release. Backing up the project is recommended!", "I have a backup", "Cancel");
                        }
                        else
                        {
                            upgradeIsValid = true;
                        }

                        if (upgradeIsValid)
                        {
                            GetCurrentScenesSaving();

                            if (requiresMeshUpgrade)
                            {
                                UpgradeMeshes();
                            }

                            if (requiresMaterialUpgrade)
                            {
                                UpgradeMaterials();
                            }

                            RestartActiveScenes();

                            requiresProjectBackup = false;
                            requiresMaterialUpgrade = false;
                            requiresMeshUpgrade = false;

                            GUIUtility.ExitGUI();
                        }
                    }
                }
                else
                {
                    EditorGUILayout.HelpBox("The Vegetation Engine is installed for the " + pipelineCurrent + "!", MessageType.Info, true);

                    GUILayout.Space(15);

                    GUI.enabled = false;
                    GUILayout.BeginHorizontal();
                    GUILayout.Label("Render Pipeline Support", GUILayout.Width(GUI_HALF_EDITOR_WIDTH));
                    pipelineIndex = EditorGUILayout.Popup(pipelineIndex, pipelineOptions, stylePopup);
                    GUILayout.EndHorizontal();
                    GUI.enabled = true;

                    GUILayout.Space(15);

                    if (GUILayout.Button("Restart Render Pipeline Setup", GUILayout.Height(24)))
                    {
                        GetPipeline();

                        requiresPipelineSetup = true;
                    }

                    //if (GUILayout.Button("Validate All Project Meshes", GUILayout.Height(24)))
                    //{
                    //    UpgradeMeshes();
                    //}

                    //if (GUILayout.Button("Validate All Project Materials", GUILayout.Height(24)))
                    //{
                    //    GetCurrentScenesSaving();
                    //    UpgradeAllMaterials();
                    //    RestartActiveScenes();
                    //}
                }
            }

            GUI.enabled = true;

            //GUILayout.EndScrollView();

            GUILayout.EndVertical();

            GUILayout.Space(13);
            GUILayout.EndHorizontal();

            DrawInstall();
        }

        void SetGUIStyles()
        {
            stylePopup = new GUIStyle(EditorStyles.popup)
            {
                alignment = TextAnchor.MiddleCenter
            };

            styleLabelCentered = new GUIStyle(EditorStyles.label)
            {
                richText = true,
                alignment = TextAnchor.MiddleCenter,
            };

            styledToolbar = new GUIStyle(EditorStyles.toolbarButton)
            {
                alignment = TextAnchor.MiddleCenter,
                fontStyle = FontStyle.Normal,
                fontSize = 11,
            };
        }

        void EndLayout()
        {
            GUI.enabled = true;

            //GUILayout.EndScrollView();

            GUILayout.EndVertical();

            GUILayout.Space(13);
            GUILayout.EndHorizontal();

            GUIUtility.ExitGUI();
        }

        void DrawToolbar()
        {
            var GUI_TOOLBAR_EDITOR_WIDTH = this.position.width / 5.0f + 1;

            GUILayout.Space(1);
            GUILayout.BeginHorizontal();

            if (GUILayout.Button("Discord Server", styledToolbar, GUILayout.Width(GUI_TOOLBAR_EDITOR_WIDTH)))
            {
                Application.OpenURL("https://discord.com/invite/znxuXET");
            }
            GUILayout.Space(-1);

            if (GUILayout.Button("Documentation", styledToolbar, GUILayout.Width(GUI_TOOLBAR_EDITOR_WIDTH)))
            {
                Application.OpenURL("https://docs.google.com/document/d/145JOVlJ1tE-WODW45YoJ6Ixg23mFc56EnB_8Tbwloz8/edit#");
            }
            GUILayout.Space(-1);

            if (GUILayout.Button("Demo Scenes", styledToolbar, GUILayout.Width(GUI_TOOLBAR_EDITOR_WIDTH)))
            {
                EditorGUIUtility.PingObject(AssetDatabase.LoadAssetAtPath<Object>(assetFolder + "/Demo/Demo Diorama.unity"));
            }
            GUILayout.Space(-1);

            if (GUILayout.Button("More Modules", styledToolbar, GUILayout.Width(GUI_TOOLBAR_EDITOR_WIDTH)))
            {
                Application.OpenURL("https://assetstore.unity.com/publishers/20529");
            }

#if UNITY_2020_3_OR_NEWER
            var rectModules = GUILayoutUtility.GetLastRect();
            var iconModules = new Rect(rectModules.xMax - 24, rectModules.y, 20, 20);
            GUI.color = new Color(0.2f, 1.0f, 1.0f);
            GUI.Label(iconModules, EditorGUIUtility.IconContent("d_SceneViewFx"));
            GUI.color = Color.white;
#endif
            GUILayout.Space(-1);

            if (GUILayout.Button("Write A Review", styledToolbar, GUILayout.Width(GUI_TOOLBAR_EDITOR_WIDTH)))
            {
                Application.OpenURL("https://assetstore.unity.com/packages/tools/utilities/the-vegetation-engine-159647#reviews");
            }

#if UNITY_2020_3_OR_NEWER
            var rectReview = GUILayoutUtility.GetLastRect();
            var iconReview = new Rect(rectReview.xMax - 24, rectReview.y, 20, 20);
            GUI.color = new Color(1.0f, 1.0f, 0.5f);
            GUI.Label(iconReview, EditorGUIUtility.IconContent("d_Favorite"));
            GUI.color = Color.white;
#endif
            GUILayout.Space(-1);

            GUILayout.EndHorizontal();
            GUILayout.Space(4);
        }

        void DrawInstall()
        {
            GUI.enabled = false;

            Color progressColor;

            if (EditorGUIUtility.isProSkin)
            {
                progressColor = new Color(1, 1, 1, 0.2f);
            }
            else
            {
                progressColor = new Color(0, 0, 0, 0.2f);
            }

            if (File.Exists(autorunPath) || requiresPipelineSetup)
            {
                if (requiresMaterialUpgrade || requiresMeshUpgrade || requiresPipelineSetup)
                {
                    EditorGUI.LabelField(new Rect(0, this.position.height - 25, this.position.width, 20), "<size=10>Installation Progress</size>", styleLabelCentered);

                    EditorGUI.DrawRect(new Rect(0, this.position.height - 30, this.position.width / 3, 1), progressColor);
                }
                else
                {
                    EditorGUI.LabelField(new Rect(0, this.position.height - 25, this.position.width, 20), "<size=10>Installation Progress</size>", styleLabelCentered);

                    EditorGUI.DrawRect(new Rect(0, this.position.height - 30, this.position.width / 2, 1), progressColor);
                }
            }
            else
            {
                if (requiresMaterialUpgrade || requiresMeshUpgrade)
                {
                    EditorGUI.LabelField(new Rect(0, this.position.height - 25, this.position.width, 20), "<size=10>Installation Progress</size>", styleLabelCentered);

                    EditorGUI.DrawRect(new Rect(0, this.position.height - 30, this.position.width / 1.5f, 1), progressColor);
                }
                else
                {
                    EditorGUI.LabelField(new Rect(0, this.position.height - 25, this.position.width, 20), "<size=10>Installation Completed</size>", styleLabelCentered);

                    EditorGUI.DrawRect(new Rect(0, this.position.height - 30, this.position.width, 1), progressColor);
                }
            }

            GUI.enabled = true;
        }

        void GetPackages()
        {
            pipelinePaths = Directory.GetFiles(pipelinesPath, "*.unitypackage", SearchOption.TopDirectoryOnly);

            pipelineOptions = new string[pipelinePaths.Length];

            for (int i = 0; i < pipelineOptions.Length; i++)
            {
                pipelineOptions[i] = Path.GetFileNameWithoutExtension(pipelinePaths[i].Replace("Built-in Pipeline", "Standard"));
            }
        }

        void GetPipeline()
        {
            for (int i = 0; i < pipelineOptions.Length; i++)
            {
                if (pipelineOptions[i] == SettingsUtils.LoadSettingsData(pipelinePath, ""))
                {
                    pipelineIndex = i;
                    pipelineCurrent = pipelineOptions[i];
                }
            }

            pipelineCurrent = pipelineCurrent.Replace("Standard", "Standard Render Pipeline");
            pipelineCurrent = pipelineCurrent.Replace("Universal", "Universal Render Pipeline");
            pipelineCurrent = pipelineCurrent.Replace("High Definition", "High Definition Render Pipeline");
        }

        void ImportPackage()
        {
            SettingsUtils.SaveSettingsData(pipelinePath, pipelineOptions[pipelineIndex]);

            AssetDatabase.ImportPackage(pipelinePaths[pipelineIndex], false);
            AssetDatabase.SaveAssets();
            AssetDatabase.Refresh();
        }

        void InstallAsset()
        {
            FileUtil.DeleteFileOrDirectory(autorunPath);
            FileUtil.DeleteFileOrDirectory(autorunPath + ".meta");

            SettingsUtils.SaveSettingsData(assetFolder + "/Core/Editor/Validator.asset", assetVersion);
            SettingsUtils.SaveSettingsData(userFolder + "/Version.asset", assetVersion);

            SetDefineSymbols();
            SetScriptExecutionOrder();

            AssetDatabase.SaveAssets();
            AssetDatabase.Refresh();

            GUIUtility.ExitGUI();
        }

        void SetDefineSymbols()
        {
            var defineSymbols = PlayerSettings.GetScriptingDefineSymbolsForGroup(EditorUserBuildSettings.selectedBuildTargetGroup);

            if (!defineSymbols.Contains("THE_VEGETATION_ENGINE"))
            {
                defineSymbols += ";THE_VEGETATION_ENGINE;";

                PlayerSettings.SetScriptingDefineSymbolsForGroup(EditorUserBuildSettings.selectedBuildTargetGroup, defineSymbols);
            }
        }

        void SetScriptExecutionOrder()
        {
            MonoScript[] scripts = (MonoScript[])Resources.FindObjectsOfTypeAll(typeof(MonoScript));

            foreach (MonoScript script in scripts)
            {
                if (script.GetClass() == typeof(TVEManager))
                {
                    MonoImporter.SetExecutionOrder(script, -122);
                }

                if (script.GetClass() == typeof(TVECustomRenderData))
                {
                    MonoImporter.SetExecutionOrder(script, -121);
                }
            }
        }

        void GetVertexChannelCompression()
        {
            if (EditorSettings.serializationMode != UnityEditor.SerializationMode.ForceText)
            {
                return;
            }

            var projectSettingsPath = Path.Combine(Path.GetDirectoryName(Application.dataPath), "ProjectSettings", "ProjectSettings.asset");
            requiresCompressionUpgrade = false;

            if (File.Exists(projectSettingsPath))
            {
                StreamReader reader = new StreamReader(projectSettingsPath);

                int bitmask = 0;
                vertexLayers = new List<int>();
                settingsLines = new List<string>();

                while (!reader.EndOfStream)
                {
                    settingsLines.Add(reader.ReadLine());
                }

                reader.Close();

                for (int i = 0; i < settingsLines.Count; i++)
                {
                    if (settingsLines[i].Contains("VertexChannelCompressionMask"))
                    {
                        string line = settingsLines[i].Replace("  VertexChannelCompressionMask: ", "");
                        bitmask = int.Parse(line, CultureInfo.InvariantCulture);
                    }
                }

                for (int i = 0; i < 9; i++)
                {
                    if (((1 << i) & bitmask) != 0)
                    {
                        vertexLayers.Add(1);
                    }
                    else
                    {
                        vertexLayers.Add(0);
                    }
                }

                if (vertexLayers[4] == 1 || vertexLayers[7] == 1)
                {
                    requiresCompressionUpgrade = true;
                }
            }
        }

        void SetVertexChannelCompression()
        {
            if (EditorSettings.serializationMode != UnityEditor.SerializationMode.ForceText)
            {
                return;
            }

            var projectSettingsPath = Path.Combine(Path.GetDirectoryName(Application.dataPath), "ProjectSettings", "ProjectSettings.asset");

            if (File.Exists(projectSettingsPath))
            {
                // Disable layers
                vertexLayers[4] = 0;
                vertexLayers[7] = 0;

                int layerMask = 0;

                for (int i = 0; i < 9; i++)
                {
                    if (vertexLayers[i] == 1)
                    {
                        layerMask = layerMask + (int)Mathf.Pow(2, i);
                    }
                }

                StreamWriter writer = new StreamWriter(projectSettingsPath);

                for (int i = 0; i < settingsLines.Count; i++)
                {
                    if (settingsLines[i].Contains("VertexChannelCompressionMask"))
                    {
                        settingsLines[i] = "  VertexChannelCompressionMask: " + layerMask;
                    }

                    if (settingsLines[i].Contains("StripUnusedMeshComponents"))
                    {
                        settingsLines[i] = "  StripUnusedMeshComponents: 1";
                    }

                    writer.WriteLine(settingsLines[i]);
                }

                writer.Close();

                requiresCompressionUpgrade = false;
            }
        }

        void UpgradeMeshes()
        {
            int total = 0;
            int count = 0;

            foreach (var asset in allMeshGUIDs)
            {
                var path = AssetDatabase.GUIDToAssetPath(asset);

                if ((path.Contains("TVE Mesh") || path.Contains("TVE_Mesh")))
                {
                    total++;
                }
            }

            foreach (var asset in allMeshGUIDs)
            {
                var path = AssetDatabase.GUIDToAssetPath(asset);

                if ((path.Contains("TVE Mesh") || path.Contains("TVE_Mesh")))
                {
                    if (Path.GetFullPath(path).Length > 256)
                    {
                        Debug.Log("<b>[The Vegetation Engine]</b> " + path + " could not be upgraded because the file path is too long! To fix the issue, rename the folders and file names, then go to Hub > Show Advanced Settings > Validate All Project Meshes to re-process the meshes!");
                        continue;
                    }

                    var mesh = AssetDatabase.LoadAssetAtPath<Mesh>(path);

                    if (mesh == null)
                    {
                        Debug.Log("<b>[The Vegetation Engine]</b> " + path + " could not be upgraded because the mesh is null!");
                        continue;
                    }

                    bool isUpgraded = false;
                    bool isReadable = mesh.isReadable;

                    if (userVersion >= 650)
                    {
                        isUpgraded = true;
                    }

                    if (isUpgraded)
                    {
                        AssetDatabase.SetLabels(AssetDatabase.LoadAssetAtPath<UnityEngine.Object>(path), new string[] { "TVE Model" });

                        var meshName = Path.GetFileNameWithoutExtension(path);
                        var newName = "";
                        var newPath = "";

                        if (meshName.Contains("TVE Mesh"))
                        {
                            newName = meshName.Replace("TVE Mesh", "TVE Model");
                            newPath = newPath.Replace("TVE Mesh", "TVE Model");
                        }

                        if (meshName.Contains("TVE_Mesh"))
                        {
                            newName = meshName.Replace("TVE_Mesh", "TVE_Model");
                            newPath = newPath.Replace("TVE_Mesh", "TVE_Model");
                        }

                        var newMesh = Instantiate(mesh);
                        newMesh.name = newName;

                        EditorUtility.CopySerialized(newMesh, mesh);
                        AssetDatabase.SaveAssets();
                        AssetDatabase.Refresh();

                        AssetDatabase.RenameAsset(path, newName);

                        AssetDatabase.SaveAssets();
                        AssetDatabase.Refresh();

                        Resources.UnloadAsset(mesh);
                        Resources.UnloadAsset(Resources.Load<Mesh>(newPath));
                    }

                    if (!isUpgraded)
                    {
                        AssetDatabase.SetLabels(AssetDatabase.LoadAssetAtPath<UnityEngine.Object>(path), new string[] { "TVE Model" });

                        var meshName = Path.GetFileNameWithoutExtension(path);
                        var newName = "";
                        var newPath = "";

                        if (meshName.Contains("TVE Mesh"))
                        {
                            newName = meshName.Replace("TVE Mesh", "TVE Model");
                            newPath = newPath.Replace("TVE Mesh", "TVE Model");
                        }

                        if (meshName.Contains("TVE_Mesh"))
                        {
                            newName = meshName.Replace("TVE_Mesh", "TVE_Model");
                            newPath = newPath.Replace("TVE_Mesh", "TVE_Model");
                        }

                        var newMesh = Instantiate(mesh);
                        newMesh.name = newName;

                        if (newMesh == null)
                        {
                            Debug.Log("<b>[The Vegetation Engine]</b> " + path + " could not be upgraded because the mesh is null!");
                            continue;
                        }

                        var bounds = mesh.bounds;

                        var maxX = Mathf.Max(Mathf.Abs(bounds.min.x), Mathf.Abs(bounds.max.x));
                        var maxZ = Mathf.Max(Mathf.Abs(bounds.min.z), Mathf.Abs(bounds.max.z));
                        var maxR = Mathf.Max(maxX, maxZ);
                        var maxDivR = maxR / 100f;
                        var maxDivH = Mathf.Max(Mathf.Abs(bounds.min.y), Mathf.Abs(bounds.max.y)) / 100f;

                        var vertexCount = mesh.vertexCount;
                        var vertices = new List<Vector3>(vertexCount);
                        var colors = new List<Color>(vertexCount);
                        var UV0 = new List<Vector4>(vertexCount);
                        var UV2 = new List<Vector4>(vertexCount);
                        var UV4 = new List<Vector4>(vertexCount);
                        var newColors = new List<Color>(vertexCount);
                        var newUV0 = new List<Vector4>(vertexCount);
                        var newUV2 = new List<Vector4>(vertexCount);
                        var newUV4 = new List<Vector4>(vertexCount);

                        mesh.GetVertices(vertices);
                        mesh.GetColors(colors);
                        mesh.GetUVs(0, UV0);
                        mesh.GetUVs(1, UV2);
                        mesh.GetUVs(3, UV4);

                        newColors = colors;

                        // Must be a default mesh
                        if (colors.Count != 0 && UV0.Count != 0 && UV4.Count != 0)
                        {
                            // No LM used
                            if (UV2.Count == 0)
                            {
                                for (int i = 0; i < vertexCount; i++)
                                {
                                    var cylinderMask = Mathf.Clamp01(TVEUtils.MathRemap(Vector3.Distance(vertices[i], new Vector3(0, vertices[i].y, 0)), maxR * 0.1f, maxR, 0f, 1f));
                                    var powerMask = cylinderMask * cylinderMask;

                                    newUV0.Add(new Vector4(UV0[i].x, UV0[i].y, TVEUtils.MathVector2ToFloat(powerMask, UV4[i].z), TVEUtils.MathVector2ToFloat(maxDivH, maxDivR)));
                                    newUV2.Add(new Vector4(UV0[i].x, UV0[i].y, UV0[i].z, UV0[i].w));
                                    newUV4.Add(new Vector4(UV0[i].z, UV0[i].w, 0, 0));
                                }
                            }
                            else
                            {
                                for (int i = 0; i < vertexCount; i++)
                                {
                                    var cylinderMask = Mathf.Clamp01(TVEUtils.MathRemap(Vector3.Distance(vertices[i], new Vector3(0, vertices[i].y, 0)), maxR * 0.1f, maxR, 0f, 1f));
                                    var powerMask = cylinderMask * cylinderMask;

                                    newUV0.Add(new Vector4(UV0[i].x, UV0[i].y, TVEUtils.MathVector2ToFloat(powerMask, UV4[i].z), TVEUtils.MathVector2ToFloat(maxDivH, maxDivR)));
                                    newUV2.Add(new Vector4(UV2[i].x, UV2[i].y, UV0[i].z, UV0[i].w));
                                    newUV4.Add(new Vector4(UV0[i].z, UV0[i].w, 0, 0));
                                }
                            }
                        }

                        // Must be a polygonal mesh
                        if (colors.Count != 0 && UV0.Count != 0 && UV4.Count == 0)
                        {
                            // No LM used
                            if (UV2.Count == 0)
                            {
                                for (int i = 0; i < vertexCount; i++)
                                {
                                    newUV0.Add(new Vector4(UV0[i].x, UV0[i].y, TVEUtils.MathVector2ToFloat(colors[i].a, colors[i].a), TVEUtils.MathVector2ToFloat(maxDivH, maxDivR)));
                                    newUV2.Add(new Vector4(UV0[i].x, UV0[i].y, UV0[i].z, UV0[i].w));
                                    newUV4.Add(new Vector4(0, 0, 0, 0));
                                }
                            }
                            else
                            {
                                for (int i = 0; i < vertexCount; i++)
                                {
                                    newUV0.Add(new Vector4(UV0[i].x, UV0[i].y, TVEUtils.MathVector2ToFloat(colors[i].a, colors[i].a), TVEUtils.MathVector2ToFloat(maxDivH, maxDivR)));
                                    newUV2.Add(new Vector4(UV2[i].x, UV2[i].y, UV0[i].z, UV0[i].w));
                                    newUV4.Add(new Vector4(0, 0, 0, 0));
                                }
                            }
                        }

                        // Must be a prop mesh
                        if (colors.Count == 0 && UV0.Count != 0 && UV4.Count == 0)
                        {
                            // No LM used
                            if (UV2.Count == 0)
                            {
                                for (int i = 0; i < vertexCount; i++)
                                {
                                    newColors.Add(new Color(1, 1, 1, 1));
                                    newUV0.Add(new Vector4(UV0[i].x, UV0[i].y, TVEUtils.MathVector2ToFloat(1, 1), TVEUtils.MathVector2ToFloat(maxDivH, maxDivR)));
                                    newUV2.Add(new Vector4(UV0[i].x, UV0[i].y, UV0[i].z, UV0[i].w));
                                    newUV4.Add(new Vector4(0, 0, 0, 0));
                                }
                            }
                            else
                            {
                                for (int i = 0; i < vertexCount; i++)
                                {
                                    newColors.Add(new Color(1, 1, 1, 1));
                                    newUV0.Add(new Vector4(UV0[i].x, UV0[i].y, TVEUtils.MathVector2ToFloat(1, 1), TVEUtils.MathVector2ToFloat(maxDivH, maxDivR)));
                                    newUV2.Add(new Vector4(UV2[i].x, UV2[i].y, UV0[i].z, UV0[i].w));
                                    newUV4.Add(new Vector4(0, 0, 0, 0));
                                }
                            }
                        }

                        // Must be a prop collider
                        if (UV0.Count == 0)
                        {
                            for (int i = 0; i < vertexCount; i++)
                            {
                                newColors.Add(new Color(1, 1, 1, 1));
                                newUV0.Add(new Vector4(0, 0, TVEUtils.MathVector2ToFloat(1, 1), TVEUtils.MathVector2ToFloat(maxDivH, maxDivR)));
                                newUV2.Add(new Vector4(0, 0, 0, 0));
                                newUV4.Add(new Vector4(0, 0, 0, 0));
                            }
                        }

                        newMesh.SetColors(newColors);
                        newMesh.SetUVs(0, newUV0);
                        newMesh.SetUVs(1, newUV2);
                        newMesh.SetUVs(3, newUV4);

                        mesh.Clear();

                        if (!isReadable)
                        {
                            newMesh.UploadMeshData(true);
                        }

                        EditorUtility.CopySerialized(newMesh, mesh);
                        AssetDatabase.SaveAssets();
                        AssetDatabase.Refresh();

                        AssetDatabase.RenameAsset(path, newName);

                        AssetDatabase.SaveAssets();
                        AssetDatabase.Refresh();

                        Resources.UnloadAsset(mesh);
                        Resources.UnloadAsset(Resources.Load<Mesh>(newPath));

                        vertices.Clear();
                        colors.Clear();
                        UV0.Clear();
                        UV2.Clear();
                        UV4.Clear();
                        newColors.Clear();
                        newUV0.Clear();
                        newUV2.Clear();
                        newUV4.Clear();
                    }

                    count++;

                    EditorUtility.DisplayProgressBar("The Vegetatin Engine", "Processing " + Path.GetFileName(path), (float)count * (1.0f / (float)total));
                }
            }

            EditorUtility.ClearProgressBar();
            Debug.Log("<b>[The Vegetation Engine]</b> " + "All valid project meshes have been updated!");
        }

        void UpgradeMaterials()
        {
            int total = 0;
            int count = 0;

            foreach (var asset in allMaterialGUIDs)
            {
                var path = AssetDatabase.GUIDToAssetPath(asset);

                if (path.Contains("TVE Material") || path.Contains("TVE_Material") || path.Contains("_Impostor") || path.Contains("TVE Element") || path.Contains("TVE_Element"))
                {
                    total++;
                }
            }

            foreach (var asset in allMaterialGUIDs)
            {
                var path = AssetDatabase.GUIDToAssetPath(asset);

                if (path.Contains("TVE Material") || path.Contains("TVE_Material") || path.Contains("_Impostor"))
                {
                    var material = AssetDatabase.LoadAssetAtPath<Material>(path);
                    TVEUtils.SetMaterialSettings(material);

                    AssetDatabase.SaveAssets();
                    AssetDatabase.Refresh();

                    TVEUtils.UnloadMaterialFromMemory(material);

                    count++;
                }
                else if (path.Contains("TVE Element") || path.Contains("TVE_Element"))
                {
                    var material = AssetDatabase.LoadAssetAtPath<Material>(path);
                    TVEUtils.SetElementSettings(material);

                    AssetDatabase.SaveAssets();
                    AssetDatabase.Refresh();

                    TVEUtils.UnloadMaterialFromMemory(material);

                    count++;
                }

                EditorUtility.DisplayProgressBar("The Vegetatin Engine", "Processing " + Path.GetFileName(path), (float)count * (1.0f / (float)total));
            }

            EditorUtility.ClearProgressBar();
            Debug.Log("<b>[The Vegetation Engine]</b> " + "All valid project materials have been updated!");
        }

        void UpgradeAllMaterials()
        {
            int total = allMaterialGUIDs.Length;
            int count = 0;

            foreach (var asset in allMaterialGUIDs)
            {
                var path = AssetDatabase.GUIDToAssetPath(asset);

                var material = AssetDatabase.LoadAssetAtPath<Material>(path);
                TVEUtils.SetMaterialSettings(material);
                TVEUtils.SetElementSettings(material);

                AssetDatabase.SaveAssets();
                AssetDatabase.Refresh();

                TVEUtils.UnloadMaterialFromMemory(material);

                count++;

                EditorUtility.DisplayProgressBar("The Vegetatin Engine", "Processing " + Path.GetFileName(path), (float)count * (1.0f / (float)total));
            }

            EditorUtility.ClearProgressBar();
            Debug.Log("<b>[The Vegetation Engine]</b> " + "All valid project materials have been updated!");
        }

        void GetCurrentScenesSaving()
        {
            activeScenePaths = new List<string>();

            for (int i = 0; i < SceneManager.sceneCount; i++)
            {
                var scene = SceneManager.GetSceneAt(i);
                activeScenePaths.Add(scene.path);
            }

            for (int i = 0; i < activeScenePaths.Count; i++)
            {
                var activeScenePath = activeScenePaths[i];

                if (activeScenePath == "")
                {
                    var saveScene = EditorUtility.DisplayDialog("Save Untitled Scene?", "The current scene is not saved to disk! Would you like to save it?", "Save New Scene", "No");

                    if (saveScene)
                    {
                        var currentScene = SceneManager.GetSceneByPath(activeScenePath);

                        var savePath = EditorUtility.SaveFilePanelInProject("Save Scene", "New Scene", "unity", "Save scene to disk!", "Assets");

                        if (savePath != "")
                        {
                            EditorSceneManager.SaveScene(currentScene, savePath);
                            AssetDatabase.SaveAssets();
                            AssetDatabase.Refresh();

                            activeScenePaths[i] = savePath;
                        }
                    }
                }
                else
                {
                    var currentScene = SceneManager.GetSceneByPath(activeScenePath);

                    if (currentScene.isDirty)
                    {
                        var saveScene = EditorUtility.DisplayDialog("Save Scene " + currentScene.name + "?", "The current scene is modified! Would you like to save it?", "Save Scene", "No");

                        if (saveScene)
                        {
                            EditorSceneManager.SaveScene(currentScene);
                            AssetDatabase.SaveAssets();
                            AssetDatabase.Refresh();
                        }
                    }
                }
            }

            EditorSceneManager.NewScene(NewSceneSetup.EmptyScene);
            requiresSceneRestart = true;
        }

        void RestartActiveScenes()
        {
            if (requiresSceneRestart)
            {
                for (int i = 0; i < activeScenePaths.Count; i++)
                {
                    var activeScenePath = activeScenePaths[i];

                    if (activeScenePath != "")
                    {
                        var scene = SceneManager.GetSceneByPath(activeScenePath);

                        if (i == 0)
                        {
                            EditorSceneManager.OpenScene(activeScenePath);
                        }
                        else
                        {
                            EditorSceneManager.OpenScene(activeScenePath, OpenSceneMode.Additive);
                        }

                        EditorSceneManager.SaveScene(scene);
                    }

                    AssetDatabase.SaveAssets();
                    AssetDatabase.Refresh();

                    requiresSceneRestart = false;
                }
            }
        }

        // Check for latest version
        //UnityWebRequest www;

        //IEnumerator StartRequest(string url, Action success = null)
        //{
        //    using (www = UnityWebRequest.Get(url))
        //    {
        //        yield return www.Send();

        //        while (www.isDone == false)
        //            yield return null;

        //        if (success != null)
        //            success();
        //    }
        //}

        //public static void StartBackgroundTask(IEnumerator update, Action end = null)
        //{
        //    EditorApplication.CallbackFunction closureCallback = null;

        //    closureCallback = () =>
        //    {
        //        try
        //        {
        //            if (update.MoveNext() == false)
        //            {
        //                if (end != null)
        //                    end();
        //                EditorApplication.update -= closureCallback;
        //            }
        //        }
        //        catch (Exception ex)
        //        {
        //            if (end != null)
        //                end();
        //            Debug.LogException(ex);
        //            EditorApplication.update -= closureCallback;
        //        }
        //    };

        //    EditorApplication.update += closureCallback;
        //}
    }
}

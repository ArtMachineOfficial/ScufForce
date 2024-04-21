// Cristian Pop - https://boxophobic.com/

using UnityEngine;
using UnityEditor;
using Boxophobic.StyledGUI;
using Boxophobic.Utils;
using System.IO;

namespace TheVegetationEngineDetails
{
    public class TVETDHub : EditorWindow
    {
        string autorunPath;
        string assetFolder = "Assets/BOXOPHOBIC/The Vegetation Engine Modules/Terrain Details";

        int assetVersion;

        GUIStyle styledToolbar;
        GUIStyle styleLabelCentered;

        Color bannerColor;
        string bannerText;
        string bannerVersion;
        static TVETDHub window;

        [MenuItem("Window/BOXOPHOBIC/The Vegetation Engine/Hub/Terrain Details", false, 1008)]
        public static void ShowWindow()
        {
            window = GetWindow<TVETDHub>(false, "Terrain Details Module", true);
            window.minSize = new Vector2(800, 300);
        }

        void OnEnable()
        {
            //Safer search, there might be many user folders
            string[] searchFolders;

            searchFolders = AssetDatabase.FindAssets("Terrain Details");

            for (int i = 0; i < searchFolders.Length; i++)
            {
                if (AssetDatabase.GUIDToAssetPath(searchFolders[i]).EndsWith("Terrain Details.pdf"))
                {
                    assetFolder = AssetDatabase.GUIDToAssetPath(searchFolders[i]);
                    assetFolder = assetFolder.Replace("/Terrain Details.pdf", "");
                }
            }

            autorunPath = assetFolder + "/Core/Editor/TVETDHubAutoRun.cs";

            assetVersion = SettingsUtils.LoadSettingsData(assetFolder + "/Core/Editor/Version.asset", -99);

            bannerColor = new Color(0.890f, 0.745f, 0.309f);
            bannerText = "Terrain Details Module";
            bannerVersion = assetVersion.ToString();
            bannerVersion = bannerVersion.Insert(2, ".");
            bannerVersion = bannerVersion.Insert(4, ".");
        }

        void OnGUI()
        {
            SetGUIStyles();
            DrawToolbar();

            StyledGUI.DrawWindowBanner(bannerColor, bannerText, bannerVersion);

            GUILayout.BeginHorizontal();
            GUILayout.Space(15);

            GUILayout.BeginVertical();

            if (File.Exists(autorunPath))
            {
                EditorGUILayout.HelpBox("Welcome to the Terrain Details Module for the Vegetation Engine! Press Install to set up the asset!", MessageType.Info, true);

                GUILayout.Space(15);

                if (GUILayout.Button("Install", GUILayout.Height(24)))
                {
                    InstallAsset();
                }
            }
            else
            {
                EditorGUILayout.HelpBox("The included detail shaders are only compatible with the Standard Render Pipeline!", MessageType.Info, true);
            }

            GUILayout.EndVertical();

            GUILayout.Space(13);
            GUILayout.EndHorizontal();

            DrawInstall();
        }

        void SetGUIStyles()
        {
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
                Application.OpenURL("https://docs.google.com/document/d/145JOVlJ1tE-WODW45YoJ6Ixg23mFc56EnB_8Tbwloz8/edit#heading=h.ry5kejfultmi");
            }
            GUILayout.Space(-1);

            if (GUILayout.Button("Demo Scenes", styledToolbar, GUILayout.Width(GUI_TOOLBAR_EDITOR_WIDTH)))
            {
                EditorGUIUtility.PingObject(AssetDatabase.LoadAssetAtPath<Object>(assetFolder + "/Demo/Demo Day.unity"));
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
                Application.OpenURL("https://assetstore.unity.com/packages/vfx/shaders/the-vegetation-engine-terrain-details-add-on-beta-178485#reviews");
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
            Color progressColor;

            if (EditorGUIUtility.isProSkin)
            {
                progressColor = new Color(1, 1, 1, 0.2f);
            }
            else
            {
                progressColor = new Color(0, 0, 0, 0.2f);
            }

            if (File.Exists(autorunPath))
            {
                EditorGUI.LabelField(new Rect(0, this.position.height - 25, this.position.width, 20), "<size=10><color=#808080>Installation Progress</color></size>", styleLabelCentered);
                EditorGUI.DrawRect(new Rect(0, this.position.height - 30, this.position.width / 2, 1), progressColor);
            }
            else
            {
                EditorGUI.LabelField(new Rect(0, this.position.height - 25, this.position.width, 20), "<size=10><color=#808080>Installation Completed</color></size>", styleLabelCentered);
                EditorGUI.DrawRect(new Rect(0, this.position.height - 30, this.position.width, 1), progressColor);
            }
        }

        void InstallAsset()
        {
            FileUtil.DeleteFileOrDirectory(autorunPath);
            FileUtil.DeleteFileOrDirectory(autorunPath + ".meta");

            AssetDatabase.Refresh();

            SetDefineSymbols();

            GUIUtility.ExitGUI();
        }

        void SetDefineSymbols()
        {
#if UNITY_2023_1_OR_NEWER
            BuildTarget buildTarget = EditorUserBuildSettings.activeBuildTarget;
            BuildTargetGroup targetGroup = BuildPipeline.GetBuildTargetGroup(buildTarget);
            var namedBuildTarget = UnityEditor.Build.NamedBuildTarget.FromBuildTargetGroup(targetGroup);
            var defineSymbols = PlayerSettings.GetScriptingDefineSymbols(namedBuildTarget);
#else
            var defineSymbols = PlayerSettings.GetScriptingDefineSymbolsForGroup(EditorUserBuildSettings.selectedBuildTargetGroup);
#endif

            if (!defineSymbols.Contains("THE_VEGETATION_ENGINE_DETAILS"))
            {
                defineSymbols += ";THE_VEGETATION_ENGINE_DETAILS;";

#if UNITY_2023_1_OR_NEWER
                PlayerSettings.SetScriptingDefineSymbols(namedBuildTarget, defineSymbols);
#else
                PlayerSettings.SetScriptingDefineSymbolsForGroup(EditorUserBuildSettings.selectedBuildTargetGroup, defineSymbols);
#endif
            }
        }
    }
}



// Cristian Pop - https://boxophobic.com/

using UnityEngine;
using UnityEditor;
using Boxophobic.StyledGUI;
using Boxophobic.Utils;
using System.IO;
using System.Collections.Generic;
using System;

namespace TheVegetationEngine
{
    public class TVEShaderManager : EditorWindow
    {
        float GUI_HALF_EDITOR_WIDTH = 220;
        float GUI_HALF_OPTION_WIDTH = 220;
        const int GUI_SELECTION_HEIGHT = 24;

        string userFolder = "Assets/BOXOPHOBIC/User";

        List<string> coreShaderPaths;
        List<int> renderEngineIndices;
        List<int> shaderModelIndices;
        List<TVEShaderSettings> coreShaderSettings;

        int renderEngineIndex = 0;
        int shaderModelIndex = 0;
        bool showRenderEngineMixedValues = false;
        bool showShaderModelMixedValues = false;
        bool showSelection = true;

        GUIStyle stylePopup;
        GUIStyle styleLabel;
        GUIStyle styleHelpBox;
        GUIStyle styleCenteredHelpBox;

        Color bannerColor;
        string bannerText;
        static TVEShaderManager window;
        Vector2 scrollPosition = Vector2.zero;

        [MenuItem("Window/BOXOPHOBIC/The Vegetation Engine/Shader Manager", false, 2007)]
        public static void ShowWindow()
        {
            window = GetWindow<TVEShaderManager>(false, "Shader Manager", true);
            window.minSize = new Vector2(400, 300);
        }

        void OnEnable()
        {
            string[] searchFolders;

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

            coreShaderPaths = TVEUtils.GetCoreShaderPaths();

            GetShaderSettings();
            GetShaderMixedSettings();

            bannerColor = new Color(0.890f, 0.745f, 0.309f);
            bannerText = "Shader Manager";
        }

        void OnGUI()
        {
            SetGUIStyles();

            GUI_HALF_EDITOR_WIDTH = this.position.width / 2.0f - 24;
            GUI_HALF_OPTION_WIDTH = GUI_HALF_EDITOR_WIDTH - 38;

            StyledGUI.DrawWindowBanner(bannerColor, bannerText);

            GUILayout.BeginHorizontal();
            GUILayout.Space(15);

            GUILayout.BeginVertical();

            scrollPosition = GUILayout.BeginScrollView(scrollPosition, false, false, GUILayout.Width(this.position.width - 28), GUILayout.Height(this.position.height - 80));

            EditorGUILayout.HelpBox("Choose the shader render engine to enable instanced indirect support when working with 3rd party tools! The option can be set for each shader individually!", MessageType.Info, true);
            EditorGUILayout.HelpBox("GPU Instancer and Quadro Renderer create compatible shaders automatically and adding support is not required. You can still enable the support if you need the instanced indirect to be added to the original shaders specifically!", MessageType.Warning, true);

            GUILayout.Space(15);

            if (showRenderEngineMixedValues)
            {
                renderEngineIndex = -1;
            }

            EditorGUI.showMixedValue = showRenderEngineMixedValues;

            EditorGUI.BeginChangeCheck();

            GUILayout.BeginHorizontal();
            GUILayout.Label("Render Engine Support", GUILayout.Width(GUI_HALF_EDITOR_WIDTH));
            renderEngineIndex = EditorGUILayout.Popup(renderEngineIndex, TVEUtils.RenderEngineOptions, stylePopup, GUILayout.Height(GUI_SELECTION_HEIGHT));
            GUILayout.EndHorizontal();

            if (EditorGUI.EndChangeCheck())
            {
                showRenderEngineMixedValues = false;

                UpdateShaders();

                GetShaderSettings();
                GetShaderMixedSettings();

                GUIUtility.ExitGUI();
            }

            if (showShaderModelMixedValues)
            {
                shaderModelIndex = -1;
            }

            EditorGUI.showMixedValue = showShaderModelMixedValues;

            EditorGUI.BeginChangeCheck();

            GUILayout.BeginHorizontal();
            GUILayout.Label("Shader Model Support", GUILayout.Width(GUI_HALF_EDITOR_WIDTH));
            shaderModelIndex = EditorGUILayout.Popup(shaderModelIndex, TVEUtils.ShaderModelOptions, stylePopup, GUILayout.Height(GUI_SELECTION_HEIGHT));
            GUILayout.EndHorizontal();

            if (EditorGUI.EndChangeCheck())
            {
                showShaderModelMixedValues = false;

                UpdateShaders();

                GetShaderSettings();
                GetShaderMixedSettings();

                GUIUtility.ExitGUI();
            }

            EditorGUI.showMixedValue = false;

            GUILayout.Space(10);

            //if (showShaderModelMixedValues || showRenderEngineMixedValues)
            //{
            //    GUI.enabled = false;
            //}

            //if (GUILayout.Button("Set Shader Settings", GUILayout.Height(24)))
            //{
            //    showShaderModelMixedValues = false;
            //    showRenderEngineMixedValues = false;
            //    //SettingsUtils.SaveSettingsData(userFolder + "/Engine.asset", TVEUtils.RenderEngineOptions[renderEngineIndex]);

            //    UpdateShaders();

            //    GetShaderSettings();
            //    GetShaderMixedSettings();

            //    GUIUtility.ExitGUI();
            //}

            if (showSelection)
            {
                if (StyledButton("Hide Shader Selection"))
                    showSelection = !showSelection;
            }
            else
            {
                if (StyledButton("Show Shader Selection"))
                    showSelection = !showSelection;
            }

            if (showSelection)
            {
                for (int i = 0; i < coreShaderPaths.Count; i++)
                {
                    StyledShader(i);
                }
            }

            GUILayout.Space(10);

            GUILayout.FlexibleSpace();

            GUILayout.Space(20);

            GUILayout.EndScrollView();

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

            styleLabel = new GUIStyle(GUI.skin.GetStyle("Label"))
            {
                richText = true,
                alignment = TextAnchor.MiddleRight,
                fontSize = 10
            };

            styleHelpBox = new GUIStyle(GUI.skin.GetStyle("HelpBox"))
            {
                richText = true,
                alignment = TextAnchor.MiddleLeft,
            };

            styleCenteredHelpBox = new GUIStyle(GUI.skin.GetStyle("HelpBox"))
            {
                richText = true,
                alignment = TextAnchor.MiddleCenter,
            };
        }

        void StyledShader(int index)
        {
            //string color;

            //if (EditorGUIUtility.isProSkin)
            //{
            //    color = "<color=#96f3f0>";
            //}
            //else
            //{
            //    color = "<color=#0b448b>";
            //}

            var shader = AssetDatabase.LoadAssetAtPath<Shader>(coreShaderPaths[index]);
            var splitLine = shader.name.Split(char.Parse("/"));
            var splitCount = splitLine.Length;
            var title = splitLine[splitCount - 1];
            var subtitle = splitLine[splitCount - 2];

            GUILayout.Label("<size=10><b>" + "  " + subtitle + " " + title + "</b></size>", styleHelpBox, GUILayout.Height(GUI_SELECTION_HEIGHT));

            var lastRect = GUILayoutUtility.GetLastRect();
            var popupRect = new Rect(lastRect.width / 2, lastRect.y + 3, lastRect.width / 2, lastRect.height);
            var selectionRect = new Rect(lastRect.x, lastRect.y, lastRect.width / 2, lastRect.height);

            if (GUI.Button(selectionRect, "", GUIStyle.none))
            {
                //var shader = AssetDatabase.LoadAssetAtPath<Shader>(coreShaderPaths[index]);
                EditorGUIUtility.PingObject(shader);
            }

            GUILayout.BeginHorizontal();

            EditorGUI.BeginChangeCheck();

            renderEngineIndices[index] = EditorGUI.Popup(popupRect, renderEngineIndices[index], TVEUtils.RenderEngineOptions, stylePopup);

            if (EditorGUI.EndChangeCheck())
            {
                //var shader = AssetDatabase.LoadAssetAtPath<Shader>(coreShaderPaths[index]);
                SettingsUtils.SaveSettingsData(userFolder + "/Shaders/Engine " + shader.name.Replace("/", "__") + ".asset", TVEUtils.RenderEngineOptions[renderEngineIndices[index]]);

                TVEUtils.SetShaderSettings(coreShaderPaths[index], coreShaderSettings[index]);

                AssetDatabase.SaveAssets();
                AssetDatabase.Refresh();

                GetShaderMixedSettings();

                GUIUtility.ExitGUI();
            }

            //if (GUILayout.Button("Install", GUILayout.Width(80)))
            //{
            //    var shader = AssetDatabase.LoadAssetAtPath<Shader>(coreShaderPaths[index]);
            //    SettingsUtils.SaveSettingsData(userFolder + "/Shaders/Engine " + shader.name.Replace("/", "__") + ".asset", TVEShaderUtils.RenderEngineOptions[engineOverridesIndices[index]]);

            //    TVEShaderUtils.InjectShaderFeatures(coreShaderPaths[index], TVEShaderUtils.RenderEngineOptions[engineOverridesIndices[index]]);

            //    AssetDatabase.SaveAssets();
            //    AssetDatabase.Refresh();

            //    GetRenderEngineMixedValues();

            //    GUIUtility.ExitGUI();
            //}

            GUILayout.EndHorizontal();
        }

        bool StyledButton(string text)
        {
            bool value = GUILayout.Button("<b>" + text + "</b>", styleCenteredHelpBox, GUILayout.Height(GUI_SELECTION_HEIGHT));

            return value;
        }

        void UpdateShaders()
        {
            for (int i = 0; i < coreShaderPaths.Count; i++)
            {
                coreShaderSettings[i].renderEngine = TVEUtils.RenderEngineOptions[renderEngineIndex];
                coreShaderSettings[i].shaderModel = TVEUtils.ShaderModelOptions[shaderModelIndex];

                var shader = AssetDatabase.LoadAssetAtPath<Shader>(coreShaderPaths[i]);
                SettingsUtils.SaveSettingsData(userFolder + "/Shaders/Engine " + shader.name.Replace("/", "__") + ".asset", TVEUtils.RenderEngineOptions[renderEngineIndex]);
                SettingsUtils.SaveSettingsData(userFolder + "/Shaders/Model " + shader.name.Replace("/", "__") + ".asset", TVEUtils.ShaderModelOptions[shaderModelIndex]);

                TVEUtils.SetShaderSettings(coreShaderPaths[i], coreShaderSettings[i]);
            }

            Debug.Log("<b>[The Vegetation Engine]</b> " + "Shader features updated!");

            AssetDatabase.SaveAssets();
            AssetDatabase.Refresh();
        }

        void GetShaderSettings()
        {
            coreShaderSettings = new List<TVEShaderSettings>();
            renderEngineIndices = new List<int>();
            shaderModelIndices = new List<int>();

            for (int i = 0; i < coreShaderPaths.Count; i++)
            {
                var shaderSettings = TVEUtils.GetShaderSettings(coreShaderPaths[i]);
                coreShaderSettings.Add(shaderSettings);
                renderEngineIndices.Add(0);
                shaderModelIndices.Add(0);
            }

            for (int i = 0; i < coreShaderSettings.Count; i++)
            {
                var shaderSettings = coreShaderSettings[i];

                for (int s = 0; s < TVEUtils.RenderEngineOptions.Length; s++)
                {
                    if (shaderSettings.renderEngine == TVEUtils.RenderEngineOptions[s])
                    {
                        renderEngineIndices[i] = s;
                        renderEngineIndex = s;
                    }
                }

                for (int s = 0; s < TVEUtils.ShaderModelOptions.Length; s++)
                {
                    if (shaderSettings.shaderModel == TVEUtils.ShaderModelOptions[s])
                    {
                        shaderModelIndices[i] = s;
                        shaderModelIndex = s;
                    }
                }
            }
        }

        void GetShaderMixedSettings()
        {
            showRenderEngineMixedValues = false;
            showShaderModelMixedValues = false;

            for (int i = 1; i < renderEngineIndices.Count; i++)
            {
                if (renderEngineIndices[i - 1] != renderEngineIndices[i])
                {
                    showRenderEngineMixedValues = true;
                    break;
                }
            }

            for (int i = 1; i < shaderModelIndices.Count; i++)
            {
                if (shaderModelIndices[i - 1] != shaderModelIndices[i])
                {
                    showShaderModelMixedValues = true;
                    break;
                }
            }
        }
    }
}

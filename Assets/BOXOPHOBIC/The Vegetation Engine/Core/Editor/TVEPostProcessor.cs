#if !THE_VEGETATION_ENGINE_DEVELOPMENT

using Boxophobic.Utils;
using UnityEditor;
using UnityEngine;

namespace TheVegetationEngine
{
    class TVEPostProcessor : AssetPostprocessor
    {
        static void OnPostprocessAllAssets(string[] importedAssets, string[] deletedAssets, string[] movedAssets, string[] movedFromAssetPaths)
        {
            foreach (var path in importedAssets)
            {
                if (path.EndsWith(".shader"))
                {
                    if (TVEUtils.IsValidTVEShader(path))
                    {
                        string userFolder = "Assets/BOXOPHOBIC/User";

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

                        var shader = AssetDatabase.LoadAssetAtPath<Shader>(path);
                        var engine = SettingsUtils.LoadSettingsData(userFolder + "/Shaders/Engine " + shader.name.Replace("/", "__") + ".asset", "Unity Default Renderer");
                        var model = SettingsUtils.LoadSettingsData(userFolder + "/Shaders/Model " + shader.name.Replace("/", "__") + ".asset", "From Shader");

                        var shaderSettings = new TVEShaderSettings();
                        shaderSettings.renderEngine = engine;
                        shaderSettings.shaderModel = model;

                        TVEUtils.SetShaderSettings(path, shaderSettings);

                        AssetDatabase.SaveAssets();
                        AssetDatabase.Refresh();
                    }
                }

                if (path.EndsWith(".mat"))
                {
                    if (path.Contains("TVE Material") || path.Contains("_Impostor"))
                    {
                        var material = AssetDatabase.LoadAssetAtPath<Material>(path);

                        TVEUtils.SetMaterialSettings(material);
                    }
                }
            }
        }
    }
}

#endif
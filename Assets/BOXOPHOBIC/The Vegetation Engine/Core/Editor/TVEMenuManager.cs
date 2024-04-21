using UnityEditor;
using UnityEditor.SceneManagement;
using UnityEngine;

namespace TheVegetationEngine
{
    public static class TVEWindowMenus
    {
        [MenuItem("Window/BOXOPHOBIC/The Vegetation Engine/Discord Server", false, 8000)]
        public static void Discord()
        {
            Application.OpenURL("https://discord.com/invite/znxuXET");
        }

        [MenuItem("Window/BOXOPHOBIC/The Vegetation Engine/Publisher Page", false, 8001)]
        public static void AssetStore()
        {
            Application.OpenURL("https://assetstore.unity.com/publishers/20529");
        }

        [MenuItem("Window/BOXOPHOBIC/The Vegetation Engine/Documentation", false, 8002)]
        public static void Documentation()
        {
            Application.OpenURL("https://docs.google.com/document/d/145JOVlJ1tE-WODW45YoJ6Ixg23mFc56EnB_8Tbwloz8/edit#");
        }

        [MenuItem("Window/BOXOPHOBIC/The Vegetation Engine/Changelog", false, 8003)]
        public static void Chnagelog()
        {
            Application.OpenURL("https://docs.google.com/document/d/145JOVlJ1tE-WODW45YoJ6Ixg23mFc56EnB_8Tbwloz8/edit#heading=h.1rbujejuzjce");
        }

        [MenuItem("Window/BOXOPHOBIC/The Vegetation Engine/Write A Review", false, 9999)]
        public static void WriteAReview()
        {
            Application.OpenURL("https://assetstore.unity.com/packages/tools/utilities/the-vegetation-engine-159647#reviews");
        }
    }

    public static class TVEHierarchyMenus
    {
        [MenuItem("GameObject/BOXOPHOBIC/The Vegetation Engine/Manager", false, 6)]
        static void CreateManager()
        {
            if (GameObject.Find("The Vegetation Engine") != null)
            {
                Debug.Log("<b>[The Vegetation Engine]</b> " + "The Vegetation Engine Manager is already set in your scene!");
                return;
            }

            GameObject manager = new GameObject();
            manager.AddComponent<TVEManager>();
            manager.name = "The Vegetation Engine";

            EditorSceneManager.MarkSceneDirty(EditorSceneManager.GetActiveScene());

            Debug.Log("<b>[The Vegetation Engine]</b> " + "The Vegetation Engine is set in the current scene! Check the Documentation for the next steps!");
        }

        [MenuItem("GameObject/BOXOPHOBIC/The Vegetation Engine/Element", false, 6)]
        static void CreateElement()
        {
            if (GameObject.Find("The Vegetation Engine") == null)
            {
                Debug.Log("<b>[The Vegetation Engine]</b> " + "The Vegetation Engine manager is missing from your scene. Make sure setup it up first!");
                return;
            }

            GameObject element = MonoBehaviour.Instantiate(Resources.Load<GameObject>("Internal Element"));

            if (EditorSceneManager.IsPreviewSceneObject(element))
            {
                Debug.Log("<b>[The Vegetation Engine]</b> " + "Elements cannot be created inside prefabs");
                return;
            }

            var sceneCamera = SceneView.lastActiveSceneView.camera;

            if (sceneCamera != null)
            {
                element.transform.position = sceneCamera.ViewportToWorldPoint(new Vector3(0.5f, 0.5f, 10f));
            }
            else
            {
                element.transform.localPosition = Vector3.zero;
                element.transform.localEulerAngles = Vector3.zero;
                element.transform.localScale = Vector3.one;
            }

            if (Selection.activeGameObject != null)
            {
                if (Selection.activeGameObject.GetComponent<Terrain>() != null)
                {
                    var terrain = Selection.activeGameObject.GetComponent<Terrain>();

                    var position = terrain.transform.position;
                    var bounds = terrain.terrainData.bounds;
                    element.transform.localPosition = new Vector3(bounds.center.x + position.x, bounds.min.y + position.y, bounds.center.z + position.z);
                    element.transform.localScale = new Vector3(bounds.size.x, 1, bounds.size.z);

                    element.AddComponent<TVEElement>();

                    element.GetComponent<TVEElement>().terrainData = terrain;
                }
                else
                {
                    element.AddComponent<TVEElement>();
                }

                element.transform.parent = Selection.activeGameObject.transform;
            }
            else
            {
                element.AddComponent<TVEElement>();
            }

            element.name = "Element";

            Selection.activeGameObject = element;

            EditorSceneManager.MarkSceneDirty(EditorSceneManager.GetActiveScene());
        }

        //[MenuItem("GameObject/BOXOPHOBIC/The Vegetation Engine/Volume", false, 7)]
        //static void CreateVolume()
        //{
        //    if (GameObject.Find("The Vegetation Engine") == null)
        //    {
        //        Debug.Log("[Warning][The Vegetation Engine] " + "The Vegetation Engine manager is missing from your scene. Make sure setup it up first!");
        //        return;
        //    }

        //    GameObject volume = new GameObject();
        //    volume.AddComponent<TVEVolume>();
        //    volume.GetComponent<TVEVolume>().volumeGizmo = new Color(0.890f, 0.745f, 0.309f, 1f);
        //    volume.name = "Volume";

        //    var sceneCamera = SceneView.lastActiveSceneView.camera;

        //    if (sceneCamera != null)
        //    {
        //        volume.transform.position = sceneCamera.ViewportToWorldPoint(new Vector3(0.5f, 0.5f, 10f));
        //    }
        //    else
        //    {
        //        volume.transform.localPosition = Vector3.zero;
        //        volume.transform.localEulerAngles = Vector3.zero;
        //    }

        //    volume.transform.localScale = new Vector3(200, 50, 200);

        //    Selection.activeGameObject = volume;

        //    EditorSceneManager.MarkSceneDirty(EditorSceneManager.GetActiveScene());
        //}
    }

    [InitializeOnLoad]
    class TVEHierarchyIcons
    {
        static TVEHierarchyIcons()
        {
            EditorApplication.hierarchyWindowItemOnGUI += HierarchyItemCB;
            EditorApplication.projectWindowItemOnGUI += ProjectItemCB;
        }

        static void HierarchyItemCB(int id, Rect rect)
        {
            int showIcons = Shader.GetGlobalInt("TVE_ShowIcons");

            if (showIcons == 0)
            {
                return;
            }

            Rect iconRect = new Rect(rect.x - 3, rect.y + 2, 3, 3);

            GameObject go = EditorUtility.InstanceIDToObject(id) as GameObject;

            if (go != null && go.GetComponent<TVEPrefab>() != null)
            {
                var tveComponent = go.GetComponent<TVEPrefab>();

                if (tveComponent.isCollected)
                {
                    EditorGUI.DrawRect(iconRect, new Color(0.2f, 1f, 1f));
                }
                else
                {
                    EditorGUI.DrawRect(iconRect, new Color(1f, 0.9f, 0.4f));
                }
            }
        }

        static void ProjectItemCB(string guid, Rect selectionRect)
        {
            int showIcons = Shader.GetGlobalInt("TVE_ShowIcons");

            if (showIcons == 0)
            {
                return;
            }

            Rect iconRect = new Rect(selectionRect.x, selectionRect.y + 2, 3, 3);

            var assetPath = AssetDatabase.GUIDToAssetPath(guid);

            GameObject go = AssetDatabase.LoadAssetAtPath<GameObject>(assetPath);

            if (go != null && go.GetComponent<TVEPrefab>() != null)
            {
                var tveComponent = go.GetComponent<TVEPrefab>();

                if (tveComponent.isCollected)
                {
                    EditorGUI.DrawRect(iconRect, new Color(0.2f, 1f, 1f));
                }
                else
                {
                    EditorGUI.DrawRect(iconRect, new Color(1f, 0.9f, 0.4f));
                }
            }
        }
    }
}


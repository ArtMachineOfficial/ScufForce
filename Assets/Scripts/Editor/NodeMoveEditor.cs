using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;

[CustomEditor(typeof(NodeMove))]

public class NodeMoveEditor : Editor
{
    NodeMove source;

    public override void OnInspectorGUI()
    {
        base.OnInspectorGUI();
    }

    private void OnSceneGUI()
    {
        source = (NodeMove)target;

        for (int i = 0; i < source.nodes.Count; i++)
        {
            source.nodes[i] = Handles.PositionHandle(source.nodes[i], Quaternion.identity);
            Handles.Label(source.nodes[i], "Nodes" + (i + 1));
        }
    }

}

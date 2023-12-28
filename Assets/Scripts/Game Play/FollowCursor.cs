using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FollowCursor : MonoBehaviour
{
    Transform gg;
    void Start()
    {
        RotateToMouse();
    }

    private void RotateToMouse()
    {
        Vector3 mousePos = Input.mousePosition;
        Vector3 ggPos = Camera.main.WorldToScreenPoint(gg.position);
        Vector3 result = mousePos - ggPos;
    }

    void Update()
    {
        
    }
}

using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor.Rendering.LookDev;
using UnityEngine;

public class AutoRotateLimited : MonoBehaviour
{
    private Quaternion originRot;
    public float userSettings;
    public Transform objectToRotateAround;

    void Start()
    {
           
    }
    float degreesPerSecond = 2;

    void Update()
    {
 
        transform.RotateAround(objectToRotateAround.position, Vector3.up, 34);
        transform.RotateAround(objectToRotateAround.position, Vector3.up, -34);
        transform.RotateAround(objectToRotateAround.position, Vector3.up, -34);

    }
}

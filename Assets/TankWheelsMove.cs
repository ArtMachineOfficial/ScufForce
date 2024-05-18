using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

public class TankWheelsMove : MonoBehaviour
{
    public GameObject[] wheels;
    public GameObject[] returnedWheels;
    public float rotateSpeed = 10f;

    void Start()
    {
        
    }

    void Update()
    {
        for (int i = 0; i < wheels.Length; i++)
        {
            wheels[i].transform.Rotate(Vector3.up, rotateSpeed * Time.deltaTime);
        }

        for (int i = 0; i < returnedWheels.Length; i++)
        {
            returnedWheels[i].transform.Rotate(Vector3.up, -rotateSpeed * Time.deltaTime);
        }
    }

}

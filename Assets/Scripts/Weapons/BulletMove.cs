using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BulletMove : MonoBehaviour
{
    public float speed;
    protected Rigidbody myRb;

    void Start()
    {
        myRb = GetComponent<Rigidbody>();
    }


    void FixedUpdate()
    {
        myRb.velocity = transform.forward * speed;
    }
}

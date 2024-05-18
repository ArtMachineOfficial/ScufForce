using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LookAtPlayer : MonoBehaviour
{

    public float rotateSpeed = 2f;
    public Transform player;
    private Vector3 lookDir;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        if (player != null)
        {
            lookDir = player.position - transform.position;
            lookDir.y = 0f;

            transform.rotation = Quaternion.Slerp(transform.rotation, Quaternion.LookRotation(lookDir), rotateSpeed * Time.deltaTime);
        }
    }
}

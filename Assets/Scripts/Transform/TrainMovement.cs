using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TrainMovement : MonoBehaviour
{
    public Transform waypoint1; // first waypoint
    public Transform waypoint2; // second waypoint
    public Transform waypoint3; // third waypoint

    private new Transform transform;
    private float currentSpeed = 0.0f;
    private float targetSpeed = 10.0f; // target speed
    private float acceleration = 5.0f; // acceleration rate
    private float deceleration = 5.0f; // deceleration rate

    private bool isAccelerating = true;
    private bool isDecelerating = false;

    private void Start()
    {
        transform = GetComponent<Transform>();
        transform.position = waypoint1.position; // start at the first waypoint
    }

    private void Update()
    {
        // calculate the direction to the next waypoint
        Vector3 direction = (waypoint2.position - transform.position).normalized;

        // accelerate to the second waypoint
        if (isAccelerating && transform.position != waypoint2.position)
        {
            currentSpeed += acceleration * Time.deltaTime;
            transform.position += direction * currentSpeed * Time.deltaTime;
            if (currentSpeed >= targetSpeed)
            {
                isAccelerating = false;
            }
        }
        // decelerate to the third waypoint
        else if (isDecelerating && transform.position != waypoint3.position)
        {
            currentSpeed -= deceleration * Time.deltaTime;
            transform.position += direction * currentSpeed * Time.deltaTime;
            if (currentSpeed <= 0.0f)
            {
                isDecelerating = false;
            }
        }
        // move to the next waypoint
        else
        {
            transform.position += direction * currentSpeed * Time.deltaTime;
            if (transform.position == waypoint2.position)
            {
                isAccelerating = false;
                isDecelerating = true;
            }
            else if (transform.position == waypoint3.position)
            {
                isDecelerating = false;
            }
        }
    }
}

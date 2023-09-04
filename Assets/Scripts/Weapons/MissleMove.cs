using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MissleMove : BulletMove
{
    public float rotateSpeed = 3f, FollowDuration = 1f;
    public Transform player;


    private WaitForSeconds physicsTimeStep;

    void Awake()
    {
        myRb = GetComponent<Rigidbody>();
        physicsTimeStep = new WaitForSeconds(Time.fixedDeltaTime);
    }


    private void Start()
    {
        if (GameObject.FindGameObjectWithTag("Player"))
            player = GameObject.FindGameObjectWithTag("Player").transform;
    }

    private void OnEnable()
    {
        StartCoroutine(StartFollow(FollowDuration));
    }
    // Update is called once per frame
    IEnumerator StartFollow (float followingDuration)
    {
        while(followingDuration > 0f)
        {
            followingDuration -= Time.fixedDeltaTime;

            if(player != null )
            {
                Vector3 dir = player.position - transform.position;
                transform.rotation = Quaternion.Slerp(transform.rotation, Quaternion.LookRotation(dir), rotateSpeed * Time.fixedDeltaTime);
            }

            myRb.velocity = transform.forward * speed;

            yield return physicsTimeStep;
        }

    }
}

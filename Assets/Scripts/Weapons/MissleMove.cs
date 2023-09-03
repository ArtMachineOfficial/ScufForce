using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MissleMove : BulletMove
{
    public float rotateSpeed = 3f, FollowDuration = 1f;
    public Transform player;
    private Transform gmtrans;

    private WaitForSeconds physicsTimeStep;

    void Awake()
    {
        myRb = GetComponent<Rigidbody>();
        physicsTimeStep = new WaitForSeconds(Time.fixedDeltaTime);
    }


    private void Start()
    {
        gmtrans = player.transform;
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

            if(gmtrans != null )
            {
                Vector3 dir = gmtrans.position - transform.position;
                transform.rotation = Quaternion.Slerp(transform.rotation, Quaternion.LookRotation(dir), rotateSpeed * Time.fixedDeltaTime);
            }

            myRb.velocity = transform.forward * speed;

            yield return physicsTimeStep;
        }

    }
}

using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AutoRotate : MonoBehaviour
{
    [Header("Continuous Rotation")]
    public Vector3 rotateSpeed;
    public bool endless, onStart;

    [Header("Targeted Rotation")]
    public Vector3 angleRotation;
    public float speed;


    void Start()
    {
        if (onStart)
        {
            StartCoroutine(DoRotate());
        }    
    }


    public void StartRotate()
    {
        StartCoroutine(DoRotate());
    }

    IEnumerator DoRotate()
    {
        Quaternion targetedRotation = Quaternion.Euler(transform.localRotation.eulerAngles + angleRotation);

        if (endless)
        {
            while(endless)
            {
                transform.Rotate(rotateSpeed * Time.deltaTime);

                yield return null;
            }    
        }
        else
        {
            while (transform.localRotation != targetedRotation)
            {
                transform.localRotation = Quaternion.RotateTowards(transform.localRotation, targetedRotation, speed * Time.deltaTime);

                yield return null;
            }
        }
    }

    private void OnDisable()
    {
        StopAllCoroutines();
    }
}

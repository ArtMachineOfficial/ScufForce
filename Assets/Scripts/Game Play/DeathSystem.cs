using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

public class DeathSystem : MonoBehaviour
{
    public bool destroy = true;
    public float destroyerAfter;
    public CreateObject[] spawnObjects;
    public UnityEvent onDeathEvent;

    private Collider[] colliders;

    private void Start()
    {
        colliders = GetComponents<Collider>();
    }

    public void Death()
    {
        for (int i = 0; i < spawnObjects.Length; i++)
        {
            spawnObjects[i].Create();
        }

        onDeathEvent.Invoke();

        if (destroy)
        {
            PoolingManager.instance.ReturnObject(gameObject, destroyerAfter);
        }

        for (int i = 0; i < colliders.Length; i++)
        {
            colliders[i].enabled = false;
        }
    }
}

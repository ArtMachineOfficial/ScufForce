using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.Events;

public class EnemyCollision : MonoBehaviour
{
    public float damage = 10f;
    public CreateObject[] spawnObjects;

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            for (int i = 0; i < spawnObjects.Length; i++)
            {
                spawnObjects[i].Create();
            }

            PoolingManager.instance.ReturnObject(gameObject);
        }
    }
}

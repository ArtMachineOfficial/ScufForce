using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

public class MoveActivator : MonoBehaviour
{
    public UnityEvent onTriggerEnter, onExitScreen, onEnterScreen;

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            print("Active");
            gameObject.GetComponent<TrainMove>().enabled = true;

        }
    }

    private void OnTriggerExit(Collider other)
    {
        if (other.CompareTag("Deactivator"))
        {
            onExitScreen.Invoke();
        }
    }
}

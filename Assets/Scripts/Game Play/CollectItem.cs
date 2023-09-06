using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.Events;

public class CollectItem : MonoBehaviour
{
    public float collectTime = 5f;
    public Image timerUI;
    public UnityEvent onCollected;

    IEnumerator Collecting(float time)
    {
        while (time > 0f)
        {
            time -= Time.deltaTime;
            UpdateUI(time);
            yield return null;
        }

        onCollected.Invoke();
        Destroy(gameObject, 1.5f);
    }

    void UpdateUI(float time)
    {
        if (timerUI != null)
        {
            float value = 1f - (time / collectTime);
            timerUI.fillAmount = value;
        }
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            StartCoroutine(Collecting(collectTime));
        }
    }

    private void OnTriggerExit(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            StopAllCoroutines();
            timerUI.fillAmount = 0f;
        }
    }
}

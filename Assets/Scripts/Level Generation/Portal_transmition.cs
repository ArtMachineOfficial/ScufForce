using JetBrains.Annotations;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using static UnityEngine.Rendering.PostProcessing.HistogramMonitor;

public class Potral_tranmisition : MonoBehaviour
{
    private Animator animator;
    public string LevelName = "Level1";
    public GameObject gameObject;
    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            animator = gameObject.GetComponent<Animator>();
            animator.SetTrigger("FadeOut");
            SceneManager.LoadScene(LevelName);
        }
    }
}

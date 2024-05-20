using UnityEngine;

public class DialogueTrigger : MonoBehaviour
{
    public Dialogue[] dialogueScripts;
    public GameObject objectToActivate;

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            // ���������� ������
            objectToActivate.SetActive(true);
        }
    }

    private void OnTriggerExit(Collider other)
    {
     
    }
}
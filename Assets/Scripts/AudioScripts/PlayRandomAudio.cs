using System.Collections;
using System.Collections.Generic;
using System.Xml.Serialization;
using UnityEngine;

[RequireComponent(typeof(AudioSource))]
public class PlayRandomAudio : MonoBehaviour
{
    public AudioClip[] audioClips;
    public float minPitch = 0.9f, maxPitch = 1.1f;
    public bool playOnAwake = true;

    private AudioSource thisAudio;

    private void Awake()
    {
        thisAudio = GetComponent<AudioSource>();
    }

    private void OnEnable()
    {
        if (playOnAwake)
            PlayAudio(Random.Range(0, audioClips.Length));
    }

    public void PlayAudio(int audioId)
    {
        thisAudio.pitch = Random.Range(minPitch, maxPitch);
        thisAudio.PlayOneShot(audioClips[audioId]);
    }

}

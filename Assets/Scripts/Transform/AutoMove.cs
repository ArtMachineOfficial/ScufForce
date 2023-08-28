using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

public class AutoMove : MonoBehaviour
{
    public Vector3 moveOffset;
    public bool onStart, reverse;
    public float duration;
    public UnityEvent onStartMove, onMoveDone;

    private Vector3 targetPos, initialPos;
    private float moveDistance;

    // Start is called before the first frame update
    void Start()
    {
        initialPos = transform.localPosition;
        moveDistance = moveOffset.magnitude;

        if (onStart)
        {
            Move(reverse);
        }
    }

    public void Move(bool reverce)
    {
        StartCoroutine(StartMove(reverce, duration));

    }

    IEnumerator StartMove(bool reverce, float time) {
        if (reverce)
        {
            targetPos = initialPos;
            transform.localPosition += moveOffset;
        }
        else
        {
            targetPos = transform.localPosition + moveOffset;
        }

        onStartMove.Invoke();

        while(transform.localPosition != targetPos)
        {
            transform.localPosition = Vector3.MoveTowards(transform.localPosition, targetPos, (moveDistance / time) * Time.deltaTime);
            yield return null;
        }

        onMoveDone.Invoke();
    }
}

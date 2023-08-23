using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemyWaves : MonoBehaviour
{
    public int numWaves = 1;
    public float intervlaBetweenEnemy = 0.5f, removeAfter = 2f;
    public List<GameObject> childs = new List<GameObject>();

    private GameObject mainChild;
    private WaitForSeconds interval, disableAfter;


    // Start is called before the first frame update
    void Start()
    {
        interval = new WaitForSeconds(intervlaBetweenEnemy);
        disableAfter = new WaitForSeconds(removeAfter);
        Init();

        StartCoroutine(StartWaves());
        StartCoroutine(CheckCombo());
    }

    // Update is called once per frame
    void Init()
    {
        mainChild = transform.GetChild(0).gameObject;
        Vector3 position = mainChild.transform.position;
        mainChild.SetActive(false);
        childs.Add(mainChild);

        for (int i = 1; i < numWaves; i++)
        {
            GameObject temp = Instantiate(mainChild, position, mainChild.transform.rotation);
            childs.Add(temp);
            childs[i].transform.SetParent(transform);
            childs[i].SetActive(false);
        }
    }

    IEnumerator StartWaves()
    {
        int i = 0;
        while (i < numWaves)
        {
            childs[i].SetActive(true);
            StartCoroutine(DisableChild(childs[i]));
            i++;
            yield return interval;
        }
    }

    IEnumerator DisableChild(GameObject obj)
    {
        yield return disableAfter;

        if (obj != null)
        {
            obj.SetActive(false);
        }
    }

    IEnumerator CheckCombo()
    {
        yield return new WaitForSeconds(transform.childCount);

        if (transform.childCount == 0)
        {
            print("enemy Combo Kill");
        }
        else
        {
            print("Chain Lost");
        }
    }

}

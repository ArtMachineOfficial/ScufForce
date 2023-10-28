using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DebugScript : MonoBehaviour
{
    public void Save()
    {
        StatsKManager.instance.SaveProgress();
    }

    public void Load()
    {
        StatsKManager.instance.LoadProgress();
    }
}

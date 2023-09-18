using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.SceneManagement;

public class LevelManager : MonoBehaviour
{
    public static LevelManager instance;
    public Medals medals = new Medals();
    public int TotalEnemy, enemyKilled, TotalCollected, ItemsCollected;
    public UnityEvent onGameEnd;

    private string levelName;

    private void Awake()
    {
        instance = this;
        medals.untouched = true;

        levelName = SceneManager.GetActiveScene().name;
    }

    public void RegisterEnemy()
    {
        TotalEnemy++;
    }
    public void RegisterCollect()
    {
        TotalCollected++;
    }
    public void AddEnemyKill()
    {
        enemyKilled++;
    }
    public void AddCollect()
    {
        ItemsCollected++;
    }

    public void PlayerHit()
    {
        medals.untouched = false;
    }

    public void GameEnd()
    {
        StartCoroutine(CountDelay());
    }

    IEnumerator CountDelay()
    {
        yield return new WaitForSeconds(0.25f);
        if (enemyKilled >= TotalEnemy)
            medals.kill = true;

        if (ItemsCollected >= TotalCollected)
            medals.rescue = true;

        StatsKManager.instance.AddMedals(levelName, medals);

        onGameEnd.Invoke();
    }
    
}

[System.Serializable]
public class Medals
{
    public bool rescue, kill, untouched;
}

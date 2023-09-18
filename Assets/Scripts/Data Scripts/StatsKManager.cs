using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class StatsKManager : MonoBehaviour
{
    public static StatsKManager instance;

    public int lives = 5;
    public int money;

    [Header("Upgrade Options")]
    public List<ShootProfile> blasterUpgradeList = new List<ShootProfile>();
    public List<ShootProfile> missileUpgradeList = new List<ShootProfile>();
    public List<float> healthUpgradeList = new List<float>();
    public List<MegaBombData> megaBombUpgList = new List<MegaBombData>();
    public List<ShieldData> shieldUpgList = new List<ShieldData>();
    public List<LaserData> laserUpgList = new List<LaserData>();

    public Dictionary<string, Medals> achivementList = new Dictionary<string, Medals>();
    public Dictionary<string, DateTime> statsTimer = new Dictionary<string, DateTime>();

    [Header("Upgrade Timer Data")]
    public List<StatsUpgradeInfo> stats = new List<StatsUpgradeInfo>();

    private void Awake()
    {
        if (instance == null)
        {
            instance = this;
            DontDestroyOnLoad(gameObject);
        }
        else
        {
            Destroy(gameObject);
        }
    }

    void Start()
    {
        
    }

    public void AddMoney(int value)
    {
        money += value;
    }

    public T GetStatsValue<T>(string statName, List<T> statsList)
    {
        for (int i = 0; i < stats.Count; i++)
        {
            if (stats[i].name == statName)
            {
                return statsList[stats[i].level - 1];
            }
        }

        return default(T);
    }

    public float[] GetUpgradeTime(string statName)
    {
        for (int i = 0; i < stats.Count; i++)
        {
            if (stats[i].name == statName)
            {
                return stats[i].upgradeTime;
            }
        }
        return null;
    }

    public StatsUpgradeInfo GetStats(string statName)
    {
        for (int i = 0; i < stats.Count; i++)
        {
            if (stats[i].name == statName)
            {
                return stats[i];
            }
        }
        return null;
    }

    public void SaveProgress()
    {
        SaveData saveData = new SaveData();

        saveData.lives = lives;
        saveData.money = money;
        saveData.achivementList = achivementList;
        saveData.statsTimer = statsTimer;
        saveData.stats = stats;
        SaveSystem.Save(saveData);
    }

    public void LoadProgress()
    {
        SaveData loadData = SaveSystem.Load<SaveData>();

        lives = loadData.lives;
        money = loadData.money;

        achivementList = loadData.achivementList;
        statsTimer = loadData.statsTimer;

        stats = loadData.stats;

        UpdateItemDisplay();
    }

    void UpdateItemDisplay()
    {
        UpgradeItem[] items = FindObjectsOfType<UpgradeItem>();
        LevelMenu[] levelMenus = FindObjectsOfType<LevelMenu>();

        for (int i = 0; i < items.Length; i++)
        {
            items[i].UpdateItemDisplay();
        }

        for (int i = 0; i < levelMenus.Length; i++)
        {
            levelMenus[i].UpdateMenu();
        }
    }

    public void AddMedals(string levelName, Medals medal)
    {
        Medals newMedal = new Medals();

        if (achivementList.ContainsKey(levelName))
        {
            newMedal.kill = medal.kill ? true : achivementList[levelName].kill;
            newMedal.rescue = medal.rescue ? true : achivementList[levelName].rescue;
            newMedal.untouched = medal.untouched ? true : achivementList[levelName].untouched;

            achivementList[levelName] = newMedal;
        }
        else
        {
            achivementList.Add(levelName, medal);
        }
    }

}

[System.Serializable]
public class StatsUpgradeInfo
{
    public string name;
    public int level;
    public float[] upgradeTime;
}

[System.Serializable]
public class MegaBombData
{
    public float radius;
    public float damage;
}

[System.Serializable]
public class ShieldData
{
    public float shieldDuration;
}

[System.Serializable] 
public class LaserData
{
    public float laserDuration;
}

[System.Serializable]
public class SaveData
{
    public int lives;
    public int money;
    public Dictionary<string, Medals> achivementList = new Dictionary<string, Medals>();
    public Dictionary<string, DateTime> statsTimer = new Dictionary<string, DateTime>();
    public List<StatsUpgradeInfo> stats = new List<StatsUpgradeInfo>();
}
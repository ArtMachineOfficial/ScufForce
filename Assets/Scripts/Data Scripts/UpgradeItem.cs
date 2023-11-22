using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using System;

public class UpgradeItem : MonoBehaviour
{
    [Header("Upgrade Menu Objects")]
    public string statName;
    public string itemName;
    public Text itemNameText, buyText;
    public Slider itemLevelBar;
    public Button buyButton;

    [Header("Item Prices Setup:")]
    public int[] pricesLevel;

    private StatsUpgradeInfo stat;
    private bool isUpgrading;

    void Start()
    {
        stat = StatsKManager.instance.GetStats(statName);

        itemNameText.text = itemName;
        buyText.text = pricesLevel[stat.level].ToString();

        itemLevelBar.value = stat.level;

        buyButton.onClick.AddListener(BuyUpgrade);

        UpdateItemDisplay();
    }

    public void BuyUpgrade()
    {
        if (StatsKManager.instance.money >= pricesLevel[stat.level])
        {
            DialogManager.instance.ShowDialog("Do you really want to upgrade " + statName, () =>
            {
                StatsKManager.instance.AddMoney(-pricesLevel[stat.level]);

                StatsKManager.instance.statsTimer.Add(statName, DateTime.Now.AddMinutes(StatsKManager.instance.GetUpgradeTime(statName)[stat.level]));

                StartCoroutine(DoUpgrade());
            });
        }
        else
        {
            DialogManager.instance.ShowMessage("You don't have enough money to upgrade " + statName);
        }
    }

    public void UpdateItemDisplay()
    {
        stat = StatsKManager.instance.GetStats(statName);

        itemLevelBar.value = stat.level;

        if (stat.level == pricesLevel.Length)
        {
            buyText.text = "MAX";
            return;
        }
        buyText.text = pricesLevel[stat.level].ToString();

        CheckForUpgradeStatus();
    }

    public void CheckForUpgradeStatus()
    {
        if (StatsKManager.instance.statsTimer.ContainsKey(statName))
        {
            if(DateTime.Now < StatsKManager.instance.statsTimer[statName])
            {
                StartCoroutine(DoUpgrade());
            }
            else
            {
                IncreaseStat();
            }
        }
    }
   

    IEnumerator DoUpgrade()
    {
        isUpgrading = true;

        TimeSpan timeRemaining = StatsKManager.instance.statsTimer[statName] - DateTime.Now;

        while (timeRemaining.TotalSeconds > 0f)
        {
            timeRemaining = StatsKManager.instance.statsTimer[statName] - DateTime.Now;
            buyText.text = string.Format("{0:00}:{1:00}", timeRemaining.Minutes, timeRemaining.Seconds);
            yield return null;
        }
        isUpgrading = false;
        IncreaseStat();
    }

    void IncreaseStat()
    {
        stat.level++;
        if(isUpgrading)
        {
            StopAllCoroutines();
            isUpgrading = false;
        }

        buyText.text = pricesLevel[stat.level].ToString();
        itemLevelBar.value = stat.level;
        StatsKManager.instance.statsTimer.Remove(statName);

        DialogManager.instance.ShowMessage("Finish upgrading " + statName);
    }
}

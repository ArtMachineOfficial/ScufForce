using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ChangeLayout : MonoBehaviour
{
    public GameObject levelMenu;
    public GameObject mainMenu;
    public GameObject upgradeMenu;
    private GameObject currentLayout;
    private GameObject previousLayout;

    void Start()
    {
        levelMenu.SetActive(false);
        upgradeMenu.SetActive(false);
        mainMenu.SetActive(true);
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void EnterLevelMenu()
    {
        currentLayout = levelMenu;
        previousLayout = mainMenu;
        mainMenu.SetActive(false);
        levelMenu.SetActive(true);
    }

    public void EnterUpgradeMenu()
    {
        currentLayout = upgradeMenu;
        previousLayout = levelMenu;
        levelMenu.SetActive(false);
        upgradeMenu.SetActive(true);
    }

    public void BackButtonHandler()
    {
        currentLayout.SetActive(false);
        previousLayout.SetActive(true);
    }
}

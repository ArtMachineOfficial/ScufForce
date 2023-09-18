using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class LevelMenu : MonoBehaviour
{
    public string sceneTarget;

    public Button playButton;
    public Text killText, rescueText, untouchedText;

    public Color disableColor, enabledColor;
    private Medals sceneMedal;

    void Start()
    {
        //if (StatsKManager.instance.achivementList.ContainsKey(sceneTarget))
        //    sceneMedal = StatsKManager.instance.achivementList[sceneTarget];

        UpdateMenu();

        playButton.onClick.AddListener(GoToLevel);
    }

    public void UpdateMenu()
    {
        if (StatsKManager.instance.achivementList.ContainsKey(sceneTarget))
            sceneMedal = StatsKManager.instance.achivementList[sceneTarget];

        if (sceneMedal != null)
        {
            killText.color = sceneMedal.kill ? enabledColor : disableColor;
            rescueText.color = sceneMedal.rescue ? enabledColor : disableColor;
            untouchedText.color = sceneMedal.untouched ? enabledColor : disableColor;
        }
        else
        {
            killText.color = disableColor;
            rescueText.color = disableColor;
            untouchedText.color = disableColor;
        }
    }

    void GoToLevel()
    {
        SceneLoader.instance.ChangeScene(sceneTarget);
    }
}

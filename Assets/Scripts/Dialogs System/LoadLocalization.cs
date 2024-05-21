using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Xml;
using TMPro;
using UnityEngine;
using static Unity.VisualScripting.Icons;

public class LoadLocalization : MonoBehaviour
{
    public TextMeshProUGUI textComponent;
    public string localizationKey;
    public string language = "en";
    private string line;
    
    void Start()
    {
        LoadLocalizationStrings();
        textComponent.text = line;
    }

    void Update()
    {
        
    }

    void LoadLocalizationStrings()
    {
        string filePath = $"{Application.dataPath}/Scripts/Dialogs System/Localization/localization.xml";
        if (File.Exists(filePath))
        {
            XmlDocument doc = new XmlDocument();
            doc.Load(filePath);

            XmlNode stringNode = doc.SelectSingleNode($"//string[key='{localizationKey}']");
            if (stringNode != null)
            {
                line = stringNode.SelectSingleNode(language == "en" ? "en" : "ru").InnerText;
                Debug.Assert(!string.IsNullOrEmpty(line), $"Localized text for key '{localizationKey}' is null or empty.");
            }
            else
            {
                Debug.LogError($"Localization key '{localizationKey}' not found in the XML file.");
            }
        }
        else
        {
            Debug.LogError($"Localization file '{filePath}' not found.");
        }
    }
}

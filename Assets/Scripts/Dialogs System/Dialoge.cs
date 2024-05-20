using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using System.IO;
using System.Xml;

public class Dialogue : MonoBehaviour
{
    public TextMeshProUGUI textComponent;
    private string line;
    public float textSpeed;
    public string localizationKey;
    public string language = "en"; // Установите язык по умолчанию

    private int index;
    private bool isDialogueFinished = false;

    private void OnEnable()
    {
        StartDialogue();
    }

    private void OnDisable()
    {
        StopAllCoroutines();
    }

    void StartDialogue()
    {
        gameObject.SetActive(true);

        index = 0;
        textComponent.text = string.Empty;
        LoadLocalization();
        StartCoroutine(TypeLine());
    }

    IEnumerator TypeLine()
    {
        foreach (char c in line.ToCharArray())
        {
            textComponent.text += c;
            yield return new WaitForSeconds(textSpeed);
        }

        // Ждем 10 секунд после вывода последнего символа
        yield return new WaitForSeconds(10f);

        // Деактивируем диалоговое окно
        gameObject.SetActive(false);
    }

    void LoadLocalization()
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
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RandomEventConclusion : MonoBehaviour
{
    public string Title;
    [TextArea(8, 10)]
    public string ResultText;
    [TextArea(3, 5)]
    public string RewardText;
    public RandomEventController.Resources[] RewardTypes;
    public int[] RewardValues;

    void Start()
    {
        
    }

    void Update()
    {
        
    }
}

using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RandomEvent : MonoBehaviour
{
    public int Level;
    public RandomEventController.Resources[] RequirementTypes;
    public int[] RequirementValues;
    public string TitleText;
    [TextArea(8, 10)]
    public string EventText;
    [TextArea(3, 5)]
    public string OptionOneText;
    [TextArea(3, 5)]
    public string OptionTwoText;
    public RandomEventConclusion[] OptionOneResults;
    public RandomEventConclusion[] OptionTwoResults;
    public float[] OptionOneChances;
    public float[] OptionTwoChances;

    void Start()
    {
    }

    void Update()
    {
    }
}

using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameController : MonoBehaviour
{
    public UIManager UIManagerRef;
    public RandomEventController RECRef;
    public MapGenerator MapGeneratorRef;
    public Player PlayerRef;

    public int TargetFrameRate = 60;
    public bool GameStarted = false;
    public bool SkipToFinale = false;

    float _lanternFixTimer;
    bool _skipped = true;

    void Awake()
    {
        //Application.targetFrameRate = TargetFrameRate;
    }

    public void StartGame()
    {
        Time.timeScale = 1.0f;
        GameStarted = true;
    }

    void Start()
    {
        _lanternFixTimer = 1.5f;
        Time.timeScale = 1.0f;
        if (SkipToFinale)
        {
            _skipped = false;
        }
    }

    void Update()
    {
        _lanternFixTimer -= Time.deltaTime;
        if (_lanternFixTimer <= 0.0f && !GameStarted)
        {
            Time.timeScale = 0.0f;
        }
        if (!_skipped)
        {
            UIManagerRef.OnClickStartFromMenu();
            UIManagerRef.OnClickStartFromFTUE();
            MapGeneratorRef.MoveBoatToQuadrant();
            RECRef.PlayFinaleEvent();
            PlayerRef.AddSpirit();
            PlayerRef.AddSpirit();
            PlayerRef.AddSpirit();
            _skipped = true;
        }
    }
}

using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RandomEventController : MonoBehaviour
{
    public enum Resources
    {
        Energy,
        Sanity,
        Spirits,
    }

    public Player PlayerRef;
    public float EncounterMinTime;
    public float EncounterMaxTime;
    public UIManager UIManagerRef;
    public MapGenerator MapGenRef;
    public GameController GameManagerRef;
    public RandomEvent[] BoatEvents;
    public RandomEvent[] IslandEvents;

    float _boatEncounterTimer;
    float _nextEncounterTime;
    bool _isInEncounter = false;
    RandomEvent _currentEvent = null;
    bool _isInFinalEvent = false;

    List<RandomEvent> _boatEventsLeft;
    List<RandomEvent> _boatEventsFinished;

    List<RandomEvent> _islandEventsLeft;
    List<RandomEvent> _islandEventsFinished;

    public RandomEvent _finaleEvent;
    public bool IsInEvent { get { return _isInEncounter; } }

    public AudioClip EventAudio;
    public AudioClip FinaleEventAudio;
    public AudioClip EarthquakeAudio;
    AudioSource _audioSource;

    bool _playingEarthquakeAudio = false;
    float _earthquakeAudioTimer = 0.0f;

    void Start()
    {
        _boatEncounterTimer = 0.0f;
        _nextEncounterTime = Random.Range(EncounterMinTime, EncounterMaxTime);
        _isInEncounter = false;

        _boatEventsLeft = new List<RandomEvent>();
        foreach (RandomEvent randEvent in BoatEvents)
        {
            _boatEventsLeft.Add(randEvent);
        }
        foreach (RandomEvent randEvent in IslandEvents)
        {
            _islandEventsLeft.Add(randEvent);
        }
        _boatEventsFinished = new List<RandomEvent>();
        _islandEventsFinished = new List<RandomEvent>();

        _audioSource = gameObject.AddComponent<AudioSource>() as AudioSource;
    }

    void Update()
    {
        if (!_isInFinalEvent && PlayerRef.IsInBoat && !_isInEncounter && GameManagerRef.GameStarted)
        {
            _boatEncounterTimer += Time.deltaTime;
            if (_boatEncounterTimer > _nextEncounterTime)
            {   
                TriggerBoatEncounter();
                _boatEncounterTimer = 0.0f;
                _nextEncounterTime = Random.Range(EncounterMinTime, EncounterMaxTime);
            }
        }

        _earthquakeAudioTimer -= Time.deltaTime;
        if (_playingEarthquakeAudio)
        {
            _audioSource.volume = 1.0f - Mathf.Clamp(Mathf.Lerp(1.0f, 0.0f, _earthquakeAudioTimer), 0.0f, 1.0f);
            if (_earthquakeAudioTimer < 0.0f)
            {
                _playingEarthquakeAudio = false;
                _audioSource.Stop();
            }
        }        

        PlayerRef.IsPopup = _currentEvent != null || _isInEncounter;
    }

    public void TriggerIslandEncounter()
    {
    }

    public void TriggerBoatEncounter()
    {
        // replenish event list if we've gone through all of them.
        if (_boatEventsLeft.Count == 0)
        {
            foreach (RandomEvent randEvent in BoatEvents)
            {
                _boatEventsLeft.Add(randEvent);
            }
        }

        // remove this event from the available list so we don't repeat any (until we run out completely)
        int randIndex = Random.Range(0, _boatEventsLeft.Count);
        _currentEvent = _boatEventsLeft[randIndex];
        _boatEventsLeft.RemoveAt(randIndex);
        _boatEventsFinished.Add(_currentEvent);

        // set up and show the popup.
        UIManagerRef.SetupEvent(_currentEvent);
        UIManagerRef.SetShowEventPopup(true);
        _isInEncounter = true;
        _audioSource.PlayOneShot(EventAudio, 1.0f);

        Time.timeScale = 0.0f;
    }

    public void PlayFinaleEvent()
    {
        // set up and show the popup.
        UIManagerRef.SetupEvent(_finaleEvent);
        UIManagerRef.SetShowEventPopup(true);
        _currentEvent = _finaleEvent;
        _isInEncounter = true;
        _isInFinalEvent = true;
        _audioSource.PlayOneShot(FinaleEventAudio, 1.0f);

        Time.timeScale = 0.0f;
    }

    public void OnEventOptionOne()
    {
        ConcludeEvent(_currentEvent.OptionOneResults, _currentEvent.OptionOneChances);
    }

    public void OnEventOptionTwo()
    {
        ConcludeEvent(_currentEvent.OptionTwoResults, _currentEvent.OptionTwoChances);
    }

    private void ConcludeEvent(RandomEventConclusion[] eventResults, float[] eventResultChances)
    {
        float rnd = Random.Range(0.0f, 1.0f);
        RandomEventConclusion result = null;
        for (int i = 0; i < eventResults.Length; i++)
        {
            if (rnd < eventResultChances[i])
            {
                result = eventResults[i];
                break;
            }
            rnd -= eventResultChances[i];
        }
        if (result == null)
        {
            Debug.LogError(string.Format("Incorrect rewards setup for {0}", _currentEvent.TitleText));
            return;
        }

        PlayerRef.OnEventComplete(result);
        UIManagerRef.SetupEventConclusion(result);
        UIManagerRef.SetShowEventPopup(false);
        UIManagerRef.SetShowEventConclusionPopup(true);
    }

    public void OnEventConclusionDismissed()
    {
        if (_currentEvent == _finaleEvent)
        {
            _audioSource.PlayOneShot(EarthquakeAudio, 1.0f);
            _playingEarthquakeAudio = true;
            _earthquakeAudioTimer = 10.0f;
            MapGenRef.TriggerFinale();
        }

        _currentEvent = null;
        UIManagerRef.SetShowEventConclusionPopup(false);
        _isInEncounter = false;
        Time.timeScale = 1.0f;
    }
}

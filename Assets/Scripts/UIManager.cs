using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;
using UnityEngine.SceneManagement;

public class UIManager : MonoBehaviour
{
    public CanvasGroup Menu;
    public CanvasGroup FTUE;
    public CanvasGroup EnergyBar;
    public CanvasGroup EventPopup;
    public CanvasGroup EventConclusionPopup;
    public CanvasGroup BossHealthBar;

    public GameController GameManagerRef;

    public TextMeshProUGUI EventPopupTitle;
    public TextMeshProUGUI EventPopupMessage;
    public TextMeshProUGUI EventPopupOption1;
    public TextMeshProUGUI EventPopupOption2;

    public TextMeshProUGUI EventConclusionTitle;
    public TextMeshProUGUI EventConclusionMessage;
    public TextMeshProUGUI EventConclusionReward;

    public CanvasGroup FTUE_Energy;
    public CanvasGroup FTUE_Scrolls;
    public CanvasGroup FTUE_Sanity;

    public CanvasGroup WinScreen;
    public CanvasGroup LoseScreen;

    private Slider _bossSlider;

    AudioSource _audioSource;
    public AudioClip GameStartAudio;
    public AudioClip ButtonPressAudio;

    void Start()
    {
        EventPopup.alpha = 0.0f;
        EventPopup.blocksRaycasts = false;

        EventConclusionPopup.alpha = 0.0f;
        EventConclusionPopup.blocksRaycasts = false;

        EnergyBar.alpha = 0.0f;
        EnergyBar.blocksRaycasts = false;

        FTUE.alpha = 0.0f;
        FTUE.blocksRaycasts = false;

        FTUEShowEnergy(false);
        FTUEShowScrolls(false);
        FTUEShowSanity(false);

        WinScreen.alpha = 0.0f;
        WinScreen.blocksRaycasts = false;

        LoseScreen.alpha = 0.0f;
        LoseScreen.blocksRaycasts = false;

        _bossSlider = BossHealthBar.GetComponent<Slider>();
        _bossSlider.value = 1.0f;
        BossHealthBar.alpha = 0.0f;
        BossHealthBar.blocksRaycasts = false;

        _audioSource = gameObject.AddComponent<AudioSource>();
    }

    public void FTUEShowEnergy(bool show)
    {
        FTUE_Energy.alpha = show ? 1.0f : 0.0f;
        FTUE_Energy.blocksRaycasts = show;
    }

    public void FTUEShowScrolls(bool show)
    {
        FTUE_Scrolls.alpha = show ? 1.0f : 0.0f;
        FTUE_Scrolls.blocksRaycasts = show;
    }

    public void FTUEShowSanity(bool show)
    {
        FTUE_Sanity.alpha = show ? 1.0f : 0.0f;
        FTUE_Sanity.blocksRaycasts = show;
    }

    public void ShowWinScreen()
    {
        WinScreen.alpha = 1.0f;
        WinScreen.blocksRaycasts = true;
    }

    public void ShowLoseScreen()
    {
        LoseScreen.alpha = 1.0f;
        LoseScreen.blocksRaycasts = true;
    }

    public void OnClickStartFromMenu()
    {
        Menu.alpha = 0.0f;
        Menu.blocksRaycasts = false;

        FTUE.alpha = 1.0f;
        FTUE.blocksRaycasts = true;

        _audioSource.PlayOneShot(ButtonPressAudio);
    }

    public void OnClickStartFromFTUE()
    {
        FTUE.alpha = 0.0f;
        FTUE.blocksRaycasts = false;

        _audioSource.PlayOneShot(ButtonPressAudio);
        _audioSource.PlayOneShot(GameStartAudio, 1.0f);

        FTUEShowEnergy(true);
    }

    public void OnClickExit()
    {
        _audioSource.PlayOneShot(ButtonPressAudio);

        Application.Quit();
    }

    public void OnFTUECompleteEnergy()
    {
        _audioSource.PlayOneShot(ButtonPressAudio);

        FTUEShowEnergy(false);
        FTUEShowSanity(true);
    }    

    public void OnFTUECompleteSanity()
    {
        _audioSource.PlayOneShot(ButtonPressAudio);

        FTUEShowSanity(false);
        FTUEShowScrolls(true);
    }

    public void OnFTUECompleteScrolls()
    {
        _audioSource.PlayOneShot(ButtonPressAudio);

        FTUEShowScrolls(false);
        GameManagerRef.StartGame();
    }

    public void Restart()
    {
        Scene scene = SceneManager.GetActiveScene();
        SceneManager.LoadScene(scene.name);

        _audioSource.PlayOneShot(ButtonPressAudio);
    }

    public void SetShowEventPopup(bool show)
    {
        EventPopup.alpha = show ? 1.0f : 0.0f;
        EventPopup.blocksRaycasts = show;

        _audioSource.PlayOneShot(ButtonPressAudio);
    }

    public void SetShowEventConclusionPopup(bool show)
    {
        EventConclusionPopup.alpha = show ? 1.0f : 0.0f;
        EventConclusionPopup.blocksRaycasts = show;

        _audioSource.PlayOneShot(ButtonPressAudio);
    }

    public void SetupEvent(RandomEvent randEvent)
    {
        EventPopupTitle.text = randEvent.TitleText;
        EventPopupMessage.text = randEvent.EventText;
        EventPopupOption1.text = randEvent.OptionOneText;
        EventPopupOption2.text = randEvent.OptionTwoText;
    }

    public void SetupEventConclusion(RandomEventConclusion randEventConclusion)
    {
        EventConclusionTitle.text = randEventConclusion.Title;
        EventConclusionMessage.text = randEventConclusion.ResultText;
        EventConclusionReward.text = randEventConclusion.RewardText;
    }

    public void SetShowBossHealth(bool show)
    {
        BossHealthBar.alpha = show ? 1.0f : 0.0f;
        BossHealthBar.blocksRaycasts = show;
    }

    public void SetBossHealthLevel(float progress)
    {
        _bossSlider.value = progress;
    }

    void Update()
    {
    }
}

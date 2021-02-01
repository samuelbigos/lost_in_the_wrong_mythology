using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class Player : MonoBehaviour
{
    public Camera PlayerCamera;
    public Boat BoatRef;
    public GameObject EnergyBar;
    public UIManager UIManagerRef;
    public RandomEventController EventController;
    public GameController GameRef;

    public float MaxEnergy = 100.0f;
    public float EnergyUsageRate = 1.0f;
    public float ElixirPickupValue = 50.0f;
    public float ElixirPickupValueSanity = 10.0f;
    public float MaxSanity = 100.0f;
    public float SanityLossRate = 0.5f;
    public float SanityLossRateSea = 25.0f;
    public int RequiredScrolls = 3;
    public int StartingSpirits = 5;
    public float SpiritShotCooldown = 1.0f;

    public Material SkullElixerMaterial;
    public float Acceleration = 1.0f;
    public float Deceleration = 5.0f;
    public float TurnRate = 10.0f;
    public float JumpHeight = 2.0f;
    public float Gravity = -15.0f;

    public Spirit SpiritPrefab;

    public MeshRenderer MapScrollOff1;
    public MeshRenderer MapScrollOff2;
    public MeshRenderer MapScrollOff3;
    public MeshRenderer MapScrollOn1;
    public MeshRenderer MapScrollOn2;
    public MeshRenderer MapScrollOn3;

    public string RowAnimName = "Take 001";
    public Vector3 CameraShakeOffset = Vector3.zero;
    public float SpiritSpacing = 0.5f;
    public bool OnFinale = false;

    public Material[] UICandleMaterials;

    public AudioClip DrinkPotion;
    public AudioClip NewGhost;
    public AudioClip PickupMap;
    public AudioClip OnDamage;

    public Animation ModelRow;
    public Animation ModelJump;
    public Animation ModelFloat;

    public CharonBoss CharonRef = null;

    Vector2 _inputVec = new Vector2();
    Vector3 _cameraOffset;
    float _cameraY;
    bool _inBoat = true;
    CharacterController _controller;
    Vector3 _playerVelocity;
    bool _groundedPlayer;
    bool _isInSea;

    float _groundedPlayerTimer = 0.0f;
    bool _wasControllerGrounded = true;

    float _energy;
    float _sanity;
    List<Spirit> _spirits = new List<Spirit>();
    Slider _energySlider;
    int _numScrolls = 0;
    float _spiritShotCooldown;

    Animation _rowAnimation;

    public bool IsInBoat { get { return _inBoat; } }
    public bool CanRow { get { return _energy > 0.0f; } }
    public bool IsPopup = false;

    AudioSource _audioSource;

    public bool Grounded { get { return _groundedPlayer; } }

    private void Awake()
    {
        _controller = GetComponent<CharacterController>();
        _energySlider = EnergyBar.GetComponent<Slider>();
        _rowAnimation = GetComponentInChildren<Animation>();
    }

    void Start()
    {
        _cameraOffset = PlayerCamera.transform.position - transform.position;
        _cameraY = transform.position.y + _cameraOffset.y;
        _energy = MaxEnergy;
        _sanity = MaxSanity;
        _energySlider.maxValue = MaxEnergy;
        _energySlider.value = _energy;
        EnterBoat();

        MapScrollOn1.gameObject.SetActive(false);
        MapScrollOn2.gameObject.SetActive(false);
        MapScrollOn3.gameObject.SetActive(false);

        _audioSource = gameObject.AddComponent<AudioSource>() as AudioSource;

        ModelJump.enabled = false;
        ModelFloat.enabled = false;
    }

    void Update()
    {
        for (int i = 0; i < StartingSpirits; i++)
        {
            AddSpirit();
        }
        StartingSpirits = 0;

        // hacky animation switching.
        if (_groundedPlayer)
        {
            if (IsInBoat)
            {
                ModelJump.gameObject.SetActive(false);
                ModelFloat.gameObject.SetActive(false);
                ModelRow.gameObject.SetActive(true);
            }
            else
            {
                ModelJump.gameObject.SetActive(false);
                ModelFloat.gameObject.SetActive(true);
                ModelRow.gameObject.SetActive(false);
            }
        }
        else
        {
            ModelJump.gameObject.SetActive(true);
            ModelFloat.gameObject.SetActive(false);
            ModelRow.gameObject.SetActive(false);
        }

        if (IsInBoat)
        {
            PlayerCamera.transform.position += transform.forward * BoatRef.LinearVelocity * 0.25f;
        }
        else
        {
            if (!_controller.isGrounded && _wasControllerGrounded)
                _groundedPlayerTimer = 0.2f;

            _groundedPlayerTimer -= Time.deltaTime;
            if (_groundedPlayerTimer < 0.0f)
            {
                _groundedPlayer = false;
            }

            if (_controller.isGrounded)
                _groundedPlayer = true;

            _wasControllerGrounded = _controller.isGrounded;

            Vector3 move = new Vector3(_inputVec.x, 0, _inputVec.y);
            Vector3 moveDir = move.normalized;

            // accelerate
            if (move.magnitude != 0.0f)
            {
                _playerVelocity += moveDir * Acceleration * Time.deltaTime;
            }

            _playerVelocity.y += Gravity * Time.deltaTime;
            if (_groundedPlayer && _playerVelocity.y < 0)
            {
                _playerVelocity.y = 0f;
            }

            _controller.Move(_playerVelocity * Time.deltaTime);

            // decelerate
            float y = _playerVelocity.y;
            _playerVelocity = Vector3.Lerp(_playerVelocity, Vector3.zero, Deceleration * Time.deltaTime);
            _playerVelocity.y = y;

            if (move != Vector3.zero)
            {
                gameObject.transform.forward = Vector3.Slerp(gameObject.transform.forward, move, TurnRate * Time.deltaTime);
            }
        }

        if (!IsPopup && CharonRef == null)
        {
            if (IsInBoat)
            {
                AddEnergy(-EnergyUsageRate * Mathf.Abs(BoatRef.LinearVelocity) * Time.deltaTime);
            }
            AddSanity(-SanityLossRate * Time.deltaTime);
        }
        if (_isInSea)
        {
            AddSanity(-SanityLossRateSea * Time.deltaTime);
        }

        if (!CanRow)
        { 
            _rowAnimation.Stop(RowAnimName);
        }

        Vector3 camPos = _controller.transform.position + _cameraOffset;
        camPos.y = _cameraY;
        PlayerCamera.transform.position = camPos + CameraShakeOffset;

        _energySlider.value = _energy;
        SkullElixerMaterial.SetFloat("_Fill", _energy * 0.01f);

        foreach (Material m in UICandleMaterials)
        {
            m.SetFloat("_Fill", _sanity * 0.01f);
        }

        for (int i = 0; i < _spirits.Count; i++)
        {
            Vector3 targetPos = BoatRef.transform.position;
            targetPos -= BoatRef.transform.forward * 3.0f;
            targetPos -= BoatRef.transform.forward * i * SpiritSpacing;
            _spirits[i].TargetPosition = targetPos;
            _spirits[i].LookAt = BoatRef.transform.position;
            _spirits[i].BoatRef = BoatRef;

            if (CharonRef != null && CharonRef.Life > 0)
            {
                Ray ray = Camera.main.ScreenPointToRay(Mouse.current.position.ReadValue());
                Vector3 hit = ray.origin + (ray.direction * (ray.origin.y / -ray.direction.y));

                _spirits[i].LookAt = hit;
            }
        }
        _spiritShotCooldown -= Time.deltaTime;
    }

    void AddEnergy(float val)
    {
        _energy = Mathf.Clamp(_energy + val, 0.0f, MaxEnergy);
        if(val>0.0f)
            _audioSource.PlayOneShot(DrinkPotion, 1.0f);
    }

    void AddSanity(float val)
    {
        _sanity = Mathf.Clamp(_sanity + val, 0.0f, MaxSanity);
        if (_sanity <= 0.0f)
        {
            OnLoseTheGame();
        }
    }

    public void AddSpirit()
    {
        Spirit spirit = Instantiate(SpiritPrefab, transform.position, Quaternion.identity);
        spirit.PlayerRef = this;
        spirit.BoatRef = BoatRef;
        _spirits.Add(spirit);
        _audioSource.PlayOneShot(NewGhost, 1.0f);
    }

    public void AddSpirit(Spirit spirit)
    {
        _spirits.Add(spirit);
        _audioSource.PlayOneShot(NewGhost, 1.0f);
    }

    void AddScroll()
    {
        _numScrolls += 1;
        if (_numScrolls >= RequiredScrolls)
        {
            EventController.PlayFinaleEvent();
        }
        switch (_numScrolls)
        {
            case 1:
                MapScrollOff1.gameObject.SetActive(false);
                MapScrollOn1.gameObject.SetActive(true);
                break;
            case 2:
                MapScrollOff2.gameObject.SetActive(false);
                MapScrollOn2.gameObject.SetActive(true);
                break;
            case 3:
                MapScrollOff3.gameObject.SetActive(false);
                MapScrollOn3.gameObject.SetActive(true);
                break;
            default:
                break;
        }

        _audioSource.PlayOneShot(PickupMap, 0.8f);
    }

    void EnterBoat()
    {
        _rowAnimation.Play(RowAnimName);
        BoatRef.OnPlayerEnter();
        _inBoat = true;
        _isInSea = false;
    }

    void ExitBoat()
    {
        _rowAnimation.Stop(RowAnimName);
        BoatRef.OnPlayerExit();
        _inBoat = false;
    }

    public void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.CompareTag("Elixir"))
        {
            AddEnergy(ElixirPickupValue);
            AddSanity(ElixirPickupValueSanity);
            Destroy(other.gameObject);
        }
        if (other.gameObject.CompareTag("Boat"))
        {
            _groundedPlayer = true;
            EnterBoat();
        }
        if (other.gameObject.CompareTag("Scroll"))
        {
            AddScroll();
            Destroy(other.gameObject);
        }
        if (other.gameObject.CompareTag("PortalToElysium"))
        {
            OnWinTheGame();
        }
        if (other.gameObject.CompareTag("CharonSkull"))
        {
            AddSanity(-CharonRef.SkullProjectileDamage);
            AddEnergy(-CharonRef.SkullProjectileDamage);
            Destroy(other.gameObject);
            _audioSource.PlayOneShot(OnDamage, 0.8f);
        }
        if (other.gameObject.CompareTag("Sea") && !_inBoat)
        {
            _isInSea = true;
            _audioSource.PlayOneShot(OnDamage, 1.0f);
        }
    }

    public void OnTriggerExit(Collider other)
    {
        if (other.gameObject.CompareTag("Sea"))
        {
            _isInSea = false;
        }
    }

    public void OnMove(InputValue input)
    {
        if (!GameRef.GameStarted)
            return;

        if (IsPopup)
            return;

        _inputVec = input.Get<Vector2>();

        if (IsInBoat)
        {
            BoatRef.OnMove(_inputVec);
        }
    }

    public void OnJump()
    {
        if (!GameRef.GameStarted)
            return;

        if (IsPopup)
            return;

        if (_groundedPlayer || IsInBoat)
        {
            ExitBoat();
            BoatRef.OnMove(new Vector2(0.0f, 0.0f));
            _playerVelocity.y += Mathf.Sqrt(JumpHeight * -3.0f * Gravity);
        }
    }

    public void OnFire()
    {
        //if (CharonRef == null || CharonRef.Life <= 0)
        //    return;

        if (_spiritShotCooldown > 0.0f)
            return;

        if (EventController.IsInEvent)
            return;

        //if (_spirits.Count == 0)
        //{
        //    AddSpirit();
        //    AddSanity(-10.0f);
        //}
        if (_spirits.Count > 0)
        {
            Ray ray = Camera.main.ScreenPointToRay(Mouse.current.position.ReadValue());
            Vector3 hit = ray.origin + (ray.direction * (ray.origin.y / -ray.direction.y));

            Spirit spirit = _spirits[0];
            _spirits.RemoveAt(0);
            spirit.FireAt(hit);
            _spiritShotCooldown = SpiritShotCooldown;
        }
    }

    public void OnDefeatedCharon()
    {
    }

    void OnWinTheGame()
    {
        UIManagerRef.ShowWinScreen();
        Time.timeScale = 0.0f;
    }

    void OnLoseTheGame()
    {
        UIManagerRef.ShowLoseScreen();
        Time.timeScale = 0.0f;
    }

    public void OnEventComplete(RandomEventConclusion conclusion)
    {
        for (int i = 0; i < conclusion.RewardTypes.Length; i++)
        {
            RandomEventController.Resources type = conclusion.RewardTypes[i];
            switch (type)
            {
                case RandomEventController.Resources.Energy:
                    AddEnergy((float)conclusion.RewardValues[i]);
                    break;
                case RandomEventController.Resources.Sanity:
                    AddSanity((float)conclusion.RewardValues[i]);
                    break;
                case RandomEventController.Resources.Spirits:
                    for (int j = 0; j < conclusion.RewardValues[i]; j++)
                        AddSpirit();
                    break;
                default:
                    break;
            }
        }
    }
}

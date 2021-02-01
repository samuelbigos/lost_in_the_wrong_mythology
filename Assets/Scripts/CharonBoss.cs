using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CharonBoss : MonoBehaviour
{
    public Player PlayerRef;
    public UIManager UIRef;

    public GameObject SkullProjectilePrefab;
    public float SkullAttackCooldown = 0.5f;
    public int SkullAttackNumProjectiles = 1;
    public float SkullProjectileDamage = 5.0f;
    public float ProjectileSpread = 10.0f;
    public float EngageRange = 20.0f;
    public float ProjectileSpeed = 10.0f;
    public int Life = 5;

    bool _engaged = false;
    float _cooldown = 0.0f;
    List<GameObject> _projectiles = new List<GameObject>();
    int _livesLeft;

    AudioSource _audioSource;
    public AudioClip OnDefeatedSfx;
    public AudioClip OnDamagedSfx;

    void Start()
    {
        _audioSource = gameObject.AddComponent<AudioSource>();
        _engaged = false;
        _livesLeft = Life;
    }

    void Update()
    {
        if (Vector3.Distance(transform.position, PlayerRef.transform.position) < EngageRange && !_engaged)
        {
            _engaged = true;
            PlayerRef.CharonRef = this;
            UIRef.SetBossHealthLevel(_livesLeft / Life);
            UIRef.SetShowBossHealth(true);
        }

        for (int i = 0; i < _projectiles.Count; i++)
        {
            if (_projectiles[i] == null)
                continue;

            _projectiles[i].transform.position += _projectiles[i].transform.forward * ProjectileSpeed * Time.deltaTime;

            if (_projectiles[i].transform.position.y < -1.0f)
            {
                Destroy(_projectiles[i]);
            }
        }

        if (_engaged && _livesLeft > 0)
        {
            _cooldown -= Time.deltaTime;
            if (_cooldown < 0.0f)
            {
                FireProjectile();
                _cooldown = SkullAttackCooldown;
            }

            transform.forward = Vector3.Lerp(transform.forward, (PlayerRef.transform.position - transform.position).normalized, Time.deltaTime);
        }

        if (_livesLeft <= 0)
        {
            transform.position = new Vector3(transform.position.x, transform.position.y - Time.deltaTime, transform.position.z);
        }
    }

    void FireProjectile()
    {
        for (int i = 0; i < SkullAttackNumProjectiles; i++)
        {
            Vector3 target = PlayerRef.transform.position;
            Vector3 spawn = transform.position + (transform.position - target).normalized * 0.75f;
            spawn.y = 1.5f;
            GameObject projectile = Instantiate(SkullProjectilePrefab, spawn, Quaternion.identity);
            Vector3 forward = target - transform.position;

            float angle = -(SkullAttackNumProjectiles * 0.5f * ProjectileSpread) + (ProjectileSpread * i);
            forward = Quaternion.Euler(0, angle, 0) * forward;

            projectile.transform.forward = forward;
            _projectiles.Add(projectile);
        }
    }

    void OnDefeated()
    {
        PlayerRef.OnDefeatedCharon();
        for (int i = 0; i < _projectiles.Count; i++)
        {
            Destroy(_projectiles[i].gameObject);
        }
        _audioSource.PlayOneShot(OnDefeatedSfx, 0.8f);
    }

    public void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.CompareTag("Spirit"))
        {
            _livesLeft -= 1;
            UIRef.SetBossHealthLevel((float)_livesLeft / (float)Life);
            if (_livesLeft == 0)
            {
                UIRef.SetShowBossHealth(false);
                OnDefeated();
            }
            _audioSource.PlayOneShot(OnDamagedSfx, 0.8f);
        }
    }
}

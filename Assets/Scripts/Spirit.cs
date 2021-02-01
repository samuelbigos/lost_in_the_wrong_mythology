using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Spirit : MonoBehaviour
{
    public Vector3 TargetPosition;
    public Vector3 LookAt;
    public float ReturnTime = 3.0f;
    public Boat BoatRef;    
    public Player PlayerRef;

    float _lifetime;
    bool _fired = false;
    float _cooldown;

    void Start()
    {
        _lifetime = 0.0f;
    }

    void Update()
    {
        _lifetime += Time.deltaTime;
        Vector3 pos = new Vector3();
        pos = Vector3.Slerp(transform.position, TargetPosition, Time.deltaTime * 1.0f);
        LookAt.y = transform.position.y;
        if ((LookAt - transform.position).magnitude > 0.1f)
        {
            transform.forward = transform.position - LookAt;
        }
        pos.y = TargetPosition.y + Mathf.Sin(_lifetime) * 0.50f;
        transform.position = pos;

        _cooldown -= Time.deltaTime;
        if (_fired && _cooldown < 0.0f)
        {
            PlayerRef.AddSpirit(this);
            _fired = false;
        }        
    }

    public void FireAt(Vector3 target)
    {
        TargetPosition = target;
        _fired = true;
        _cooldown = ReturnTime;
    }
}

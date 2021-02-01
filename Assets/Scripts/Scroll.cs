using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Scroll : MonoBehaviour
{
    Vector3 _initialPosition;
    float _rotation = 0.0f;
    float _rotationSpeed = 20.0f;

    void Start()
    {
        _initialPosition = transform.position;
        transform.localScale *= 1.5f;
    }

    void Update()
    {
        transform.position = _initialPosition + new Vector3(0.0f, 0.25f, 0.0f) + new Vector3(0.0f, 0.5f, 0.0f) * Mathf.Sin(Time.realtimeSinceStartup);
        _rotation += Time.deltaTime * _rotationSpeed;
        transform.rotation = Quaternion.AngleAxis(_rotation, transform.up);
    }
}

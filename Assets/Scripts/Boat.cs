using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;

public class Boat : MonoBehaviour
{
    public float LinearAcceleration = 1.0f;
    public float AngularAcceleration = 1.0f;
    public float LinearDeceleration = 1.0f;
    public float AngularDeceleration = 1.0f;
    public float RowSpeed = 5.0f;
    public Player PlayerRef;
    public GameObject IslandPointerPrefab;
    public MapGenerator MapGeneratorRef;

    public Camera RenderTextureCamera;
    public Material WaterMaterial;

    public string RowAnimName = "Take 001";

    Vector2 _inputVec = new Vector2();
    float _linearVelocity = 0.0f;
    float _angularVelocity = 0.0f;
    float _rowTime = 0.0f;
    Rigidbody _rigidBody;

    int _waterMaterialSizeID;
    int _waterMaterialPosID;

    Animation _rowAnim;

    Dictionary<Island, GameObject> _islandArrows = new Dictionary<Island, GameObject>();
    public GameObject FinalePointer;

    public float LinearVelocity { get { return _linearVelocity; } }

    public void Awake()
    {
        _rigidBody = GetComponent<Rigidbody>();
        _rowAnim = GetComponentInChildren<Animation>();
    }

    void Start()
    {
        _waterMaterialSizeID = Shader.PropertyToID("_WaterRenderTextureSize");
        _waterMaterialPosID = Shader.PropertyToID("_WaterRenderTexturePosition");

        WaterMaterial.SetFloat(_waterMaterialSizeID, RenderTextureCamera.orthographicSize);
        FinalePointer.SetActive(false);
    }

    void Update()
    {
        _rowTime += Time.deltaTime;

        float linearImpulse = _inputVec.y * LinearAcceleration;
        float angularImpulse = _inputVec.x * AngularAcceleration;

        // modify linear impulse by row time to simulate oar strokes.
        linearImpulse *= Mathf.Sin(_rowTime * RowSpeed) + 1.0f;

        _linearVelocity = _linearVelocity + linearImpulse * Time.deltaTime;
        _angularVelocity = _angularVelocity + angularImpulse * Time.deltaTime;

        if (PlayerRef.CanRow)
        {
            transform.position += transform.forward * _linearVelocity * Time.deltaTime;
            transform.Rotate(new Vector3(0.0f, 1.0f, 0.0f), _angularVelocity * Time.deltaTime);
        }
        else
        {
            _rowAnim.Stop(RowAnimName);
        }

        _linearVelocity = Mathf.Lerp(_linearVelocity, 0.0f, LinearDeceleration * Mathf.Abs(_linearVelocity) * Time.deltaTime);
        _angularVelocity = Mathf.Lerp(_angularVelocity, 0.0f, AngularDeceleration * Mathf.Abs(_angularVelocity) * Time.deltaTime);

        if (PlayerRef.IsInBoat)
        {
            UpdatePlayerPos();
        }

        RenderTextureCamera.transform.position = transform.position + new Vector3(0, 10, 0);
        WaterMaterial.SetVector(_waterMaterialPosID, RenderTextureCamera.transform.position);

        if (PlayerRef.OnFinale)
        {
            foreach (Island key in _islandArrows.Keys)
            {
                _islandArrows[key].SetActive(false);
            }

            Vector3 finaleIslandPos = MapGeneratorRef.CentreOfMap;
            FinalePointer.SetActive(true);
            FinalePointer.transform.forward = finaleIslandPos - transform.position;

            float maxDist = 500.0f;
            float maxDistFade = 450.0f;
            float minDist = 15.0f;
            float minDistFade = 20.0f;
            float distance = (finaleIslandPos - transform.position).magnitude;

            float fadeMax = 1.0f - Mathf.Clamp((distance - maxDistFade) / (maxDist - maxDistFade), 0.0f, 1.0f);
            float fadeMin = 1.0f - Mathf.Clamp((minDistFade - distance) / (minDistFade - minDist), 0.0f, 1.0f);
            float fade = Mathf.Min(fadeMax, fadeMin);
            fade = Mathf.Lerp(0.0f, 0.7f, fade);
            FinalePointer.GetComponentInChildren<MeshRenderer>().material.color = new Color(1.0f, 1.0f, 1.0f, fade);
        }
        else
        {
            foreach (Island key in _islandArrows.Keys)
            {
                GameObject islandPointer = _islandArrows[key];
                if (key.ItemPicked)
                {
                    islandPointer.GetComponentInChildren<MeshRenderer>().material.color = new Color(1.0f, 1.0f, 1.0f, 0.0f);
                    continue;
                }
                Vector3 islandPos = key.transform.position;
                islandPointer.transform.forward = islandPos - transform.position;

                float maxDist = 50.0f;
                float maxDistFade = 35.0f;
                float minDist = 10.0f;
                float minDistFade = 20.0f;
                float distance = (islandPos - transform.position).magnitude;

                float fadeMax = 1.0f - Mathf.Clamp((distance - maxDistFade) / (maxDist - maxDistFade), 0.0f, 1.0f);
                float fadeMin = 1.0f - Mathf.Clamp((minDistFade - distance) / (minDistFade - minDist), 0.0f, 1.0f);
                float fade = Mathf.Min(fadeMax, fadeMin);
                fade = Mathf.Lerp(0.0f, 0.7f, fade);
                islandPointer.GetComponentInChildren<MeshRenderer>().material.color = new Color(1.0f, 1.0f, 1.0f, fade);
            }
        }
    }

    public void UpdatePlayerPos()
    {
        PlayerRef.transform.position = transform.position + new Vector3(0.0f, 1.0f, 0.0f);
        PlayerRef.transform.rotation = transform.rotation;
    }

    public void OnPlayerEnter()
    {
        _rowAnim.Play(RowAnimName);
    }

    public void OnPlayerExit()
    {
        _rowAnim.Stop(RowAnimName);
    }

    public void OnMove(Vector2 input)
    {
        _inputVec = input;

        if (Mathf.Abs(_inputVec.y) > 0.0f)
        {
            _rowTime = 0.0f;
        }
    }

    public void OnIslandAdded(Island island)
    {
        GameObject islandPointer = Instantiate(IslandPointerPrefab, transform.position, Quaternion.identity);
        _islandArrows.Add(island, islandPointer);
        islandPointer.transform.parent = transform;
    }
}

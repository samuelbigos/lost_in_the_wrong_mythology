using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]

public class OutlinePostProcess : MonoBehaviour
{
    public Material material;
    private Material _material;

    [Range(1, 9)]
    public int LineThickness = 5;
    [Range(0,1)]
    public float DepthThreshold = 0.5f;
    [Range(0, 1)]
    public float MaxDepth = 0.0f;
    [Range(0, 1)]
    public float LineScaleTransition = 0.0f;

    void Awake()
    {
        _material = new Material(material);
    }

    void Start()
    {
        Camera cam = GetComponent<Camera>();
        cam.depthTextureMode = cam.depthTextureMode | DepthTextureMode.Depth;
    }

    void OnRenderImage(RenderTexture source, RenderTexture destination)
    {
        //Graphics.Blit(source, destination);

        _material.SetFloat("_Scale", (float)LineThickness);
        _material.SetFloat("_DepthThreshold", DepthThreshold);
        _material.SetFloat("_MaxDepth", MaxDepth);
        _material.SetFloat("_ScaleTransition", LineScaleTransition);
        Graphics.Blit(source, destination, _material);
    }
}

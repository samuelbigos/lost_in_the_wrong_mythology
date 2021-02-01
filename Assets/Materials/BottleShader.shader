Shader "Custom/BottleShader"
{
    Properties
    {
        _ColorA ("Bottle Color", Color) = (0, 0.5, 0.8, 0.6)
        _ColorB ("Liquid Color", Color) = (0.8, 0, 0.5, 1)
        _Fill ("FillLevel", Range(0,1)) = 0.5
        _Scale("Scale", Range(0, 100)) = 1
        [Toggle] _UI("UI", Float) = 0
        _FlashFrequency("Flash Frequency", Range(0.1, 10)) = 1
        _FadeStart("Flash Fade Start", Range(0, 1)) = 0.3
        _FadeFull("Flash Fade Full", Range(0, 1)) = 0.2
        _FlashColor("Flash Color", Color) = (1,0,0,1)
    }
    SubShader
    {
        //Tags {"Queue" = "Transparent" "RenderType" = "Transparent" }
        Tags {"Queue" = "Geometry"}
        //ZWrite Off
        //Blend SrcAlpha OneMinusSrcAlpha
        //Cull Off
        LOD 100

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            // make fog work
            #pragma multi_compile_fog

            #include "UnityCG.cginc"
            #define TAU 6.28318530718

            struct Input
            {
                float2 uv_MainTex;
                float3 worldPos;
            };

            fixed4 _ColorA;
            fixed4 _ColorB;
            float _Fill;
            float _Scale;

            float _UI;
            float _FlashFrequency;
            float4 _FlashColor;
            float _FadeStart;
            float _FadeFull;

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
                float3 normal : NORMAL;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                UNITY_FOG_COORDS(1)
                float4 vertex : SV_POSITION;
                float4 worldPos : TEXCOORD2;
                float3 viewDir : COLOR;
                float3 normal : COLOR2;

            };

            v2f vert(appdata v)
            {
                v2f o;

                float4 pos = v.vertex;
                o.worldPos = mul(unity_ObjectToWorld, pos);
                o.vertex = UnityObjectToClipPos(pos);
                o.normal = v.normal;
                o.viewDir = normalize(ObjSpaceViewDir(v.vertex));
                return o;
            }



            fixed4 frag(v2f i) : SV_Target
            {
                float3 cent = mul(unity_ObjectToWorld, float4(0, 0, 0, 1));

                float t = _Time.y;
                float ypos = i.worldPos.y + sin(t*3.7 + sin(t * 0.837 + i.worldPos.z * 12.89)*3.14 - sin(t * 0.732 + i.worldPos.x * 12.7)*3.14)*0.02;

                float fillEdge = (ypos - cent.y)/ _Scale * 1.25 + (1. - _Fill);

                float fresnel = dot(i.normal, i.viewDir);

                float fillMask = step(fillEdge, 0.5) * step(0.1, fresnel);

                // Albedo comes from a texture tinted by color
                fixed4 c = 0;

                float4 cB = lerp(_ColorB*.5, _ColorB, fillEdge);

                c = lerp(_ColorA, cB, fillMask);

                float fresnelColor = smoothstep(0.3, 0.4, length(i.worldPos.xyz - cent.xyz)/ _Scale);
                c.xyz = lerp(fresnelColor, c.xyz, fresnel);

                if (_UI > 0.5f) {
                    if (_Fill < _FadeStart)
                    {
                        if (_Fill > 0.01)
                        {
                            float m = clamp((_Fill - _FadeStart) / (_FadeFull - _FadeStart), 0, 1);
                            c.xyz = lerp(c.xyz, _FlashColor, (sin(_Time.y * TAU * _FlashFrequency) * .25f + .25f) * m);
                        }
                        else
                        {
                            c.xyz *= clamp(1 - fresnel, 0, 1);
                        }
                    }
                }

                return c;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
}

Shader "Custom/UICandleWaxShader"
{
    Properties
    {
        _Color("Color", Color) = (1,1,1,1)
        _Fill("Fill", Range(0, 1)) = 0.5
        _Hightest("Highest Point", Range(0, 10)) = 1
        _Lowest("Lowest Point", Range(-5, 5)) = 0
        _FlashFrequency("Flash Frequency", Range(0.1, 10)) = 1
        _FadeStart("Flash Fade Start", Range(0, 1)) = 0.45
        _FadeFull("Flash Fade Full", Range(0, 1)) = 0.25
        _FlashColor("Flash Color", Color) = (1,0,0,1)
    }
    SubShader
    {
        Tags {"Queue" = "Geometry"}
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

            fixed4 _Color;
            float _Fill;

            float _Hightest;
            float _Lowest;

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
                float3 viewDir : COLOR;
                float3 normal : COLOR2;
                float3 bounds : TEXCOORD2;
                float height : TEXCOORD3;
            };

            v2f vert(appdata v)
            {
                v2f o;

                //float4 bot = mul(unity_ObjectToWorld, float4(0, _Lowest, 0, 1));
                //float4 top  = mul(unity_ObjectToWorld, float4(0, _Hightest, 0, 1));
                //float4 wheight = mul(unity_ObjectToWorld, float4(0, v.vertex.y, 0, 1));
                //float4 wpos = mul(unity_ObjectToWorld, v.vertex);

                //float hnorm = distance(wheight, top) / distance(bot, top);

                //float4 dir = bot - wheight;


                float hnorm = clamp((v.vertex.y - _Lowest) / (_Hightest - _Lowest), 0, 1);
                //float mask = smoothstep(_Fill - 0.25, _Fill + 0.25, hnorm);

                float mask = clamp(hnorm + (0 - _Fill), 0, 1);

                float dist = (_Lowest - v.vertex.y)*mask;

                float4 pos = v.vertex;
                pos.y += dist;
                o.height = hnorm;

                o.vertex = UnityObjectToClipPos(pos);
                o.normal = v.normal;
                o.viewDir = normalize(ObjSpaceViewDir(v.vertex));
                return o;
            }



            fixed4 frag(v2f i) : SV_Target
            {


                // Albedo comes from a texture tinted by color
                fixed4 c = 0;

                float fresnel = dot(i.normal, i.viewDir);
                float mask = clamp(smoothstep(0.8, 1.0, fresnel) * (i.height+.2), 0, 1);

                c.xyz = lerp(_Color*float3(.9, .7, .6), _Color, fresnel);
                //c.xyz = lerp(c.xyz, 1, )
               // c.xyz = i.col;

                c.xyz = c.xyz+mask*0.2;

                if (_Fill < _FadeStart)
                {
                    float m = clamp((_Fill - _FadeStart) / (_FadeFull - _FadeStart), 0, 1);
                    c.xyz = lerp(c.xyz, _FlashColor, (sin(_Time.y * TAU * _FlashFrequency) * .4f + .4f) * m);
                }

                return c;
            }
            ENDCG
        }
    }
        FallBack "Diffuse"
}
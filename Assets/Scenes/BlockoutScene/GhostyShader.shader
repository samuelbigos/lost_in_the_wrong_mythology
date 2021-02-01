// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

Shader "Unlit/GhostyShader"
{
    Properties
    {
        _Color("Color", Color) = (0.3, 0.5, 0.8, 1.0)
        _OffsetMult("Offset Multiplier", Range(0, 10)) = 1
        _OpacityOffset("Opacity Offset", Range(-1, 1)) = 0
    }
    SubShader
    {
        Tags {"Queue" = "Transparent" "RenderType"="Transparent" }
        ZWrite Off
        Blend SrcAlpha OneMinusSrcAlpha
        //Cull back
        LOD 200

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            // make fog work
            #pragma multi_compile_fog

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                UNITY_FOG_COORDS(1)
                float4 vertex : SV_POSITION;
                float3 bounds : TEXCOORD2;
            };

            float4 _MainTex_ST;
            float4 _Color;
            float _OffsetMult;
            float _OpacityOffset;


            v2f vert (appdata v)
            {
                float4 bbox_min = float4(0, 0, 0, 1);
                float4 bbox_max = float4(1, 1, 1, 1);
                float4 bounds = (v.vertex - bbox_min) / (bbox_max - bbox_min);
                v2f o;
                o.bounds = bounds.xyz;
                float4 pos = v.vertex;
                if (_OffsetMult > 0)
                {
                    float t = _Time.y;
                    float m = clamp(1 - (bounds.y * .5 - .2), 0, 1);
                    float s = sin(t + pos.x * .27 + pos.z * .28 + pos.y * 3.) * m;
                    pos.xz += s * 0.3 * _OffsetMult;
                }
                o.vertex = UnityObjectToClipPos(pos);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                UNITY_TRANSFER_FOG(o,pos);
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                // sample the texture
                fixed4 col = float4(_Color.xyz, clamp( clamp(i.bounds.y*.5-.2, 0., .5) + _OpacityOffset, 0, 1));

                //col.xyz = i.bounds.xyz;
                //col.a = 1;
                // apply fog
                //UNITY_APPLY_FOG(i.fogCoord, col);
                return col;
            }
            ENDCG
        }
    }
}

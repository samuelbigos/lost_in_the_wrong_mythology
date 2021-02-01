Shader "Unlit/PortalShader"
{
    Properties
    {
        //_MainTex ("Texture", 2D) = "white" {}
        _ColorA ("Color Bottom", Color) = (0.2, 0.7, 0.8, 1)
        _ColorB ("Color Top", Color) = (0.8, 0.2, 0.9, 1)
    }
    SubShader
    {
        Tags { "RenderType"="Transparent" "Queue"="Transparent"}
        Blend SrcAlpha OneMinusSrcAlpha
        Cull Off
        LOD 100

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
            };

            sampler2D _MainTex;
            float4 _MainTex_ST;

            float4 _ColorA;
            float4 _ColorB;

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                //UNITY_TRANSFER_FOG(o,o.vertex);
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                // sample the texture
                fixed4 col = 1;
                // apply fog
                //UNITY_APPLY_FOG(i.fogCoord, col);
                col.xyz = 0;
                col.xy = i.uv;
                float2 orgUV = i.uv;
                float2 uv = i.uv-.5;

                float2 st = float2(atan2(uv.y, uv.x), length(uv));
                float2 polarUV = float2(st.x, st.y);
                //polarUV.x = polarUV.x / 6.2831 + .5;
                float t = _Time.y;
                //polarUV.x = frac(polarUV.x+_Time.y*0.2);

                float m = smoothstep(0.00, 0.8, length(uv));

                float s1 = sin(polarUV.x + polarUV.y*27 - t*2.9)*.4+.6;
                float s2 = sin(polarUV.x + polarUV.y * 33 - t*2.7) * -.4 + .6;

                float edges = clamp(max(abs(uv.x * 2.) * 2 - 1, abs(uv.y * 2.) * 2 - 1), 0., 1.);

                float colorTrans = orgUV.y * (1. - (s1 + s2)*0.2);
                col.xyz = lerp(_ColorA, _ColorB, colorTrans);
                col.a = max(lerp((s1 + s2) * m, 1, edges), 0.5);
                return col;
            }
            ENDCG
        }
    }
}

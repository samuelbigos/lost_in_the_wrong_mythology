Shader "Unlit/UIGhostShader"
{
    Properties
    {
        _ColorA("Color A", Color) = (0.8, 0.2, 0.6, 1)
        _ColorB("Color B", Color) = (0.2, 0., 0.8, 1)
        _AlphaA("Alpha A", Range(0, 1)) = 0.5
        _AlphaB("Alpha B", Range(0, 1)) = 1.0

        _AlphaTransition("Alpha Transition", Range(0.001, 1)) = 0.5
        _ColorTransition("Color Transition", Range(0.001, 1)) = 0.5
        _AlphaFalloff("Alpha Falloff", Range(0, 1)) = 0.5
        _ColorFalloff("Color Falloff", Range(0, 1)) = 0.5
    }
    SubShader
    {

        /*Tags { "Queue" = "Geometry+10" "RenderType" = "Opaque"}
        ColorMask 0
        Zwrite On

        Pass
        {
        }*/

        Tags {"Queue" = "Geometry+10" "RenderType" = "Transparent" }
        ZWrite On
        ColorMask RGB
        //Blend SrcAlpha OneMinusSrcAlpha
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
                float3 normal : NORMAL;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                UNITY_FOG_COORDS(1)
                float4 vertex : SV_POSITION;
                float3 viewDir : COLOR;
                float3 normal : COLOR2;
            };

            sampler2D _MainTex;
            float4 _MainTex_ST;
            fixed4 _ColorA;
            fixed4 _ColorB;
            
            float _AlphaA;
            float _AlphaB;

            float _AlphaTransition;
            float _ColorTransition;
            float _AlphaFalloff;
            float _ColorFalloff;

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                o.normal = v.normal;
                o.viewDir = normalize(ObjSpaceViewDir(v.vertex));
                //UNITY_TRANSFER_FOG(o,o.vertex);
                return o;
            }

            fixed4 frag(v2f i) : SV_Target
            {
                // sample the texture
                fixed4 col = 0;
            
                float d = dot(i.normal, i.viewDir);

                float cm = clamp((d - _ColorTransition) * (1 / _ColorFalloff), 0, 1);
                float am = clamp((d - _AlphaTransition) * (1 / _AlphaFalloff), 0, 1);

                col.xyz = lerp(_ColorA, _ColorB, cm);
                col.a = lerp(_AlphaA, _AlphaB, am);

                // apply fog
                //UNITY_APPLY_FOG(i.fogCoord, col);
                return col;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
}

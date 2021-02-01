Shader "Custom/WaterSurfaceShader"
{
    Properties
    {
        _ColorA("Bottom Color", Color) = (0,1,0.6173377,1)
        _ColorB("Top Color", Color) = (0,0,0,1)
        _Scale("Scale", Range(0.001, 10)) = .37
        _MaxDist("Max Distance", Range(0,100)) = 10.0
        _WaterRenderTexture("Water Render Texture", 2D) = "" {}
        _WaterRenderTextureSize("Water Render Texture Size", Range(0, 128)) = 32
        _WaterRenderTexturePosition("Water Render Texture Position", Vector) = (0,0,0)
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 200

        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Standard fullforwardshadows
        // Use shader model 3.0 target, to get nicer looking lighting
        #pragma target 3.0

        #define dot2(a) dot(a, a)


        float _Scale;
        float _MaxDist;
        float4 _ColorA;
        float4 _ColorB;

        sampler2D _WaterRenderTexture;
        float3 _WaterRenderTexturePosition;
        float _WaterRenderTextureSize;

        struct Input
        {
            float2 uv_MainTex;
            float3 worldPos;
        };

        struct v2f {
            float4 pos : SV_POSITION;
        };

        float N21(float2 p)
        {
            p = frac(p * float2(233.34, 851.734));
            p += dot(p, p + 23.65);

            return frac(p.x * p.y);
        }

        float2 N22(float2 p)
        {
            float n = N21(p);
            return float2(n, N21(p + n));
        }

        float2 GetPos(float2 id, float2 offset, float t)
        {
            float2 n = N22(id + offset) * t;

            return offset + sin(n) * 0.35;
        }

        //half3 waterColor = half3(0.2, 0.5, 1.);
        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            float t = _Time.y + 17.3;
            float3 pos = IN.worldPos;

            //float2 scrPos = ComputeScreenPos(pos);

            float2 uv = pos.xz * _Scale;

            float2 texUV = 1. - ((_WaterRenderTexturePosition.xz - pos.xz) / (_WaterRenderTextureSize * 2) + .5);
            float3 tex = tex2D(_WaterRenderTexture, texUV).xyz;

            float2 offset = tex.xz - .5;

            offset = offset * pow(1. - length(offset), 2);

            uv += offset;

            uv += sin(uv + t)*.1;

            float2 index = floor(uv);
            float2 localUV = frac(uv);

            float2 indices[9];
            float2 p[9];

            int i = 0;
            for (float y = -1.; y <= 1.; y++)
            {
                for (float x = -1.; x <= 1.; x++)
                {
                    indices[i] = index + float2(x, y);
                    p[i++] = GetPos(index, float2(x, y), t);
                }
            }

            float d = 100;
            float2 idMask = 0;

            for (i = 0; i < 9; i++)
            {
                float dst = dot2(localUV-p[i]);
                if (dst < d)
                {
                    d = dst;
                    idMask = indices[i];
                }
            }

            d *= _Scale;

            d += pow(max(tex.b - 0.5, 0.0)*2.0, 2)*.2;

            d = smoothstep(.0, .4, d);
            d = lerp(d, step(0.4, d), 0.2);

            float4 c = lerp(_ColorA, _ColorB, clamp(texUV.y*0.5+0.5, 0, 1));

            c.xyz = lerp(c.xyz, 1, d*0.5);

            //c.xy = scrPos * 0.01;

            o.Albedo = c.rgb;
            // Metallic and smoothness come from slider variables
            o.Metallic = 0.0;
            o.Smoothness = .8 - d*.4;
            o.Alpha = c.a;
        }
        ENDCG
    }
    FallBack "Diffuse"
}

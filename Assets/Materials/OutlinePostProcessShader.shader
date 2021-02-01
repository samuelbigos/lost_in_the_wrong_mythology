Shader "Hidden/OutlinePostProcessShader"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _Scale("Scale", Range(1, 20)) = 5
        _DepthThreshold("Depth Threshold", Range(0,1)) = 0.5
        _MaxDepth("Max Depth", Range(0,1)) = 0
        _ScaleTransition("Scale Transition", Range(0, 1)) = 0
    }
    SubShader
    {
        // No culling or depth
        Cull Off ZWrite Off ZTest Always

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"
            
            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                return o;
            }

            sampler2D _MainTex;
            sampler2D _CameraDepthTexture;
            float _Scale;
            float _DepthThreshold;
            float _MaxDepth;
            float _ScaleTransition;

            fixed4 frag (v2f i) : SV_Target
            {
                fixed4 col = tex2D(_MainTex, i.uv);

                float depth = tex2D(_CameraDepthTexture, i.uv).r;
                float scale = _Scale;

                if (_MaxDepth > 0)
                {
                    if (Linear01Depth(depth) > _MaxDepth)
                    {
                        float nD = Linear01Depth(depth) - _MaxDepth;
                        if (nD > _ScaleTransition)
                            return col;
                        scale = lerp(scale, 1, nD / _ScaleTransition);
                    }
                }

                float halfScaleFloor = floor(scale * 0.5);
                float halfScaleCeil = ceil(scale * 0.5);
                
                float2 TexelSize = 1 / float2(1920, 1080);//_MainTex_TexelSize.xy;

                float2 bottomLeftUV = i.uv - TexelSize * halfScaleFloor;
                float2 topRightUV = i.uv + TexelSize * halfScaleCeil;
                float2 bottomRightUV = i.uv + TexelSize * float2(halfScaleCeil, -halfScaleFloor);
                float2 topLeftUV = i.uv + TexelSize * float2(-halfScaleFloor, halfScaleCeil);

                float depth0 = tex2D(_CameraDepthTexture, bottomLeftUV).r;
                float depth1 = tex2D(_CameraDepthTexture, topRightUV).r;
                float depth2 = tex2D(_CameraDepthTexture, bottomRightUV).r;
                float depth3 = tex2D(_CameraDepthTexture, topLeftUV).r;

                /*if (_MaxDepth > 0)
                {
                   
                    float closestDepth = max(depth0, max(depth1, max(depth2, depth3)));
                    //return Linear01Depth(closestDepth) > _MaxDepth ? 0 : 1;
                    if (Linear01Depth(closestDepth) > _MaxDepth)
                        return col;
                }*/

                float depthFiniteDifference0 = depth1 - depth0;
                float depthFiniteDifference1 = depth3 - depth2;

                float edgeDepth = sqrt(pow(depthFiniteDifference0, 2) + pow(depthFiniteDifference1, 2)) * 100;
                edgeDepth = edgeDepth > _DepthThreshold ? 1 : 0;

                
                // just invert the colors
                col.rgb = col.rgb * (1.-edgeDepth);
                col.a = max(col.a, edgeDepth);
                return col;
            }
            ENDCG
        }
    }
}

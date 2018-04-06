// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Custom/WindowCoordinatesBaseShader" {
	SubShader {
		Pass {
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma target 3.0

			// defined "UnityCG.cginc"
			// Instead of #include "UnityCG.cginc"
			struct appdata_base {
				float4 vertex : POSITION;
				float3 normal : NORMAL;
				float4 texcoord : TEXCOORD0;
			};

			float4 vert(appdata_base v) : POSITION {
				return UnityObjectToClipPos (v.vertex);
			}

			// WPOS is variable of reffering screen axis
			fixed4 frag(float4 sp:WPOS) : COLOR {
				fixed2 red_green = sp.xy / _ScreenParams.xy;
				fixed  blue		 = 0.0;
				fixed  alpha	 = 1.0f;
				// fixed4(fixed2, f, f) -> fixed4(f, f, f, f)
				return fixed4(red_green, blue, alpha);
			}

			ENDCG
		}
	}
	FallBack "Diffuse"
}

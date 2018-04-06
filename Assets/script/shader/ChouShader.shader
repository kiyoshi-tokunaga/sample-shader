// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Custom/Chou" {
	Properties {
		_BendScale ("Bend Scale", Range(0.0, 1.0)) = 0.1
		_MainTex ("Base (RGB)", 2D) = "white" {}
	}
	SubShader {
		Pass {
			// https://docs.unity3d.com/jp/current/Manual/SL-Blend.html
			// SrcAlpha: multiple alpha of source
			// One: using plain color of source or target color
			Blend SrcAlpha One
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#define PI 3.14159

			#include "UnityCG.cginc"

			// add uniform modifier should be use variables defined in Properties
			uniform float _BendScale;
			uniform sampler2D _MainTex;

			struct v2f {
				float4 position : SV_POSITION;
				fixed4 color	: COLOR;
				float2 uv		: TEXCOORD0;
			};

			v2f vert(appdata_full v) {
				float bend = sin(PI * _Time.x * 1000 / 45 + v.vertex.y + v.vertex.x);
				float x = sin(v.texcoord.x * PI) - 1.0;
				float y = sin(v.texcoord.y * PI) - 1.0;
				v.vertex.y += _BendScale * bend * (x + y);

				v2f o;
				o.position = UnityObjectToClipPos(v.vertex);
				o.uv	   = MultiplyUV(UNITY_MATRIX_TEXTURE0, v.texcoord);
				o.color	   = v.color;
				return o;
			}

			fixed4 frag(v2f i) : COLOr {
				fixed4 tex = tex2D(_MainTex, i.uv);
				tex.rgb *= i.color.rgb;
				tex.a	*= i.color.a;
				return tex;
			}

			ENDCG
		}
	}
	FallBack "Diffuse"
}

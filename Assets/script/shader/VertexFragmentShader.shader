// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Custom/VertexFragmentShader" {
	SubShader {
		Pass {
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag


			// processing all vertex
			// Syntax: variable:Semantics, 
			//         Semantics is valiables thougn each stages in graphics pipeline
			float4 vert(float4 v:POSITION) : SV_POSITION
				// coordinate transformation to MVP
				return UnityObjectToClipPos(v);
			}

			// process all pixels
			fixed4 frag() : COLOR {
				// to red
				return fixed4(1.0,0.0,0.0,1.0);
			}
			ENDCG
		}
	}
	FallBack "Diffuse"
}

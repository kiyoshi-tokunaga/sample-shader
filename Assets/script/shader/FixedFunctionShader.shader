Shader "Custom/VertexLitWhite"
{
	// Enable Adjust from Inspecter, Global Variables
	Properties {
		// Properties Syntax: Internal name (Inspector title, Property type) = Default value
		_Color("Main Color", Color) = (1,1,1,1)
		_SpecColor("Spec Color", Color) = (1,1,1,1)
		_Emission("Emmisive Color", Color) = (0,0,0,0)
		_Shininess("Shininess", RAnge (0.01,1)) = 0.7
		_MainTex("Base(RGB)", 2D) = "white" {}
	}
	SubShader
	{
		Pass {
			Material {
				Diffuse [_Color] // 拡散反射の色
				Ambient [_Color] // 環境色
				Shininess [_Shininess] // The level of blur for the highlight is controlled
				Specular [_SpecColor] // 鏡面反射の色
				Emission [_Emission] // 表面から放出される光の色と強度 -> 強いほど "自己発光" しているようにみえる
			}
			Lighting On
			SeparateSpecular On
			SetTexture [_MainTex] {
				Combine texture * primary DOUBLE, texture * primary
			}
		}
	}
}

Shader "Custom/SurfaceShader" {
	Properties {
		_MainColor ("Color", Color) = (1,1,1,1)
	}
	SubShader {
		// Tags scope can adapte rendering cycle, assign when - how as key - value
		Tags { "RenderType"="Transparent" }

		CGPROGRAM
		float4 _MainColor;
		// Syntax: #pragma surface surfaceFunction(function name) lightModel [optionalparams]
		// lightModel: Lambert, BlinnPhong etc
		// optionalparams: alpha(be transparent), vertex(change vertex) etc
		// has a scope in this declaration, 
		// shoud call defined variables in the scope if Properties variables uses
		#pragma surface surf Lambert alpha
		struct Input {
			float4 color : COLOR;
		};

		// This function is surfaceFunction in #pragma declaration
		// output struct:
		//	struct SurfaceOutput {
		//	    half3 Albedo;
		//	    half3 Normal;
		//	    half3 Emission;
		//	    half Specular;
		//	    half Gloss;
		//	    half Alpha;
		//	};
		//
		void surf (Input IN, inout SurfaceOutput o) {
			o.Albedo = _MainColor.rgb * half3(1, 0.5, 0.5);
			o.Alpha = 0.5;
		} 
		ENDCG
	}
	FallBack "Diffuse"
}

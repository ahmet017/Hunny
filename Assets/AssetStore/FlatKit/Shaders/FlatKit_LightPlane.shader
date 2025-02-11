Shader "FlatKit/LightPlane" {
	Properties {
		[Header(Color alpha controls opacity)] [HDR] _Color ("Color", Vector) = (0.5,0.5,0.5,1)
		[Space(15)] _Depth ("Depth Fade Distance", Range(1, 500)) = 100
		[Space] _CameraDistanceFadeFar ("Camera Distance Fade Far", Float) = 10
		_CameraDistanceFadeClose ("Camera Distance Fade Close", Float) = 0
		[Space] _UvFadeX ("UV Fade X", Range(0, 10)) = 0.1
		_UvFadeY ("UV Fade Y", Range(0, 10)) = 0.1
		[ToggleOff] _AllowAlphaOverflow ("Allow Alpha Overflow", Float) = 0
	}
	//DummyShaderTextExporter
	SubShader{
		Tags { "RenderType"="Opaque" }
		LOD 200
		CGPROGRAM
#pragma surface surf Standard
#pragma target 3.0

		fixed4 _Color;
		struct Input
		{
			float2 uv_MainTex;
		};
		
		void surf(Input IN, inout SurfaceOutputStandard o)
		{
			o.Albedo = _Color.rgb;
			o.Alpha = _Color.a;
		}
		ENDCG
	}
	Fallback "Diffuse"
}
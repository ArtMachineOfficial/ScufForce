// Made with Amplify Shader Editor v1.9.2.2
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Hidden/TerrainEngine/Details/WavingDoublePass"
{
	Properties
	{
		[HideInInspector]_CameraPosition("_CameraPosition", Vector) = (0,0,0,0)
		[HideInInspector]_WaveAndDistance("_WaveAndDistance", Vector) = (0,0,0,0)
		_WavingTint("_WavingTint", Vector) = (0,0,0,0)
		[HideInInspector][NoScaleOffset]_MainTex("_MainTex", 2D) = "white" {}
		_Cutoff( "Mask Clip Value", Float ) = 0.5
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "TransparentCutout"  "Queue" = "AlphaTest+0" "DisableBatching" = "True" }
		Cull Off
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 4.5
		#define THE_VEGETATION_ENGINE
		#define TVE_IS_STANDARD_PIPELINE
		#define ASE_USING_SAMPLING_MACROS 1
		#if defined(SHADER_API_D3D11) || defined(SHADER_API_XBOXONE) || defined(UNITY_COMPILER_HLSLCC) || defined(SHADER_API_PSSL) || (defined(SHADER_TARGET_SURFACE_ANALYSIS) && !defined(SHADER_TARGET_SURFACE_ANALYSIS_MOJOSHADER))//ASE Sampler Macros
		#define SAMPLE_TEXTURE2D(tex,samplerTex,coord) tex.Sample(samplerTex,coord)
		#define SAMPLE_TEXTURE2D_LOD(tex,samplerTex,coord,lod) tex.SampleLevel(samplerTex,coord, lod)
		#define SAMPLE_TEXTURE2D_ARRAY_LOD(tex,samplerTex,coord,lod) tex.SampleLevel(samplerTex,coord, lod)
		#else//ASE Sampling Macros
		#define SAMPLE_TEXTURE2D(tex,samplerTex,coord) tex2D(tex,coord)
		#define SAMPLE_TEXTURE2D_LOD(tex,samplerTex,coord,lod) tex2Dlod(tex,float4(coord,0,lod))
		#define SAMPLE_TEXTURE2D_ARRAY_LOD(tex,samplertex,coord,lod) tex2DArraylod(tex, float4(coord,lod))
		#endif//ASE Sampling Macros

		#pragma surface surf Standard keepalpha addshadow fullforwardshadows vertex:vertexDataFunc 
		struct Input
		{
			float3 worldPos;
			float2 uv_texcoord;
			float4 vertexColor : COLOR;
			float vertexToFrag11_g74642;
			float vertexToFrag762_g57854;
		};

		uniform float4 _WaveAndDistance;
		uniform float4 _CameraPosition;
		uniform half TVE_DetailInteractionAmplitude;
		UNITY_DECLARE_TEX2D_NOSAMPLER(TVE_NoiseTex);
		uniform float3 TVE_WorldOrigin;
		uniform float TVE_DetailMotionScale_10;
		uniform half TVE_NoiseTexTilling;
		uniform half4 TVE_MotionParams;
		uniform half4 TVE_TimeParams;
		uniform float TVE_DetailMotionSpeed_10;
		SamplerState sampler_Linear_Repeat;
		uniform half TVE_DetailLayerMotion;
		uniform float TVE_MotionUsage[10];
		UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_MotionTex);
		uniform half4 TVE_MotionCoords;
		SamplerState sampler_Linear_Clamp;
		uniform half4 TVE_WindEditor;
		uniform half TVE_DetailMotionAmplitude_10;
		uniform half TVE_MotionValue_10;
		uniform float TVE_DetailMotionScale_32;
		uniform float TVE_DetailMotionSpeed_32;
		uniform float TVE_DetailMotionAmplitude_32;
		uniform half TVE_MotionFadeEnd;
		uniform half TVE_MotionFadeStart;
		uniform half TVE_MotionValue_30;
		uniform half TVE_DetailPerspectivePush;
		uniform half TVE_DetailPerspectiveNoise;
		uniform half TVE_DetailPerspectiveAngle;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_MainTex);
		SamplerState sampler_MainTex;
		uniform float3 _WavingTint;
		uniform half4 TVE_DetailMotionHighlightColor;
		uniform half TVE_DetailLayerColors;
		uniform float TVE_ColorsUsage[10];
		UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_ColorsTex);
		uniform half4 TVE_ColorsCoords;
		uniform half4 TVE_ColorsParams;
		uniform half TVE_DetailGlobalColors;
		uniform half TVE_DetailColorsMaskMin;
		uniform half TVE_DetailColorsMaskMax;
		uniform half4 TVE_OverlayColor;
		uniform half TVE_DetailLayerExtras;
		uniform float TVE_ExtrasUsage[10];
		UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_ExtrasTex);
		uniform half4 TVE_ExtrasCoords;
		uniform half4 TVE_ExtrasParams;
		uniform float TVE_DetailGlobalOverlay;
		uniform float TVE_DetailOverlayMaskMin;
		uniform float TVE_DetailOverlayMaskMax;
		uniform half TVE_DetailGlobalWetness;
		uniform float TVE_DetailGlobalAlpha;
		uniform float TVE_DistanceFadeBias;
		uniform float TVE_DetailCutoff;
		uniform float _Cutoff = 0.5;

		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float3 ase_vertex3Pos = v.vertex.xyz;
			float3 ase_worldPos = mul( unity_ObjectToWorld, v.vertex );
			float3 WorldPosition837_g57854 = ase_worldPos;
			float3 WorldPosition_Shifted923_g57854 = ( WorldPosition837_g57854 - TVE_WorldOrigin );
			half3 Input_Position419_g75261 = WorldPosition_Shifted923_g57854;
			float Input_MotionScale287_g75261 = ( TVE_DetailMotionScale_10 + 0.2 );
			half NoiseTex_Tilling735_g75261 = TVE_NoiseTexTilling;
			float2 temp_output_597_0_g75261 = (( Input_Position419_g75261 * Input_MotionScale287_g75261 * NoiseTex_Tilling735_g75261 * 0.0075 )).xz;
			float2 temp_output_447_0_g75259 = ((TVE_MotionParams).xy*2.0 + -1.0);
			half2 Global_Wind_DirectionWS852_g57854 = temp_output_447_0_g75259;
			half2 Input_DirectionWS423_g75261 = Global_Wind_DirectionWS852_g57854;
			float lerpResult128_g75262 = lerp( _Time.y , ( ( _Time.y * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
			half Input_MotionSpeed62_g75261 = TVE_DetailMotionSpeed_10;
			half Input_MotionVariation284_g75261 = 0.0;
			half Input_GlobalMeshVariation569_g75261 = 0.0;
			float temp_output_630_0_g75261 = ( ( ( lerpResult128_g75262 * Input_MotionSpeed62_g75261 ) + ( Input_MotionVariation284_g75261 * Input_GlobalMeshVariation569_g75261 ) ) * 0.03 );
			float temp_output_607_0_g75261 = frac( temp_output_630_0_g75261 );
			float4 lerpResult590_g75261 = lerp( SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g75261 + ( -Input_DirectionWS423_g75261 * temp_output_607_0_g75261 ) ), 0.0 ) , SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g75261 + ( -Input_DirectionWS423_g75261 * frac( ( temp_output_630_0_g75261 + 0.5 ) ) ) ), 0.0 ) , ( abs( ( temp_output_607_0_g75261 - 0.5 ) ) / 0.5 ));
			half4 Noise_Complex703_g75261 = lerpResult590_g75261;
			float2 temp_output_645_0_g75261 = ((Noise_Complex703_g75261).rg*2.0 + -1.0);
			half2 Global_Noise_WS891_g57854 = temp_output_645_0_g75261;
			float temp_output_84_0_g57863 = TVE_DetailLayerMotion;
			float temp_output_19_0_g57867 = TVE_MotionUsage[(int)temp_output_84_0_g57863];
			float4 temp_output_91_19_g57863 = TVE_MotionCoords;
			half2 UV94_g57863 = ( (temp_output_91_19_g57863).zw + ( (temp_output_91_19_g57863).xy * (WorldPosition837_g57854).xz ) );
			float4 tex2DArrayNode50_g57863 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_Linear_Clamp, float3(UV94_g57863,temp_output_84_0_g57863), 0.0 );
			float4 temp_output_17_0_g57867 = tex2DArrayNode50_g57863;
			float4 temp_output_112_19_g57863 = TVE_MotionParams;
			float4 temp_output_3_0_g57867 = temp_output_112_19_g57863;
			float4 ifLocalVar18_g57867 = 0;
			UNITY_BRANCH 
			if( temp_output_19_0_g57867 >= 0.5 )
				ifLocalVar18_g57867 = temp_output_17_0_g57867;
			else
				ifLocalVar18_g57867 = temp_output_3_0_g57867;
			float4 lerpResult22_g57867 = lerp( temp_output_3_0_g57867 , temp_output_17_0_g57867 , temp_output_19_0_g57867);
			#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g57867 = lerpResult22_g57867;
			#else
				float4 staticSwitch24_g57867 = ifLocalVar18_g57867;
			#endif
			float4 break322_g75259 = staticSwitch24_g57867;
			float lerpResult457_g75259 = lerp( break322_g75259.z , TVE_WindEditor.z , TVE_WindEditor.w);
			float temp_output_459_0_g75259 = ( 1.0 - lerpResult457_g75259 );
			half Global_Wind_Power614_g57854 = ( 1.0 - ( temp_output_459_0_g75259 * temp_output_459_0_g75259 ) );
			float temp_output_888_0_g57854 = ( 1.0 - Global_Wind_Power614_g57854 );
			float2 lerpResult890_g57854 = lerp( Global_Noise_WS891_g57854 , Global_Wind_DirectionWS852_g57854 , ( ( 1.0 - ( temp_output_888_0_g57854 * temp_output_888_0_g57854 ) ) * 0.8 ));
			half Motion_Bending617_g57854 = ( TVE_DetailMotionAmplitude_10 * TVE_MotionValue_10 );
			float2 appendResult433_g75259 = (float2(break322_g75259.x , break322_g75259.y));
			float2 temp_output_436_0_g75259 = (appendResult433_g75259*2.0 + -1.0);
			half2 Global_React_DirectionWS911_g57854 = temp_output_436_0_g75259;
			half Global_React_Mask611_g57854 = ( break322_g75259.w * break322_g75259.w * break322_g75259.w * break322_g75259.w );
			float2 lerpResult234_g57854 = lerp( ( lerpResult890_g57854 * Motion_Bending617_g57854 * Global_Wind_Power614_g57854 ) , ( TVE_DetailInteractionAmplitude * Global_React_DirectionWS911_g57854 ) , saturate( ( TVE_DetailInteractionAmplitude * Global_React_Mask611_g57854 ) ));
			float2 break130_g57854 = ( lerpResult234_g57854 * v.color.a );
			half Motion_X178_g57854 = break130_g57854.x;
			half Motion_Z175_g57854 = break130_g57854.y;
			float3 appendResult385_g57854 = (float3(Motion_X178_g57854 , 0.0 , Motion_Z175_g57854));
			half3 Input_Position500_g74631 = WorldPosition_Shifted923_g57854;
			half Input_MotionScale321_g74631 = TVE_DetailMotionScale_32;
			half Input_MotionVariation330_g74631 = 0.0;
			half Input_GlobalVariation372_g74631 = 0.0;
			float lerpResult128_g74632 = lerp( _Time.y , ( ( _Time.y * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
			half Input_MotionSpeed62_g74631 = TVE_DetailMotionSpeed_32;
			float4 tex2DNode460_g74631 = SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( ( (Input_Position500_g74631).xz * Input_MotionScale321_g74631 * 0.03 ) + ( Input_MotionVariation330_g74631 * Input_GlobalVariation372_g74631 ) + ( lerpResult128_g74632 * Input_MotionSpeed62_g74631 * 0.02 ) ), 0.0 );
			float3 appendResult462_g74631 = (float3(tex2DNode460_g74631.r , tex2DNode460_g74631.g , tex2DNode460_g74631.b));
			half3 Flutter_Texture489_g74631 = (appendResult462_g74631*2.0 + -1.0);
			float temp_output_7_0_g57862 = TVE_MotionFadeEnd;
			float temp_output_10_0_g57862 = ( TVE_MotionFadeStart - temp_output_7_0_g57862 );
			half Wind_FadeOut822_g57854 = saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g57862 ) / ( temp_output_10_0_g57862 + 0.0001 ) ) );
			half Input_MotionAmplitude58_g74631 = ( TVE_DetailMotionAmplitude_32 * Wind_FadeOut822_g57854 );
			half Input_MeshMotion_30374_g74631 = v.color.a;
			half Input_GlobalWind471_g74631 = Global_Wind_Power614_g57854;
			half Global_MotionValue503_g74631 = TVE_MotionValue_30;
			float4 break638_g75261 = abs( Noise_Complex703_g75261 );
			half Global_Noise_B69_g57854 = break638_g75261.b;
			half Input_GlobalNoise472_g74631 = Global_Noise_B69_g57854;
			float lerpResult466_g74631 = lerp( 2.4 , 0.6 , Input_GlobalWind471_g74631);
			half Flutter_Amplitude491_g74631 = ( Input_MotionAmplitude58_g74631 * Input_MeshMotion_30374_g74631 * Input_GlobalWind471_g74631 * Global_MotionValue503_g74631 * pow( Input_GlobalNoise472_g74631 , lerpResult466_g74631 ) );
			half3 Motion_Flutter122_g57854 = ( Flutter_Texture489_g74631 * Flutter_Amplitude491_g74631 );
			float3 ase_worldViewDir = normalize( UnityWorldSpaceViewDir( ase_worldPos ) );
			float3 normalizeResult918_g57854 = normalize( ase_worldViewDir );
			float3 ViewDirection916_g57854 = normalizeResult918_g57854;
			float3 break719_g57854 = cross( ViewDirection916_g57854 , half3(0,1,0) );
			float3 appendResult715_g57854 = (float3(-break719_g57854.z , 0.0 , break719_g57854.x));
			float3 appendResult702_g57854 = (float3(frac( ase_vertex3Pos.x ) , 0.5 , frac( ase_vertex3Pos.z )));
			float dotResult732_g57854 = dot( ViewDirection916_g57854 , float3(0,1,0) );
			half Mask_HView731_g57854 = abs( dotResult732_g57854 );
			float saferPower704_g57854 = abs( Mask_HView731_g57854 );
			half3 Perspective_Correction699_g57854 = ( ( ( appendResult715_g57854 * TVE_DetailPerspectivePush ) + ( (appendResult702_g57854*2.0 + -1.0) * TVE_DetailPerspectiveNoise ) ) * v.color.a * pow( saferPower704_g57854 , TVE_DetailPerspectiveAngle ) );
			v.vertex.xyz = ( ( ase_vertex3Pos + appendResult385_g57854 + Motion_Flutter122_g57854 ) + Perspective_Correction699_g57854 );
			v.vertex.w = 1;
			half Global_Noise_A868_g57854 = break638_g75261.a;
			o.vertexToFrag11_g74642 = ( Global_Noise_A868_g57854 * Global_Wind_Power614_g57854 * Wind_FadeOut822_g57854 * v.color.a );
			float3 TerrainData_CameraPos482_g57854 = (_CameraPosition).xyz;
			half3 Fade_Distance751_g57854 = ( ase_vertex3Pos - TerrainData_CameraPos482_g57854 );
			float temp_output_442_0_g57854 = length( Fade_Distance751_g57854 );
			float TerrainData_DetailDistance433_g57854 = _WaveAndDistance.w;
			float temp_output_7_0_g74638 = TerrainData_DetailDistance433_g57854;
			float temp_output_10_0_g74638 = ( 0.0 - temp_output_7_0_g74638 );
			half Fade_Mask667_g57854 = ( 1.0 - saturate( ( ( ( ( temp_output_442_0_g57854 * temp_output_442_0_g57854 ) * ( 1.0 / TVE_DistanceFadeBias ) ) - temp_output_7_0_g74638 ) / ( temp_output_10_0_g74638 + 0.0001 ) ) ) );
			o.vertexToFrag762_g57854 = Fade_Mask667_g57854;
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_MainTex413_g57854 = i.uv_texcoord;
			float4 tex2DNode413_g57854 = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, uv_MainTex413_g57854 );
			half3 MainTex_RGB579_g57854 = (tex2DNode413_g57854).rgb;
			half3 Highlight_Tint685_g57854 = ( ( (TVE_DetailMotionHighlightColor).rgb * i.vertexToFrag11_g74642 ) + float3( 1,1,1 ) );
			float3 temp_output_412_0_g57854 = ( MainTex_RGB579_g57854 * (i.vertexColor).rgb * _WavingTint * Highlight_Tint685_g57854 );
			float dotResult797_g57854 = dot( temp_output_412_0_g57854 , float3(0.2126,0.7152,0.0722) );
			float3 temp_cast_0 = (dotResult797_g57854).xxx;
			float temp_output_82_0_g57869 = TVE_DetailLayerColors;
			float temp_output_19_0_g57873 = TVE_ColorsUsage[(int)temp_output_82_0_g57869];
			float4 temp_output_91_19_g57869 = TVE_ColorsCoords;
			float3 ase_worldPos = i.worldPos;
			float3 WorldPosition837_g57854 = ase_worldPos;
			half2 UV94_g57869 = ( (temp_output_91_19_g57869).zw + ( (temp_output_91_19_g57869).xy * (WorldPosition837_g57854).xz ) );
			float4 tex2DArrayNode83_g57869 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ColorsTex, sampler_Linear_Clamp, float3(UV94_g57869,temp_output_82_0_g57869), 0.0 );
			float4 temp_output_17_0_g57873 = tex2DArrayNode83_g57869;
			float4 temp_output_92_86_g57869 = TVE_ColorsParams;
			float4 temp_output_3_0_g57873 = temp_output_92_86_g57869;
			float4 ifLocalVar18_g57873 = 0;
			UNITY_BRANCH 
			if( temp_output_19_0_g57873 >= 0.5 )
				ifLocalVar18_g57873 = temp_output_17_0_g57873;
			else
				ifLocalVar18_g57873 = temp_output_3_0_g57873;
			float4 lerpResult22_g57873 = lerp( temp_output_3_0_g57873 , temp_output_17_0_g57873 , temp_output_19_0_g57873);
			#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g57873 = lerpResult22_g57873;
			#else
				float4 staticSwitch24_g57873 = ifLocalVar18_g57873;
			#endif
			float4 temp_output_346_0_g74629 = staticSwitch24_g57873;
			half Global_ColorsTex_A65_g57854 = saturate( (temp_output_346_0_g74629).w );
			half Global_Colors_Influence804_g57854 = Global_ColorsTex_A65_g57854;
			float3 lerpResult798_g57854 = lerp( temp_output_412_0_g57854 , temp_cast_0 , Global_Colors_Influence804_g57854);
			half3 Global_ColorsTex_RGB66_g57854 = (temp_output_346_0_g74629).xyz;
			#ifdef UNITY_COLORSPACE_GAMMA
				float staticSwitch1_g57855 = 2.0;
			#else
				float staticSwitch1_g57855 = 4.594794;
			#endif
			half3 Global_Colors103_g57854 = ( Global_ColorsTex_RGB66_g57854 * staticSwitch1_g57855 );
			float temp_output_7_0_g57874 = TVE_DetailColorsMaskMin;
			float temp_output_10_0_g57874 = ( TVE_DetailColorsMaskMax - temp_output_7_0_g57874 );
			half Global_Colors_Mask819_g57854 = saturate( ( ( ( 1.0 - i.vertexColor.a ) - temp_output_7_0_g57874 ) / ( temp_output_10_0_g57874 + 0.0001 ) ) );
			float3 lerpResult801_g57854 = lerp( temp_output_412_0_g57854 , ( lerpResult798_g57854 * Global_Colors103_g57854 ) , ( TVE_DetailGlobalColors * Global_Colors_Mask819_g57854 ));
			half3 Global_OverlayColor87_g57854 = (TVE_OverlayColor).rgb;
			half MainTex_G786_g57854 = tex2DNode413_g57854.g;
			float temp_output_84_0_g57856 = TVE_DetailLayerExtras;
			float temp_output_19_0_g57860 = TVE_ExtrasUsage[(int)temp_output_84_0_g57856];
			float4 temp_output_93_19_g57856 = TVE_ExtrasCoords;
			half2 UV96_g57856 = ( (temp_output_93_19_g57856).zw + ( (temp_output_93_19_g57856).xy * (WorldPosition837_g57854).xz ) );
			float4 tex2DArrayNode48_g57856 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ExtrasTex, sampler_Linear_Clamp, float3(UV96_g57856,temp_output_84_0_g57856), 0.0 );
			float4 temp_output_17_0_g57860 = tex2DArrayNode48_g57856;
			float4 temp_output_94_85_g57856 = TVE_ExtrasParams;
			float4 temp_output_3_0_g57860 = temp_output_94_85_g57856;
			float4 ifLocalVar18_g57860 = 0;
			UNITY_BRANCH 
			if( temp_output_19_0_g57860 >= 0.5 )
				ifLocalVar18_g57860 = temp_output_17_0_g57860;
			else
				ifLocalVar18_g57860 = temp_output_3_0_g57860;
			float4 lerpResult22_g57860 = lerp( temp_output_3_0_g57860 , temp_output_17_0_g57860 , temp_output_19_0_g57860);
			#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g57860 = lerpResult22_g57860;
			#else
				float4 staticSwitch24_g57860 = ifLocalVar18_g57860;
			#endif
			float4 break456_g74630 = staticSwitch24_g57860;
			half Global_ExtrasTex_B97_g57854 = break456_g74630.z;
			float temp_output_7_0_g75256 = TVE_DetailOverlayMaskMin;
			float temp_output_10_0_g75256 = ( TVE_DetailOverlayMaskMax - temp_output_7_0_g75256 );
			float Overlay_Mask586_g57854 = saturate( ( ( ( ( i.vertexColor.a + MainTex_G786_g57854 ) * Global_ExtrasTex_B97_g57854 * TVE_DetailGlobalOverlay ) - temp_output_7_0_g75256 ) / ( temp_output_10_0_g75256 + 0.0001 ) ) );
			float3 lerpResult493_g57854 = lerp( lerpResult801_g57854 , Global_OverlayColor87_g57854 , Overlay_Mask586_g57854);
			o.Albedo = lerpResult493_g57854;
			half Global_ExtrasTex_G94_g57854 = break456_g74630.y;
			float temp_output_914_0_g57854 = ( 1.0 - Global_ExtrasTex_G94_g57854 );
			o.Smoothness = ( ( 1.0 - ( temp_output_914_0_g57854 * temp_output_914_0_g57854 ) ) * TVE_DetailGlobalWetness );
			o.Alpha = 1;
			half Global_ExtrasTex_A72_g57854 = saturate( break456_g74630.w );
			float lerpResult662_g57854 = lerp( 0.75 , 0.0 , Global_ExtrasTex_A72_g57854);
			float lerpResult802_g57854 = lerp( 0.0 , lerpResult662_g57854 , TVE_DetailGlobalAlpha);
			clip( saturate( ( ( ( tex2DNode413_g57854.a - lerpResult802_g57854 ) - i.vertexToFrag762_g57854 ) - TVE_DetailCutoff ) ) - _Cutoff );
		}

		ENDCG
	}
	Fallback "Diffuse"
}
/*ASEBEGIN
Version=19202
Node;AmplifyShaderEditor.FunctionNode;329;-512,-384;Inherit;False;Compile All Shaders;-1;;44315;e67c8238031dbf04ab79a5d4d63d1b4f;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;330;-256,-384;Inherit;False;Compile Details;-1;;44316;8afbb733ecf2e844f811992b33b036ae;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;0,0;Float;False;True;-1;5;;0;0;Standard;Hidden/TerrainEngine/Details/WavingDoublePass;False;False;False;False;False;False;False;False;False;False;False;False;False;True;False;False;False;False;False;False;False;Off;0;False;;0;False;;False;0;False;;0;False;;False;0;Custom;0.5;True;True;0;True;TransparentCutout;;AlphaTest;All;12;all;True;True;True;True;0;False;;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;2;15;10;25;False;0.5;True;0;0;False;;0;False;;0;0;False;;0;False;;0;False;;0;False;;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Absolute;0;;18;-1;-1;-1;0;False;0;0;False;;-1;0;False;;0;0;0;False;0.1;False;;0;False;;True;17;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;16;FLOAT4;0,0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
Node;AmplifyShaderEditor.CommentaryNode;302;-512,-128;Inherit;False;770.392;100;Final;0;;0,1,0.5,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;303;-512,512;Inherit;False;769.438;100;Features;0;;0,1,0.5,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;328;-512,-512;Inherit;False;770.392;100;Internal;0;;1,0,0,1;0;0
Node;AmplifyShaderEditor.FunctionNode;332;-512,0;Inherit;False;Base Detail;0;;57854;3cf1ef10a81a8a341aef45911c04a700;4,626,0,588,0,570,0,696,0;0;4;FLOAT3;415;FLOAT;508;FLOAT;417;FLOAT3;331
Node;AmplifyShaderEditor.FunctionNode;333;-512,640;Inherit;False;Define Pipeline Standard;-1;;75268;9af03ae8defe78d448ef2a4ef3601e12;0;0;1;FLOAT;529
WireConnection;0;0;332;415
WireConnection;0;4;332;508
WireConnection;0;10;332;417
WireConnection;0;11;332;331
ASEEND*/
//CHKSM=17B523EB08DB1D2A709A6E10BC9FC4D9A3D9D7F3
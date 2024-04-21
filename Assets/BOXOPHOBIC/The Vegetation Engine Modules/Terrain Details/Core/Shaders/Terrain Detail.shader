// Made with Amplify Shader Editor v1.9.2.2
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Hidden/TerrainEngine/Details/Vertexlit"
{
	Properties
	{
		[HideInInspector]_CameraPosition("_CameraPosition", Vector) = (0,0,0,0)
		[HideInInspector]_WaveAndDistance("_WaveAndDistance", Vector) = (0,0,0,0)
		_WavingTint("_WavingTint", Vector) = (0,0,0,0)
		[HideInInspector][NoScaleOffset]_MainTex("_MainTex", 2D) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGINCLUDE
		#include "UnityPBSLighting.cginc"
		#include "Lighting.cginc"
		#pragma target 4.5
		#define THE_VEGETATION_ENGINE
		#define TVE_IS_STANDARD_PIPELINE
		#define ASE_USING_SAMPLING_MACROS 1
		#if defined(SHADER_API_D3D11) || defined(SHADER_API_XBOXONE) || defined(UNITY_COMPILER_HLSLCC) || defined(SHADER_API_PSSL) || (defined(SHADER_TARGET_SURFACE_ANALYSIS) && !defined(SHADER_TARGET_SURFACE_ANALYSIS_MOJOSHADER))//ASE Sampler Macros
		#define SAMPLE_TEXTURE2D(tex,samplerTex,coord) tex.Sample(samplerTex,coord)
		#define SAMPLE_TEXTURE2D_ARRAY_LOD(tex,samplerTex,coord,lod) tex.SampleLevel(samplerTex,coord, lod)
		#else//ASE Sampling Macros
		#define SAMPLE_TEXTURE2D(tex,samplerTex,coord) tex2D(tex,coord)
		#define SAMPLE_TEXTURE2D_ARRAY_LOD(tex,samplertex,coord,lod) tex2DArraylod(tex, float4(coord,lod))
		#endif//ASE Sampling Macros

		struct Input
		{
			float2 uv_texcoord;
			float4 vertexColor : COLOR;
			float3 worldNormal;
			float3 worldPos;
		};

		uniform float4 _WaveAndDistance;
		uniform float4 _CameraPosition;
		uniform half TVE_DetailInteractionAmplitude;
		uniform float TVE_DistanceFadeBias;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_MainTex);
		SamplerState sampler_MainTex;
		uniform float3 _WavingTint;
		uniform half4 TVE_OverlayColor;
		uniform half TVE_DetailLayerExtras;
		uniform float TVE_ExtrasUsage[10];
		UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_ExtrasTex);
		uniform half4 TVE_ExtrasCoords;
		SamplerState sampler_Linear_Clamp;
		uniform half4 TVE_ExtrasParams;
		uniform float TVE_DetailGlobalOverlay;
		uniform float TVE_DetailOverlayMaskMin;
		uniform float TVE_DetailOverlayMaskMax;
		uniform half TVE_DetailGlobalWetness;

		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float3 ase_vertex3Pos = v.vertex.xyz;
			float3 TerrainData_CameraPos482_g57857 = (_CameraPosition).xyz;
			half3 Fade_Distance751_g57857 = ( ase_vertex3Pos - TerrainData_CameraPos482_g57857 );
			float temp_output_442_0_g57857 = length( Fade_Distance751_g57857 );
			float TerrainData_DetailDistance433_g57857 = _WaveAndDistance.w;
			float temp_output_7_0_g74638 = TerrainData_DetailDistance433_g57857;
			float temp_output_10_0_g74638 = ( 0.0 - temp_output_7_0_g74638 );
			half Fade_Mask667_g57857 = ( 1.0 - saturate( ( ( ( ( temp_output_442_0_g57857 * temp_output_442_0_g57857 ) * ( 1.0 / TVE_DistanceFadeBias ) ) - temp_output_7_0_g74638 ) / ( temp_output_10_0_g74638 + 0.0001 ) ) ) );
			float3 appendResult768_g57857 = (float3(0.0 , Fade_Mask667_g57857 , 0.0));
			v.vertex.xyz = ( ase_vertex3Pos - appendResult768_g57857 );
			v.vertex.w = 1;
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_MainTex413_g57857 = i.uv_texcoord;
			float4 tex2DNode413_g57857 = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, uv_MainTex413_g57857 );
			half3 MainTex_RGB579_g57857 = (tex2DNode413_g57857).rgb;
			half3 Highlight_Tint685_g57857 = half3(1,1,1);
			float3 temp_output_412_0_g57857 = ( MainTex_RGB579_g57857 * (i.vertexColor).rgb * _WavingTint * Highlight_Tint685_g57857 );
			half3 Global_OverlayColor87_g57857 = (TVE_OverlayColor).rgb;
			float3 ase_worldNormal = i.worldNormal;
			half MainTex_G786_g57857 = tex2DNode413_g57857.g;
			float temp_output_84_0_g57859 = TVE_DetailLayerExtras;
			float temp_output_19_0_g57863 = TVE_ExtrasUsage[(int)temp_output_84_0_g57859];
			float4 temp_output_93_19_g57859 = TVE_ExtrasCoords;
			float3 ase_worldPos = i.worldPos;
			float3 WorldPosition837_g57857 = ase_worldPos;
			half2 UV96_g57859 = ( (temp_output_93_19_g57859).zw + ( (temp_output_93_19_g57859).xy * (WorldPosition837_g57857).xz ) );
			float4 tex2DArrayNode48_g57859 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ExtrasTex, sampler_Linear_Clamp, float3(UV96_g57859,temp_output_84_0_g57859), 0.0 );
			float4 temp_output_17_0_g57863 = tex2DArrayNode48_g57859;
			float4 temp_output_94_85_g57859 = TVE_ExtrasParams;
			float4 temp_output_3_0_g57863 = temp_output_94_85_g57859;
			float4 ifLocalVar18_g57863 = 0;
			UNITY_BRANCH 
			if( temp_output_19_0_g57863 >= 0.5 )
				ifLocalVar18_g57863 = temp_output_17_0_g57863;
			else
				ifLocalVar18_g57863 = temp_output_3_0_g57863;
			float4 lerpResult22_g57863 = lerp( temp_output_3_0_g57863 , temp_output_17_0_g57863 , temp_output_19_0_g57863);
			#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g57863 = lerpResult22_g57863;
			#else
				float4 staticSwitch24_g57863 = ifLocalVar18_g57863;
			#endif
			float4 break456_g74630 = staticSwitch24_g57863;
			half Global_ExtrasTex_B97_g57857 = break456_g74630.z;
			float temp_output_7_0_g75256 = TVE_DetailOverlayMaskMin;
			float temp_output_10_0_g75256 = ( TVE_DetailOverlayMaskMax - temp_output_7_0_g75256 );
			float Overlay_Mask586_g57857 = saturate( ( ( ( ( saturate( ase_worldNormal.y ) + MainTex_G786_g57857 ) * Global_ExtrasTex_B97_g57857 * TVE_DetailGlobalOverlay ) - temp_output_7_0_g75256 ) / ( temp_output_10_0_g75256 + 0.0001 ) ) );
			float3 lerpResult493_g57857 = lerp( temp_output_412_0_g57857 , Global_OverlayColor87_g57857 , Overlay_Mask586_g57857);
			o.Albedo = lerpResult493_g57857;
			half Global_ExtrasTex_G94_g57857 = break456_g74630.y;
			float temp_output_914_0_g57857 = ( 1.0 - Global_ExtrasTex_G94_g57857 );
			o.Smoothness = ( ( 1.0 - ( temp_output_914_0_g57857 * temp_output_914_0_g57857 ) ) * TVE_DetailGlobalWetness );
			o.Alpha = 1;
		}

		ENDCG
		CGPROGRAM
		#pragma surface surf Standard keepalpha fullforwardshadows vertex:vertexDataFunc 

		ENDCG
		Pass
		{
			Name "ShadowCaster"
			Tags{ "LightMode" = "ShadowCaster" }
			ZWrite On
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma target 4.5
			#pragma multi_compile_shadowcaster
			#pragma multi_compile UNITY_PASS_SHADOWCASTER
			#pragma skip_variants FOG_LINEAR FOG_EXP FOG_EXP2
			#include "HLSLSupport.cginc"
			#if ( SHADER_API_D3D11 || SHADER_API_GLCORE || SHADER_API_GLES || SHADER_API_GLES3 || SHADER_API_METAL || SHADER_API_VULKAN )
				#define CAN_SKIP_VPOS
			#endif
			#include "UnityCG.cginc"
			#include "Lighting.cginc"
			#include "UnityPBSLighting.cginc"
			struct v2f
			{
				V2F_SHADOW_CASTER;
				float2 customPack1 : TEXCOORD1;
				float3 worldPos : TEXCOORD2;
				float3 worldNormal : TEXCOORD3;
				half4 color : COLOR0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};
			v2f vert( appdata_full v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_INITIALIZE_OUTPUT( v2f, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				Input customInputData;
				vertexDataFunc( v, customInputData );
				float3 worldPos = mul( unity_ObjectToWorld, v.vertex ).xyz;
				half3 worldNormal = UnityObjectToWorldNormal( v.normal );
				o.worldNormal = worldNormal;
				o.customPack1.xy = customInputData.uv_texcoord;
				o.customPack1.xy = v.texcoord;
				o.worldPos = worldPos;
				TRANSFER_SHADOW_CASTER_NORMALOFFSET( o )
				o.color = v.color;
				return o;
			}
			half4 frag( v2f IN
			#if !defined( CAN_SKIP_VPOS )
			, UNITY_VPOS_TYPE vpos : VPOS
			#endif
			) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				Input surfIN;
				UNITY_INITIALIZE_OUTPUT( Input, surfIN );
				surfIN.uv_texcoord = IN.customPack1.xy;
				float3 worldPos = IN.worldPos;
				half3 worldViewDir = normalize( UnityWorldSpaceViewDir( worldPos ) );
				surfIN.worldPos = worldPos;
				surfIN.worldNormal = IN.worldNormal;
				surfIN.vertexColor = IN.color;
				SurfaceOutputStandard o;
				UNITY_INITIALIZE_OUTPUT( SurfaceOutputStandard, o )
				surf( surfIN, o );
				#if defined( CAN_SKIP_VPOS )
				float2 vpos = IN.pos;
				#endif
				SHADOW_CASTER_FRAGMENT( IN )
			}
			ENDCG
		}
	}
	Fallback "Diffuse"
}
/*ASEBEGIN
Version=19202
Node;AmplifyShaderEditor.FunctionNode;117;-512,-384;Inherit;False;Compile All Shaders;-1;;57854;e67c8238031dbf04ab79a5d4d63d1b4f;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;118;-256,-384;Inherit;False;Compile Details;-1;;57855;8afbb733ecf2e844f811992b33b036ae;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;32,0;Float;False;True;-1;5;;0;0;Standard;Hidden/TerrainEngine/Details/Vertexlit;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;;0;False;;False;0;False;;0;False;;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;12;all;True;True;True;True;0;False;;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;2;15;10;25;False;0.5;True;0;0;False;;0;False;;0;0;False;;0;False;;0;False;;0;False;;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Absolute;0;;-1;-1;-1;-1;0;False;0;0;False;;-1;0;False;;0;0;0;False;0.1;False;;0;False;;True;17;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;16;FLOAT4;0,0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
Node;AmplifyShaderEditor.CommentaryNode;86;-512,512;Inherit;False;769.438;100;Features;0;;0,1,0.5,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;85;-512,-128;Inherit;False;770.392;100;Final;0;;0,1,0.5,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;116;-512,-512;Inherit;False;770.392;100;Internal;0;;1,0,0,1;0;0
Node;AmplifyShaderEditor.FunctionNode;119;-512,0;Inherit;False;Base Detail;0;;57857;3cf1ef10a81a8a341aef45911c04a700;4,626,1,588,1,570,1,696,1;0;4;FLOAT3;415;FLOAT;508;FLOAT;417;FLOAT3;331
Node;AmplifyShaderEditor.FunctionNode;120;-512,640;Inherit;False;Define Pipeline Standard;-1;;75268;9af03ae8defe78d448ef2a4ef3601e12;0;0;1;FLOAT;529
WireConnection;0;0;119;415
WireConnection;0;4;119;508
WireConnection;0;11;119;331
ASEEND*/
//CHKSM=B38CE861196D2BEEB019A0938D9EC16C17F5BB07
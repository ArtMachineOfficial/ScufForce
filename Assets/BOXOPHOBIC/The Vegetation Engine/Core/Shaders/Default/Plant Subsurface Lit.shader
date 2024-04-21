// Made with Amplify Shader Editor v1.9.1.5
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BOXOPHOBIC/The Vegetation Engine/Default/Plant Subsurface Lit"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[StyledCategory(Render Settings, 5, 10)]_CategoryRender("[ Category Render ]", Float) = 1
		[Enum(Opaque,0,Transparent,1)]_RenderMode("Render Mode", Float) = 0
		[Enum(Off,0,On,1)]_RenderZWrite("Render ZWrite", Float) = 1
		[Enum(Both,0,Back,1,Front,2)]_RenderCull("Render Faces", Float) = 0
		[Enum(Flip,0,Mirror,1,Same,2)]_RenderNormals("Render Normals", Float) = 0
		[HideInInspector]_RenderQueue("Render Queue", Float) = 0
		[HideInInspector]_RenderPriority("Render Priority", Float) = 0
		[Enum(Off,0,On,1)]_RenderSpecular("Render Specular", Float) = 1
		[Enum(Off,0,On,1)]_RenderDecals("Render Decals", Float) = 0
		[Enum(Off,0,On,1)]_RenderSSR("Render SSR", Float) = 0
		[Space(10)]_RenderDirect("Render Lighting", Range( 0 , 1)) = 1
		_RenderAmbient("Render Ambient", Range( 0 , 1)) = 1
		_RenderShadow("Render Shadow", Range( 0 , 1)) = 1
		[Enum(Off,0,On,1)][Space(10)]_RenderClip("Alpha Clipping", Float) = 1
		[Enum(Off,0,On,1)]_RenderCoverage("Alpha To Mask", Float) = 0
		_AlphaClipValue("Alpha Treshold", Range( 0 , 1)) = 0.5
		[StyledSpace(10)]_SpaceRenderFade("# Space Render Fade", Float) = 0
		[StyledCategory(Global Settings)]_CategoryGlobals("[ Category Globals ]", Float) = 1
		[StyledMessage(Info, Procedural Variation in use. The Variation might not work as expected when switching from one LOD to another., 0, 10)]_MessageGlobalsVariation("# Message Globals Variation", Float) = 0
		[StyledEnum(TVELayers, Default 0 Layer_1 1 Layer_2 2 Layer_3 3 Layer_4 4 Layer_5 5 Layer_6 6 Layer_7 7 Layer_8 8, 0, 0)]_LayerColorsValue("Layer Colors", Float) = 0
		[StyledEnum(TVELayers, Default 0 Layer_1 1 Layer_2 2 Layer_3 3 Layer_4 4 Layer_5 5 Layer_6 6 Layer_7 7 Layer_8 8, 0, 0)]_LayerExtrasValue("Layer Extras", Float) = 0
		[StyledEnum(TVELayers, Default 0 Layer_1 1 Layer_2 2 Layer_3 3 Layer_4 4 Layer_5 5 Layer_6 6 Layer_7 7 Layer_8 8, 0, 0)]_LayerMotionValue("Layer Motion", Float) = 0
		[StyledEnum(TVELayers, Default 0 Layer_1 1 Layer_2 2 Layer_3 3 Layer_4 4 Layer_5 5 Layer_6 6 Layer_7 7 Layer_8 8, 0, 0)]_LayerVertexValue("Layer Vertex", Float) = 0
		[StyledSpace(10)]_SpaceGlobalLayers("# Space Global Layers", Float) = 0
		_GlobalColors("Global Color", Range( 0 , 1)) = 1
		_GlobalAlpha("Global Alpha", Range( 0 , 1)) = 1
		_GlobalOverlay("Global Overlay", Range( 0 , 1)) = 1
		_GlobalWetness("Global Wetness", Range( 0 , 1)) = 1
		_GlobalEmissive("Global Emissive", Range( 0 , 1)) = 1
		_GlobalSize("Global Size Fade", Range( 0 , 1)) = 1
		[StyledSpace(10)]_SpaceGlobalLocals("# Space Global Locals", Float) = 0
		_ColorsVariationValue("Color Variation", Range( 0 , 1)) = 0.5
		_AlphaVariationValue("Alpha Variation", Range( 0 , 1)) = 0.5
		_OverlayVariationValue("Overlay Variation", Range( 0 , 1)) = 0.5
		_OverlayProjectionValue("Overlay Projection", Range( 0 , 1)) = 0.5
		[StyledSpace(10)]_SpaceGlobalOptions("# Space Global Options", Float) = 0
		[StyledToggle]_ColorsPositionMode("Use Pivot Position for Colors", Float) = 0
		[StyledToggle]_ExtrasPositionMode("Use Pivot Position for Extras", Float) = 0
		[StyledCategory(Main Settings)]_CategoryMain("[Category Main ]", Float) = 1
		[StyledMessage(Info, Use the Main Mask remap sliders to control the mask for Global Color__ Gradient Tinting and Subsurface Effect. The mask is stored in Main Mask Blue channel. , 0, 10)]_MessageMainMask("# Message Main Mask", Float) = 0
		[NoScaleOffset][StyledTextureSingleLine]_MainAlbedoTex("Main Albedo", 2D) = "white" {}
		[NoScaleOffset][StyledTextureSingleLine]_MainNormalTex("Main Normal", 2D) = "bump" {}
		[NoScaleOffset][StyledTextureSingleLine]_MainMaskTex("Main Mask", 2D) = "white" {}
		[Space(10)][StyledVector(9)]_MainUVs("Main UVs", Vector) = (1,1,0,0)
		[HDR]_MainColor("Main Color", Color) = (1,1,1,1)
		_MainAlbedoValue("Main Albedo", Range( 0 , 1)) = 1
		_MainNormalValue("Main Normal", Range( -8 , 8)) = 1
		_MainOcclusionValue("Main Occlusion", Range( 0 , 1)) = 0
		_MainSmoothnessValue("Main Smoothness", Range( 0 , 1)) = 0
		[StyledRemapSlider(_MainMaskMinValue, _MainMaskMaxValue, 0, 1, 0, 0)]_MainMaskRemap("Main Mask Remap", Vector) = (0,0,0,0)
		[HideInInspector]_MainMaskMinValue("Main Mask Min", Range( 0 , 1)) = 0
		[HideInInspector]_MainMaskMaxValue("Main Mask Max", Range( 0 , 1)) = 0
		[StyledCategory(Detail Settings)]_CategoryDetail("[ Category Detail ]", Float) = 1
		[StyledMessage(Info, Use the Detail Mask remap sliders to control the mask for Global Color__ Gradient Tinting and Subsurface Effect. The mask is stored in Detail Mask Blue channel., 0, 10)]_MessageSecondMask("# Message Second Mask", Float) = 0
		[Enum(Off,0,On,1)]_DetailMode("Detail Mode", Float) = 0
		[Enum(Overlay,0,Replace,1)]_DetailBlendMode("Detail Blend", Float) = 1
		[Enum(Overlay,0,Replace,1)]_DetailAlphaMode("Detail Alpha", Float) = 1
		[Space(10)][StyledToggle]_DetailFadeMode("Use Global Alpha and Fade", Float) = 0
		[NoScaleOffset][StyledTextureSingleLine]_SecondAlbedoTex("Detail Albedo", 2D) = "white" {}
		[NoScaleOffset][StyledTextureSingleLine]_SecondNormalTex("Detail Normal", 2D) = "bump" {}
		[NoScaleOffset][StyledTextureSingleLine]_SecondMaskTex("Detail Mask", 2D) = "white" {}
		[Enum(Main UVs,0,Detail UVs,1,Planar UVs,2)][Space(10)]_SecondUVsMode("Detail UVs", Float) = 0
		[StyledVector(9)]_SecondUVs("Detail UVs", Vector) = (1,1,0,0)
		[HDR]_SecondColor("Detail Color", Color) = (1,1,1,1)
		_SecondAlbedoValue("Detail Albedo", Range( 0 , 1)) = 1
		_SecondNormalValue("Detail Normal", Range( -8 , 8)) = 1
		_SecondOcclusionValue("Detail Occlusion", Range( 0 , 1)) = 0
		_SecondSmoothnessValue("Detail Smoothness", Range( 0 , 1)) = 0
		[StyledRemapSlider(_SecondMaskMinValue, _SecondMaskMaxValue, 0, 1, 0, 0)]_SecondMaskRemap("Detail Mask Remap", Vector) = (0,0,0,0)
		[HideInInspector]_SecondMaskMinValue("Detail Mask Min", Range( 0 , 1)) = 0
		[HideInInspector]_SecondMaskMaxValue("Detail Mask Max", Range( 0 , 1)) = 0
		_DetailNormalValue("Detail Blend Normals", Range( 0 , 1)) = 1
		[Enum(Vertex Blue,0,Projection,1)][Space(10)]_DetailMeshMode("Detail Object Mode", Float) = 0
		_DetailMeshValue("Detail Object Mask", Range( 0 , 1)) = 1
		[Enum(Main Mask,0,Detail Mask,1)]_DetailMaskMode("Detail Texture Mode", Float) = 0
		_DetailMaskIntensity("Detail Texture Mask", Range( 0 , 1)) = 1
		[StyledRemapSlider(_DetailBlendMinValue, _DetailBlendMaxValue,0,1)]_DetailBlendRemap("Detail Blending Remap", Vector) = (0,0,0,0)
		[HideInInspector]_DetailBlendMinValue("Detail Blend Min", Range( 0 , 1)) = 0.4
		[HideInInspector]_DetailBlendMaxValue("Detail Blend Max", Range( 0 , 1)) = 0.6
		[Space(10)][StyledToggle]_DetailMeshInvertMode("Use Inverted Object Mask", Float) = 0
		[StyledToggle]_DetailMaskInvertMode("Use Inverted Texture Mask", Float) = 0
		[HideInInspector]_second_uvs_mode("_second_uvs_mode", Vector) = (0,0,0,0)
		[StyledCategory(Occlusion Settings)]_CategoryOcclusion("[ Category Occlusion ]", Float) = 1
		[StyledMessage(Info, Use the Occlusion Color for tinting and the Occlusion Alpha as Global Color and Global Overlay mask control. The mask is stored in Vertex Green channel. , 0, 10)]_MessageOcclusion("# Message Occlusion", Float) = 0
		[HDR]_VertexOcclusionColor("Occlusion Color", Color) = (1,1,1,0.5019608)
		[StyledRemapSlider(_VertexOcclusionMinValue, _VertexOcclusionMaxValue, 0, 1, 0, 0)]_VertexOcclusionRemap("Occlusion Remap", Vector) = (0,0,0,0)
		[HideInInspector]_VertexOcclusionMinValue("Occlusion Min", Range( 0 , 1)) = 0
		[HideInInspector]_VertexOcclusionMaxValue("Occlusion Max", Range( 0 , 1)) = 1
		[Space(10)][StyledToggle]_ColorsMaskMode("Use Inverted Mask for Colors", Float) = 0
		[StyledCategory(Gradient Settings)]_CategoryGradient("[ Category Gradient ]", Float) = 1
		[HDR]_GradientColorOne("Gradient Color One", Color) = (1,1,1,1)
		[HDR]_GradientColorTwo("Gradient Color Two", Color) = (1,1,1,1)
		[StyledRemapSlider(_GradientMinValue, _GradientMaxValue, 0, 1)]_GradientMaskRemap("Gradient Mask Remap", Vector) = (0,0,0,0)
		[HideInInspector]_GradientMinValue("Gradient Mask Min", Range( 0 , 1)) = 0
		[HideInInspector]_GradientMaxValue("Gradient Mask Max ", Range( 0 , 1)) = 1
		[StyledCategory(Noise Settings)]_CategoryNoise("[ Category Noise ]", Float) = 1
		[StyledRemapSlider(_NoiseMinValue, _NoiseMaxValue, 0, 1)]_NoiseMaskRemap("Noise Mask Remap", Vector) = (0,0,0,0)
		[StyledCategory(Subsurface Settings)]_CategorySubsurface("[ Category Subsurface ]", Float) = 1
		[StyledMessage(Info, In HDRP__ the Subsurface Color and Power are fake effects used for artistic control. For physically correct subsurface scattering the Power slider need to be set to 0., 0, 10)]_MessageSubsurface("# Message Subsurface", Float) = 0
		[DiffusionProfile]_SubsurfaceDiffusion("Subsurface Diffusion", Float) = 0
		[HideInInspector]_SubsurfaceDiffusion_Asset("Subsurface Diffusion", Vector) = (0,0,0,0)
		[StyledSpace(10)]_SpaceSubsurface("# SpaceSubsurface", Float) = 0
		_SubsurfaceValue("Subsurface Intensity", Range( 0 , 1)) = 1
		[HDR]_SubsurfaceColor("Subsurface Color", Color) = (1,1,1,1)
		_SubsurfaceScatteringValue("Subsurface Power", Range( 0 , 16)) = 2
		_SubsurfaceAngleValue("Subsurface Angle", Range( 1 , 16)) = 8
		_SubsurfaceDirectValue("Subsurface Direct", Range( 0 , 1)) = 1
		_SubsurfaceNormalValue("Subsurface Normal", Range( 0 , 1)) = 0
		_SubsurfaceAmbientValue("Subsurface Ambient", Range( 0 , 1)) = 0.2
		_SubsurfaceShadowValue("Subsurface Shadow", Range( 0 , 1)) = 1
		[StyledCategory(Matcap Settings)]_CategoryMatcap("[ Category Matcap ]", Float) = 1
		[StyledCategory(Rim Light Settings)]_CategoryRimLight("[ Category Rim Light ]", Float) = 1
		[StyledRemapSlider(_RimLightMinValue, _RimLightMaxValue, 0, 1, 0, 0)]_RimLightRemap("Rim Light Remap", Vector) = (0,0,0,0)
		[StyledCategory(Emissive Settings)]_CategoryEmissive("[ Category Emissive]", Float) = 1
		[Enum(Nits,0,EV100,1)]_EmissiveIntensityMode("Emissive Value", Float) = 0
		[Enum(None,0,Any,1,Baked,2,Realtime,3)]_EmissiveFlagMode("Emissive GI", Float) = 0
		[NoScaleOffset][Space(10)][StyledTextureSingleLine]_EmissiveTex("Emissive Texture", 2D) = "white" {}
		[Space(10)][StyledVector(9)]_EmissiveUVs("Emissive UVs", Vector) = (1,1,0,0)
		[HDR]_EmissiveColor("Emissive Color", Color) = (0,0,0,0)
		_EmissiveIntensityValue("Emissive Intensity", Float) = 1
		_EmissivePhaseValue("Emissive Phase", Range( 0 , 1)) = 1
		[HideInInspector]_emissive_intensity_value("_emissive_intensity_value", Float) = 1
		[StyledCategory(Perspective Settings)]_CategoryPerspective("[ Category Perspective ]", Float) = 1
		_PerspectivePushValue("Perspective Push", Range( 0 , 4)) = 0
		_PerspectiveNoiseValue("Perspective Noise", Range( 0 , 4)) = 0
		_PerspectiveAngleValue("Perspective Angle", Range( 0 , 8)) = 1
		[StyledCategory(Size Fade Settings)]_CategorySizeFade("[ Category Size Fade ]", Float) = 1
		_SizeFadeStartValue("Size Fade Start", Range( 0 , 1000)) = 0
		_SizeFadeEndValue("Size Fade End", Range( 0 , 1000)) = 0
		[StyledCategory(Motion Settings)]_CategoryMotion("[ Category Motion ]", Float) = 1
		[StyledMessage(Info, Procedural variation in use. Use the Scale settings if the Variation is splitting the mesh., 0, 10)]_MessageMotionVariation("# Message Motion Variation", Float) = 0
		[HDR]_MotionHighlightColor("Motion Highlight Color", Color) = (0,0,0,0)
		_MotionFacingValue("Motion Direction Mask", Range( 0 , 1)) = 0.5
		[StyledSpace(10)]_SpaceMotionGlobals("# SpaceMotionGlobals", Float) = 0
		_MotionAmplitude_10("Motion Bending", Range( 0 , 2)) = 0.2
		_MotionPosition_10("Motion Rigidity", Range( 0 , 1)) = 0.5
		[IntRange]_MotionSpeed_10("Motion Speed", Range( 0 , 40)) = 2
		_MotionScale_10("Motion Scale", Range( 0 , 20)) = 1
		_MotionVariation_10("Motion Variation", Range( 0 , 20)) = 0
		[Space(10)]_MotionAmplitude_20("Motion Squash", Range( 0 , 2)) = 0.2
		_MotionAmplitude_22("Motion Rolling", Range( 0 , 2)) = 0.2
		[IntRange]_MotionSpeed_20("Motion Speed", Range( 0 , 40)) = 6
		_MotionScale_20("Motion Scale", Range( 0 , 20)) = 3
		_MotionVariation_20("Motion Variation", Range( 0 , 20)) = 0
		[Space(10)]_MotionAmplitude_32("Motion Flutter", Range( 0 , 2)) = 0.2
		[IntRange]_MotionSpeed_32("Motion Speed", Range( 0 , 40)) = 20
		_MotionScale_32("Motion Scale", Range( 0 , 20)) = 10
		_MotionVariation_32("Motion Variation", Range( 0 , 20)) = 0
		[Space(10)]_InteractionAmplitude("Interaction Amplitude", Range( 0 , 2)) = 1
		_InteractionMaskValue("Interaction Use Mask", Range( 0 , 1)) = 0
		[StyledSpace(10)]_SpaceMotionLocals("# SpaceMotionLocals", Float) = 0
		[StyledToggle]_MotionValue_20("Use Branch Motion Settings", Float) = 1
		[ASEEnd][StyledToggle]_MotionValue_30("Use Flutter Motion Settings", Float) = 1
		[HideInInspector][StyledToggle]_VertexPivotMode("Enable Pre Baked Pivots", Float) = 0
		[HideInInspector][StyledToggle]_VertexDataMode("Enable Batching Support", Float) = 0
		[HideInInspector][StyledToggle]_VertexDynamicMode("Enable Dynamic Support", Float) = 0
		[HideInInspector]_render_normals("_render_normals", Vector) = (1,1,1,0)
		[HideInInspector]_Cutoff("Legacy Cutoff", Float) = 0.5
		[HideInInspector]_Color("Legacy Color", Color) = (0,0,0,0)
		[HideInInspector]_MainTex("Legacy MainTex", 2D) = "white" {}
		[HideInInspector]_BumpMap("Legacy BumpMap", 2D) = "white" {}
		[HideInInspector]_MaxBoundsInfo("_MaxBoundsInfo", Vector) = (1,1,1,1)
		[HideInInspector]_ColorsMaskMinValue("_ColorsMaskMinValue", Range( 0 , 1)) = 1
		[HideInInspector]_ColorsMaskMaxValue("_ColorsMaskMaxValue", Range( 0 , 1)) = 0
		[HideInInspector]_DetailTypeMode("_DetailTypeMode", Float) = 2
		[HideInInspector]_DetailCoordMode("_DetailCoordMode", Float) = 0
		[HideInInspector]_DetailOpaqueMode("_DetailOpaqueMode", Float) = 0
		[HideInInspector]_IsTVEShader("_IsTVEShader", Float) = 1
		[HideInInspector]_IsIdentifier("_IsIdentifier", Float) = 0
		[HideInInspector]_IsCollected("_IsCollected", Float) = 0
		[HideInInspector]_IsShared("_IsShared", Float) = 0
		[HideInInspector]_HasEmissive("_HasEmissive", Float) = 0
		[HideInInspector]_HasGradient("_HasGradient", Float) = 0
		[HideInInspector]_HasOcclusion("_HasOcclusion", Float) = 0
		[HideInInspector]_VertexVariationMode("_VertexVariationMode", Float) = 0
		[HideInInspector]_IsVersion("_IsVersion", Float) = 900
		[HideInInspector]_IsCoreShader("_IsCoreShader", Float) = 1
		[HideInInspector]_render_cull("_render_cull", Float) = 0
		[HideInInspector]_render_src("_render_src", Float) = 5
		[HideInInspector]_render_dst("_render_dst", Float) = 10
		[HideInInspector]_render_zw("_render_zw", Float) = 1
		[HideInInspector]_render_coverage("_render_coverage", Float) = 0
		[HideInInspector]_IsSubsurfaceShader("_IsSubsurfaceShader", Float) = 1
		[HideInInspector]_IsPlantShader("_IsPlantShader", Float) = 1


		//_TransmissionShadow( "Transmission Shadow", Range( 0, 1 ) ) = 0.5
		_TransStrength( "Strength", Range( 0, 50 ) ) = 1
		_TransNormal( "Normal Distortion", Range( 0, 1 ) ) = 0.5
		_TransScattering( "Scattering", Range( 1, 50 ) ) = 2
		_TransDirect( "Direct", Range( 0, 1 ) ) = 0.9
		_TransAmbient( "Ambient", Range( 0, 1 ) ) = 0.1
		_TransShadow( "Shadow", Range( 0, 1 ) ) = 0.5
		//_TessPhongStrength( "Tess Phong Strength", Range( 0, 1 ) ) = 0.5
		//_TessValue( "Tess Max Tessellation", Range( 1, 32 ) ) = 16
		//_TessMin( "Tess Min Distance", Float ) = 10
		//_TessMax( "Tess Max Distance", Float ) = 25
		//_TessEdgeLength ( "Tess Edge length", Range( 2, 50 ) ) = 16
		//_TessMaxDisp( "Tess Max Displacement", Float ) = 25

		[HideInInspector][ToggleOff] _SpecularHighlights("Specular Highlights", Float) = 1.0
		[HideInInspector][ToggleOff] _EnvironmentReflections("Environment Reflections", Float) = 1.0
		[HideInInspector][ToggleOff] _ReceiveShadows("Receive Shadows", Float) = 1.0

		[HideInInspector] _QueueOffset("_QueueOffset", Float) = 0
        [HideInInspector] _QueueControl("_QueueControl", Float) = -1

        [HideInInspector][NoScaleOffset] unity_Lightmaps("unity_Lightmaps", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_LightmapsInd("unity_LightmapsInd", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_ShadowMasks("unity_ShadowMasks", 2DArray) = "" {}
	}

	SubShader
	{
		LOD 0

		

		Tags { "RenderPipeline"="UniversalPipeline" "RenderType"="Opaque" "Queue"="Geometry" "UniversalMaterialType"="Lit" }

		Cull [_render_cull]
		ZWrite [_render_zw]
		ZTest LEqual
		Offset 0,0
		AlphaToMask [_render_coverage]

		

		HLSLINCLUDE
		#pragma target 4.5
		#pragma prefer_hlslcc gles
		// ensure rendering platforms toggle list is visible

		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Filtering.hlsl"

		#ifndef ASE_TESS_FUNCS
		#define ASE_TESS_FUNCS
		float4 FixedTess( float tessValue )
		{
			return tessValue;
		}

		float CalcDistanceTessFactor (float4 vertex, float minDist, float maxDist, float tess, float4x4 o2w, float3 cameraPos )
		{
			float3 wpos = mul(o2w,vertex).xyz;
			float dist = distance (wpos, cameraPos);
			float f = clamp(1.0 - (dist - minDist) / (maxDist - minDist), 0.01, 1.0) * tess;
			return f;
		}

		float4 CalcTriEdgeTessFactors (float3 triVertexFactors)
		{
			float4 tess;
			tess.x = 0.5 * (triVertexFactors.y + triVertexFactors.z);
			tess.y = 0.5 * (triVertexFactors.x + triVertexFactors.z);
			tess.z = 0.5 * (triVertexFactors.x + triVertexFactors.y);
			tess.w = (triVertexFactors.x + triVertexFactors.y + triVertexFactors.z) / 3.0f;
			return tess;
		}

		float CalcEdgeTessFactor (float3 wpos0, float3 wpos1, float edgeLen, float3 cameraPos, float4 scParams )
		{
			float dist = distance (0.5 * (wpos0+wpos1), cameraPos);
			float len = distance(wpos0, wpos1);
			float f = max(len * scParams.y / (edgeLen * dist), 1.0);
			return f;
		}

		float DistanceFromPlane (float3 pos, float4 plane)
		{
			float d = dot (float4(pos,1.0f), plane);
			return d;
		}

		bool WorldViewFrustumCull (float3 wpos0, float3 wpos1, float3 wpos2, float cullEps, float4 planes[6] )
		{
			float4 planeTest;
			planeTest.x = (( DistanceFromPlane(wpos0, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[0]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.y = (( DistanceFromPlane(wpos0, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[1]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.z = (( DistanceFromPlane(wpos0, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[2]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.w = (( DistanceFromPlane(wpos0, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[3]) > -cullEps) ? 1.0f : 0.0f );
			return !all (planeTest);
		}

		float4 DistanceBasedTess( float4 v0, float4 v1, float4 v2, float tess, float minDist, float maxDist, float4x4 o2w, float3 cameraPos )
		{
			float3 f;
			f.x = CalcDistanceTessFactor (v0,minDist,maxDist,tess,o2w,cameraPos);
			f.y = CalcDistanceTessFactor (v1,minDist,maxDist,tess,o2w,cameraPos);
			f.z = CalcDistanceTessFactor (v2,minDist,maxDist,tess,o2w,cameraPos);

			return CalcTriEdgeTessFactors (f);
		}

		float4 EdgeLengthBasedTess( float4 v0, float4 v1, float4 v2, float edgeLength, float4x4 o2w, float3 cameraPos, float4 scParams )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;
			tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
			tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
			tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
			tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			return tess;
		}

		float4 EdgeLengthBasedTessCull( float4 v0, float4 v1, float4 v2, float edgeLength, float maxDisplacement, float4x4 o2w, float3 cameraPos, float4 scParams, float4 planes[6] )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;

			if (WorldViewFrustumCull(pos0, pos1, pos2, maxDisplacement, planes))
			{
				tess = 0.0f;
			}
			else
			{
				tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
				tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
				tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
				tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			}
			return tess;
		}
		#endif //ASE_TESS_FUNCS
		ENDHLSL

		
		Pass
		{
			
			Name "Forward"
			Tags { "LightMode"="UniversalForwardOnly" }

			Blend [_render_src] [_render_dst], One Zero
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA

			

			HLSLPROGRAM

			#define _SPECULAR_SETUP 1
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma multi_compile_fragment _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#pragma multi_compile _ DOTS_INSTANCING_ON
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define ASE_TRANSLUCENCY 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140007
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
			#pragma multi_compile_fragment _ _ADDITIONAL_LIGHT_SHADOWS
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BLENDING
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BOX_PROJECTION
			#pragma multi_compile_fragment _ _SHADOWS_SOFT
			#pragma multi_compile_fragment _ _SCREEN_SPACE_OCCLUSION
			#pragma multi_compile_fragment _ _DBUFFER_MRT1 _DBUFFER_MRT2 _DBUFFER_MRT3
			#pragma multi_compile_fragment _ _LIGHT_LAYERS
			#pragma multi_compile_fragment _ _LIGHT_COOKIES
			#pragma multi_compile _ _FORWARD_PLUS
			//#pragma shader_feature_local _RECEIVE_SHADOWS_OFF
			//#pragma shader_feature_local_fragment _SPECULARHIGHLIGHTS_OFF
			//#pragma shader_feature_local_fragment _ENVIRONMENTREFLECTIONS_OFF

			#pragma multi_compile _ LIGHTMAP_SHADOW_MIXING
			#pragma multi_compile _ SHADOWS_SHADOWMASK
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile _ DYNAMICLIGHTMAP_ON
			#pragma multi_compile_fragment _ DEBUG_DISPLAY
			#pragma multi_compile_fragment _ _WRITE_RENDERING_LAYERS

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_FORWARD

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Shadows.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DBuffer.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"

			#if defined(UNITY_INSTANCING_ENABLED) && defined(_TERRAIN_INSTANCED_PERPIXEL_NORMAL)
				#define ENABLE_TERRAIN_PERPIXEL_NORMAL
			#endif

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#pragma shader_feature_local_fragment TVE_FEATURE_CLIP
			#pragma shader_feature_local TVE_FEATURE_BATCHING
			#pragma shader_feature_local_fragment TVE_FEATURE_DETAIL
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_UNIVERSAL_PIPELINE
			#define TVE_IS_PLANT_SHADER
			#define TVE_IS_SUBSURFACE_SHADER
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				float4 lightmapUVOrVertexSH : TEXCOORD0;
				half4 fogFactorAndVertexLight : TEXCOORD1;
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					float4 shadowCoord : TEXCOORD2;
				#endif
				float4 tSpace0 : TEXCOORD3;
				float4 tSpace1 : TEXCOORD4;
				float4 tSpace2 : TEXCOORD5;
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
					float4 screenPos : TEXCOORD6;
				#endif
				#if defined(DYNAMICLIGHTMAP_ON)
					float2 dynamicLightmapUV : TEXCOORD7;
				#endif
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_texcoord9 : TEXCOORD9;
				float4 ase_color : COLOR;
				float4 ase_texcoord10 : TEXCOORD10;
				float4 ase_texcoord11 : TEXCOORD11;
				float3 ase_normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _DetailBlendRemap;
			float4 _GradientMaskRemap;
			half4 _VertexOcclusionRemap;
			half4 _RimLightRemap;
			half4 _MainColor;
			half4 _MainUVs;
			half4 _MotionHighlightColor;
			half4 _EmissiveColor;
			half4 _EmissiveUVs;
			half4 _SecondColor;
			half4 _VertexOcclusionColor;
			half4 _second_uvs_mode;
			float4 _MaxBoundsInfo;
			half4 _SecondUVs;
			half4 _SecondMaskRemap;
			half4 _MainMaskRemap;
			half4 _GradientColorTwo;
			float4 _SubsurfaceDiffusion_Asset;
			float4 _Color;
			float4 _NoiseMaskRemap;
			half4 _SubsurfaceColor;
			half4 _GradientColorOne;
			half3 _render_normals;
			half _SecondAlbedoValue;
			half _DetailMaskIntensity;
			half _DetailMaskMode;
			half _MainAlbedoValue;
			half _DetailBlendMode;
			half _VertexDataMode;
			half _DetailMaskInvertMode;
			half _SizeFadeStartValue;
			half _render_zw;
			half _GlobalSize;
			half _MotionVariation_20;
			half _MotionSpeed_20;
			half _MotionValue_20;
			half _MotionFacingValue;
			half _MotionAmplitude_20;
			half _MotionAmplitude_22;
			float _MotionScale_32;
			half _SizeFadeEndValue;
			float _MotionVariation_32;
			half _MotionValue_30;
			half _MotionAmplitude_32;
			half _PerspectivePushValue;
			half _PerspectiveNoiseValue;
			half _DetailMeshMode;
			half _PerspectiveAngleValue;
			half _LayerVertexValue;
			float _MotionSpeed_32;
			half _DetailMeshInvertMode;
			half _GradientMinValue;
			half _DetailBlendMinValue;
			half _SecondNormalValue;
			half _OverlayProjectionValue;
			half _GlobalWetness;
			half _GlobalEmissive;
			half _EmissivePhaseValue;
			float _emissive_intensity_value;
			half _RenderSpecular;
			half _DetailNormalValue;
			half _MainSmoothnessValue;
			half _MainOcclusionValue;
			half _SecondOcclusionValue;
			half _DetailAlphaMode;
			half _AlphaClipValue;
			half _AlphaVariationValue;
			half _DetailFadeMode;
			half _GlobalAlpha;
			half _SecondSmoothnessValue;
			half _MainNormalValue;
			half _OverlayVariationValue;
			half _ExtrasPositionMode;
			half _DetailBlendMaxValue;
			half _DetailMode;
			half _MotionScale_20;
			half _GradientMaxValue;
			half _MainMaskMinValue;
			half _MainMaskMaxValue;
			half _SecondMaskMinValue;
			half _SecondMaskMaxValue;
			half _VertexOcclusionMinValue;
			half _VertexOcclusionMaxValue;
			half _LayerColorsValue;
			half _ColorsPositionMode;
			half _GlobalColors;
			half _ColorsVariationValue;
			half _ColorsMaskMode;
			half _GlobalOverlay;
			half _LayerExtrasValue;
			half _DetailMeshValue;
			half _InteractionAmplitude;
			float _MotionSpeed_10;
			half _MotionAmplitude_10;
			half _MessageSecondMask;
			half _MessageMotionVariation;
			half _MessageGlobalsVariation;
			half _MessageMainMask;
			half _MessageSubsurface;
			half _IsTVEShader;
			half _IsIdentifier;
			half _MessageOcclusion;
			half _HasOcclusion;
			half _HasEmissive;
			half _VertexVariationMode;
			half _IsCollected;
			half _IsShared;
			half _IsVersion;
			half _RenderCoverage;
			float _EmissiveIntensityValue;
			half _HasGradient;
			half _RenderNormals;
			half _CategoryRender;
			half _RenderMode;
			half _render_coverage;
			half _render_cull;
			half _render_src;
			half _render_dst;
			float _IsPlantShader;
			half _IsSubsurfaceShader;
			float _SubsurfaceDiffusion;
			half _Cutoff;
			half _ColorsMaskMinValue;
			half _ColorsMaskMaxValue;
			half _RenderDecals;
			half _RenderSSR;
			half _RenderZWrite;
			half _RenderClip;
			half _RenderCull;
			half _RenderQueue;
			half _RenderPriority;
			half _DetailTypeMode;
			half _DetailOpaqueMode;
			half _DetailCoordMode;
			half _EmissiveIntensityMode;
			half _SubsurfaceDirectValue;
			half _SubsurfaceAngleValue;
			half _SubsurfaceScatteringValue;
			half _RenderDirect;
			half _CategoryRimLight;
			half _CategoryMatcap;
			half _CategorySubsurface;
			half _CategoryEmissive;
			half _RenderAmbient;
			half _RenderShadow;
			half _IsCoreShader;
			half _VertexPivotMode;
			half _MotionPosition_10;
			float _MotionScale_10;
			half _MotionVariation_10;
			half _VertexDynamicMode;
			half _LayerMotionValue;
			half _SubsurfaceAmbientValue;
			half _InteractionMaskValue;
			half _SubsurfaceShadowValue;
			half _SpaceRenderFade;
			half _EmissiveFlagMode;
			half _SecondUVsMode;
			half _SpaceGlobalLayers;
			half _SpaceGlobalLocals;
			half _SpaceSubsurface;
			half _SpaceMotionLocals;
			half _SpaceMotionGlobals;
			half _SpaceGlobalOptions;
			half _CategoryGlobals;
			half _CategoryMain;
			half _CategoryDetail;
			half _CategoryOcclusion;
			half _CategoryGradient;
			half _CategoryNoise;
			half _CategoryPerspective;
			half _CategorySizeFade;
			half _CategoryMotion;
			half _SubsurfaceNormalValue;
			half _SubsurfaceValue;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			// Property used by ScenePickingPass
			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			// Properties used by SceneSelectionPass
			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(TVE_NoiseTex);
			float3 TVE_WorldOrigin;
			half4 TVE_MotionParams;
			half4 TVE_TimeParams;
			SAMPLER(sampler_Linear_Repeat);
			float TVE_MotionUsage[10];
			TEXTURE2D_ARRAY(TVE_MotionTex);
			half4 TVE_MotionCoords;
			SAMPLER(sampler_Linear_Clamp);
			half TVE_MotionValue_10;
			half TVE_MotionValue_20;
			half TVE_MotionFadeEnd;
			half TVE_MotionFadeStart;
			half TVE_MotionValue_30;
			float TVE_VertexUsage[10];
			TEXTURE2D_ARRAY(TVE_VertexTex);
			half4 TVE_VertexCoords;
			half4 TVE_VertexParams;
			half TVE_DistanceFadeBias;
			half TVE_IsEnabled;
			half _DisableSRPBatcher;
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);
			TEXTURE2D(_SecondAlbedoTex);
			SAMPLER(sampler_SecondAlbedoTex);
			TEXTURE2D(_MainMaskTex);
			TEXTURE2D(_SecondMaskTex);
			float TVE_ColorsUsage[10];
			TEXTURE2D_ARRAY(TVE_ColorsTex);
			half4 TVE_ColorsCoords;
			half4 TVE_ColorsParams;
			half4 TVE_OverlayColor;
			float TVE_ExtrasUsage[10];
			TEXTURE2D_ARRAY(TVE_ExtrasTex);
			half4 TVE_ExtrasCoords;
			half4 TVE_ExtrasParams;
			TEXTURE2D(_MainNormalTex);
			TEXTURE2D(_SecondNormalTex);
			half TVE_WetnessContrast;
			half TVE_OverlayNormalValue;
			half TVE_WetnessNormalValue;
			TEXTURE2D(_EmissiveTex);
			half TVE_OverlaySmoothness;
			half TVE_SubsurfaceValue;
			half TVE_OverlaySubsurface;


			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/PBRForwardPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			float2 DecodeFloatToVector2( float enc )
			{
				float2 result ;
				result.y = enc % 2048;
				result.x = floor(enc / 2048);
				return result / (2048 - 1);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 VertexPosition3588_g76959 = v.vertex.xyz;
				float3 appendResult60_g76970 = (float3(v.ase_texcoord3.x , v.ase_texcoord3.z , v.ase_texcoord3.y));
				half3 Mesh_PivotsData2831_g76959 = ( appendResult60_g76970 * _VertexPivotMode );
				half3 Mesh_PivotsOS2291_g76959 = Mesh_PivotsData2831_g76959;
				float3 temp_output_2283_0_g76959 = ( VertexPosition3588_g76959 - Mesh_PivotsOS2291_g76959 );
				half3 VertexPos40_g77080 = temp_output_2283_0_g76959;
				half3 VertexPos40_g77081 = VertexPos40_g77080;
				float3 appendResult74_g77081 = (float3(VertexPos40_g77081.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g77081 = appendResult74_g77081;
				float3 break84_g77081 = VertexPos40_g77081;
				float3 appendResult81_g77081 = (float3(0.0 , break84_g77081.y , break84_g77081.z));
				half3 VertexPosOtherAxis82_g77081 = appendResult81_g77081;
				float3 ase_worldPos = TransformObjectToWorld( (v.vertex).xyz );
				float3 vertexToFrag3890_g76959 = ase_worldPos;
				float3 WorldPosition3905_g76959 = vertexToFrag3890_g76959;
				float3 WorldPosition_Shifted7477_g76959 = ( WorldPosition3905_g76959 - TVE_WorldOrigin );
				float4x4 break19_g77047 = GetObjectToWorldMatrix();
				float3 appendResult20_g77047 = (float3(break19_g77047[ 0 ][ 3 ] , break19_g77047[ 1 ][ 3 ] , break19_g77047[ 2 ][ 3 ]));
				float3 temp_output_122_0_g77047 = Mesh_PivotsData2831_g76959;
				float3 PivotsOnly105_g77047 = (mul( GetObjectToWorldMatrix(), float4( temp_output_122_0_g77047 , 0.0 ) ).xyz).xyz;
				half3 ObjectData20_g77049 = ( appendResult20_g77047 + PivotsOnly105_g77047 );
				half3 WorldData19_g77049 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g77049 = WorldData19_g77049;
				#else
				float3 staticSwitch14_g77049 = ObjectData20_g77049;
				#endif
				float3 temp_output_114_0_g77047 = staticSwitch14_g77049;
				float3 vertexToFrag4224_g76959 = temp_output_114_0_g77047;
				float3 ObjectPosition4223_g76959 = vertexToFrag4224_g76959;
				float3 ObjectPosition_Shifted7481_g76959 = ( ObjectPosition4223_g76959 - TVE_WorldOrigin );
				float3 lerpResult6766_g76959 = lerp( WorldPosition_Shifted7477_g76959 , ObjectPosition_Shifted7481_g76959 , _MotionPosition_10);
				float3 Motion_10_Position6738_g76959 = lerpResult6766_g76959;
				half3 Input_Position419_g77065 = Motion_10_Position6738_g76959;
				float Input_MotionScale287_g77065 = ( _MotionScale_10 + 0.2 );
				float2 temp_output_597_0_g77065 = (( Input_Position419_g77065 * Input_MotionScale287_g77065 * 0.0075 )).xz;
				float2 temp_output_447_0_g76964 = ((TVE_MotionParams).xy*2.0 + -1.0);
				half2 Global_Wind_DirectionWS4683_g76959 = temp_output_447_0_g76964;
				half2 Input_DirectionWS423_g77065 = Global_Wind_DirectionWS4683_g76959;
				float lerpResult115_g77066 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g77065 = _MotionSpeed_10;
				half Input_MotionVariation284_g77065 = _MotionVariation_10;
				half3 Input_Position167_g77037 = ObjectPosition_Shifted7481_g76959;
				float dotResult156_g77037 = dot( (Input_Position167_g77037).xz , float2( 12.9898,78.233 ) );
				half Vertex_DynamicMode5112_g76959 = _VertexDynamicMode;
				half Input_DynamicMode120_g77037 = Vertex_DynamicMode5112_g76959;
				float Postion_Random162_g77037 = ( sin( dotResult156_g77037 ) * ( 1.0 - Input_DynamicMode120_g77037 ) );
				float Mesh_Variation16_g76959 = v.ase_color.r;
				half Input_Variation124_g77037 = Mesh_Variation16_g76959;
				half ObjectData20_g77039 = frac( ( Postion_Random162_g77037 + Input_Variation124_g77037 ) );
				half WorldData19_g77039 = Input_Variation124_g77037;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g77039 = WorldData19_g77039;
				#else
				float staticSwitch14_g77039 = ObjectData20_g77039;
				#endif
				float clampResult17_g77041 = clamp( staticSwitch14_g77039 , 0.0001 , 0.9999 );
				float Global_MeshVariation5104_g76959 = clampResult17_g77041;
				half Input_GlobalMeshVariation569_g77065 = Global_MeshVariation5104_g76959;
				float temp_output_630_0_g77065 = ( ( ( lerpResult115_g77066 * Input_MotionSpeed62_g77065 ) + ( Input_MotionVariation284_g77065 * Input_GlobalMeshVariation569_g77065 ) ) * 0.03 );
				float temp_output_607_0_g77065 = frac( temp_output_630_0_g77065 );
				float4 lerpResult590_g77065 = lerp( SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g77065 + ( -Input_DirectionWS423_g77065 * temp_output_607_0_g77065 ) ), 0.0 ) , SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g77065 + ( -Input_DirectionWS423_g77065 * frac( ( temp_output_630_0_g77065 + 0.5 ) ) ) ), 0.0 ) , ( abs( ( temp_output_607_0_g77065 - 0.5 ) ) / 0.5 ));
				half4 Noise_Complex703_g77065 = lerpResult590_g77065;
				float2 temp_output_645_0_g77065 = ((Noise_Complex703_g77065).rg*2.0 + -1.0);
				float2 break650_g77065 = temp_output_645_0_g77065;
				float3 appendResult649_g77065 = (float3(break650_g77065.x , 0.0 , break650_g77065.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Global_Noise_OS5548_g76959 = (( mul( GetWorldToObjectMatrix(), float4( appendResult649_g77065 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Noise_DirectionOS487_g77073 = Global_Noise_OS5548_g76959;
				float2 break448_g76964 = temp_output_447_0_g76964;
				float3 appendResult452_g76964 = (float3(break448_g76964.x , 0.0 , break448_g76964.y));
				half2 Global_Wind_DirectionOS5692_g76959 = (( mul( GetWorldToObjectMatrix(), float4( appendResult452_g76964 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Wind_DirectionOS458_g77073 = Global_Wind_DirectionOS5692_g76959;
				float temp_output_84_0_g76973 = _LayerMotionValue;
				float temp_output_19_0_g76977 = TVE_MotionUsage[(int)temp_output_84_0_g76973];
				float4 temp_output_91_19_g76973 = TVE_MotionCoords;
				half2 UV94_g76973 = ( (temp_output_91_19_g76973).zw + ( (temp_output_91_19_g76973).xy * (ObjectPosition4223_g76959).xz ) );
				float4 tex2DArrayNode50_g76973 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_Linear_Clamp, UV94_g76973,temp_output_84_0_g76973, 0.0 );
				float4 temp_output_17_0_g76977 = tex2DArrayNode50_g76973;
				float4 temp_output_112_19_g76973 = TVE_MotionParams;
				float4 temp_output_3_0_g76977 = temp_output_112_19_g76973;
				float4 ifLocalVar18_g76977 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76977 >= 0.5 )
				ifLocalVar18_g76977 = temp_output_17_0_g76977;
				else
				ifLocalVar18_g76977 = temp_output_3_0_g76977;
				float4 lerpResult22_g76977 = lerp( temp_output_3_0_g76977 , temp_output_17_0_g76977 , temp_output_19_0_g76977);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76977 = lerpResult22_g76977;
				#else
				float4 staticSwitch24_g76977 = ifLocalVar18_g76977;
				#endif
				half4 Global_Motion_Params3909_g76959 = staticSwitch24_g76977;
				float4 break322_g76964 = Global_Motion_Params3909_g76959;
				half Global_Wind_Power2223_g76959 = break322_g76964.z;
				half Input_WindPower449_g77073 = Global_Wind_Power2223_g76959;
				float temp_output_565_0_g77073 = ( 1.0 - Input_WindPower449_g77073 );
				float2 lerpResult516_g77073 = lerp( Input_Noise_DirectionOS487_g77073 , Input_Wind_DirectionOS458_g77073 , ( ( 1.0 - ( temp_output_565_0_g77073 * temp_output_565_0_g77073 * temp_output_565_0_g77073 ) ) * 0.6 ));
				half Mesh_Height1524_g76959 = v.ase_color.a;
				half Input_MeshHeight388_g77073 = Mesh_Height1524_g76959;
				half ObjectData20_g77074 = Input_MeshHeight388_g77073;
				float enc62_g76967 = v.texcoord.w;
				float2 localDecodeFloatToVector262_g76967 = DecodeFloatToVector2( enc62_g76967 );
				float2 break63_g76967 = ( localDecodeFloatToVector262_g76967 * 100.0 );
				float Bounds_Height5230_g76959 = break63_g76967.x;
				half Input_BoundsHeight390_g77073 = Bounds_Height5230_g76959;
				half WorldData19_g77074 = ( Input_MeshHeight388_g77073 * Input_MeshHeight388_g77073 * Input_BoundsHeight390_g77073 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g77074 = WorldData19_g77074;
				#else
				float staticSwitch14_g77074 = ObjectData20_g77074;
				#endif
				half Final_Motion10_Mask321_g77073 = ( staticSwitch14_g77074 * 2.0 );
				half Motion_10_Amplitude2258_g76959 = _MotionAmplitude_10;
				half Input_BendingAmplitude376_g77073 = Motion_10_Amplitude2258_g76959;
				half Global_MotionValue640_g77073 = TVE_MotionValue_10;
				half2 Final_Bending631_g77073 = ( lerpResult516_g77073 * ( Final_Motion10_Mask321_g77073 * Input_BendingAmplitude376_g77073 * Input_WindPower449_g77073 * Input_WindPower449_g77073 * Global_MotionValue640_g77073 ) );
				float2 appendResult433_g76964 = (float2(break322_g76964.x , break322_g76964.y));
				float2 temp_output_436_0_g76964 = (appendResult433_g76964*2.0 + -1.0);
				float2 break441_g76964 = temp_output_436_0_g76964;
				float3 appendResult440_g76964 = (float3(break441_g76964.x , 0.0 , break441_g76964.y));
				half2 Global_React_DirectionOS39_g76959 = (( mul( GetWorldToObjectMatrix(), float4( appendResult440_g76964 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_React_DirectionOS358_g77073 = Global_React_DirectionOS39_g76959;
				float clampResult17_g77076 = clamp( Input_MeshHeight388_g77073 , 0.0001 , 0.9999 );
				float temp_output_7_0_g77075 = 0.0;
				half Input_InteractionUseMask62_g77073 = _InteractionMaskValue;
				float temp_output_10_0_g77075 = ( Input_InteractionUseMask62_g77073 - temp_output_7_0_g77075 );
				half Final_InteractionRemap594_g77073 = saturate( ( ( clampResult17_g77076 - temp_output_7_0_g77075 ) / ( temp_output_10_0_g77075 + 0.0001 ) ) );
				half ObjectData20_g77077 = Final_InteractionRemap594_g77073;
				half WorldData19_g77077 = ( Final_InteractionRemap594_g77073 * Final_InteractionRemap594_g77073 * Input_BoundsHeight390_g77073 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g77077 = WorldData19_g77077;
				#else
				float staticSwitch14_g77077 = ObjectData20_g77077;
				#endif
				half Final_InteractionMask373_g77073 = ( staticSwitch14_g77077 * 2.0 );
				half Interaction_Amplitude7501_g76959 = _InteractionAmplitude;
				half Input_InteractionAmplitude58_g77073 = Interaction_Amplitude7501_g76959;
				half2 Final_Interaction632_g77073 = ( Input_React_DirectionOS358_g77073 * Final_InteractionMask373_g77073 * Input_InteractionAmplitude58_g77073 );
				half Global_Interaction_Mask66_g76959 = ( break322_g76964.w * break322_g76964.w * break322_g76964.w * break322_g76964.w );
				float Input_InteractionGlobalMask330_g77073 = Global_Interaction_Mask66_g76959;
				half Final_InteractionValue525_g77073 = saturate( ( Input_InteractionAmplitude58_g77073 * Input_InteractionGlobalMask330_g77073 ) );
				float2 lerpResult551_g77073 = lerp( Final_Bending631_g77073 , Final_Interaction632_g77073 , Final_InteractionValue525_g77073);
				float2 break364_g77073 = lerpResult551_g77073;
				float3 appendResult638_g77073 = (float3(break364_g77073.x , 0.0 , break364_g77073.y));
				half3 Motion_10_Interaction7519_g76959 = appendResult638_g77073;
				half3 Angle44_g77080 = Motion_10_Interaction7519_g76959;
				half Angle44_g77081 = (Angle44_g77080).z;
				half3 VertexPos40_g77082 = ( VertexPosRotationAxis50_g77081 + ( VertexPosOtherAxis82_g77081 * cos( Angle44_g77081 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g77081 ) * sin( Angle44_g77081 ) ) );
				float3 appendResult74_g77082 = (float3(0.0 , 0.0 , VertexPos40_g77082.z));
				half3 VertexPosRotationAxis50_g77082 = appendResult74_g77082;
				float3 break84_g77082 = VertexPos40_g77082;
				float3 appendResult81_g77082 = (float3(break84_g77082.x , break84_g77082.y , 0.0));
				half3 VertexPosOtherAxis82_g77082 = appendResult81_g77082;
				half Angle44_g77082 = -(Angle44_g77080).x;
				half3 Input_Position419_g77078 = WorldPosition_Shifted7477_g76959;
				float3 break459_g77078 = Input_Position419_g77078;
				float Sum_Position446_g77078 = ( break459_g77078.x + break459_g77078.y + break459_g77078.z );
				half Input_MotionScale321_g77078 = ( _MotionScale_20 * 0.1 );
				half Input_MotionVariation330_g77078 = _MotionVariation_20;
				half Input_GlobalVariation400_g77078 = Global_MeshVariation5104_g76959;
				float lerpResult115_g77079 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g77078 = _MotionSpeed_20;
				float temp_output_404_0_g77078 = ( lerpResult115_g77079 * Input_MotionSpeed62_g77078 );
				half Motion_SineA450_g77078 = sin( ( ( Sum_Position446_g77078 * Input_MotionScale321_g77078 ) + ( Input_MotionVariation330_g77078 * Input_GlobalVariation400_g77078 ) + temp_output_404_0_g77078 ) );
				half Motion_SineB395_g77078 = sin( ( ( temp_output_404_0_g77078 * 0.6842 ) + ( Sum_Position446_g77078 * Input_MotionScale321_g77078 ) ) );
				half3 Input_Position419_g76971 = VertexPosition3588_g76959;
				float3 normalizeResult518_g76971 = normalize( Input_Position419_g76971 );
				half2 Input_DirectionOS423_g76971 = Global_React_DirectionOS39_g76959;
				float2 break521_g76971 = -Input_DirectionOS423_g76971;
				float3 appendResult522_g76971 = (float3(break521_g76971.x , 0.0 , break521_g76971.y));
				float dotResult519_g76971 = dot( normalizeResult518_g76971 , appendResult522_g76971 );
				half Input_Value62_g76971 = _MotionFacingValue;
				float lerpResult524_g76971 = lerp( 1.0 , (dotResult519_g76971*0.5 + 0.5) , Input_Value62_g76971);
				half ObjectData20_g76972 = max( lerpResult524_g76971 , 0.001 );
				half WorldData19_g76972 = 1.0;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76972 = WorldData19_g76972;
				#else
				float staticSwitch14_g76972 = ObjectData20_g76972;
				#endif
				half Motion_FacingMask5214_g76959 = staticSwitch14_g76972;
				half Motion_20_Amplitude4381_g76959 = ( _MotionValue_20 * Motion_FacingMask5214_g76959 );
				half Input_MotionAmplitude384_g77078 = Motion_20_Amplitude4381_g76959;
				half Input_GlobalWind407_g77078 = Global_Wind_Power2223_g76959;
				float4 break638_g77065 = abs( Noise_Complex703_g77065 );
				half Global_Noise_B5526_g76959 = break638_g77065.b;
				half Input_GlobalNoise411_g77078 = Global_Noise_B5526_g76959;
				float lerpResult413_g77078 = lerp( 1.6 , 0.4 , Input_GlobalWind407_g77078);
				half Motion_Amplitude418_g77078 = ( Input_MotionAmplitude384_g77078 * Input_GlobalWind407_g77078 * pow( Input_GlobalNoise411_g77078 , lerpResult413_g77078 ) );
				half Input_Squash58_g77078 = _MotionAmplitude_20;
				float enc59_g76967 = v.texcoord.z;
				float2 localDecodeFloatToVector259_g76967 = DecodeFloatToVector2( enc59_g76967 );
				float2 break61_g76967 = localDecodeFloatToVector259_g76967;
				half Mesh_Motion_2060_g76959 = break61_g76967.x;
				half Input_MeshMotion_20388_g77078 = Mesh_Motion_2060_g76959;
				float Bounds_Radius5231_g76959 = break63_g76967.y;
				half Input_BoundsRadius390_g77078 = Bounds_Radius5231_g76959;
				half Global_MotionValue462_g77078 = TVE_MotionValue_20;
				half2 Input_DirectionOS366_g77078 = Global_React_DirectionOS39_g76959;
				float2 break371_g77078 = Input_DirectionOS366_g77078;
				float3 appendResult372_g77078 = (float3(break371_g77078.x , ( Motion_SineA450_g77078 * 0.3 ) , break371_g77078.y));
				half3 Motion_20_Squash4418_g76959 = ( ( (max( Motion_SineA450_g77078 , Motion_SineB395_g77078 )*0.5 + 0.5) * Motion_Amplitude418_g77078 * Input_Squash58_g77078 * Input_MeshMotion_20388_g77078 * Input_BoundsRadius390_g77078 * Global_MotionValue462_g77078 ) * appendResult372_g77078 );
				half3 VertexPos40_g77057 = ( ( VertexPosRotationAxis50_g77082 + ( VertexPosOtherAxis82_g77082 * cos( Angle44_g77082 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g77082 ) * sin( Angle44_g77082 ) ) ) + Motion_20_Squash4418_g76959 );
				float3 appendResult74_g77057 = (float3(0.0 , VertexPos40_g77057.y , 0.0));
				float3 VertexPosRotationAxis50_g77057 = appendResult74_g77057;
				float3 break84_g77057 = VertexPos40_g77057;
				float3 appendResult81_g77057 = (float3(break84_g77057.x , 0.0 , break84_g77057.z));
				float3 VertexPosOtherAxis82_g77057 = appendResult81_g77057;
				half Input_Rolling379_g77078 = _MotionAmplitude_22;
				half Motion_20_Rolling5257_g76959 = ( Motion_SineA450_g77078 * Motion_Amplitude418_g77078 * Input_Rolling379_g77078 * Input_MeshMotion_20388_g77078 * Global_MotionValue462_g77078 );
				half Angle44_g77057 = Motion_20_Rolling5257_g76959;
				half3 Input_Position500_g77069 = WorldPosition_Shifted7477_g76959;
				half Input_MotionScale321_g77069 = _MotionScale_32;
				half Input_MotionVariation330_g77069 = _MotionVariation_32;
				half Input_GlobalVariation372_g77069 = Global_MeshVariation5104_g76959;
				float lerpResult115_g77072 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g77069 = _MotionSpeed_32;
				float4 tex2DNode460_g77069 = SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( ( (Input_Position500_g77069).xz * Input_MotionScale321_g77069 * 0.03 ) + ( Input_MotionVariation330_g77069 * Input_GlobalVariation372_g77069 ) + ( lerpResult115_g77072 * Input_MotionSpeed62_g77069 * 0.02 ) ), 0.0 );
				float3 appendResult462_g77069 = (float3(tex2DNode460_g77069.r , tex2DNode460_g77069.g , tex2DNode460_g77069.b));
				half3 Flutter_Texture489_g77069 = (appendResult462_g77069*2.0 + -1.0);
				float temp_output_7_0_g77027 = TVE_MotionFadeEnd;
				float temp_output_10_0_g77027 = ( TVE_MotionFadeStart - temp_output_7_0_g77027 );
				half Motion_FadeOut4005_g76959 = saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g77027 ) / ( temp_output_10_0_g77027 + 0.0001 ) ) );
				half Motion_30_Amplitude4960_g76959 = ( _MotionValue_30 * _MotionAmplitude_32 * Motion_FacingMask5214_g76959 * Motion_FadeOut4005_g76959 );
				half Input_MotionAmplitude58_g77069 = Motion_30_Amplitude4960_g76959;
				half Mesh_Motion_30144_g76959 = break61_g76967.y;
				half Input_MeshMotion_30374_g77069 = Mesh_Motion_30144_g76959;
				half Input_GlobalWind471_g77069 = Global_Wind_Power2223_g76959;
				half Global_MotionValue503_g77069 = TVE_MotionValue_30;
				half Input_GlobalNoise472_g77069 = Global_Noise_B5526_g76959;
				float lerpResult466_g77069 = lerp( 2.0 , 0.6 , Input_GlobalWind471_g77069);
				half Flutter_Amplitude491_g77069 = ( Input_MotionAmplitude58_g77069 * Input_MeshMotion_30374_g77069 * Input_GlobalWind471_g77069 * Global_MotionValue503_g77069 * pow( Input_GlobalNoise472_g77069 , lerpResult466_g77069 ) );
				half3 Motion_30_Flutter263_g76959 = ( Flutter_Texture489_g77069 * Flutter_Amplitude491_g77069 );
				float3 Vertex_Motion_Object833_g76959 = ( ( VertexPosRotationAxis50_g77057 + ( VertexPosOtherAxis82_g77057 * cos( Angle44_g77057 ) ) + ( cross( float3(0,1,0) , VertexPosOtherAxis82_g77057 ) * sin( Angle44_g77057 ) ) ) + Motion_30_Flutter263_g76959 );
				half3 ObjectData20_g77062 = Vertex_Motion_Object833_g76959;
				float3 temp_output_3474_0_g76959 = ( VertexPosition3588_g76959 - Mesh_PivotsOS2291_g76959 );
				float3 Vertex_Motion_World1118_g76959 = ( ( ( temp_output_3474_0_g76959 + Motion_10_Interaction7519_g76959 ) + Motion_20_Squash4418_g76959 ) + Motion_30_Flutter263_g76959 );
				half3 WorldData19_g77062 = Vertex_Motion_World1118_g76959;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g77062 = WorldData19_g77062;
				#else
				float3 staticSwitch14_g77062 = ObjectData20_g77062;
				#endif
				float3 temp_output_7495_0_g76959 = staticSwitch14_g77062;
				float3 Vertex_Motion7493_g76959 = temp_output_7495_0_g76959;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 normalizeResult2169_g76959 = normalize( ase_worldViewDir );
				float3 ViewDirection3963_g76959 = normalizeResult2169_g76959;
				float3 break2709_g76959 = cross( ViewDirection3963_g76959 , half3(0,1,0) );
				float3 appendResult2710_g76959 = (float3(-break2709_g76959.z , 0.0 , break2709_g76959.x));
				float3 appendResult2667_g76959 = (float3(Global_MeshVariation5104_g76959 , 0.5 , Global_MeshVariation5104_g76959));
				float dotResult2212_g76959 = dot( ViewDirection3963_g76959 , float3(0,1,0) );
				half Mask_HView2656_g76959 = dotResult2212_g76959;
				float saferPower2652_g76959 = abs( Mask_HView2656_g76959 );
				half3 Grass_Perspective2661_g76959 = ( ( ( mul( GetWorldToObjectMatrix(), float4( appendResult2710_g76959 , 0.0 ) ).xyz * _PerspectivePushValue ) + ( (appendResult2667_g76959*2.0 + -1.0) * _PerspectiveNoiseValue ) ) * Mesh_Height1524_g76959 * pow( saferPower2652_g76959 , _PerspectiveAngleValue ) );
				float temp_output_84_0_g76999 = _LayerVertexValue;
				float temp_output_19_0_g77003 = TVE_VertexUsage[(int)temp_output_84_0_g76999];
				float4 temp_output_94_19_g76999 = TVE_VertexCoords;
				half2 UV97_g76999 = ( (temp_output_94_19_g76999).zw + ( (temp_output_94_19_g76999).xy * (ObjectPosition4223_g76959).xz ) );
				float4 tex2DArrayNode50_g76999 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_VertexTex, sampler_Linear_Clamp, UV97_g76999,temp_output_84_0_g76999, 0.0 );
				float4 temp_output_17_0_g77003 = tex2DArrayNode50_g76999;
				float4 temp_output_111_19_g76999 = TVE_VertexParams;
				float4 temp_output_3_0_g77003 = temp_output_111_19_g76999;
				float4 ifLocalVar18_g77003 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g77003 >= 0.5 )
				ifLocalVar18_g77003 = temp_output_17_0_g77003;
				else
				ifLocalVar18_g77003 = temp_output_3_0_g77003;
				float4 lerpResult22_g77003 = lerp( temp_output_3_0_g77003 , temp_output_17_0_g77003 , temp_output_19_0_g77003);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g77003 = lerpResult22_g77003;
				#else
				float4 staticSwitch24_g77003 = ifLocalVar18_g77003;
				#endif
				half4 Global_Vertex_Params4173_g76959 = staticSwitch24_g77003;
				float4 break322_g77004 = Global_Vertex_Params4173_g76959;
				half Global_VertexSize174_g76959 = saturate( break322_g77004.w );
				float lerpResult346_g76959 = lerp( 1.0 , Global_VertexSize174_g76959 , _GlobalSize);
				float3 appendResult3480_g76959 = (float3(lerpResult346_g76959 , lerpResult346_g76959 , lerpResult346_g76959));
				half3 ObjectData20_g77059 = appendResult3480_g76959;
				half3 _Vector11 = half3(1,1,1);
				half3 WorldData19_g77059 = _Vector11;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g77059 = WorldData19_g77059;
				#else
				float3 staticSwitch14_g77059 = ObjectData20_g77059;
				#endif
				half3 Vertex_Size1741_g76959 = staticSwitch14_g77059;
				float temp_output_7_0_g77060 = _SizeFadeEndValue;
				float temp_output_10_0_g77060 = ( _SizeFadeStartValue - temp_output_7_0_g77060 );
				float temp_output_7453_0_g76959 = saturate( ( ( ( distance( _WorldSpaceCameraPos , ObjectPosition4223_g76959 ) * ( 1.0 / TVE_DistanceFadeBias ) ) - temp_output_7_0_g77060 ) / ( temp_output_10_0_g77060 + 0.0001 ) ) );
				float3 appendResult3482_g76959 = (float3(temp_output_7453_0_g76959 , temp_output_7453_0_g76959 , temp_output_7453_0_g76959));
				half3 ObjectData20_g77058 = appendResult3482_g76959;
				half3 _Vector5 = half3(1,1,1);
				half3 WorldData19_g77058 = _Vector5;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g77058 = WorldData19_g77058;
				#else
				float3 staticSwitch14_g77058 = ObjectData20_g77058;
				#endif
				float3 Vertex_SizeFade1740_g76959 = staticSwitch14_g77058;
				float3 lerpResult16_g77063 = lerp( VertexPosition3588_g76959 , ( ( ( Vertex_Motion7493_g76959 + Grass_Perspective2661_g76959 ) * Vertex_Size1741_g76959 * Vertex_SizeFade1740_g76959 ) + Mesh_PivotsOS2291_g76959 ) , TVE_IsEnabled);
				float3 temp_output_4912_0_g76959 = lerpResult16_g77063;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch4976_g76959 = temp_output_4912_0_g76959;
				#else
				float3 staticSwitch4976_g76959 = temp_output_4912_0_g76959;
				#endif
				float3 temp_output_4918_0_g76959 = ( staticSwitch4976_g76959 + ( _VertexDataMode * 0.0 ) );
				float3 Final_VertexPosition890_g76959 = ( temp_output_4918_0_g76959 + _DisableSRPBatcher );
				
				float4 break33_g76991 = _second_uvs_mode;
				float2 temp_output_30_0_g76991 = ( v.texcoord.xy * break33_g76991.x );
				float2 appendResult21_g76967 = (float2(v.texcoord1.z , v.texcoord1.w));
				float2 Mesh_DetailCoord3_g76959 = appendResult21_g76967;
				float2 temp_output_29_0_g76991 = ( Mesh_DetailCoord3_g76959 * break33_g76991.y );
				float2 temp_output_31_0_g76991 = ( (WorldPosition_Shifted7477_g76959).xz * break33_g76991.z );
				float2 vertexToFrag11_g76990 = ( ( ( temp_output_30_0_g76991 + temp_output_29_0_g76991 + temp_output_31_0_g76991 ) * (_SecondUVs).xy ) + (_SecondUVs).zw );
				o.ase_texcoord9.xy = vertexToFrag11_g76990;
				half Mesh_DetailMask90_g76959 = v.ase_color.b;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				half3 WorldNormal4101_g76959 = normalizedWorldNormal;
				float lerpResult5730_g76959 = lerp( (WorldNormal4101_g76959).y , v.ase_normal.y , Vertex_DynamicMode5112_g76959);
				half WorldNormal_Y6811_g76959 = lerpResult5730_g76959;
				float lerpResult6884_g76959 = lerp( Mesh_DetailMask90_g76959 , (WorldNormal_Y6811_g76959*0.5 + 0.5) , _DetailMeshMode);
				float lerpResult7357_g76959 = lerp( lerpResult6884_g76959 , ( 1.0 - lerpResult6884_g76959 ) , _DetailMeshInvertMode);
				float lerpResult7546_g76959 = lerp( 1.0 , lerpResult7357_g76959 , _DetailMeshValue);
				float vertexToFrag11_g77083 = lerpResult7546_g76959;
				o.ase_texcoord9.z = vertexToFrag11_g77083;
				o.ase_texcoord10.xyz = vertexToFrag3890_g76959;
				o.ase_texcoord11.xyz = vertexToFrag4224_g76959;
				half Global_Noise_A4860_g76959 = break638_g77065.a;
				half Tint_Highlight_Value3231_g76959 = ( Global_Noise_A4860_g76959 * Global_Wind_Power2223_g76959 * Motion_FadeOut4005_g76959 * Mesh_Height1524_g76959 );
				float vertexToFrag11_g77009 = Tint_Highlight_Value3231_g76959;
				o.ase_texcoord9.w = vertexToFrag11_g77009;
				
				o.ase_texcoord8 = v.texcoord;
				o.ase_color = v.ase_color;
				o.ase_normal = v.ase_normal;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord10.w = 0;
				o.ase_texcoord11.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = Final_VertexPosition890_g76959;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif
				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float3 positionVS = TransformWorldToView( positionWS );
				float4 positionCS = TransformWorldToHClip( positionWS );

				VertexNormalInputs normalInput = GetVertexNormalInputs( v.ase_normal, v.ase_tangent );

				o.tSpace0 = float4( normalInput.normalWS, positionWS.x);
				o.tSpace1 = float4( normalInput.tangentWS, positionWS.y);
				o.tSpace2 = float4( normalInput.bitangentWS, positionWS.z);

				#if defined(LIGHTMAP_ON)
					OUTPUT_LIGHTMAP_UV( v.texcoord1, unity_LightmapST, o.lightmapUVOrVertexSH.xy );
				#endif

				#if !defined(LIGHTMAP_ON)
					OUTPUT_SH( normalInput.normalWS.xyz, o.lightmapUVOrVertexSH.xyz );
				#endif

				#if defined(DYNAMICLIGHTMAP_ON)
					o.dynamicLightmapUV.xy = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					o.lightmapUVOrVertexSH.zw = v.texcoord;
					o.lightmapUVOrVertexSH.xy = v.texcoord * unity_LightmapST.xy + unity_LightmapST.zw;
				#endif

				half3 vertexLight = VertexLighting( positionWS, normalInput.normalWS );

				#ifdef ASE_FOG
					half fogFactor = ComputeFogFactor( positionCS.z );
				#else
					half fogFactor = 0;
				#endif

				o.fogFactorAndVertexLight = half4(fogFactor, vertexLight);

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.clipPos = positionCS;

				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
					o.screenPos = ComputeScreenPos(positionCS);
				#endif

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_tangent = v.ase_tangent;
				o.texcoord = v.texcoord;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				o.texcoord = v.texcoord;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				o.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				o.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE)
				#define ASE_SV_DEPTH SV_DepthLessEqual
			#else
				#define ASE_SV_DEPTH SV_Depth
			#endif

			half4 frag ( VertexOutput IN
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						#ifdef _WRITE_RENDERING_LAYERS
						, out float4 outRenderingLayers : SV_Target1
						#endif
						, bool ase_vface : SV_IsFrontFace ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);

				#ifdef LOD_FADE_CROSSFADE
					LODFadeCrossFade( IN.clipPos );
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float2 sampleCoords = (IN.lightmapUVOrVertexSH.zw / _TerrainHeightmapRecipSize.zw + 0.5f) * _TerrainHeightmapRecipSize.xy;
					float3 WorldNormal = TransformObjectToWorldNormal(normalize(SAMPLE_TEXTURE2D(_TerrainNormalmapTexture, sampler_TerrainNormalmapTexture, sampleCoords).rgb * 2 - 1));
					float3 WorldTangent = -cross(GetObjectToWorldMatrix()._13_23_33, WorldNormal);
					float3 WorldBiTangent = cross(WorldNormal, -WorldTangent);
				#else
					float3 WorldNormal = normalize( IN.tSpace0.xyz );
					float3 WorldTangent = IN.tSpace1.xyz;
					float3 WorldBiTangent = IN.tSpace2.xyz;
				#endif

				float3 WorldPosition = float3(IN.tSpace0.w,IN.tSpace1.w,IN.tSpace2.w);
				float3 WorldViewDirection = _WorldSpaceCameraPos.xyz  - WorldPosition;
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
					float4 ScreenPos = IN.screenPos;
				#endif

				float2 NormalizedScreenSpaceUV = GetNormalizedScreenSpaceUV(IN.clipPos);

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					ShadowCoords = IN.shadowCoord;
				#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
				#endif

				WorldViewDirection = SafeNormalize( WorldViewDirection );

				half2 Main_UVs15_g76959 = ( ( IN.ase_texcoord8.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g76959 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g76959 );
				float3 lerpResult6223_g76959 = lerp( float3( 1,1,1 ) , (tex2DNode29_g76959).rgb , _MainAlbedoValue);
				half3 Main_Albedo99_g76959 = ( (_MainColor).rgb * lerpResult6223_g76959 );
				float2 vertexToFrag11_g76990 = IN.ase_texcoord9.xy;
				half2 Second_UVs17_g76959 = vertexToFrag11_g76990;
				float4 tex2DNode89_g76959 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, Second_UVs17_g76959 );
				float3 lerpResult6225_g76959 = lerp( float3( 1,1,1 ) , (tex2DNode89_g76959).rgb , _SecondAlbedoValue);
				half3 Second_Albedo153_g76959 = ( (_SecondColor).rgb * lerpResult6225_g76959 );
				#ifdef UNITY_COLORSPACE_GAMMA
				float staticSwitch1_g77010 = 2.0;
				#else
				float staticSwitch1_g77010 = 4.594794;
				#endif
				float3 lerpResult4834_g76959 = lerp( ( Main_Albedo99_g76959 * Second_Albedo153_g76959 * staticSwitch1_g77010 ) , Second_Albedo153_g76959 , _DetailBlendMode);
				float4 tex2DNode35_g76959 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_Linear_Repeat, Main_UVs15_g76959 );
				half Main_Mask57_g76959 = tex2DNode35_g76959.b;
				float4 tex2DNode33_g76959 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_Linear_Repeat, Second_UVs17_g76959 );
				half Second_Mask81_g76959 = tex2DNode33_g76959.b;
				float lerpResult6885_g76959 = lerp( Main_Mask57_g76959 , Second_Mask81_g76959 , _DetailMaskMode);
				float lerpResult7354_g76959 = lerp( lerpResult6885_g76959 , ( 1.0 - lerpResult6885_g76959 ) , _DetailMaskInvertMode);
				float lerpResult7547_g76959 = lerp( 1.0 , lerpResult7354_g76959 , _DetailMaskIntensity);
				half Blend_Mask_Texture6794_g76959 = lerpResult7547_g76959;
				float vertexToFrag11_g77083 = IN.ase_texcoord9.z;
				half Blend_Mask_Mesh1540_g76959 = vertexToFrag11_g77083;
				float clampResult17_g77023 = clamp( ( Blend_Mask_Texture6794_g76959 * Blend_Mask_Mesh1540_g76959 ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g77032 = _DetailBlendMinValue;
				float temp_output_10_0_g77032 = ( _DetailBlendMaxValue - temp_output_7_0_g77032 );
				half Blend_Mask147_g76959 = ( saturate( ( ( clampResult17_g77023 - temp_output_7_0_g77032 ) / ( temp_output_10_0_g77032 + 0.0001 ) ) ) * _DetailMode );
				float3 lerpResult235_g76959 = lerp( Main_Albedo99_g76959 , lerpResult4834_g76959 , Blend_Mask147_g76959);
				#ifdef TVE_FEATURE_DETAIL
				float3 staticSwitch255_g76959 = lerpResult235_g76959;
				#else
				float3 staticSwitch255_g76959 = Main_Albedo99_g76959;
				#endif
				half3 Blend_Albedo265_g76959 = staticSwitch255_g76959;
				half Mesh_Height1524_g76959 = IN.ase_color.a;
				float temp_output_7_0_g77030 = _GradientMinValue;
				float temp_output_10_0_g77030 = ( _GradientMaxValue - temp_output_7_0_g77030 );
				half Tint_Gradient_Value2784_g76959 = saturate( ( ( Mesh_Height1524_g76959 - temp_output_7_0_g77030 ) / ( temp_output_10_0_g77030 + 0.0001 ) ) );
				float3 lerpResult2779_g76959 = lerp( (_GradientColorTwo).rgb , (_GradientColorOne).rgb , Tint_Gradient_Value2784_g76959);
				float clampResult17_g77025 = clamp( Main_Mask57_g76959 , 0.0001 , 0.9999 );
				float temp_output_7_0_g77028 = _MainMaskMinValue;
				float temp_output_10_0_g77028 = ( _MainMaskMaxValue - temp_output_7_0_g77028 );
				half Main_Mask_Remap5765_g76959 = saturate( ( ( clampResult17_g77025 - temp_output_7_0_g77028 ) / ( temp_output_10_0_g77028 + 0.0001 ) ) );
				float clampResult17_g77024 = clamp( Second_Mask81_g76959 , 0.0001 , 0.9999 );
				float temp_output_7_0_g77029 = _SecondMaskMinValue;
				float temp_output_10_0_g77029 = ( _SecondMaskMaxValue - temp_output_7_0_g77029 );
				half Second_Mask_Remap6130_g76959 = saturate( ( ( clampResult17_g77024 - temp_output_7_0_g77029 ) / ( temp_output_10_0_g77029 + 0.0001 ) ) );
				float lerpResult6617_g76959 = lerp( Main_Mask_Remap5765_g76959 , Second_Mask_Remap6130_g76959 , Blend_Mask147_g76959);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6623_g76959 = lerpResult6617_g76959;
				#else
				float staticSwitch6623_g76959 = Main_Mask_Remap5765_g76959;
				#endif
				half Blend_Mask_Remap6621_g76959 = staticSwitch6623_g76959;
				half Tint_Gradient_Mask6207_g76959 = Blend_Mask_Remap6621_g76959;
				float3 lerpResult6208_g76959 = lerp( float3( 1,1,1 ) , lerpResult2779_g76959 , Tint_Gradient_Mask6207_g76959);
				half3 Tint_Gradient_Color5769_g76959 = lerpResult6208_g76959;
				half3 Tint_Noise_Color5770_g76959 = float3(1,1,1);
				half3 Tint_User_Color7335_g76959 = float3(1,1,1);
				float Mesh_Occlusion318_g76959 = IN.ase_color.g;
				float clampResult17_g77022 = clamp( Mesh_Occlusion318_g76959 , 0.0001 , 0.9999 );
				float temp_output_7_0_g77035 = _VertexOcclusionMinValue;
				float temp_output_10_0_g77035 = ( _VertexOcclusionMaxValue - temp_output_7_0_g77035 );
				half Occlusion_Mask6432_g76959 = saturate( ( ( clampResult17_g77022 - temp_output_7_0_g77035 ) / ( temp_output_10_0_g77035 + 0.0001 ) ) );
				float3 lerpResult2945_g76959 = lerp( (_VertexOcclusionColor).rgb , float3( 1,1,1 ) , Occlusion_Mask6432_g76959);
				half3 Occlusion_Color648_g76959 = lerpResult2945_g76959;
				half3 Matcap_Color7428_g76959 = half3(0,0,0);
				half3 Blend_Albedo_Tinted2808_g76959 = ( ( Blend_Albedo265_g76959 * Tint_Gradient_Color5769_g76959 * Tint_Noise_Color5770_g76959 * Tint_User_Color7335_g76959 * Occlusion_Color648_g76959 ) + Matcap_Color7428_g76959 );
				float3 temp_output_3_0_g77020 = Blend_Albedo_Tinted2808_g76959;
				float dotResult20_g77020 = dot( temp_output_3_0_g77020 , float3(0.2126,0.7152,0.0722) );
				half Blend_Albedo_Grayscale5939_g76959 = dotResult20_g77020;
				float3 temp_cast_0 = (Blend_Albedo_Grayscale5939_g76959).xxx;
				float temp_output_82_0_g76983 = _LayerColorsValue;
				float temp_output_19_0_g76987 = TVE_ColorsUsage[(int)temp_output_82_0_g76983];
				float4 temp_output_91_19_g76983 = TVE_ColorsCoords;
				float3 vertexToFrag3890_g76959 = IN.ase_texcoord10.xyz;
				float3 WorldPosition3905_g76959 = vertexToFrag3890_g76959;
				float3 vertexToFrag4224_g76959 = IN.ase_texcoord11.xyz;
				float3 ObjectPosition4223_g76959 = vertexToFrag4224_g76959;
				float3 lerpResult4822_g76959 = lerp( WorldPosition3905_g76959 , ObjectPosition4223_g76959 , _ColorsPositionMode);
				half2 UV94_g76983 = ( (temp_output_91_19_g76983).zw + ( (temp_output_91_19_g76983).xy * (lerpResult4822_g76959).xz ) );
				float4 tex2DArrayNode83_g76983 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ColorsTex, sampler_Linear_Clamp, UV94_g76983,temp_output_82_0_g76983, 0.0 );
				float4 temp_output_17_0_g76987 = tex2DArrayNode83_g76983;
				float4 temp_output_92_86_g76983 = TVE_ColorsParams;
				float4 temp_output_3_0_g76987 = temp_output_92_86_g76983;
				float4 ifLocalVar18_g76987 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76987 >= 0.5 )
				ifLocalVar18_g76987 = temp_output_17_0_g76987;
				else
				ifLocalVar18_g76987 = temp_output_3_0_g76987;
				float4 lerpResult22_g76987 = lerp( temp_output_3_0_g76987 , temp_output_17_0_g76987 , temp_output_19_0_g76987);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76987 = lerpResult22_g76987;
				#else
				float4 staticSwitch24_g76987 = ifLocalVar18_g76987;
				#endif
				half4 Global_Colors_Params5434_g76959 = staticSwitch24_g76987;
				float4 temp_output_346_0_g76966 = Global_Colors_Params5434_g76959;
				half Global_Colors_A1701_g76959 = saturate( (temp_output_346_0_g76966).w );
				half Colors_Influence3668_g76959 = Global_Colors_A1701_g76959;
				float temp_output_6306_0_g76959 = ( 1.0 - Colors_Influence3668_g76959 );
				float3 lerpResult3618_g76959 = lerp( Blend_Albedo_Tinted2808_g76959 , temp_cast_0 , ( 1.0 - ( temp_output_6306_0_g76959 * temp_output_6306_0_g76959 ) ));
				half3 Global_Colors_RGB1700_g76959 = (temp_output_346_0_g76966).xyz;
				#ifdef UNITY_COLORSPACE_GAMMA
				float staticSwitch1_g77006 = 2.0;
				#else
				float staticSwitch1_g77006 = 4.594794;
				#endif
				half3 Colors_RGB1954_g76959 = ( Global_Colors_RGB1700_g76959 * staticSwitch1_g77006 );
				half Colors_Value3692_g76959 = ( Blend_Mask_Remap6621_g76959 * _GlobalColors );
				float3 ObjectPosition_Shifted7481_g76959 = ( ObjectPosition4223_g76959 - TVE_WorldOrigin );
				half3 Input_Position167_g77037 = ObjectPosition_Shifted7481_g76959;
				float dotResult156_g77037 = dot( (Input_Position167_g77037).xz , float2( 12.9898,78.233 ) );
				half Vertex_DynamicMode5112_g76959 = _VertexDynamicMode;
				half Input_DynamicMode120_g77037 = Vertex_DynamicMode5112_g76959;
				float Postion_Random162_g77037 = ( sin( dotResult156_g77037 ) * ( 1.0 - Input_DynamicMode120_g77037 ) );
				float Mesh_Variation16_g76959 = IN.ase_color.r;
				half Input_Variation124_g77037 = Mesh_Variation16_g76959;
				half ObjectData20_g77039 = frac( ( Postion_Random162_g77037 + Input_Variation124_g77037 ) );
				half WorldData19_g77039 = Input_Variation124_g77037;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g77039 = WorldData19_g77039;
				#else
				float staticSwitch14_g77039 = ObjectData20_g77039;
				#endif
				float clampResult17_g77041 = clamp( staticSwitch14_g77039 , 0.0001 , 0.9999 );
				float Global_MeshVariation5104_g76959 = clampResult17_g77041;
				float lerpResult3870_g76959 = lerp( 1.0 , Global_MeshVariation5104_g76959 , _ColorsVariationValue);
				half Colors_Variation3650_g76959 = lerpResult3870_g76959;
				half Occlusion_Alpha6463_g76959 = _VertexOcclusionColor.a;
				float lerpResult6459_g76959 = lerp( Occlusion_Mask6432_g76959 , ( 1.0 - Occlusion_Mask6432_g76959 ) , _ColorsMaskMode);
				float lerpResult6461_g76959 = lerp( Occlusion_Alpha6463_g76959 , 1.0 , lerpResult6459_g76959);
				half Occlusion_Colors6450_g76959 = lerpResult6461_g76959;
				float3 temp_output_3_0_g77021 = ( Blend_Albedo265_g76959 * Tint_Gradient_Color5769_g76959 * Tint_Noise_Color5770_g76959 * Tint_User_Color7335_g76959 );
				float dotResult20_g77021 = dot( temp_output_3_0_g77021 , float3(0.2126,0.7152,0.0722) );
				float clampResult6740_g76959 = clamp( saturate( ( dotResult20_g77021 * 5.0 ) ) , 0.2 , 1.0 );
				half Blend_Albedo_Globals6410_g76959 = clampResult6740_g76959;
				float temp_output_7_0_g77033 = 0.1;
				float temp_output_10_0_g77033 = ( 0.2 - temp_output_7_0_g77033 );
				float lerpResult16_g77007 = lerp( 0.0 , saturate( ( ( ( Colors_Value3692_g76959 * Colors_Influence3668_g76959 * Colors_Variation3650_g76959 * Occlusion_Colors6450_g76959 * Blend_Albedo_Globals6410_g76959 ) - temp_output_7_0_g77033 ) / ( temp_output_10_0_g77033 + 0.0001 ) ) ) , TVE_IsEnabled);
				float3 lerpResult3628_g76959 = lerp( Blend_Albedo_Tinted2808_g76959 , ( lerpResult3618_g76959 * Colors_RGB1954_g76959 ) , lerpResult16_g77007);
				half3 Blend_Albedo_Colored_High6027_g76959 = lerpResult3628_g76959;
				half3 Blend_Albedo_Colored863_g76959 = Blend_Albedo_Colored_High6027_g76959;
				half3 Global_OverlayColor1758_g76959 = (TVE_OverlayColor).rgb;
				float temp_output_84_0_g76978 = _LayerExtrasValue;
				float temp_output_19_0_g76982 = TVE_ExtrasUsage[(int)temp_output_84_0_g76978];
				float4 temp_output_93_19_g76978 = TVE_ExtrasCoords;
				float3 lerpResult4827_g76959 = lerp( WorldPosition3905_g76959 , ObjectPosition4223_g76959 , _ExtrasPositionMode);
				half2 UV96_g76978 = ( (temp_output_93_19_g76978).zw + ( (temp_output_93_19_g76978).xy * (lerpResult4827_g76959).xz ) );
				float4 tex2DArrayNode48_g76978 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ExtrasTex, sampler_Linear_Clamp, UV96_g76978,temp_output_84_0_g76978, 0.0 );
				float4 temp_output_17_0_g76982 = tex2DArrayNode48_g76978;
				float4 temp_output_94_85_g76978 = TVE_ExtrasParams;
				float4 temp_output_3_0_g76982 = temp_output_94_85_g76978;
				float4 ifLocalVar18_g76982 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76982 >= 0.5 )
				ifLocalVar18_g76982 = temp_output_17_0_g76982;
				else
				ifLocalVar18_g76982 = temp_output_3_0_g76982;
				float4 lerpResult22_g76982 = lerp( temp_output_3_0_g76982 , temp_output_17_0_g76982 , temp_output_19_0_g76982);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76982 = lerpResult22_g76982;
				#else
				float4 staticSwitch24_g76982 = ifLocalVar18_g76982;
				#endif
				half4 Global_Extras_Params5440_g76959 = staticSwitch24_g76982;
				float4 break456_g76996 = Global_Extras_Params5440_g76959;
				half Global_Extras_Overlay156_g76959 = break456_g76996.z;
				float lerpResult1065_g76959 = lerp( 1.0 , Global_MeshVariation5104_g76959 , _OverlayVariationValue);
				half Overlay_Variation4560_g76959 = lerpResult1065_g76959;
				half Overlay_Value5738_g76959 = ( _GlobalOverlay * Global_Extras_Overlay156_g76959 * Overlay_Variation4560_g76959 );
				half4 Normal_Packed45_g76988 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_Linear_Repeat, Main_UVs15_g76959 );
				float2 appendResult58_g76988 = (float2(( (Normal_Packed45_g76988).x * (Normal_Packed45_g76988).w ) , (Normal_Packed45_g76988).y));
				half2 Normal_Default50_g76988 = appendResult58_g76988;
				half2 Normal_ASTC41_g76988 = (Normal_Packed45_g76988).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g76988 = Normal_ASTC41_g76988;
				#else
				float2 staticSwitch38_g76988 = Normal_Default50_g76988;
				#endif
				half2 Normal_NO_DTX544_g76988 = (Normal_Packed45_g76988).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g76988 = Normal_NO_DTX544_g76988;
				#else
				float2 staticSwitch37_g76988 = staticSwitch38_g76988;
				#endif
				float2 temp_output_6555_0_g76959 = ( (staticSwitch37_g76988*2.0 + -1.0) * _MainNormalValue );
				half2 Main_Normal137_g76959 = temp_output_6555_0_g76959;
				float2 lerpResult3372_g76959 = lerp( float2( 0,0 ) , Main_Normal137_g76959 , _DetailNormalValue);
				half4 Normal_Packed45_g76989 = SAMPLE_TEXTURE2D( _SecondNormalTex, sampler_Linear_Repeat, Second_UVs17_g76959 );
				float2 appendResult58_g76989 = (float2(( (Normal_Packed45_g76989).x * (Normal_Packed45_g76989).w ) , (Normal_Packed45_g76989).y));
				half2 Normal_Default50_g76989 = appendResult58_g76989;
				half2 Normal_ASTC41_g76989 = (Normal_Packed45_g76989).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g76989 = Normal_ASTC41_g76989;
				#else
				float2 staticSwitch38_g76989 = Normal_Default50_g76989;
				#endif
				half2 Normal_NO_DTX544_g76989 = (Normal_Packed45_g76989).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g76989 = Normal_NO_DTX544_g76989;
				#else
				float2 staticSwitch37_g76989 = staticSwitch38_g76989;
				#endif
				half2 Second_Normal179_g76959 = ( (staticSwitch37_g76989*2.0 + -1.0) * _SecondNormalValue );
				float2 temp_output_36_0_g77011 = ( lerpResult3372_g76959 + Second_Normal179_g76959 );
				float2 lerpResult3376_g76959 = lerp( Main_Normal137_g76959 , temp_output_36_0_g77011 , Blend_Mask147_g76959);
				#ifdef TVE_FEATURE_DETAIL
				float2 staticSwitch267_g76959 = lerpResult3376_g76959;
				#else
				float2 staticSwitch267_g76959 = Main_Normal137_g76959;
				#endif
				half2 Blend_Normal312_g76959 = staticSwitch267_g76959;
				float3 appendResult7377_g76959 = (float3(Blend_Normal312_g76959 , 1.0));
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 tanNormal7376_g76959 = appendResult7377_g76959;
				float3 worldNormal7376_g76959 = float3(dot(tanToWorld0,tanNormal7376_g76959), dot(tanToWorld1,tanNormal7376_g76959), dot(tanToWorld2,tanNormal7376_g76959));
				half3 Blend_NormalWS7375_g76959 = worldNormal7376_g76959;
				float lerpResult7446_g76959 = lerp( (Blend_NormalWS7375_g76959).y , IN.ase_normal.y , Vertex_DynamicMode5112_g76959);
				float lerpResult6757_g76959 = lerp( 1.0 , saturate( lerpResult7446_g76959 ) , _OverlayProjectionValue);
				half Overlay_Projection6081_g76959 = lerpResult6757_g76959;
				half Overlay_Shading6688_g76959 = Blend_Albedo_Globals6410_g76959;
				half Overlay_Custom6707_g76959 = 1.0;
				float lerpResult6467_g76959 = lerp( Occlusion_Alpha6463_g76959 , 1.0 , Occlusion_Mask6432_g76959);
				half Occlusion_Overlay6471_g76959 = lerpResult6467_g76959;
				float temp_output_7_0_g77031 = 0.1;
				float temp_output_10_0_g77031 = ( 0.2 - temp_output_7_0_g77031 );
				half Overlay_Mask_High6064_g76959 = saturate( ( ( ( Overlay_Value5738_g76959 * Overlay_Projection6081_g76959 * Overlay_Shading6688_g76959 * Overlay_Custom6707_g76959 * Occlusion_Overlay6471_g76959 ) - temp_output_7_0_g77031 ) / ( temp_output_10_0_g77031 + 0.0001 ) ) );
				half Overlay_Mask269_g76959 = Overlay_Mask_High6064_g76959;
				float3 lerpResult336_g76959 = lerp( Blend_Albedo_Colored863_g76959 , Global_OverlayColor1758_g76959 , Overlay_Mask269_g76959);
				half3 Blend_Albedo_Overlay359_g76959 = lerpResult336_g76959;
				half Global_WetnessContrast6502_g76959 = TVE_WetnessContrast;
				half Global_Extras_Wetness305_g76959 = break456_g76996.y;
				half Wetness_Value6343_g76959 = ( Global_Extras_Wetness305_g76959 * _GlobalWetness );
				float3 lerpResult6367_g76959 = lerp( Blend_Albedo_Overlay359_g76959 , ( Blend_Albedo_Overlay359_g76959 * Blend_Albedo_Overlay359_g76959 ) , ( Global_WetnessContrast6502_g76959 * Wetness_Value6343_g76959 ));
				half3 Blend_Albedo_Wetness6351_g76959 = lerpResult6367_g76959;
				float vertexToFrag11_g77009 = IN.ase_texcoord9.w;
				half3 Tint_Highlight_Color5771_g76959 = ( ( (_MotionHighlightColor).rgb * vertexToFrag11_g77009 ) + float3( 1,1,1 ) );
				half Emissive_Dark6993_g76959 = 1.0;
				float3 temp_output_6309_0_g76959 = ( Blend_Albedo_Wetness6351_g76959 * Tint_Highlight_Color5771_g76959 * Emissive_Dark6993_g76959 );
				half3 Blend_Albedo_Subsurface149_g76959 = temp_output_6309_0_g76959;
				half3 Blend_Albedo_RimLight7316_g76959 = Blend_Albedo_Subsurface149_g76959;
				
				half Global_OverlayNormalScale6581_g76959 = TVE_OverlayNormalValue;
				float lerpResult6585_g76959 = lerp( 1.0 , Global_OverlayNormalScale6581_g76959 , Overlay_Mask269_g76959);
				half2 Blend_Normal_Overlay366_g76959 = ( Blend_Normal312_g76959 * lerpResult6585_g76959 );
				half Global_WetnessNormalScale6571_g76959 = TVE_WetnessNormalValue;
				float lerpResult6579_g76959 = lerp( 1.0 , Global_WetnessNormalScale6571_g76959 , ( Wetness_Value6343_g76959 * Wetness_Value6343_g76959 ));
				half2 Blend_Normal_Wetness6372_g76959 = ( Blend_Normal_Overlay366_g76959 * lerpResult6579_g76959 );
				float3 appendResult6568_g76959 = (float3(Blend_Normal_Wetness6372_g76959 , 1.0));
				float3 temp_output_13_0_g76997 = appendResult6568_g76959;
				float3 temp_output_33_0_g76997 = ( temp_output_13_0_g76997 * _render_normals );
				float3 switchResult12_g76997 = (((ase_vface>0)?(temp_output_13_0_g76997):(temp_output_33_0_g76997)));
				
				half3 Emissive_Color7162_g76959 = (_EmissiveColor).rgb;
				half2 Emissive_UVs2468_g76959 = ( ( IN.ase_texcoord8.xy * (_EmissiveUVs).xy ) + (_EmissiveUVs).zw );
				half3 Emissive_Texture7022_g76959 = (SAMPLE_TEXTURE2D( _EmissiveTex, sampler_Linear_Repeat, Emissive_UVs2468_g76959 )).rgb;
				half Global_Extras_Emissive4203_g76959 = break456_g76996.x;
				float lerpResult4206_g76959 = lerp( 1.0 , Global_Extras_Emissive4203_g76959 , _GlobalEmissive);
				half Emissive_Value7024_g76959 = ( lerpResult4206_g76959 * _EmissivePhaseValue );
				half3 Emissive_Constant7189_g76959 = ( Emissive_Texture7022_g76959 * Emissive_Value7024_g76959 );
				half3 Emissive_Mask6968_g76959 = Emissive_Constant7189_g76959;
				float3 temp_output_3_0_g76995 = ( Emissive_Color7162_g76959 * Emissive_Mask6968_g76959 );
				float temp_output_15_0_g76995 = _emissive_intensity_value;
				float3 temp_output_23_0_g76995 = ( temp_output_3_0_g76995 * temp_output_15_0_g76995 );
				half3 Final_Emissive2476_g76959 = temp_output_23_0_g76995;
				
				half Render_Specular4861_g76959 = _RenderSpecular;
				float3 temp_cast_11 = (( 0.04 * Render_Specular4861_g76959 )).xxx;
				
				half Main_Smoothness227_g76959 = ( tex2DNode35_g76959.a * _MainSmoothnessValue );
				half Second_Smoothness236_g76959 = ( tex2DNode33_g76959.a * _SecondSmoothnessValue );
				float lerpResult266_g76959 = lerp( Main_Smoothness227_g76959 , Second_Smoothness236_g76959 , Blend_Mask147_g76959);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch297_g76959 = lerpResult266_g76959;
				#else
				float staticSwitch297_g76959 = Main_Smoothness227_g76959;
				#endif
				half Blend_Smoothness314_g76959 = staticSwitch297_g76959;
				half Global_OverlaySmoothness311_g76959 = TVE_OverlaySmoothness;
				float lerpResult343_g76959 = lerp( Blend_Smoothness314_g76959 , Global_OverlaySmoothness311_g76959 , Overlay_Mask269_g76959);
				half Blend_Smoothness_Overlay371_g76959 = lerpResult343_g76959;
				float temp_output_6499_0_g76959 = ( 1.0 - Wetness_Value6343_g76959 );
				half Blend_Smoothness_Wetness4130_g76959 = saturate( ( Blend_Smoothness_Overlay371_g76959 + ( 1.0 - ( temp_output_6499_0_g76959 * temp_output_6499_0_g76959 ) ) ) );
				
				float lerpResult240_g76959 = lerp( 1.0 , tex2DNode35_g76959.g , _MainOcclusionValue);
				half Main_Occlusion247_g76959 = lerpResult240_g76959;
				float lerpResult239_g76959 = lerp( 1.0 , tex2DNode33_g76959.g , _SecondOcclusionValue);
				half Second_Occlusion251_g76959 = lerpResult239_g76959;
				float lerpResult294_g76959 = lerp( Main_Occlusion247_g76959 , Second_Occlusion251_g76959 , Blend_Mask147_g76959);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch310_g76959 = lerpResult294_g76959;
				#else
				float staticSwitch310_g76959 = Main_Occlusion247_g76959;
				#endif
				half Blend_Occlusion323_g76959 = staticSwitch310_g76959;
				
				float localCustomAlphaClip19_g77017 = ( 0.0 );
				half Main_Alpha316_g76959 = tex2DNode29_g76959.a;
				half Second_Alpha5007_g76959 = tex2DNode89_g76959.a;
				float lerpResult6153_g76959 = lerp( Main_Alpha316_g76959 , Second_Alpha5007_g76959 , Blend_Mask147_g76959);
				float lerpResult6785_g76959 = lerp( ( Main_Alpha316_g76959 * Second_Alpha5007_g76959 ) , lerpResult6153_g76959 , _DetailAlphaMode);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6158_g76959 = lerpResult6785_g76959;
				#else
				float staticSwitch6158_g76959 = Main_Alpha316_g76959;
				#endif
				half Blend_Alpha6157_g76959 = staticSwitch6158_g76959;
				half AlphaTreshold2132_g76959 = _AlphaClipValue;
				half Global_Extras_Alpha1033_g76959 = saturate( break456_g76996.w );
				float lerpResult5154_g76959 = lerp( 0.0 , Global_MeshVariation5104_g76959 , _AlphaVariationValue);
				half Global_Alpha_Variation5158_g76959 = lerpResult5154_g76959;
				float lerpResult6866_g76959 = lerp( ( 1.0 - Blend_Mask147_g76959 ) , 1.0 , _DetailFadeMode);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6612_g76959 = lerpResult6866_g76959;
				#else
				float staticSwitch6612_g76959 = 1.0;
				#endif
				half Blend_Mask_Invert6260_g76959 = staticSwitch6612_g76959;
				half Alpha_Mask6234_g76959 = ( 1.0 * Blend_Mask_Invert6260_g76959 );
				float lerpResult5203_g76959 = lerp( 1.0 , saturate( ( ( Global_Extras_Alpha1033_g76959 - Global_Alpha_Variation5158_g76959 ) + ( Global_Extras_Alpha1033_g76959 * 0.5 ) ) ) , ( Alpha_Mask6234_g76959 * _GlobalAlpha ));
				float lerpResult16_g77012 = lerp( 1.0 , lerpResult5203_g76959 , TVE_IsEnabled);
				half Global_Alpha315_g76959 = lerpResult16_g77012;
				half Fade_Alpha3727_g76959 = 1.0;
				float Emissive_Alpha6927_g76959 = 1.0;
				half Final_Alpha7344_g76959 = min( min( ( Blend_Alpha6157_g76959 - AlphaTreshold2132_g76959 ) , Global_Alpha315_g76959 ) , min( Fade_Alpha3727_g76959 , Emissive_Alpha6927_g76959 ) );
				float temp_output_3_0_g77017 = Final_Alpha7344_g76959;
				float Alpha19_g77017 = temp_output_3_0_g77017;
				float temp_output_15_0_g77017 = 0.01;
				float Treshold19_g77017 = temp_output_15_0_g77017;
				{
				#if defined (TVE_FEATURE_CLIP)
				#if defined (TVE_IS_HD_PIPELINE)
				#if !defined (SHADERPASS_FORWARD_BYPASS_ALPHA_TEST)
				clip(Alpha19_g77017 - Treshold19_g77017);
				#endif
				#if !defined (SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST)
				clip(Alpha19_g77017 - Treshold19_g77017);
				#endif
				#else
				clip(Alpha19_g77017 - Treshold19_g77017);
				#endif
				#endif
				}
				half Main_Color_Alpha6121_g76959 = _MainColor.a;
				half Second_Color_Alpha6152_g76959 = _SecondColor.a;
				float lerpResult6168_g76959 = lerp( Main_Color_Alpha6121_g76959 , Second_Color_Alpha6152_g76959 , Blend_Mask147_g76959);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6174_g76959 = lerpResult6168_g76959;
				#else
				float staticSwitch6174_g76959 = Main_Color_Alpha6121_g76959;
				#endif
				half Blend_Color_Alpha6167_g76959 = staticSwitch6174_g76959;
				half Final_Clip914_g76959 = saturate( ( Alpha19_g77017 * Blend_Color_Alpha6167_g76959 ) );
				
				half3 Subsurface_Color1722_g76959 = ( (_SubsurfaceColor).rgb * Blend_Albedo_Wetness6351_g76959 );
				half Global_Subsurface4041_g76959 = TVE_SubsurfaceValue;
				half Global_OverlaySubsurface5667_g76959 = TVE_OverlaySubsurface;
				float lerpResult7362_g76959 = lerp( 1.0 , Global_OverlaySubsurface5667_g76959 , Overlay_Value5738_g76959);
				half Overlay_Subsurface7361_g76959 = lerpResult7362_g76959;
				half Subsurface_Intensity1752_g76959 = ( _SubsurfaceValue * Global_Subsurface4041_g76959 * Overlay_Subsurface7361_g76959 );
				half Subsurface_Mask1557_g76959 = Blend_Mask_Remap6621_g76959;
				half3 Subsurface_Translucency884_g76959 = ( Subsurface_Color1722_g76959 * Subsurface_Intensity1752_g76959 * Subsurface_Mask1557_g76959 * 10.0 );
				

				float3 BaseColor = Blend_Albedo_RimLight7316_g76959;
				float3 Normal = switchResult12_g76997;
				float3 Emission = Final_Emissive2476_g76959;
				float3 Specular = temp_cast_11;
				float Metallic = 0;
				float Smoothness = Blend_Smoothness_Wetness4130_g76959;
				float Occlusion = Blend_Occlusion323_g76959;
				float Alpha = Final_Clip914_g76959;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;
				float3 BakedGI = 0;
				float3 RefractionColor = 1;
				float RefractionIndex = 1;
				float3 Transmission = 1;
				float3 Translucency = Subsurface_Translucency884_g76959;

				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = 0;
				#endif

				#ifdef _CLEARCOAT
					float CoatMask = 0;
					float CoatSmoothness = 0;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				InputData inputData = (InputData)0;
				inputData.positionWS = WorldPosition;
				inputData.viewDirectionWS = WorldViewDirection;

				#ifdef _NORMALMAP
						#if _NORMAL_DROPOFF_TS
							inputData.normalWS = TransformTangentToWorld(Normal, half3x3(WorldTangent, WorldBiTangent, WorldNormal));
						#elif _NORMAL_DROPOFF_OS
							inputData.normalWS = TransformObjectToWorldNormal(Normal);
						#elif _NORMAL_DROPOFF_WS
							inputData.normalWS = Normal;
						#endif
					inputData.normalWS = NormalizeNormalPerPixel(inputData.normalWS);
				#else
					inputData.normalWS = WorldNormal;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					inputData.shadowCoord = ShadowCoords;
				#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					inputData.shadowCoord = TransformWorldToShadowCoord(inputData.positionWS);
				#else
					inputData.shadowCoord = float4(0, 0, 0, 0);
				#endif

				#ifdef ASE_FOG
					inputData.fogCoord = IN.fogFactorAndVertexLight.x;
				#endif
					inputData.vertexLighting = IN.fogFactorAndVertexLight.yzw;

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float3 SH = SampleSH(inputData.normalWS.xyz);
				#else
					float3 SH = IN.lightmapUVOrVertexSH.xyz;
				#endif

				#if defined(DYNAMICLIGHTMAP_ON)
					inputData.bakedGI = SAMPLE_GI(IN.lightmapUVOrVertexSH.xy, IN.dynamicLightmapUV.xy, SH, inputData.normalWS);
				#else
					inputData.bakedGI = SAMPLE_GI(IN.lightmapUVOrVertexSH.xy, SH, inputData.normalWS);
				#endif

				#ifdef ASE_BAKEDGI
					inputData.bakedGI = BakedGI;
				#endif

				inputData.normalizedScreenSpaceUV = NormalizedScreenSpaceUV;
				inputData.shadowMask = SAMPLE_SHADOWMASK(IN.lightmapUVOrVertexSH.xy);

				#if defined(DEBUG_DISPLAY)
					#if defined(DYNAMICLIGHTMAP_ON)
						inputData.dynamicLightmapUV = IN.dynamicLightmapUV.xy;
					#endif
					#if defined(LIGHTMAP_ON)
						inputData.staticLightmapUV = IN.lightmapUVOrVertexSH.xy;
					#else
						inputData.vertexSH = SH;
					#endif
				#endif

				SurfaceData surfaceData;
				surfaceData.albedo              = BaseColor;
				surfaceData.metallic            = saturate(Metallic);
				surfaceData.specular            = Specular;
				surfaceData.smoothness          = saturate(Smoothness),
				surfaceData.occlusion           = Occlusion,
				surfaceData.emission            = Emission,
				surfaceData.alpha               = saturate(Alpha);
				surfaceData.normalTS            = Normal;
				surfaceData.clearCoatMask       = 0;
				surfaceData.clearCoatSmoothness = 1;

				#ifdef _CLEARCOAT
					surfaceData.clearCoatMask       = saturate(CoatMask);
					surfaceData.clearCoatSmoothness = saturate(CoatSmoothness);
				#endif

				#ifdef _DBUFFER
					ApplyDecalToSurfaceData(IN.clipPos, surfaceData, inputData);
				#endif

				half4 color = UniversalFragmentPBR( inputData, surfaceData);

				#ifdef ASE_TRANSMISSION
				{
					float shadow = _TransmissionShadow;

					#define SUM_LIGHT_TRANSMISSION(Light)\
						float3 atten = Light.color * Light.distanceAttenuation;\
						atten = lerp( atten, atten * Light.shadowAttenuation, shadow );\
						half3 transmission = max( 0, -dot( inputData.normalWS, Light.direction ) ) * atten * Transmission;\
						color.rgb += BaseColor * transmission;

					SUM_LIGHT_TRANSMISSION( GetMainLight( inputData.shadowCoord ) );

					#if defined(_ADDITIONAL_LIGHTS)
						uint meshRenderingLayers = GetMeshRenderingLayer();
						uint pixelLightCount = GetAdditionalLightsCount();
						#if USE_FORWARD_PLUS
							for (uint lightIndex = 0; lightIndex < min(URP_FP_DIRECTIONAL_LIGHTS_COUNT, MAX_VISIBLE_LIGHTS); lightIndex++)
							{
								FORWARD_PLUS_SUBTRACTIVE_LIGHT_CHECK

								Light light = GetAdditionalLight(lightIndex, inputData.positionWS);
								#ifdef _LIGHT_LAYERS
								if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
								#endif
								{
									SUM_LIGHT_TRANSMISSION( light );
								}
							}
						#endif
						LIGHT_LOOP_BEGIN( pixelLightCount )
							Light light = GetAdditionalLight(lightIndex, inputData.positionWS);
							#ifdef _LIGHT_LAYERS
							if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
							#endif
							{
								SUM_LIGHT_TRANSMISSION( light );
							}
						LIGHT_LOOP_END
					#endif
				}
				#endif

				#ifdef ASE_TRANSLUCENCY
				{
					float shadow = _TransShadow;
					float normal = _TransNormal;
					float scattering = _TransScattering;
					float direct = _TransDirect;
					float ambient = _TransAmbient;
					float strength = _TransStrength;

					#define SUM_LIGHT_TRANSLUCENCY(Light)\
						float3 atten = Light.color * Light.distanceAttenuation;\
						atten = lerp( atten, atten * Light.shadowAttenuation, shadow );\
						half3 lightDir = Light.direction + inputData.normalWS * normal;\
						half VdotL = pow( saturate( dot( inputData.viewDirectionWS, -lightDir ) ), scattering );\
						half3 translucency = atten * ( VdotL * direct + inputData.bakedGI * ambient ) * Translucency;\
						color.rgb += BaseColor * translucency * strength;

					SUM_LIGHT_TRANSLUCENCY( GetMainLight( inputData.shadowCoord ) );

					#if defined(_ADDITIONAL_LIGHTS)
						uint meshRenderingLayers = GetMeshRenderingLayer();
						uint pixelLightCount = GetAdditionalLightsCount();
						#if USE_FORWARD_PLUS
							for (uint lightIndex = 0; lightIndex < min(URP_FP_DIRECTIONAL_LIGHTS_COUNT, MAX_VISIBLE_LIGHTS); lightIndex++)
							{
								FORWARD_PLUS_SUBTRACTIVE_LIGHT_CHECK

								Light light = GetAdditionalLight(lightIndex, inputData.positionWS);
								#ifdef _LIGHT_LAYERS
								if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
								#endif
								{
									SUM_LIGHT_TRANSLUCENCY( light );
								}
							}
						#endif
						LIGHT_LOOP_BEGIN( pixelLightCount )
							Light light = GetAdditionalLight(lightIndex, inputData.positionWS);
							#ifdef _LIGHT_LAYERS
							if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
							#endif
							{
								SUM_LIGHT_TRANSLUCENCY( light );
							}
						LIGHT_LOOP_END
					#endif
				}
				#endif

				#ifdef ASE_REFRACTION
					float4 projScreenPos = ScreenPos / ScreenPos.w;
					float3 refractionOffset = ( RefractionIndex - 1.0 ) * mul( UNITY_MATRIX_V, float4( WorldNormal,0 ) ).xyz * ( 1.0 - dot( WorldNormal, WorldViewDirection ) );
					projScreenPos.xy += refractionOffset.xy;
					float3 refraction = SHADERGRAPH_SAMPLE_SCENE_COLOR( projScreenPos.xy ) * RefractionColor;
					color.rgb = lerp( refraction, color.rgb, color.a );
					color.a = 1;
				#endif

				#ifdef ASE_FINAL_COLOR_ALPHA_MULTIPLY
					color.rgb *= color.a;
				#endif

				#ifdef ASE_FOG
					#ifdef TERRAIN_SPLAT_ADDPASS
						color.rgb = MixFogColor(color.rgb, half3( 0, 0, 0 ), IN.fogFactorAndVertexLight.x );
					#else
						color.rgb = MixFog(color.rgb, IN.fogFactorAndVertexLight.x);
					#endif
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				#ifdef _WRITE_RENDERING_LAYERS
					uint renderingLayers = GetMeshRenderingLayer();
					outRenderingLayers = float4( EncodeMeshRenderingLayer( renderingLayers ), 0, 0, 0 );
				#endif

				return color;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "ShadowCaster"
			Tags { "LightMode"="ShadowCaster" }

			ZWrite On
			ZTest LEqual
			AlphaToMask Off
			ColorMask 0

			HLSLPROGRAM

			#define _SPECULAR_SETUP 1
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile_fragment _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#pragma multi_compile _ DOTS_INSTANCING_ON
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define ASE_TRANSLUCENCY 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140007
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma vertex vert
			#pragma fragment frag

			#pragma multi_compile_vertex _ _CASTING_PUNCTUAL_LIGHT_SHADOW

			#define SHADERPASS SHADERPASS_SHADOWCASTER

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#pragma shader_feature_local_fragment TVE_FEATURE_CLIP
			#pragma shader_feature_local TVE_FEATURE_BATCHING
			#pragma shader_feature_local_fragment TVE_FEATURE_DETAIL
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_UNIVERSAL_PIPELINE
			#define TVE_IS_PLANT_SHADER
			#define TVE_IS_SUBSURFACE_SHADER
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 worldPos : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord : TEXCOORD1;
				#endif
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _DetailBlendRemap;
			float4 _GradientMaskRemap;
			half4 _VertexOcclusionRemap;
			half4 _RimLightRemap;
			half4 _MainColor;
			half4 _MainUVs;
			half4 _MotionHighlightColor;
			half4 _EmissiveColor;
			half4 _EmissiveUVs;
			half4 _SecondColor;
			half4 _VertexOcclusionColor;
			half4 _second_uvs_mode;
			float4 _MaxBoundsInfo;
			half4 _SecondUVs;
			half4 _SecondMaskRemap;
			half4 _MainMaskRemap;
			half4 _GradientColorTwo;
			float4 _SubsurfaceDiffusion_Asset;
			float4 _Color;
			float4 _NoiseMaskRemap;
			half4 _SubsurfaceColor;
			half4 _GradientColorOne;
			half3 _render_normals;
			half _SecondAlbedoValue;
			half _DetailMaskIntensity;
			half _DetailMaskMode;
			half _MainAlbedoValue;
			half _DetailBlendMode;
			half _VertexDataMode;
			half _DetailMaskInvertMode;
			half _SizeFadeStartValue;
			half _render_zw;
			half _GlobalSize;
			half _MotionVariation_20;
			half _MotionSpeed_20;
			half _MotionValue_20;
			half _MotionFacingValue;
			half _MotionAmplitude_20;
			half _MotionAmplitude_22;
			float _MotionScale_32;
			half _SizeFadeEndValue;
			float _MotionVariation_32;
			half _MotionValue_30;
			half _MotionAmplitude_32;
			half _PerspectivePushValue;
			half _PerspectiveNoiseValue;
			half _DetailMeshMode;
			half _PerspectiveAngleValue;
			half _LayerVertexValue;
			float _MotionSpeed_32;
			half _DetailMeshInvertMode;
			half _GradientMinValue;
			half _DetailBlendMinValue;
			half _SecondNormalValue;
			half _OverlayProjectionValue;
			half _GlobalWetness;
			half _GlobalEmissive;
			half _EmissivePhaseValue;
			float _emissive_intensity_value;
			half _RenderSpecular;
			half _DetailNormalValue;
			half _MainSmoothnessValue;
			half _MainOcclusionValue;
			half _SecondOcclusionValue;
			half _DetailAlphaMode;
			half _AlphaClipValue;
			half _AlphaVariationValue;
			half _DetailFadeMode;
			half _GlobalAlpha;
			half _SecondSmoothnessValue;
			half _MainNormalValue;
			half _OverlayVariationValue;
			half _ExtrasPositionMode;
			half _DetailBlendMaxValue;
			half _DetailMode;
			half _MotionScale_20;
			half _GradientMaxValue;
			half _MainMaskMinValue;
			half _MainMaskMaxValue;
			half _SecondMaskMinValue;
			half _SecondMaskMaxValue;
			half _VertexOcclusionMinValue;
			half _VertexOcclusionMaxValue;
			half _LayerColorsValue;
			half _ColorsPositionMode;
			half _GlobalColors;
			half _ColorsVariationValue;
			half _ColorsMaskMode;
			half _GlobalOverlay;
			half _LayerExtrasValue;
			half _DetailMeshValue;
			half _InteractionAmplitude;
			float _MotionSpeed_10;
			half _MotionAmplitude_10;
			half _MessageSecondMask;
			half _MessageMotionVariation;
			half _MessageGlobalsVariation;
			half _MessageMainMask;
			half _MessageSubsurface;
			half _IsTVEShader;
			half _IsIdentifier;
			half _MessageOcclusion;
			half _HasOcclusion;
			half _HasEmissive;
			half _VertexVariationMode;
			half _IsCollected;
			half _IsShared;
			half _IsVersion;
			half _RenderCoverage;
			float _EmissiveIntensityValue;
			half _HasGradient;
			half _RenderNormals;
			half _CategoryRender;
			half _RenderMode;
			half _render_coverage;
			half _render_cull;
			half _render_src;
			half _render_dst;
			float _IsPlantShader;
			half _IsSubsurfaceShader;
			float _SubsurfaceDiffusion;
			half _Cutoff;
			half _ColorsMaskMinValue;
			half _ColorsMaskMaxValue;
			half _RenderDecals;
			half _RenderSSR;
			half _RenderZWrite;
			half _RenderClip;
			half _RenderCull;
			half _RenderQueue;
			half _RenderPriority;
			half _DetailTypeMode;
			half _DetailOpaqueMode;
			half _DetailCoordMode;
			half _EmissiveIntensityMode;
			half _SubsurfaceDirectValue;
			half _SubsurfaceAngleValue;
			half _SubsurfaceScatteringValue;
			half _RenderDirect;
			half _CategoryRimLight;
			half _CategoryMatcap;
			half _CategorySubsurface;
			half _CategoryEmissive;
			half _RenderAmbient;
			half _RenderShadow;
			half _IsCoreShader;
			half _VertexPivotMode;
			half _MotionPosition_10;
			float _MotionScale_10;
			half _MotionVariation_10;
			half _VertexDynamicMode;
			half _LayerMotionValue;
			half _SubsurfaceAmbientValue;
			half _InteractionMaskValue;
			half _SubsurfaceShadowValue;
			half _SpaceRenderFade;
			half _EmissiveFlagMode;
			half _SecondUVsMode;
			half _SpaceGlobalLayers;
			half _SpaceGlobalLocals;
			half _SpaceSubsurface;
			half _SpaceMotionLocals;
			half _SpaceMotionGlobals;
			half _SpaceGlobalOptions;
			half _CategoryGlobals;
			half _CategoryMain;
			half _CategoryDetail;
			half _CategoryOcclusion;
			half _CategoryGradient;
			half _CategoryNoise;
			half _CategoryPerspective;
			half _CategorySizeFade;
			half _CategoryMotion;
			half _SubsurfaceNormalValue;
			half _SubsurfaceValue;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			// Property used by ScenePickingPass
			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			// Properties used by SceneSelectionPass
			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(TVE_NoiseTex);
			float3 TVE_WorldOrigin;
			half4 TVE_MotionParams;
			half4 TVE_TimeParams;
			SAMPLER(sampler_Linear_Repeat);
			float TVE_MotionUsage[10];
			TEXTURE2D_ARRAY(TVE_MotionTex);
			half4 TVE_MotionCoords;
			SAMPLER(sampler_Linear_Clamp);
			half TVE_MotionValue_10;
			half TVE_MotionValue_20;
			half TVE_MotionFadeEnd;
			half TVE_MotionFadeStart;
			half TVE_MotionValue_30;
			float TVE_VertexUsage[10];
			TEXTURE2D_ARRAY(TVE_VertexTex);
			half4 TVE_VertexCoords;
			half4 TVE_VertexParams;
			half TVE_DistanceFadeBias;
			half TVE_IsEnabled;
			half _DisableSRPBatcher;
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);
			TEXTURE2D(_SecondAlbedoTex);
			SAMPLER(sampler_SecondAlbedoTex);
			TEXTURE2D(_MainMaskTex);
			TEXTURE2D(_SecondMaskTex);
			float TVE_ExtrasUsage[10];
			TEXTURE2D_ARRAY(TVE_ExtrasTex);
			half4 TVE_ExtrasCoords;
			half4 TVE_ExtrasParams;


			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShadowCasterPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			float2 DecodeFloatToVector2( float enc )
			{
				float2 result ;
				result.y = enc % 2048;
				result.x = floor(enc / 2048);
				return result / (2048 - 1);
			}
			

			float3 _LightDirection;
			float3 _LightPosition;

			VertexOutput VertexFunction( VertexInput v )
			{
				VertexOutput o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float3 VertexPosition3588_g76959 = v.vertex.xyz;
				float3 appendResult60_g76970 = (float3(v.ase_texcoord3.x , v.ase_texcoord3.z , v.ase_texcoord3.y));
				half3 Mesh_PivotsData2831_g76959 = ( appendResult60_g76970 * _VertexPivotMode );
				half3 Mesh_PivotsOS2291_g76959 = Mesh_PivotsData2831_g76959;
				float3 temp_output_2283_0_g76959 = ( VertexPosition3588_g76959 - Mesh_PivotsOS2291_g76959 );
				half3 VertexPos40_g77080 = temp_output_2283_0_g76959;
				half3 VertexPos40_g77081 = VertexPos40_g77080;
				float3 appendResult74_g77081 = (float3(VertexPos40_g77081.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g77081 = appendResult74_g77081;
				float3 break84_g77081 = VertexPos40_g77081;
				float3 appendResult81_g77081 = (float3(0.0 , break84_g77081.y , break84_g77081.z));
				half3 VertexPosOtherAxis82_g77081 = appendResult81_g77081;
				float3 ase_worldPos = TransformObjectToWorld( (v.vertex).xyz );
				float3 vertexToFrag3890_g76959 = ase_worldPos;
				float3 WorldPosition3905_g76959 = vertexToFrag3890_g76959;
				float3 WorldPosition_Shifted7477_g76959 = ( WorldPosition3905_g76959 - TVE_WorldOrigin );
				float4x4 break19_g77047 = GetObjectToWorldMatrix();
				float3 appendResult20_g77047 = (float3(break19_g77047[ 0 ][ 3 ] , break19_g77047[ 1 ][ 3 ] , break19_g77047[ 2 ][ 3 ]));
				float3 temp_output_122_0_g77047 = Mesh_PivotsData2831_g76959;
				float3 PivotsOnly105_g77047 = (mul( GetObjectToWorldMatrix(), float4( temp_output_122_0_g77047 , 0.0 ) ).xyz).xyz;
				half3 ObjectData20_g77049 = ( appendResult20_g77047 + PivotsOnly105_g77047 );
				half3 WorldData19_g77049 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g77049 = WorldData19_g77049;
				#else
				float3 staticSwitch14_g77049 = ObjectData20_g77049;
				#endif
				float3 temp_output_114_0_g77047 = staticSwitch14_g77049;
				float3 vertexToFrag4224_g76959 = temp_output_114_0_g77047;
				float3 ObjectPosition4223_g76959 = vertexToFrag4224_g76959;
				float3 ObjectPosition_Shifted7481_g76959 = ( ObjectPosition4223_g76959 - TVE_WorldOrigin );
				float3 lerpResult6766_g76959 = lerp( WorldPosition_Shifted7477_g76959 , ObjectPosition_Shifted7481_g76959 , _MotionPosition_10);
				float3 Motion_10_Position6738_g76959 = lerpResult6766_g76959;
				half3 Input_Position419_g77065 = Motion_10_Position6738_g76959;
				float Input_MotionScale287_g77065 = ( _MotionScale_10 + 0.2 );
				float2 temp_output_597_0_g77065 = (( Input_Position419_g77065 * Input_MotionScale287_g77065 * 0.0075 )).xz;
				float2 temp_output_447_0_g76964 = ((TVE_MotionParams).xy*2.0 + -1.0);
				half2 Global_Wind_DirectionWS4683_g76959 = temp_output_447_0_g76964;
				half2 Input_DirectionWS423_g77065 = Global_Wind_DirectionWS4683_g76959;
				float lerpResult115_g77066 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g77065 = _MotionSpeed_10;
				half Input_MotionVariation284_g77065 = _MotionVariation_10;
				half3 Input_Position167_g77037 = ObjectPosition_Shifted7481_g76959;
				float dotResult156_g77037 = dot( (Input_Position167_g77037).xz , float2( 12.9898,78.233 ) );
				half Vertex_DynamicMode5112_g76959 = _VertexDynamicMode;
				half Input_DynamicMode120_g77037 = Vertex_DynamicMode5112_g76959;
				float Postion_Random162_g77037 = ( sin( dotResult156_g77037 ) * ( 1.0 - Input_DynamicMode120_g77037 ) );
				float Mesh_Variation16_g76959 = v.ase_color.r;
				half Input_Variation124_g77037 = Mesh_Variation16_g76959;
				half ObjectData20_g77039 = frac( ( Postion_Random162_g77037 + Input_Variation124_g77037 ) );
				half WorldData19_g77039 = Input_Variation124_g77037;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g77039 = WorldData19_g77039;
				#else
				float staticSwitch14_g77039 = ObjectData20_g77039;
				#endif
				float clampResult17_g77041 = clamp( staticSwitch14_g77039 , 0.0001 , 0.9999 );
				float Global_MeshVariation5104_g76959 = clampResult17_g77041;
				half Input_GlobalMeshVariation569_g77065 = Global_MeshVariation5104_g76959;
				float temp_output_630_0_g77065 = ( ( ( lerpResult115_g77066 * Input_MotionSpeed62_g77065 ) + ( Input_MotionVariation284_g77065 * Input_GlobalMeshVariation569_g77065 ) ) * 0.03 );
				float temp_output_607_0_g77065 = frac( temp_output_630_0_g77065 );
				float4 lerpResult590_g77065 = lerp( SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g77065 + ( -Input_DirectionWS423_g77065 * temp_output_607_0_g77065 ) ), 0.0 ) , SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g77065 + ( -Input_DirectionWS423_g77065 * frac( ( temp_output_630_0_g77065 + 0.5 ) ) ) ), 0.0 ) , ( abs( ( temp_output_607_0_g77065 - 0.5 ) ) / 0.5 ));
				half4 Noise_Complex703_g77065 = lerpResult590_g77065;
				float2 temp_output_645_0_g77065 = ((Noise_Complex703_g77065).rg*2.0 + -1.0);
				float2 break650_g77065 = temp_output_645_0_g77065;
				float3 appendResult649_g77065 = (float3(break650_g77065.x , 0.0 , break650_g77065.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Global_Noise_OS5548_g76959 = (( mul( GetWorldToObjectMatrix(), float4( appendResult649_g77065 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Noise_DirectionOS487_g77073 = Global_Noise_OS5548_g76959;
				float2 break448_g76964 = temp_output_447_0_g76964;
				float3 appendResult452_g76964 = (float3(break448_g76964.x , 0.0 , break448_g76964.y));
				half2 Global_Wind_DirectionOS5692_g76959 = (( mul( GetWorldToObjectMatrix(), float4( appendResult452_g76964 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Wind_DirectionOS458_g77073 = Global_Wind_DirectionOS5692_g76959;
				float temp_output_84_0_g76973 = _LayerMotionValue;
				float temp_output_19_0_g76977 = TVE_MotionUsage[(int)temp_output_84_0_g76973];
				float4 temp_output_91_19_g76973 = TVE_MotionCoords;
				half2 UV94_g76973 = ( (temp_output_91_19_g76973).zw + ( (temp_output_91_19_g76973).xy * (ObjectPosition4223_g76959).xz ) );
				float4 tex2DArrayNode50_g76973 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_Linear_Clamp, UV94_g76973,temp_output_84_0_g76973, 0.0 );
				float4 temp_output_17_0_g76977 = tex2DArrayNode50_g76973;
				float4 temp_output_112_19_g76973 = TVE_MotionParams;
				float4 temp_output_3_0_g76977 = temp_output_112_19_g76973;
				float4 ifLocalVar18_g76977 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76977 >= 0.5 )
				ifLocalVar18_g76977 = temp_output_17_0_g76977;
				else
				ifLocalVar18_g76977 = temp_output_3_0_g76977;
				float4 lerpResult22_g76977 = lerp( temp_output_3_0_g76977 , temp_output_17_0_g76977 , temp_output_19_0_g76977);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76977 = lerpResult22_g76977;
				#else
				float4 staticSwitch24_g76977 = ifLocalVar18_g76977;
				#endif
				half4 Global_Motion_Params3909_g76959 = staticSwitch24_g76977;
				float4 break322_g76964 = Global_Motion_Params3909_g76959;
				half Global_Wind_Power2223_g76959 = break322_g76964.z;
				half Input_WindPower449_g77073 = Global_Wind_Power2223_g76959;
				float temp_output_565_0_g77073 = ( 1.0 - Input_WindPower449_g77073 );
				float2 lerpResult516_g77073 = lerp( Input_Noise_DirectionOS487_g77073 , Input_Wind_DirectionOS458_g77073 , ( ( 1.0 - ( temp_output_565_0_g77073 * temp_output_565_0_g77073 * temp_output_565_0_g77073 ) ) * 0.6 ));
				half Mesh_Height1524_g76959 = v.ase_color.a;
				half Input_MeshHeight388_g77073 = Mesh_Height1524_g76959;
				half ObjectData20_g77074 = Input_MeshHeight388_g77073;
				float enc62_g76967 = v.ase_texcoord.w;
				float2 localDecodeFloatToVector262_g76967 = DecodeFloatToVector2( enc62_g76967 );
				float2 break63_g76967 = ( localDecodeFloatToVector262_g76967 * 100.0 );
				float Bounds_Height5230_g76959 = break63_g76967.x;
				half Input_BoundsHeight390_g77073 = Bounds_Height5230_g76959;
				half WorldData19_g77074 = ( Input_MeshHeight388_g77073 * Input_MeshHeight388_g77073 * Input_BoundsHeight390_g77073 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g77074 = WorldData19_g77074;
				#else
				float staticSwitch14_g77074 = ObjectData20_g77074;
				#endif
				half Final_Motion10_Mask321_g77073 = ( staticSwitch14_g77074 * 2.0 );
				half Motion_10_Amplitude2258_g76959 = _MotionAmplitude_10;
				half Input_BendingAmplitude376_g77073 = Motion_10_Amplitude2258_g76959;
				half Global_MotionValue640_g77073 = TVE_MotionValue_10;
				half2 Final_Bending631_g77073 = ( lerpResult516_g77073 * ( Final_Motion10_Mask321_g77073 * Input_BendingAmplitude376_g77073 * Input_WindPower449_g77073 * Input_WindPower449_g77073 * Global_MotionValue640_g77073 ) );
				float2 appendResult433_g76964 = (float2(break322_g76964.x , break322_g76964.y));
				float2 temp_output_436_0_g76964 = (appendResult433_g76964*2.0 + -1.0);
				float2 break441_g76964 = temp_output_436_0_g76964;
				float3 appendResult440_g76964 = (float3(break441_g76964.x , 0.0 , break441_g76964.y));
				half2 Global_React_DirectionOS39_g76959 = (( mul( GetWorldToObjectMatrix(), float4( appendResult440_g76964 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_React_DirectionOS358_g77073 = Global_React_DirectionOS39_g76959;
				float clampResult17_g77076 = clamp( Input_MeshHeight388_g77073 , 0.0001 , 0.9999 );
				float temp_output_7_0_g77075 = 0.0;
				half Input_InteractionUseMask62_g77073 = _InteractionMaskValue;
				float temp_output_10_0_g77075 = ( Input_InteractionUseMask62_g77073 - temp_output_7_0_g77075 );
				half Final_InteractionRemap594_g77073 = saturate( ( ( clampResult17_g77076 - temp_output_7_0_g77075 ) / ( temp_output_10_0_g77075 + 0.0001 ) ) );
				half ObjectData20_g77077 = Final_InteractionRemap594_g77073;
				half WorldData19_g77077 = ( Final_InteractionRemap594_g77073 * Final_InteractionRemap594_g77073 * Input_BoundsHeight390_g77073 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g77077 = WorldData19_g77077;
				#else
				float staticSwitch14_g77077 = ObjectData20_g77077;
				#endif
				half Final_InteractionMask373_g77073 = ( staticSwitch14_g77077 * 2.0 );
				half Interaction_Amplitude7501_g76959 = _InteractionAmplitude;
				half Input_InteractionAmplitude58_g77073 = Interaction_Amplitude7501_g76959;
				half2 Final_Interaction632_g77073 = ( Input_React_DirectionOS358_g77073 * Final_InteractionMask373_g77073 * Input_InteractionAmplitude58_g77073 );
				half Global_Interaction_Mask66_g76959 = ( break322_g76964.w * break322_g76964.w * break322_g76964.w * break322_g76964.w );
				float Input_InteractionGlobalMask330_g77073 = Global_Interaction_Mask66_g76959;
				half Final_InteractionValue525_g77073 = saturate( ( Input_InteractionAmplitude58_g77073 * Input_InteractionGlobalMask330_g77073 ) );
				float2 lerpResult551_g77073 = lerp( Final_Bending631_g77073 , Final_Interaction632_g77073 , Final_InteractionValue525_g77073);
				float2 break364_g77073 = lerpResult551_g77073;
				float3 appendResult638_g77073 = (float3(break364_g77073.x , 0.0 , break364_g77073.y));
				half3 Motion_10_Interaction7519_g76959 = appendResult638_g77073;
				half3 Angle44_g77080 = Motion_10_Interaction7519_g76959;
				half Angle44_g77081 = (Angle44_g77080).z;
				half3 VertexPos40_g77082 = ( VertexPosRotationAxis50_g77081 + ( VertexPosOtherAxis82_g77081 * cos( Angle44_g77081 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g77081 ) * sin( Angle44_g77081 ) ) );
				float3 appendResult74_g77082 = (float3(0.0 , 0.0 , VertexPos40_g77082.z));
				half3 VertexPosRotationAxis50_g77082 = appendResult74_g77082;
				float3 break84_g77082 = VertexPos40_g77082;
				float3 appendResult81_g77082 = (float3(break84_g77082.x , break84_g77082.y , 0.0));
				half3 VertexPosOtherAxis82_g77082 = appendResult81_g77082;
				half Angle44_g77082 = -(Angle44_g77080).x;
				half3 Input_Position419_g77078 = WorldPosition_Shifted7477_g76959;
				float3 break459_g77078 = Input_Position419_g77078;
				float Sum_Position446_g77078 = ( break459_g77078.x + break459_g77078.y + break459_g77078.z );
				half Input_MotionScale321_g77078 = ( _MotionScale_20 * 0.1 );
				half Input_MotionVariation330_g77078 = _MotionVariation_20;
				half Input_GlobalVariation400_g77078 = Global_MeshVariation5104_g76959;
				float lerpResult115_g77079 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g77078 = _MotionSpeed_20;
				float temp_output_404_0_g77078 = ( lerpResult115_g77079 * Input_MotionSpeed62_g77078 );
				half Motion_SineA450_g77078 = sin( ( ( Sum_Position446_g77078 * Input_MotionScale321_g77078 ) + ( Input_MotionVariation330_g77078 * Input_GlobalVariation400_g77078 ) + temp_output_404_0_g77078 ) );
				half Motion_SineB395_g77078 = sin( ( ( temp_output_404_0_g77078 * 0.6842 ) + ( Sum_Position446_g77078 * Input_MotionScale321_g77078 ) ) );
				half3 Input_Position419_g76971 = VertexPosition3588_g76959;
				float3 normalizeResult518_g76971 = normalize( Input_Position419_g76971 );
				half2 Input_DirectionOS423_g76971 = Global_React_DirectionOS39_g76959;
				float2 break521_g76971 = -Input_DirectionOS423_g76971;
				float3 appendResult522_g76971 = (float3(break521_g76971.x , 0.0 , break521_g76971.y));
				float dotResult519_g76971 = dot( normalizeResult518_g76971 , appendResult522_g76971 );
				half Input_Value62_g76971 = _MotionFacingValue;
				float lerpResult524_g76971 = lerp( 1.0 , (dotResult519_g76971*0.5 + 0.5) , Input_Value62_g76971);
				half ObjectData20_g76972 = max( lerpResult524_g76971 , 0.001 );
				half WorldData19_g76972 = 1.0;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76972 = WorldData19_g76972;
				#else
				float staticSwitch14_g76972 = ObjectData20_g76972;
				#endif
				half Motion_FacingMask5214_g76959 = staticSwitch14_g76972;
				half Motion_20_Amplitude4381_g76959 = ( _MotionValue_20 * Motion_FacingMask5214_g76959 );
				half Input_MotionAmplitude384_g77078 = Motion_20_Amplitude4381_g76959;
				half Input_GlobalWind407_g77078 = Global_Wind_Power2223_g76959;
				float4 break638_g77065 = abs( Noise_Complex703_g77065 );
				half Global_Noise_B5526_g76959 = break638_g77065.b;
				half Input_GlobalNoise411_g77078 = Global_Noise_B5526_g76959;
				float lerpResult413_g77078 = lerp( 1.6 , 0.4 , Input_GlobalWind407_g77078);
				half Motion_Amplitude418_g77078 = ( Input_MotionAmplitude384_g77078 * Input_GlobalWind407_g77078 * pow( Input_GlobalNoise411_g77078 , lerpResult413_g77078 ) );
				half Input_Squash58_g77078 = _MotionAmplitude_20;
				float enc59_g76967 = v.ase_texcoord.z;
				float2 localDecodeFloatToVector259_g76967 = DecodeFloatToVector2( enc59_g76967 );
				float2 break61_g76967 = localDecodeFloatToVector259_g76967;
				half Mesh_Motion_2060_g76959 = break61_g76967.x;
				half Input_MeshMotion_20388_g77078 = Mesh_Motion_2060_g76959;
				float Bounds_Radius5231_g76959 = break63_g76967.y;
				half Input_BoundsRadius390_g77078 = Bounds_Radius5231_g76959;
				half Global_MotionValue462_g77078 = TVE_MotionValue_20;
				half2 Input_DirectionOS366_g77078 = Global_React_DirectionOS39_g76959;
				float2 break371_g77078 = Input_DirectionOS366_g77078;
				float3 appendResult372_g77078 = (float3(break371_g77078.x , ( Motion_SineA450_g77078 * 0.3 ) , break371_g77078.y));
				half3 Motion_20_Squash4418_g76959 = ( ( (max( Motion_SineA450_g77078 , Motion_SineB395_g77078 )*0.5 + 0.5) * Motion_Amplitude418_g77078 * Input_Squash58_g77078 * Input_MeshMotion_20388_g77078 * Input_BoundsRadius390_g77078 * Global_MotionValue462_g77078 ) * appendResult372_g77078 );
				half3 VertexPos40_g77057 = ( ( VertexPosRotationAxis50_g77082 + ( VertexPosOtherAxis82_g77082 * cos( Angle44_g77082 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g77082 ) * sin( Angle44_g77082 ) ) ) + Motion_20_Squash4418_g76959 );
				float3 appendResult74_g77057 = (float3(0.0 , VertexPos40_g77057.y , 0.0));
				float3 VertexPosRotationAxis50_g77057 = appendResult74_g77057;
				float3 break84_g77057 = VertexPos40_g77057;
				float3 appendResult81_g77057 = (float3(break84_g77057.x , 0.0 , break84_g77057.z));
				float3 VertexPosOtherAxis82_g77057 = appendResult81_g77057;
				half Input_Rolling379_g77078 = _MotionAmplitude_22;
				half Motion_20_Rolling5257_g76959 = ( Motion_SineA450_g77078 * Motion_Amplitude418_g77078 * Input_Rolling379_g77078 * Input_MeshMotion_20388_g77078 * Global_MotionValue462_g77078 );
				half Angle44_g77057 = Motion_20_Rolling5257_g76959;
				half3 Input_Position500_g77069 = WorldPosition_Shifted7477_g76959;
				half Input_MotionScale321_g77069 = _MotionScale_32;
				half Input_MotionVariation330_g77069 = _MotionVariation_32;
				half Input_GlobalVariation372_g77069 = Global_MeshVariation5104_g76959;
				float lerpResult115_g77072 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g77069 = _MotionSpeed_32;
				float4 tex2DNode460_g77069 = SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( ( (Input_Position500_g77069).xz * Input_MotionScale321_g77069 * 0.03 ) + ( Input_MotionVariation330_g77069 * Input_GlobalVariation372_g77069 ) + ( lerpResult115_g77072 * Input_MotionSpeed62_g77069 * 0.02 ) ), 0.0 );
				float3 appendResult462_g77069 = (float3(tex2DNode460_g77069.r , tex2DNode460_g77069.g , tex2DNode460_g77069.b));
				half3 Flutter_Texture489_g77069 = (appendResult462_g77069*2.0 + -1.0);
				float temp_output_7_0_g77027 = TVE_MotionFadeEnd;
				float temp_output_10_0_g77027 = ( TVE_MotionFadeStart - temp_output_7_0_g77027 );
				half Motion_FadeOut4005_g76959 = saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g77027 ) / ( temp_output_10_0_g77027 + 0.0001 ) ) );
				half Motion_30_Amplitude4960_g76959 = ( _MotionValue_30 * _MotionAmplitude_32 * Motion_FacingMask5214_g76959 * Motion_FadeOut4005_g76959 );
				half Input_MotionAmplitude58_g77069 = Motion_30_Amplitude4960_g76959;
				half Mesh_Motion_30144_g76959 = break61_g76967.y;
				half Input_MeshMotion_30374_g77069 = Mesh_Motion_30144_g76959;
				half Input_GlobalWind471_g77069 = Global_Wind_Power2223_g76959;
				half Global_MotionValue503_g77069 = TVE_MotionValue_30;
				half Input_GlobalNoise472_g77069 = Global_Noise_B5526_g76959;
				float lerpResult466_g77069 = lerp( 2.0 , 0.6 , Input_GlobalWind471_g77069);
				half Flutter_Amplitude491_g77069 = ( Input_MotionAmplitude58_g77069 * Input_MeshMotion_30374_g77069 * Input_GlobalWind471_g77069 * Global_MotionValue503_g77069 * pow( Input_GlobalNoise472_g77069 , lerpResult466_g77069 ) );
				half3 Motion_30_Flutter263_g76959 = ( Flutter_Texture489_g77069 * Flutter_Amplitude491_g77069 );
				float3 Vertex_Motion_Object833_g76959 = ( ( VertexPosRotationAxis50_g77057 + ( VertexPosOtherAxis82_g77057 * cos( Angle44_g77057 ) ) + ( cross( float3(0,1,0) , VertexPosOtherAxis82_g77057 ) * sin( Angle44_g77057 ) ) ) + Motion_30_Flutter263_g76959 );
				half3 ObjectData20_g77062 = Vertex_Motion_Object833_g76959;
				float3 temp_output_3474_0_g76959 = ( VertexPosition3588_g76959 - Mesh_PivotsOS2291_g76959 );
				float3 Vertex_Motion_World1118_g76959 = ( ( ( temp_output_3474_0_g76959 + Motion_10_Interaction7519_g76959 ) + Motion_20_Squash4418_g76959 ) + Motion_30_Flutter263_g76959 );
				half3 WorldData19_g77062 = Vertex_Motion_World1118_g76959;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g77062 = WorldData19_g77062;
				#else
				float3 staticSwitch14_g77062 = ObjectData20_g77062;
				#endif
				float3 temp_output_7495_0_g76959 = staticSwitch14_g77062;
				float3 Vertex_Motion7493_g76959 = temp_output_7495_0_g76959;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 normalizeResult2169_g76959 = normalize( ase_worldViewDir );
				float3 ViewDirection3963_g76959 = normalizeResult2169_g76959;
				float3 break2709_g76959 = cross( ViewDirection3963_g76959 , half3(0,1,0) );
				float3 appendResult2710_g76959 = (float3(-break2709_g76959.z , 0.0 , break2709_g76959.x));
				float3 appendResult2667_g76959 = (float3(Global_MeshVariation5104_g76959 , 0.5 , Global_MeshVariation5104_g76959));
				float dotResult2212_g76959 = dot( ViewDirection3963_g76959 , float3(0,1,0) );
				half Mask_HView2656_g76959 = dotResult2212_g76959;
				float saferPower2652_g76959 = abs( Mask_HView2656_g76959 );
				half3 Grass_Perspective2661_g76959 = ( ( ( mul( GetWorldToObjectMatrix(), float4( appendResult2710_g76959 , 0.0 ) ).xyz * _PerspectivePushValue ) + ( (appendResult2667_g76959*2.0 + -1.0) * _PerspectiveNoiseValue ) ) * Mesh_Height1524_g76959 * pow( saferPower2652_g76959 , _PerspectiveAngleValue ) );
				float temp_output_84_0_g76999 = _LayerVertexValue;
				float temp_output_19_0_g77003 = TVE_VertexUsage[(int)temp_output_84_0_g76999];
				float4 temp_output_94_19_g76999 = TVE_VertexCoords;
				half2 UV97_g76999 = ( (temp_output_94_19_g76999).zw + ( (temp_output_94_19_g76999).xy * (ObjectPosition4223_g76959).xz ) );
				float4 tex2DArrayNode50_g76999 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_VertexTex, sampler_Linear_Clamp, UV97_g76999,temp_output_84_0_g76999, 0.0 );
				float4 temp_output_17_0_g77003 = tex2DArrayNode50_g76999;
				float4 temp_output_111_19_g76999 = TVE_VertexParams;
				float4 temp_output_3_0_g77003 = temp_output_111_19_g76999;
				float4 ifLocalVar18_g77003 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g77003 >= 0.5 )
				ifLocalVar18_g77003 = temp_output_17_0_g77003;
				else
				ifLocalVar18_g77003 = temp_output_3_0_g77003;
				float4 lerpResult22_g77003 = lerp( temp_output_3_0_g77003 , temp_output_17_0_g77003 , temp_output_19_0_g77003);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g77003 = lerpResult22_g77003;
				#else
				float4 staticSwitch24_g77003 = ifLocalVar18_g77003;
				#endif
				half4 Global_Vertex_Params4173_g76959 = staticSwitch24_g77003;
				float4 break322_g77004 = Global_Vertex_Params4173_g76959;
				half Global_VertexSize174_g76959 = saturate( break322_g77004.w );
				float lerpResult346_g76959 = lerp( 1.0 , Global_VertexSize174_g76959 , _GlobalSize);
				float3 appendResult3480_g76959 = (float3(lerpResult346_g76959 , lerpResult346_g76959 , lerpResult346_g76959));
				half3 ObjectData20_g77059 = appendResult3480_g76959;
				half3 _Vector11 = half3(1,1,1);
				half3 WorldData19_g77059 = _Vector11;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g77059 = WorldData19_g77059;
				#else
				float3 staticSwitch14_g77059 = ObjectData20_g77059;
				#endif
				half3 Vertex_Size1741_g76959 = staticSwitch14_g77059;
				float temp_output_7_0_g77060 = _SizeFadeEndValue;
				float temp_output_10_0_g77060 = ( _SizeFadeStartValue - temp_output_7_0_g77060 );
				float temp_output_7453_0_g76959 = saturate( ( ( ( distance( _WorldSpaceCameraPos , ObjectPosition4223_g76959 ) * ( 1.0 / TVE_DistanceFadeBias ) ) - temp_output_7_0_g77060 ) / ( temp_output_10_0_g77060 + 0.0001 ) ) );
				float3 appendResult3482_g76959 = (float3(temp_output_7453_0_g76959 , temp_output_7453_0_g76959 , temp_output_7453_0_g76959));
				half3 ObjectData20_g77058 = appendResult3482_g76959;
				half3 _Vector5 = half3(1,1,1);
				half3 WorldData19_g77058 = _Vector5;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g77058 = WorldData19_g77058;
				#else
				float3 staticSwitch14_g77058 = ObjectData20_g77058;
				#endif
				float3 Vertex_SizeFade1740_g76959 = staticSwitch14_g77058;
				float3 lerpResult16_g77063 = lerp( VertexPosition3588_g76959 , ( ( ( Vertex_Motion7493_g76959 + Grass_Perspective2661_g76959 ) * Vertex_Size1741_g76959 * Vertex_SizeFade1740_g76959 ) + Mesh_PivotsOS2291_g76959 ) , TVE_IsEnabled);
				float3 temp_output_4912_0_g76959 = lerpResult16_g77063;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch4976_g76959 = temp_output_4912_0_g76959;
				#else
				float3 staticSwitch4976_g76959 = temp_output_4912_0_g76959;
				#endif
				float3 temp_output_4918_0_g76959 = ( staticSwitch4976_g76959 + ( _VertexDataMode * 0.0 ) );
				float3 Final_VertexPosition890_g76959 = ( temp_output_4918_0_g76959 + _DisableSRPBatcher );
				
				float4 break33_g76991 = _second_uvs_mode;
				float2 temp_output_30_0_g76991 = ( v.ase_texcoord.xy * break33_g76991.x );
				float2 appendResult21_g76967 = (float2(v.ase_texcoord1.z , v.ase_texcoord1.w));
				float2 Mesh_DetailCoord3_g76959 = appendResult21_g76967;
				float2 temp_output_29_0_g76991 = ( Mesh_DetailCoord3_g76959 * break33_g76991.y );
				float2 temp_output_31_0_g76991 = ( (WorldPosition_Shifted7477_g76959).xz * break33_g76991.z );
				float2 vertexToFrag11_g76990 = ( ( ( temp_output_30_0_g76991 + temp_output_29_0_g76991 + temp_output_31_0_g76991 ) * (_SecondUVs).xy ) + (_SecondUVs).zw );
				o.ase_texcoord3.xy = vertexToFrag11_g76990;
				half Mesh_DetailMask90_g76959 = v.ase_color.b;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				half3 WorldNormal4101_g76959 = normalizedWorldNormal;
				float lerpResult5730_g76959 = lerp( (WorldNormal4101_g76959).y , v.ase_normal.y , Vertex_DynamicMode5112_g76959);
				half WorldNormal_Y6811_g76959 = lerpResult5730_g76959;
				float lerpResult6884_g76959 = lerp( Mesh_DetailMask90_g76959 , (WorldNormal_Y6811_g76959*0.5 + 0.5) , _DetailMeshMode);
				float lerpResult7357_g76959 = lerp( lerpResult6884_g76959 , ( 1.0 - lerpResult6884_g76959 ) , _DetailMeshInvertMode);
				float lerpResult7546_g76959 = lerp( 1.0 , lerpResult7357_g76959 , _DetailMeshValue);
				float vertexToFrag11_g77083 = lerpResult7546_g76959;
				o.ase_texcoord3.z = vertexToFrag11_g77083;
				o.ase_texcoord4.xyz = vertexToFrag3890_g76959;
				o.ase_texcoord5.xyz = vertexToFrag4224_g76959;
				
				o.ase_texcoord2 = v.ase_texcoord;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.w = 0;
				o.ase_texcoord4.w = 0;
				o.ase_texcoord5.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = Final_VertexPosition890_g76959;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.worldPos = positionWS;
				#endif

				float3 normalWS = TransformObjectToWorldDir(v.ase_normal);

				#if _CASTING_PUNCTUAL_LIGHT_SHADOW
					float3 lightDirectionWS = normalize(_LightPosition - positionWS);
				#else
					float3 lightDirectionWS = _LightDirection;
				#endif

				float4 clipPos = TransformWorldToHClip(ApplyShadowBias(positionWS, normalWS, lightDirectionWS));

				#if UNITY_REVERSED_Z
					clipPos.z = min(clipPos.z, UNITY_NEAR_CLIP_VALUE);
				#else
					clipPos.z = max(clipPos.z, UNITY_NEAR_CLIP_VALUE);
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = clipPos;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.clipPos = clipPos;

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord1 = v.ase_texcoord1;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE)
				#define ASE_SV_DEPTH SV_DepthLessEqual
			#else
				#define ASE_SV_DEPTH SV_Depth
			#endif

			half4 frag(	VertexOutput IN
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						 ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 WorldPosition = IN.worldPos;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float localCustomAlphaClip19_g77017 = ( 0.0 );
				half2 Main_UVs15_g76959 = ( ( IN.ase_texcoord2.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g76959 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g76959 );
				half Main_Alpha316_g76959 = tex2DNode29_g76959.a;
				float2 vertexToFrag11_g76990 = IN.ase_texcoord3.xy;
				half2 Second_UVs17_g76959 = vertexToFrag11_g76990;
				float4 tex2DNode89_g76959 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, Second_UVs17_g76959 );
				half Second_Alpha5007_g76959 = tex2DNode89_g76959.a;
				float4 tex2DNode35_g76959 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_Linear_Repeat, Main_UVs15_g76959 );
				half Main_Mask57_g76959 = tex2DNode35_g76959.b;
				float4 tex2DNode33_g76959 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_Linear_Repeat, Second_UVs17_g76959 );
				half Second_Mask81_g76959 = tex2DNode33_g76959.b;
				float lerpResult6885_g76959 = lerp( Main_Mask57_g76959 , Second_Mask81_g76959 , _DetailMaskMode);
				float lerpResult7354_g76959 = lerp( lerpResult6885_g76959 , ( 1.0 - lerpResult6885_g76959 ) , _DetailMaskInvertMode);
				float lerpResult7547_g76959 = lerp( 1.0 , lerpResult7354_g76959 , _DetailMaskIntensity);
				half Blend_Mask_Texture6794_g76959 = lerpResult7547_g76959;
				float vertexToFrag11_g77083 = IN.ase_texcoord3.z;
				half Blend_Mask_Mesh1540_g76959 = vertexToFrag11_g77083;
				float clampResult17_g77023 = clamp( ( Blend_Mask_Texture6794_g76959 * Blend_Mask_Mesh1540_g76959 ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g77032 = _DetailBlendMinValue;
				float temp_output_10_0_g77032 = ( _DetailBlendMaxValue - temp_output_7_0_g77032 );
				half Blend_Mask147_g76959 = ( saturate( ( ( clampResult17_g77023 - temp_output_7_0_g77032 ) / ( temp_output_10_0_g77032 + 0.0001 ) ) ) * _DetailMode );
				float lerpResult6153_g76959 = lerp( Main_Alpha316_g76959 , Second_Alpha5007_g76959 , Blend_Mask147_g76959);
				float lerpResult6785_g76959 = lerp( ( Main_Alpha316_g76959 * Second_Alpha5007_g76959 ) , lerpResult6153_g76959 , _DetailAlphaMode);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6158_g76959 = lerpResult6785_g76959;
				#else
				float staticSwitch6158_g76959 = Main_Alpha316_g76959;
				#endif
				half Blend_Alpha6157_g76959 = staticSwitch6158_g76959;
				half AlphaTreshold2132_g76959 = _AlphaClipValue;
				float temp_output_84_0_g76978 = _LayerExtrasValue;
				float temp_output_19_0_g76982 = TVE_ExtrasUsage[(int)temp_output_84_0_g76978];
				float4 temp_output_93_19_g76978 = TVE_ExtrasCoords;
				float3 vertexToFrag3890_g76959 = IN.ase_texcoord4.xyz;
				float3 WorldPosition3905_g76959 = vertexToFrag3890_g76959;
				float3 vertexToFrag4224_g76959 = IN.ase_texcoord5.xyz;
				float3 ObjectPosition4223_g76959 = vertexToFrag4224_g76959;
				float3 lerpResult4827_g76959 = lerp( WorldPosition3905_g76959 , ObjectPosition4223_g76959 , _ExtrasPositionMode);
				half2 UV96_g76978 = ( (temp_output_93_19_g76978).zw + ( (temp_output_93_19_g76978).xy * (lerpResult4827_g76959).xz ) );
				float4 tex2DArrayNode48_g76978 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ExtrasTex, sampler_Linear_Clamp, UV96_g76978,temp_output_84_0_g76978, 0.0 );
				float4 temp_output_17_0_g76982 = tex2DArrayNode48_g76978;
				float4 temp_output_94_85_g76978 = TVE_ExtrasParams;
				float4 temp_output_3_0_g76982 = temp_output_94_85_g76978;
				float4 ifLocalVar18_g76982 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76982 >= 0.5 )
				ifLocalVar18_g76982 = temp_output_17_0_g76982;
				else
				ifLocalVar18_g76982 = temp_output_3_0_g76982;
				float4 lerpResult22_g76982 = lerp( temp_output_3_0_g76982 , temp_output_17_0_g76982 , temp_output_19_0_g76982);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76982 = lerpResult22_g76982;
				#else
				float4 staticSwitch24_g76982 = ifLocalVar18_g76982;
				#endif
				half4 Global_Extras_Params5440_g76959 = staticSwitch24_g76982;
				float4 break456_g76996 = Global_Extras_Params5440_g76959;
				half Global_Extras_Alpha1033_g76959 = saturate( break456_g76996.w );
				float3 ObjectPosition_Shifted7481_g76959 = ( ObjectPosition4223_g76959 - TVE_WorldOrigin );
				half3 Input_Position167_g77037 = ObjectPosition_Shifted7481_g76959;
				float dotResult156_g77037 = dot( (Input_Position167_g77037).xz , float2( 12.9898,78.233 ) );
				half Vertex_DynamicMode5112_g76959 = _VertexDynamicMode;
				half Input_DynamicMode120_g77037 = Vertex_DynamicMode5112_g76959;
				float Postion_Random162_g77037 = ( sin( dotResult156_g77037 ) * ( 1.0 - Input_DynamicMode120_g77037 ) );
				float Mesh_Variation16_g76959 = IN.ase_color.r;
				half Input_Variation124_g77037 = Mesh_Variation16_g76959;
				half ObjectData20_g77039 = frac( ( Postion_Random162_g77037 + Input_Variation124_g77037 ) );
				half WorldData19_g77039 = Input_Variation124_g77037;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g77039 = WorldData19_g77039;
				#else
				float staticSwitch14_g77039 = ObjectData20_g77039;
				#endif
				float clampResult17_g77041 = clamp( staticSwitch14_g77039 , 0.0001 , 0.9999 );
				float Global_MeshVariation5104_g76959 = clampResult17_g77041;
				float lerpResult5154_g76959 = lerp( 0.0 , Global_MeshVariation5104_g76959 , _AlphaVariationValue);
				half Global_Alpha_Variation5158_g76959 = lerpResult5154_g76959;
				float lerpResult6866_g76959 = lerp( ( 1.0 - Blend_Mask147_g76959 ) , 1.0 , _DetailFadeMode);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6612_g76959 = lerpResult6866_g76959;
				#else
				float staticSwitch6612_g76959 = 1.0;
				#endif
				half Blend_Mask_Invert6260_g76959 = staticSwitch6612_g76959;
				half Alpha_Mask6234_g76959 = ( 1.0 * Blend_Mask_Invert6260_g76959 );
				float lerpResult5203_g76959 = lerp( 1.0 , saturate( ( ( Global_Extras_Alpha1033_g76959 - Global_Alpha_Variation5158_g76959 ) + ( Global_Extras_Alpha1033_g76959 * 0.5 ) ) ) , ( Alpha_Mask6234_g76959 * _GlobalAlpha ));
				float lerpResult16_g77012 = lerp( 1.0 , lerpResult5203_g76959 , TVE_IsEnabled);
				half Global_Alpha315_g76959 = lerpResult16_g77012;
				half Fade_Alpha3727_g76959 = 1.0;
				float Emissive_Alpha6927_g76959 = 1.0;
				half Final_Alpha7344_g76959 = min( min( ( Blend_Alpha6157_g76959 - AlphaTreshold2132_g76959 ) , Global_Alpha315_g76959 ) , min( Fade_Alpha3727_g76959 , Emissive_Alpha6927_g76959 ) );
				float temp_output_3_0_g77017 = Final_Alpha7344_g76959;
				float Alpha19_g77017 = temp_output_3_0_g77017;
				float temp_output_15_0_g77017 = 0.01;
				float Treshold19_g77017 = temp_output_15_0_g77017;
				{
				#if defined (TVE_FEATURE_CLIP)
				#if defined (TVE_IS_HD_PIPELINE)
				#if !defined (SHADERPASS_FORWARD_BYPASS_ALPHA_TEST)
				clip(Alpha19_g77017 - Treshold19_g77017);
				#endif
				#if !defined (SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST)
				clip(Alpha19_g77017 - Treshold19_g77017);
				#endif
				#else
				clip(Alpha19_g77017 - Treshold19_g77017);
				#endif
				#endif
				}
				half Main_Color_Alpha6121_g76959 = _MainColor.a;
				half Second_Color_Alpha6152_g76959 = _SecondColor.a;
				float lerpResult6168_g76959 = lerp( Main_Color_Alpha6121_g76959 , Second_Color_Alpha6152_g76959 , Blend_Mask147_g76959);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6174_g76959 = lerpResult6168_g76959;
				#else
				float staticSwitch6174_g76959 = Main_Color_Alpha6121_g76959;
				#endif
				half Blend_Color_Alpha6167_g76959 = staticSwitch6174_g76959;
				half Final_Clip914_g76959 = saturate( ( Alpha19_g77017 * Blend_Color_Alpha6167_g76959 ) );
				

				float Alpha = Final_Clip914_g76959;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;

				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = 0;
				#endif

				#ifdef _ALPHATEST_ON
					#ifdef _ALPHATEST_SHADOW_ON
						clip(Alpha - AlphaClipThresholdShadow);
					#else
						clip(Alpha - AlphaClipThreshold);
					#endif
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODFadeCrossFade( IN.clipPos );
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				return 0;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthOnly"
			Tags { "LightMode"="DepthOnly" }

			ZWrite On
			ColorMask 0
			AlphaToMask Off

			HLSLPROGRAM

			#define _SPECULAR_SETUP 1
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile_fragment _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#pragma multi_compile _ DOTS_INSTANCING_ON
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define ASE_TRANSLUCENCY 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140007
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_DEPTHONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
			
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#pragma shader_feature_local_fragment TVE_FEATURE_CLIP
			#pragma shader_feature_local TVE_FEATURE_BATCHING
			#pragma shader_feature_local_fragment TVE_FEATURE_DETAIL
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_UNIVERSAL_PIPELINE
			#define TVE_IS_PLANT_SHADER
			#define TVE_IS_SUBSURFACE_SHADER
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 worldPos : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				float4 shadowCoord : TEXCOORD1;
				#endif
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _DetailBlendRemap;
			float4 _GradientMaskRemap;
			half4 _VertexOcclusionRemap;
			half4 _RimLightRemap;
			half4 _MainColor;
			half4 _MainUVs;
			half4 _MotionHighlightColor;
			half4 _EmissiveColor;
			half4 _EmissiveUVs;
			half4 _SecondColor;
			half4 _VertexOcclusionColor;
			half4 _second_uvs_mode;
			float4 _MaxBoundsInfo;
			half4 _SecondUVs;
			half4 _SecondMaskRemap;
			half4 _MainMaskRemap;
			half4 _GradientColorTwo;
			float4 _SubsurfaceDiffusion_Asset;
			float4 _Color;
			float4 _NoiseMaskRemap;
			half4 _SubsurfaceColor;
			half4 _GradientColorOne;
			half3 _render_normals;
			half _SecondAlbedoValue;
			half _DetailMaskIntensity;
			half _DetailMaskMode;
			half _MainAlbedoValue;
			half _DetailBlendMode;
			half _VertexDataMode;
			half _DetailMaskInvertMode;
			half _SizeFadeStartValue;
			half _render_zw;
			half _GlobalSize;
			half _MotionVariation_20;
			half _MotionSpeed_20;
			half _MotionValue_20;
			half _MotionFacingValue;
			half _MotionAmplitude_20;
			half _MotionAmplitude_22;
			float _MotionScale_32;
			half _SizeFadeEndValue;
			float _MotionVariation_32;
			half _MotionValue_30;
			half _MotionAmplitude_32;
			half _PerspectivePushValue;
			half _PerspectiveNoiseValue;
			half _DetailMeshMode;
			half _PerspectiveAngleValue;
			half _LayerVertexValue;
			float _MotionSpeed_32;
			half _DetailMeshInvertMode;
			half _GradientMinValue;
			half _DetailBlendMinValue;
			half _SecondNormalValue;
			half _OverlayProjectionValue;
			half _GlobalWetness;
			half _GlobalEmissive;
			half _EmissivePhaseValue;
			float _emissive_intensity_value;
			half _RenderSpecular;
			half _DetailNormalValue;
			half _MainSmoothnessValue;
			half _MainOcclusionValue;
			half _SecondOcclusionValue;
			half _DetailAlphaMode;
			half _AlphaClipValue;
			half _AlphaVariationValue;
			half _DetailFadeMode;
			half _GlobalAlpha;
			half _SecondSmoothnessValue;
			half _MainNormalValue;
			half _OverlayVariationValue;
			half _ExtrasPositionMode;
			half _DetailBlendMaxValue;
			half _DetailMode;
			half _MotionScale_20;
			half _GradientMaxValue;
			half _MainMaskMinValue;
			half _MainMaskMaxValue;
			half _SecondMaskMinValue;
			half _SecondMaskMaxValue;
			half _VertexOcclusionMinValue;
			half _VertexOcclusionMaxValue;
			half _LayerColorsValue;
			half _ColorsPositionMode;
			half _GlobalColors;
			half _ColorsVariationValue;
			half _ColorsMaskMode;
			half _GlobalOverlay;
			half _LayerExtrasValue;
			half _DetailMeshValue;
			half _InteractionAmplitude;
			float _MotionSpeed_10;
			half _MotionAmplitude_10;
			half _MessageSecondMask;
			half _MessageMotionVariation;
			half _MessageGlobalsVariation;
			half _MessageMainMask;
			half _MessageSubsurface;
			half _IsTVEShader;
			half _IsIdentifier;
			half _MessageOcclusion;
			half _HasOcclusion;
			half _HasEmissive;
			half _VertexVariationMode;
			half _IsCollected;
			half _IsShared;
			half _IsVersion;
			half _RenderCoverage;
			float _EmissiveIntensityValue;
			half _HasGradient;
			half _RenderNormals;
			half _CategoryRender;
			half _RenderMode;
			half _render_coverage;
			half _render_cull;
			half _render_src;
			half _render_dst;
			float _IsPlantShader;
			half _IsSubsurfaceShader;
			float _SubsurfaceDiffusion;
			half _Cutoff;
			half _ColorsMaskMinValue;
			half _ColorsMaskMaxValue;
			half _RenderDecals;
			half _RenderSSR;
			half _RenderZWrite;
			half _RenderClip;
			half _RenderCull;
			half _RenderQueue;
			half _RenderPriority;
			half _DetailTypeMode;
			half _DetailOpaqueMode;
			half _DetailCoordMode;
			half _EmissiveIntensityMode;
			half _SubsurfaceDirectValue;
			half _SubsurfaceAngleValue;
			half _SubsurfaceScatteringValue;
			half _RenderDirect;
			half _CategoryRimLight;
			half _CategoryMatcap;
			half _CategorySubsurface;
			half _CategoryEmissive;
			half _RenderAmbient;
			half _RenderShadow;
			half _IsCoreShader;
			half _VertexPivotMode;
			half _MotionPosition_10;
			float _MotionScale_10;
			half _MotionVariation_10;
			half _VertexDynamicMode;
			half _LayerMotionValue;
			half _SubsurfaceAmbientValue;
			half _InteractionMaskValue;
			half _SubsurfaceShadowValue;
			half _SpaceRenderFade;
			half _EmissiveFlagMode;
			half _SecondUVsMode;
			half _SpaceGlobalLayers;
			half _SpaceGlobalLocals;
			half _SpaceSubsurface;
			half _SpaceMotionLocals;
			half _SpaceMotionGlobals;
			half _SpaceGlobalOptions;
			half _CategoryGlobals;
			half _CategoryMain;
			half _CategoryDetail;
			half _CategoryOcclusion;
			half _CategoryGradient;
			half _CategoryNoise;
			half _CategoryPerspective;
			half _CategorySizeFade;
			half _CategoryMotion;
			half _SubsurfaceNormalValue;
			half _SubsurfaceValue;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			// Property used by ScenePickingPass
			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			// Properties used by SceneSelectionPass
			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(TVE_NoiseTex);
			float3 TVE_WorldOrigin;
			half4 TVE_MotionParams;
			half4 TVE_TimeParams;
			SAMPLER(sampler_Linear_Repeat);
			float TVE_MotionUsage[10];
			TEXTURE2D_ARRAY(TVE_MotionTex);
			half4 TVE_MotionCoords;
			SAMPLER(sampler_Linear_Clamp);
			half TVE_MotionValue_10;
			half TVE_MotionValue_20;
			half TVE_MotionFadeEnd;
			half TVE_MotionFadeStart;
			half TVE_MotionValue_30;
			float TVE_VertexUsage[10];
			TEXTURE2D_ARRAY(TVE_VertexTex);
			half4 TVE_VertexCoords;
			half4 TVE_VertexParams;
			half TVE_DistanceFadeBias;
			half TVE_IsEnabled;
			half _DisableSRPBatcher;
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);
			TEXTURE2D(_SecondAlbedoTex);
			SAMPLER(sampler_SecondAlbedoTex);
			TEXTURE2D(_MainMaskTex);
			TEXTURE2D(_SecondMaskTex);
			float TVE_ExtrasUsage[10];
			TEXTURE2D_ARRAY(TVE_ExtrasTex);
			half4 TVE_ExtrasCoords;
			half4 TVE_ExtrasParams;


			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/DepthOnlyPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			float2 DecodeFloatToVector2( float enc )
			{
				float2 result ;
				result.y = enc % 2048;
				result.x = floor(enc / 2048);
				return result / (2048 - 1);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 VertexPosition3588_g76959 = v.vertex.xyz;
				float3 appendResult60_g76970 = (float3(v.ase_texcoord3.x , v.ase_texcoord3.z , v.ase_texcoord3.y));
				half3 Mesh_PivotsData2831_g76959 = ( appendResult60_g76970 * _VertexPivotMode );
				half3 Mesh_PivotsOS2291_g76959 = Mesh_PivotsData2831_g76959;
				float3 temp_output_2283_0_g76959 = ( VertexPosition3588_g76959 - Mesh_PivotsOS2291_g76959 );
				half3 VertexPos40_g77080 = temp_output_2283_0_g76959;
				half3 VertexPos40_g77081 = VertexPos40_g77080;
				float3 appendResult74_g77081 = (float3(VertexPos40_g77081.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g77081 = appendResult74_g77081;
				float3 break84_g77081 = VertexPos40_g77081;
				float3 appendResult81_g77081 = (float3(0.0 , break84_g77081.y , break84_g77081.z));
				half3 VertexPosOtherAxis82_g77081 = appendResult81_g77081;
				float3 ase_worldPos = TransformObjectToWorld( (v.vertex).xyz );
				float3 vertexToFrag3890_g76959 = ase_worldPos;
				float3 WorldPosition3905_g76959 = vertexToFrag3890_g76959;
				float3 WorldPosition_Shifted7477_g76959 = ( WorldPosition3905_g76959 - TVE_WorldOrigin );
				float4x4 break19_g77047 = GetObjectToWorldMatrix();
				float3 appendResult20_g77047 = (float3(break19_g77047[ 0 ][ 3 ] , break19_g77047[ 1 ][ 3 ] , break19_g77047[ 2 ][ 3 ]));
				float3 temp_output_122_0_g77047 = Mesh_PivotsData2831_g76959;
				float3 PivotsOnly105_g77047 = (mul( GetObjectToWorldMatrix(), float4( temp_output_122_0_g77047 , 0.0 ) ).xyz).xyz;
				half3 ObjectData20_g77049 = ( appendResult20_g77047 + PivotsOnly105_g77047 );
				half3 WorldData19_g77049 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g77049 = WorldData19_g77049;
				#else
				float3 staticSwitch14_g77049 = ObjectData20_g77049;
				#endif
				float3 temp_output_114_0_g77047 = staticSwitch14_g77049;
				float3 vertexToFrag4224_g76959 = temp_output_114_0_g77047;
				float3 ObjectPosition4223_g76959 = vertexToFrag4224_g76959;
				float3 ObjectPosition_Shifted7481_g76959 = ( ObjectPosition4223_g76959 - TVE_WorldOrigin );
				float3 lerpResult6766_g76959 = lerp( WorldPosition_Shifted7477_g76959 , ObjectPosition_Shifted7481_g76959 , _MotionPosition_10);
				float3 Motion_10_Position6738_g76959 = lerpResult6766_g76959;
				half3 Input_Position419_g77065 = Motion_10_Position6738_g76959;
				float Input_MotionScale287_g77065 = ( _MotionScale_10 + 0.2 );
				float2 temp_output_597_0_g77065 = (( Input_Position419_g77065 * Input_MotionScale287_g77065 * 0.0075 )).xz;
				float2 temp_output_447_0_g76964 = ((TVE_MotionParams).xy*2.0 + -1.0);
				half2 Global_Wind_DirectionWS4683_g76959 = temp_output_447_0_g76964;
				half2 Input_DirectionWS423_g77065 = Global_Wind_DirectionWS4683_g76959;
				float lerpResult115_g77066 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g77065 = _MotionSpeed_10;
				half Input_MotionVariation284_g77065 = _MotionVariation_10;
				half3 Input_Position167_g77037 = ObjectPosition_Shifted7481_g76959;
				float dotResult156_g77037 = dot( (Input_Position167_g77037).xz , float2( 12.9898,78.233 ) );
				half Vertex_DynamicMode5112_g76959 = _VertexDynamicMode;
				half Input_DynamicMode120_g77037 = Vertex_DynamicMode5112_g76959;
				float Postion_Random162_g77037 = ( sin( dotResult156_g77037 ) * ( 1.0 - Input_DynamicMode120_g77037 ) );
				float Mesh_Variation16_g76959 = v.ase_color.r;
				half Input_Variation124_g77037 = Mesh_Variation16_g76959;
				half ObjectData20_g77039 = frac( ( Postion_Random162_g77037 + Input_Variation124_g77037 ) );
				half WorldData19_g77039 = Input_Variation124_g77037;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g77039 = WorldData19_g77039;
				#else
				float staticSwitch14_g77039 = ObjectData20_g77039;
				#endif
				float clampResult17_g77041 = clamp( staticSwitch14_g77039 , 0.0001 , 0.9999 );
				float Global_MeshVariation5104_g76959 = clampResult17_g77041;
				half Input_GlobalMeshVariation569_g77065 = Global_MeshVariation5104_g76959;
				float temp_output_630_0_g77065 = ( ( ( lerpResult115_g77066 * Input_MotionSpeed62_g77065 ) + ( Input_MotionVariation284_g77065 * Input_GlobalMeshVariation569_g77065 ) ) * 0.03 );
				float temp_output_607_0_g77065 = frac( temp_output_630_0_g77065 );
				float4 lerpResult590_g77065 = lerp( SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g77065 + ( -Input_DirectionWS423_g77065 * temp_output_607_0_g77065 ) ), 0.0 ) , SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g77065 + ( -Input_DirectionWS423_g77065 * frac( ( temp_output_630_0_g77065 + 0.5 ) ) ) ), 0.0 ) , ( abs( ( temp_output_607_0_g77065 - 0.5 ) ) / 0.5 ));
				half4 Noise_Complex703_g77065 = lerpResult590_g77065;
				float2 temp_output_645_0_g77065 = ((Noise_Complex703_g77065).rg*2.0 + -1.0);
				float2 break650_g77065 = temp_output_645_0_g77065;
				float3 appendResult649_g77065 = (float3(break650_g77065.x , 0.0 , break650_g77065.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Global_Noise_OS5548_g76959 = (( mul( GetWorldToObjectMatrix(), float4( appendResult649_g77065 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Noise_DirectionOS487_g77073 = Global_Noise_OS5548_g76959;
				float2 break448_g76964 = temp_output_447_0_g76964;
				float3 appendResult452_g76964 = (float3(break448_g76964.x , 0.0 , break448_g76964.y));
				half2 Global_Wind_DirectionOS5692_g76959 = (( mul( GetWorldToObjectMatrix(), float4( appendResult452_g76964 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Wind_DirectionOS458_g77073 = Global_Wind_DirectionOS5692_g76959;
				float temp_output_84_0_g76973 = _LayerMotionValue;
				float temp_output_19_0_g76977 = TVE_MotionUsage[(int)temp_output_84_0_g76973];
				float4 temp_output_91_19_g76973 = TVE_MotionCoords;
				half2 UV94_g76973 = ( (temp_output_91_19_g76973).zw + ( (temp_output_91_19_g76973).xy * (ObjectPosition4223_g76959).xz ) );
				float4 tex2DArrayNode50_g76973 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_Linear_Clamp, UV94_g76973,temp_output_84_0_g76973, 0.0 );
				float4 temp_output_17_0_g76977 = tex2DArrayNode50_g76973;
				float4 temp_output_112_19_g76973 = TVE_MotionParams;
				float4 temp_output_3_0_g76977 = temp_output_112_19_g76973;
				float4 ifLocalVar18_g76977 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76977 >= 0.5 )
				ifLocalVar18_g76977 = temp_output_17_0_g76977;
				else
				ifLocalVar18_g76977 = temp_output_3_0_g76977;
				float4 lerpResult22_g76977 = lerp( temp_output_3_0_g76977 , temp_output_17_0_g76977 , temp_output_19_0_g76977);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76977 = lerpResult22_g76977;
				#else
				float4 staticSwitch24_g76977 = ifLocalVar18_g76977;
				#endif
				half4 Global_Motion_Params3909_g76959 = staticSwitch24_g76977;
				float4 break322_g76964 = Global_Motion_Params3909_g76959;
				half Global_Wind_Power2223_g76959 = break322_g76964.z;
				half Input_WindPower449_g77073 = Global_Wind_Power2223_g76959;
				float temp_output_565_0_g77073 = ( 1.0 - Input_WindPower449_g77073 );
				float2 lerpResult516_g77073 = lerp( Input_Noise_DirectionOS487_g77073 , Input_Wind_DirectionOS458_g77073 , ( ( 1.0 - ( temp_output_565_0_g77073 * temp_output_565_0_g77073 * temp_output_565_0_g77073 ) ) * 0.6 ));
				half Mesh_Height1524_g76959 = v.ase_color.a;
				half Input_MeshHeight388_g77073 = Mesh_Height1524_g76959;
				half ObjectData20_g77074 = Input_MeshHeight388_g77073;
				float enc62_g76967 = v.ase_texcoord.w;
				float2 localDecodeFloatToVector262_g76967 = DecodeFloatToVector2( enc62_g76967 );
				float2 break63_g76967 = ( localDecodeFloatToVector262_g76967 * 100.0 );
				float Bounds_Height5230_g76959 = break63_g76967.x;
				half Input_BoundsHeight390_g77073 = Bounds_Height5230_g76959;
				half WorldData19_g77074 = ( Input_MeshHeight388_g77073 * Input_MeshHeight388_g77073 * Input_BoundsHeight390_g77073 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g77074 = WorldData19_g77074;
				#else
				float staticSwitch14_g77074 = ObjectData20_g77074;
				#endif
				half Final_Motion10_Mask321_g77073 = ( staticSwitch14_g77074 * 2.0 );
				half Motion_10_Amplitude2258_g76959 = _MotionAmplitude_10;
				half Input_BendingAmplitude376_g77073 = Motion_10_Amplitude2258_g76959;
				half Global_MotionValue640_g77073 = TVE_MotionValue_10;
				half2 Final_Bending631_g77073 = ( lerpResult516_g77073 * ( Final_Motion10_Mask321_g77073 * Input_BendingAmplitude376_g77073 * Input_WindPower449_g77073 * Input_WindPower449_g77073 * Global_MotionValue640_g77073 ) );
				float2 appendResult433_g76964 = (float2(break322_g76964.x , break322_g76964.y));
				float2 temp_output_436_0_g76964 = (appendResult433_g76964*2.0 + -1.0);
				float2 break441_g76964 = temp_output_436_0_g76964;
				float3 appendResult440_g76964 = (float3(break441_g76964.x , 0.0 , break441_g76964.y));
				half2 Global_React_DirectionOS39_g76959 = (( mul( GetWorldToObjectMatrix(), float4( appendResult440_g76964 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_React_DirectionOS358_g77073 = Global_React_DirectionOS39_g76959;
				float clampResult17_g77076 = clamp( Input_MeshHeight388_g77073 , 0.0001 , 0.9999 );
				float temp_output_7_0_g77075 = 0.0;
				half Input_InteractionUseMask62_g77073 = _InteractionMaskValue;
				float temp_output_10_0_g77075 = ( Input_InteractionUseMask62_g77073 - temp_output_7_0_g77075 );
				half Final_InteractionRemap594_g77073 = saturate( ( ( clampResult17_g77076 - temp_output_7_0_g77075 ) / ( temp_output_10_0_g77075 + 0.0001 ) ) );
				half ObjectData20_g77077 = Final_InteractionRemap594_g77073;
				half WorldData19_g77077 = ( Final_InteractionRemap594_g77073 * Final_InteractionRemap594_g77073 * Input_BoundsHeight390_g77073 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g77077 = WorldData19_g77077;
				#else
				float staticSwitch14_g77077 = ObjectData20_g77077;
				#endif
				half Final_InteractionMask373_g77073 = ( staticSwitch14_g77077 * 2.0 );
				half Interaction_Amplitude7501_g76959 = _InteractionAmplitude;
				half Input_InteractionAmplitude58_g77073 = Interaction_Amplitude7501_g76959;
				half2 Final_Interaction632_g77073 = ( Input_React_DirectionOS358_g77073 * Final_InteractionMask373_g77073 * Input_InteractionAmplitude58_g77073 );
				half Global_Interaction_Mask66_g76959 = ( break322_g76964.w * break322_g76964.w * break322_g76964.w * break322_g76964.w );
				float Input_InteractionGlobalMask330_g77073 = Global_Interaction_Mask66_g76959;
				half Final_InteractionValue525_g77073 = saturate( ( Input_InteractionAmplitude58_g77073 * Input_InteractionGlobalMask330_g77073 ) );
				float2 lerpResult551_g77073 = lerp( Final_Bending631_g77073 , Final_Interaction632_g77073 , Final_InteractionValue525_g77073);
				float2 break364_g77073 = lerpResult551_g77073;
				float3 appendResult638_g77073 = (float3(break364_g77073.x , 0.0 , break364_g77073.y));
				half3 Motion_10_Interaction7519_g76959 = appendResult638_g77073;
				half3 Angle44_g77080 = Motion_10_Interaction7519_g76959;
				half Angle44_g77081 = (Angle44_g77080).z;
				half3 VertexPos40_g77082 = ( VertexPosRotationAxis50_g77081 + ( VertexPosOtherAxis82_g77081 * cos( Angle44_g77081 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g77081 ) * sin( Angle44_g77081 ) ) );
				float3 appendResult74_g77082 = (float3(0.0 , 0.0 , VertexPos40_g77082.z));
				half3 VertexPosRotationAxis50_g77082 = appendResult74_g77082;
				float3 break84_g77082 = VertexPos40_g77082;
				float3 appendResult81_g77082 = (float3(break84_g77082.x , break84_g77082.y , 0.0));
				half3 VertexPosOtherAxis82_g77082 = appendResult81_g77082;
				half Angle44_g77082 = -(Angle44_g77080).x;
				half3 Input_Position419_g77078 = WorldPosition_Shifted7477_g76959;
				float3 break459_g77078 = Input_Position419_g77078;
				float Sum_Position446_g77078 = ( break459_g77078.x + break459_g77078.y + break459_g77078.z );
				half Input_MotionScale321_g77078 = ( _MotionScale_20 * 0.1 );
				half Input_MotionVariation330_g77078 = _MotionVariation_20;
				half Input_GlobalVariation400_g77078 = Global_MeshVariation5104_g76959;
				float lerpResult115_g77079 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g77078 = _MotionSpeed_20;
				float temp_output_404_0_g77078 = ( lerpResult115_g77079 * Input_MotionSpeed62_g77078 );
				half Motion_SineA450_g77078 = sin( ( ( Sum_Position446_g77078 * Input_MotionScale321_g77078 ) + ( Input_MotionVariation330_g77078 * Input_GlobalVariation400_g77078 ) + temp_output_404_0_g77078 ) );
				half Motion_SineB395_g77078 = sin( ( ( temp_output_404_0_g77078 * 0.6842 ) + ( Sum_Position446_g77078 * Input_MotionScale321_g77078 ) ) );
				half3 Input_Position419_g76971 = VertexPosition3588_g76959;
				float3 normalizeResult518_g76971 = normalize( Input_Position419_g76971 );
				half2 Input_DirectionOS423_g76971 = Global_React_DirectionOS39_g76959;
				float2 break521_g76971 = -Input_DirectionOS423_g76971;
				float3 appendResult522_g76971 = (float3(break521_g76971.x , 0.0 , break521_g76971.y));
				float dotResult519_g76971 = dot( normalizeResult518_g76971 , appendResult522_g76971 );
				half Input_Value62_g76971 = _MotionFacingValue;
				float lerpResult524_g76971 = lerp( 1.0 , (dotResult519_g76971*0.5 + 0.5) , Input_Value62_g76971);
				half ObjectData20_g76972 = max( lerpResult524_g76971 , 0.001 );
				half WorldData19_g76972 = 1.0;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76972 = WorldData19_g76972;
				#else
				float staticSwitch14_g76972 = ObjectData20_g76972;
				#endif
				half Motion_FacingMask5214_g76959 = staticSwitch14_g76972;
				half Motion_20_Amplitude4381_g76959 = ( _MotionValue_20 * Motion_FacingMask5214_g76959 );
				half Input_MotionAmplitude384_g77078 = Motion_20_Amplitude4381_g76959;
				half Input_GlobalWind407_g77078 = Global_Wind_Power2223_g76959;
				float4 break638_g77065 = abs( Noise_Complex703_g77065 );
				half Global_Noise_B5526_g76959 = break638_g77065.b;
				half Input_GlobalNoise411_g77078 = Global_Noise_B5526_g76959;
				float lerpResult413_g77078 = lerp( 1.6 , 0.4 , Input_GlobalWind407_g77078);
				half Motion_Amplitude418_g77078 = ( Input_MotionAmplitude384_g77078 * Input_GlobalWind407_g77078 * pow( Input_GlobalNoise411_g77078 , lerpResult413_g77078 ) );
				half Input_Squash58_g77078 = _MotionAmplitude_20;
				float enc59_g76967 = v.ase_texcoord.z;
				float2 localDecodeFloatToVector259_g76967 = DecodeFloatToVector2( enc59_g76967 );
				float2 break61_g76967 = localDecodeFloatToVector259_g76967;
				half Mesh_Motion_2060_g76959 = break61_g76967.x;
				half Input_MeshMotion_20388_g77078 = Mesh_Motion_2060_g76959;
				float Bounds_Radius5231_g76959 = break63_g76967.y;
				half Input_BoundsRadius390_g77078 = Bounds_Radius5231_g76959;
				half Global_MotionValue462_g77078 = TVE_MotionValue_20;
				half2 Input_DirectionOS366_g77078 = Global_React_DirectionOS39_g76959;
				float2 break371_g77078 = Input_DirectionOS366_g77078;
				float3 appendResult372_g77078 = (float3(break371_g77078.x , ( Motion_SineA450_g77078 * 0.3 ) , break371_g77078.y));
				half3 Motion_20_Squash4418_g76959 = ( ( (max( Motion_SineA450_g77078 , Motion_SineB395_g77078 )*0.5 + 0.5) * Motion_Amplitude418_g77078 * Input_Squash58_g77078 * Input_MeshMotion_20388_g77078 * Input_BoundsRadius390_g77078 * Global_MotionValue462_g77078 ) * appendResult372_g77078 );
				half3 VertexPos40_g77057 = ( ( VertexPosRotationAxis50_g77082 + ( VertexPosOtherAxis82_g77082 * cos( Angle44_g77082 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g77082 ) * sin( Angle44_g77082 ) ) ) + Motion_20_Squash4418_g76959 );
				float3 appendResult74_g77057 = (float3(0.0 , VertexPos40_g77057.y , 0.0));
				float3 VertexPosRotationAxis50_g77057 = appendResult74_g77057;
				float3 break84_g77057 = VertexPos40_g77057;
				float3 appendResult81_g77057 = (float3(break84_g77057.x , 0.0 , break84_g77057.z));
				float3 VertexPosOtherAxis82_g77057 = appendResult81_g77057;
				half Input_Rolling379_g77078 = _MotionAmplitude_22;
				half Motion_20_Rolling5257_g76959 = ( Motion_SineA450_g77078 * Motion_Amplitude418_g77078 * Input_Rolling379_g77078 * Input_MeshMotion_20388_g77078 * Global_MotionValue462_g77078 );
				half Angle44_g77057 = Motion_20_Rolling5257_g76959;
				half3 Input_Position500_g77069 = WorldPosition_Shifted7477_g76959;
				half Input_MotionScale321_g77069 = _MotionScale_32;
				half Input_MotionVariation330_g77069 = _MotionVariation_32;
				half Input_GlobalVariation372_g77069 = Global_MeshVariation5104_g76959;
				float lerpResult115_g77072 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g77069 = _MotionSpeed_32;
				float4 tex2DNode460_g77069 = SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( ( (Input_Position500_g77069).xz * Input_MotionScale321_g77069 * 0.03 ) + ( Input_MotionVariation330_g77069 * Input_GlobalVariation372_g77069 ) + ( lerpResult115_g77072 * Input_MotionSpeed62_g77069 * 0.02 ) ), 0.0 );
				float3 appendResult462_g77069 = (float3(tex2DNode460_g77069.r , tex2DNode460_g77069.g , tex2DNode460_g77069.b));
				half3 Flutter_Texture489_g77069 = (appendResult462_g77069*2.0 + -1.0);
				float temp_output_7_0_g77027 = TVE_MotionFadeEnd;
				float temp_output_10_0_g77027 = ( TVE_MotionFadeStart - temp_output_7_0_g77027 );
				half Motion_FadeOut4005_g76959 = saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g77027 ) / ( temp_output_10_0_g77027 + 0.0001 ) ) );
				half Motion_30_Amplitude4960_g76959 = ( _MotionValue_30 * _MotionAmplitude_32 * Motion_FacingMask5214_g76959 * Motion_FadeOut4005_g76959 );
				half Input_MotionAmplitude58_g77069 = Motion_30_Amplitude4960_g76959;
				half Mesh_Motion_30144_g76959 = break61_g76967.y;
				half Input_MeshMotion_30374_g77069 = Mesh_Motion_30144_g76959;
				half Input_GlobalWind471_g77069 = Global_Wind_Power2223_g76959;
				half Global_MotionValue503_g77069 = TVE_MotionValue_30;
				half Input_GlobalNoise472_g77069 = Global_Noise_B5526_g76959;
				float lerpResult466_g77069 = lerp( 2.0 , 0.6 , Input_GlobalWind471_g77069);
				half Flutter_Amplitude491_g77069 = ( Input_MotionAmplitude58_g77069 * Input_MeshMotion_30374_g77069 * Input_GlobalWind471_g77069 * Global_MotionValue503_g77069 * pow( Input_GlobalNoise472_g77069 , lerpResult466_g77069 ) );
				half3 Motion_30_Flutter263_g76959 = ( Flutter_Texture489_g77069 * Flutter_Amplitude491_g77069 );
				float3 Vertex_Motion_Object833_g76959 = ( ( VertexPosRotationAxis50_g77057 + ( VertexPosOtherAxis82_g77057 * cos( Angle44_g77057 ) ) + ( cross( float3(0,1,0) , VertexPosOtherAxis82_g77057 ) * sin( Angle44_g77057 ) ) ) + Motion_30_Flutter263_g76959 );
				half3 ObjectData20_g77062 = Vertex_Motion_Object833_g76959;
				float3 temp_output_3474_0_g76959 = ( VertexPosition3588_g76959 - Mesh_PivotsOS2291_g76959 );
				float3 Vertex_Motion_World1118_g76959 = ( ( ( temp_output_3474_0_g76959 + Motion_10_Interaction7519_g76959 ) + Motion_20_Squash4418_g76959 ) + Motion_30_Flutter263_g76959 );
				half3 WorldData19_g77062 = Vertex_Motion_World1118_g76959;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g77062 = WorldData19_g77062;
				#else
				float3 staticSwitch14_g77062 = ObjectData20_g77062;
				#endif
				float3 temp_output_7495_0_g76959 = staticSwitch14_g77062;
				float3 Vertex_Motion7493_g76959 = temp_output_7495_0_g76959;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 normalizeResult2169_g76959 = normalize( ase_worldViewDir );
				float3 ViewDirection3963_g76959 = normalizeResult2169_g76959;
				float3 break2709_g76959 = cross( ViewDirection3963_g76959 , half3(0,1,0) );
				float3 appendResult2710_g76959 = (float3(-break2709_g76959.z , 0.0 , break2709_g76959.x));
				float3 appendResult2667_g76959 = (float3(Global_MeshVariation5104_g76959 , 0.5 , Global_MeshVariation5104_g76959));
				float dotResult2212_g76959 = dot( ViewDirection3963_g76959 , float3(0,1,0) );
				half Mask_HView2656_g76959 = dotResult2212_g76959;
				float saferPower2652_g76959 = abs( Mask_HView2656_g76959 );
				half3 Grass_Perspective2661_g76959 = ( ( ( mul( GetWorldToObjectMatrix(), float4( appendResult2710_g76959 , 0.0 ) ).xyz * _PerspectivePushValue ) + ( (appendResult2667_g76959*2.0 + -1.0) * _PerspectiveNoiseValue ) ) * Mesh_Height1524_g76959 * pow( saferPower2652_g76959 , _PerspectiveAngleValue ) );
				float temp_output_84_0_g76999 = _LayerVertexValue;
				float temp_output_19_0_g77003 = TVE_VertexUsage[(int)temp_output_84_0_g76999];
				float4 temp_output_94_19_g76999 = TVE_VertexCoords;
				half2 UV97_g76999 = ( (temp_output_94_19_g76999).zw + ( (temp_output_94_19_g76999).xy * (ObjectPosition4223_g76959).xz ) );
				float4 tex2DArrayNode50_g76999 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_VertexTex, sampler_Linear_Clamp, UV97_g76999,temp_output_84_0_g76999, 0.0 );
				float4 temp_output_17_0_g77003 = tex2DArrayNode50_g76999;
				float4 temp_output_111_19_g76999 = TVE_VertexParams;
				float4 temp_output_3_0_g77003 = temp_output_111_19_g76999;
				float4 ifLocalVar18_g77003 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g77003 >= 0.5 )
				ifLocalVar18_g77003 = temp_output_17_0_g77003;
				else
				ifLocalVar18_g77003 = temp_output_3_0_g77003;
				float4 lerpResult22_g77003 = lerp( temp_output_3_0_g77003 , temp_output_17_0_g77003 , temp_output_19_0_g77003);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g77003 = lerpResult22_g77003;
				#else
				float4 staticSwitch24_g77003 = ifLocalVar18_g77003;
				#endif
				half4 Global_Vertex_Params4173_g76959 = staticSwitch24_g77003;
				float4 break322_g77004 = Global_Vertex_Params4173_g76959;
				half Global_VertexSize174_g76959 = saturate( break322_g77004.w );
				float lerpResult346_g76959 = lerp( 1.0 , Global_VertexSize174_g76959 , _GlobalSize);
				float3 appendResult3480_g76959 = (float3(lerpResult346_g76959 , lerpResult346_g76959 , lerpResult346_g76959));
				half3 ObjectData20_g77059 = appendResult3480_g76959;
				half3 _Vector11 = half3(1,1,1);
				half3 WorldData19_g77059 = _Vector11;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g77059 = WorldData19_g77059;
				#else
				float3 staticSwitch14_g77059 = ObjectData20_g77059;
				#endif
				half3 Vertex_Size1741_g76959 = staticSwitch14_g77059;
				float temp_output_7_0_g77060 = _SizeFadeEndValue;
				float temp_output_10_0_g77060 = ( _SizeFadeStartValue - temp_output_7_0_g77060 );
				float temp_output_7453_0_g76959 = saturate( ( ( ( distance( _WorldSpaceCameraPos , ObjectPosition4223_g76959 ) * ( 1.0 / TVE_DistanceFadeBias ) ) - temp_output_7_0_g77060 ) / ( temp_output_10_0_g77060 + 0.0001 ) ) );
				float3 appendResult3482_g76959 = (float3(temp_output_7453_0_g76959 , temp_output_7453_0_g76959 , temp_output_7453_0_g76959));
				half3 ObjectData20_g77058 = appendResult3482_g76959;
				half3 _Vector5 = half3(1,1,1);
				half3 WorldData19_g77058 = _Vector5;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g77058 = WorldData19_g77058;
				#else
				float3 staticSwitch14_g77058 = ObjectData20_g77058;
				#endif
				float3 Vertex_SizeFade1740_g76959 = staticSwitch14_g77058;
				float3 lerpResult16_g77063 = lerp( VertexPosition3588_g76959 , ( ( ( Vertex_Motion7493_g76959 + Grass_Perspective2661_g76959 ) * Vertex_Size1741_g76959 * Vertex_SizeFade1740_g76959 ) + Mesh_PivotsOS2291_g76959 ) , TVE_IsEnabled);
				float3 temp_output_4912_0_g76959 = lerpResult16_g77063;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch4976_g76959 = temp_output_4912_0_g76959;
				#else
				float3 staticSwitch4976_g76959 = temp_output_4912_0_g76959;
				#endif
				float3 temp_output_4918_0_g76959 = ( staticSwitch4976_g76959 + ( _VertexDataMode * 0.0 ) );
				float3 Final_VertexPosition890_g76959 = ( temp_output_4918_0_g76959 + _DisableSRPBatcher );
				
				float4 break33_g76991 = _second_uvs_mode;
				float2 temp_output_30_0_g76991 = ( v.ase_texcoord.xy * break33_g76991.x );
				float2 appendResult21_g76967 = (float2(v.ase_texcoord1.z , v.ase_texcoord1.w));
				float2 Mesh_DetailCoord3_g76959 = appendResult21_g76967;
				float2 temp_output_29_0_g76991 = ( Mesh_DetailCoord3_g76959 * break33_g76991.y );
				float2 temp_output_31_0_g76991 = ( (WorldPosition_Shifted7477_g76959).xz * break33_g76991.z );
				float2 vertexToFrag11_g76990 = ( ( ( temp_output_30_0_g76991 + temp_output_29_0_g76991 + temp_output_31_0_g76991 ) * (_SecondUVs).xy ) + (_SecondUVs).zw );
				o.ase_texcoord3.xy = vertexToFrag11_g76990;
				half Mesh_DetailMask90_g76959 = v.ase_color.b;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				half3 WorldNormal4101_g76959 = normalizedWorldNormal;
				float lerpResult5730_g76959 = lerp( (WorldNormal4101_g76959).y , v.ase_normal.y , Vertex_DynamicMode5112_g76959);
				half WorldNormal_Y6811_g76959 = lerpResult5730_g76959;
				float lerpResult6884_g76959 = lerp( Mesh_DetailMask90_g76959 , (WorldNormal_Y6811_g76959*0.5 + 0.5) , _DetailMeshMode);
				float lerpResult7357_g76959 = lerp( lerpResult6884_g76959 , ( 1.0 - lerpResult6884_g76959 ) , _DetailMeshInvertMode);
				float lerpResult7546_g76959 = lerp( 1.0 , lerpResult7357_g76959 , _DetailMeshValue);
				float vertexToFrag11_g77083 = lerpResult7546_g76959;
				o.ase_texcoord3.z = vertexToFrag11_g77083;
				o.ase_texcoord4.xyz = vertexToFrag3890_g76959;
				o.ase_texcoord5.xyz = vertexToFrag4224_g76959;
				
				o.ase_texcoord2 = v.ase_texcoord;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.w = 0;
				o.ase_texcoord4.w = 0;
				o.ase_texcoord5.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = Final_VertexPosition890_g76959;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;
				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float4 positionCS = TransformWorldToHClip( positionWS );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.worldPos = positionWS;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.clipPos = positionCS;

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord1 = v.ase_texcoord1;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE)
				#define ASE_SV_DEPTH SV_DepthLessEqual
			#else
				#define ASE_SV_DEPTH SV_Depth
			#endif

			half4 frag(	VertexOutput IN
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						 ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 WorldPosition = IN.worldPos;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float localCustomAlphaClip19_g77017 = ( 0.0 );
				half2 Main_UVs15_g76959 = ( ( IN.ase_texcoord2.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g76959 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g76959 );
				half Main_Alpha316_g76959 = tex2DNode29_g76959.a;
				float2 vertexToFrag11_g76990 = IN.ase_texcoord3.xy;
				half2 Second_UVs17_g76959 = vertexToFrag11_g76990;
				float4 tex2DNode89_g76959 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, Second_UVs17_g76959 );
				half Second_Alpha5007_g76959 = tex2DNode89_g76959.a;
				float4 tex2DNode35_g76959 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_Linear_Repeat, Main_UVs15_g76959 );
				half Main_Mask57_g76959 = tex2DNode35_g76959.b;
				float4 tex2DNode33_g76959 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_Linear_Repeat, Second_UVs17_g76959 );
				half Second_Mask81_g76959 = tex2DNode33_g76959.b;
				float lerpResult6885_g76959 = lerp( Main_Mask57_g76959 , Second_Mask81_g76959 , _DetailMaskMode);
				float lerpResult7354_g76959 = lerp( lerpResult6885_g76959 , ( 1.0 - lerpResult6885_g76959 ) , _DetailMaskInvertMode);
				float lerpResult7547_g76959 = lerp( 1.0 , lerpResult7354_g76959 , _DetailMaskIntensity);
				half Blend_Mask_Texture6794_g76959 = lerpResult7547_g76959;
				float vertexToFrag11_g77083 = IN.ase_texcoord3.z;
				half Blend_Mask_Mesh1540_g76959 = vertexToFrag11_g77083;
				float clampResult17_g77023 = clamp( ( Blend_Mask_Texture6794_g76959 * Blend_Mask_Mesh1540_g76959 ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g77032 = _DetailBlendMinValue;
				float temp_output_10_0_g77032 = ( _DetailBlendMaxValue - temp_output_7_0_g77032 );
				half Blend_Mask147_g76959 = ( saturate( ( ( clampResult17_g77023 - temp_output_7_0_g77032 ) / ( temp_output_10_0_g77032 + 0.0001 ) ) ) * _DetailMode );
				float lerpResult6153_g76959 = lerp( Main_Alpha316_g76959 , Second_Alpha5007_g76959 , Blend_Mask147_g76959);
				float lerpResult6785_g76959 = lerp( ( Main_Alpha316_g76959 * Second_Alpha5007_g76959 ) , lerpResult6153_g76959 , _DetailAlphaMode);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6158_g76959 = lerpResult6785_g76959;
				#else
				float staticSwitch6158_g76959 = Main_Alpha316_g76959;
				#endif
				half Blend_Alpha6157_g76959 = staticSwitch6158_g76959;
				half AlphaTreshold2132_g76959 = _AlphaClipValue;
				float temp_output_84_0_g76978 = _LayerExtrasValue;
				float temp_output_19_0_g76982 = TVE_ExtrasUsage[(int)temp_output_84_0_g76978];
				float4 temp_output_93_19_g76978 = TVE_ExtrasCoords;
				float3 vertexToFrag3890_g76959 = IN.ase_texcoord4.xyz;
				float3 WorldPosition3905_g76959 = vertexToFrag3890_g76959;
				float3 vertexToFrag4224_g76959 = IN.ase_texcoord5.xyz;
				float3 ObjectPosition4223_g76959 = vertexToFrag4224_g76959;
				float3 lerpResult4827_g76959 = lerp( WorldPosition3905_g76959 , ObjectPosition4223_g76959 , _ExtrasPositionMode);
				half2 UV96_g76978 = ( (temp_output_93_19_g76978).zw + ( (temp_output_93_19_g76978).xy * (lerpResult4827_g76959).xz ) );
				float4 tex2DArrayNode48_g76978 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ExtrasTex, sampler_Linear_Clamp, UV96_g76978,temp_output_84_0_g76978, 0.0 );
				float4 temp_output_17_0_g76982 = tex2DArrayNode48_g76978;
				float4 temp_output_94_85_g76978 = TVE_ExtrasParams;
				float4 temp_output_3_0_g76982 = temp_output_94_85_g76978;
				float4 ifLocalVar18_g76982 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76982 >= 0.5 )
				ifLocalVar18_g76982 = temp_output_17_0_g76982;
				else
				ifLocalVar18_g76982 = temp_output_3_0_g76982;
				float4 lerpResult22_g76982 = lerp( temp_output_3_0_g76982 , temp_output_17_0_g76982 , temp_output_19_0_g76982);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76982 = lerpResult22_g76982;
				#else
				float4 staticSwitch24_g76982 = ifLocalVar18_g76982;
				#endif
				half4 Global_Extras_Params5440_g76959 = staticSwitch24_g76982;
				float4 break456_g76996 = Global_Extras_Params5440_g76959;
				half Global_Extras_Alpha1033_g76959 = saturate( break456_g76996.w );
				float3 ObjectPosition_Shifted7481_g76959 = ( ObjectPosition4223_g76959 - TVE_WorldOrigin );
				half3 Input_Position167_g77037 = ObjectPosition_Shifted7481_g76959;
				float dotResult156_g77037 = dot( (Input_Position167_g77037).xz , float2( 12.9898,78.233 ) );
				half Vertex_DynamicMode5112_g76959 = _VertexDynamicMode;
				half Input_DynamicMode120_g77037 = Vertex_DynamicMode5112_g76959;
				float Postion_Random162_g77037 = ( sin( dotResult156_g77037 ) * ( 1.0 - Input_DynamicMode120_g77037 ) );
				float Mesh_Variation16_g76959 = IN.ase_color.r;
				half Input_Variation124_g77037 = Mesh_Variation16_g76959;
				half ObjectData20_g77039 = frac( ( Postion_Random162_g77037 + Input_Variation124_g77037 ) );
				half WorldData19_g77039 = Input_Variation124_g77037;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g77039 = WorldData19_g77039;
				#else
				float staticSwitch14_g77039 = ObjectData20_g77039;
				#endif
				float clampResult17_g77041 = clamp( staticSwitch14_g77039 , 0.0001 , 0.9999 );
				float Global_MeshVariation5104_g76959 = clampResult17_g77041;
				float lerpResult5154_g76959 = lerp( 0.0 , Global_MeshVariation5104_g76959 , _AlphaVariationValue);
				half Global_Alpha_Variation5158_g76959 = lerpResult5154_g76959;
				float lerpResult6866_g76959 = lerp( ( 1.0 - Blend_Mask147_g76959 ) , 1.0 , _DetailFadeMode);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6612_g76959 = lerpResult6866_g76959;
				#else
				float staticSwitch6612_g76959 = 1.0;
				#endif
				half Blend_Mask_Invert6260_g76959 = staticSwitch6612_g76959;
				half Alpha_Mask6234_g76959 = ( 1.0 * Blend_Mask_Invert6260_g76959 );
				float lerpResult5203_g76959 = lerp( 1.0 , saturate( ( ( Global_Extras_Alpha1033_g76959 - Global_Alpha_Variation5158_g76959 ) + ( Global_Extras_Alpha1033_g76959 * 0.5 ) ) ) , ( Alpha_Mask6234_g76959 * _GlobalAlpha ));
				float lerpResult16_g77012 = lerp( 1.0 , lerpResult5203_g76959 , TVE_IsEnabled);
				half Global_Alpha315_g76959 = lerpResult16_g77012;
				half Fade_Alpha3727_g76959 = 1.0;
				float Emissive_Alpha6927_g76959 = 1.0;
				half Final_Alpha7344_g76959 = min( min( ( Blend_Alpha6157_g76959 - AlphaTreshold2132_g76959 ) , Global_Alpha315_g76959 ) , min( Fade_Alpha3727_g76959 , Emissive_Alpha6927_g76959 ) );
				float temp_output_3_0_g77017 = Final_Alpha7344_g76959;
				float Alpha19_g77017 = temp_output_3_0_g77017;
				float temp_output_15_0_g77017 = 0.01;
				float Treshold19_g77017 = temp_output_15_0_g77017;
				{
				#if defined (TVE_FEATURE_CLIP)
				#if defined (TVE_IS_HD_PIPELINE)
				#if !defined (SHADERPASS_FORWARD_BYPASS_ALPHA_TEST)
				clip(Alpha19_g77017 - Treshold19_g77017);
				#endif
				#if !defined (SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST)
				clip(Alpha19_g77017 - Treshold19_g77017);
				#endif
				#else
				clip(Alpha19_g77017 - Treshold19_g77017);
				#endif
				#endif
				}
				half Main_Color_Alpha6121_g76959 = _MainColor.a;
				half Second_Color_Alpha6152_g76959 = _SecondColor.a;
				float lerpResult6168_g76959 = lerp( Main_Color_Alpha6121_g76959 , Second_Color_Alpha6152_g76959 , Blend_Mask147_g76959);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6174_g76959 = lerpResult6168_g76959;
				#else
				float staticSwitch6174_g76959 = Main_Color_Alpha6121_g76959;
				#endif
				half Blend_Color_Alpha6167_g76959 = staticSwitch6174_g76959;
				half Final_Clip914_g76959 = saturate( ( Alpha19_g77017 * Blend_Color_Alpha6167_g76959 ) );
				

				float Alpha = Final_Clip914_g76959;
				float AlphaClipThreshold = 0.5;
				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = 0;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODFadeCrossFade( IN.clipPos );
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				return 0;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "Meta"
			Tags { "LightMode"="Meta" }

			Cull Off

			HLSLPROGRAM

			#define _SPECULAR_SETUP 1
			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define ASE_TRANSLUCENCY 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140007
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma vertex vert
			#pragma fragment frag

			#pragma shader_feature EDITOR_VISUALIZATION

			#define SHADERPASS SHADERPASS_META

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/MetaInput.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_COLOR
			#pragma shader_feature_local_fragment TVE_FEATURE_CLIP
			#pragma shader_feature_local TVE_FEATURE_BATCHING
			#pragma shader_feature_local_fragment TVE_FEATURE_DETAIL
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_UNIVERSAL_PIPELINE
			#define TVE_IS_PLANT_SHADER
			#define TVE_IS_SUBSURFACE_SHADER
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 texcoord0 : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 worldPos : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord : TEXCOORD1;
				#endif
				#ifdef EDITOR_VISUALIZATION
					float4 VizUV : TEXCOORD2;
					float4 LightCoord : TEXCOORD3;
				#endif
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_color : COLOR;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_texcoord9 : TEXCOORD9;
				float4 ase_texcoord10 : TEXCOORD10;
				float3 ase_normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _DetailBlendRemap;
			float4 _GradientMaskRemap;
			half4 _VertexOcclusionRemap;
			half4 _RimLightRemap;
			half4 _MainColor;
			half4 _MainUVs;
			half4 _MotionHighlightColor;
			half4 _EmissiveColor;
			half4 _EmissiveUVs;
			half4 _SecondColor;
			half4 _VertexOcclusionColor;
			half4 _second_uvs_mode;
			float4 _MaxBoundsInfo;
			half4 _SecondUVs;
			half4 _SecondMaskRemap;
			half4 _MainMaskRemap;
			half4 _GradientColorTwo;
			float4 _SubsurfaceDiffusion_Asset;
			float4 _Color;
			float4 _NoiseMaskRemap;
			half4 _SubsurfaceColor;
			half4 _GradientColorOne;
			half3 _render_normals;
			half _SecondAlbedoValue;
			half _DetailMaskIntensity;
			half _DetailMaskMode;
			half _MainAlbedoValue;
			half _DetailBlendMode;
			half _VertexDataMode;
			half _DetailMaskInvertMode;
			half _SizeFadeStartValue;
			half _render_zw;
			half _GlobalSize;
			half _MotionVariation_20;
			half _MotionSpeed_20;
			half _MotionValue_20;
			half _MotionFacingValue;
			half _MotionAmplitude_20;
			half _MotionAmplitude_22;
			float _MotionScale_32;
			half _SizeFadeEndValue;
			float _MotionVariation_32;
			half _MotionValue_30;
			half _MotionAmplitude_32;
			half _PerspectivePushValue;
			half _PerspectiveNoiseValue;
			half _DetailMeshMode;
			half _PerspectiveAngleValue;
			half _LayerVertexValue;
			float _MotionSpeed_32;
			half _DetailMeshInvertMode;
			half _GradientMinValue;
			half _DetailBlendMinValue;
			half _SecondNormalValue;
			half _OverlayProjectionValue;
			half _GlobalWetness;
			half _GlobalEmissive;
			half _EmissivePhaseValue;
			float _emissive_intensity_value;
			half _RenderSpecular;
			half _DetailNormalValue;
			half _MainSmoothnessValue;
			half _MainOcclusionValue;
			half _SecondOcclusionValue;
			half _DetailAlphaMode;
			half _AlphaClipValue;
			half _AlphaVariationValue;
			half _DetailFadeMode;
			half _GlobalAlpha;
			half _SecondSmoothnessValue;
			half _MainNormalValue;
			half _OverlayVariationValue;
			half _ExtrasPositionMode;
			half _DetailBlendMaxValue;
			half _DetailMode;
			half _MotionScale_20;
			half _GradientMaxValue;
			half _MainMaskMinValue;
			half _MainMaskMaxValue;
			half _SecondMaskMinValue;
			half _SecondMaskMaxValue;
			half _VertexOcclusionMinValue;
			half _VertexOcclusionMaxValue;
			half _LayerColorsValue;
			half _ColorsPositionMode;
			half _GlobalColors;
			half _ColorsVariationValue;
			half _ColorsMaskMode;
			half _GlobalOverlay;
			half _LayerExtrasValue;
			half _DetailMeshValue;
			half _InteractionAmplitude;
			float _MotionSpeed_10;
			half _MotionAmplitude_10;
			half _MessageSecondMask;
			half _MessageMotionVariation;
			half _MessageGlobalsVariation;
			half _MessageMainMask;
			half _MessageSubsurface;
			half _IsTVEShader;
			half _IsIdentifier;
			half _MessageOcclusion;
			half _HasOcclusion;
			half _HasEmissive;
			half _VertexVariationMode;
			half _IsCollected;
			half _IsShared;
			half _IsVersion;
			half _RenderCoverage;
			float _EmissiveIntensityValue;
			half _HasGradient;
			half _RenderNormals;
			half _CategoryRender;
			half _RenderMode;
			half _render_coverage;
			half _render_cull;
			half _render_src;
			half _render_dst;
			float _IsPlantShader;
			half _IsSubsurfaceShader;
			float _SubsurfaceDiffusion;
			half _Cutoff;
			half _ColorsMaskMinValue;
			half _ColorsMaskMaxValue;
			half _RenderDecals;
			half _RenderSSR;
			half _RenderZWrite;
			half _RenderClip;
			half _RenderCull;
			half _RenderQueue;
			half _RenderPriority;
			half _DetailTypeMode;
			half _DetailOpaqueMode;
			half _DetailCoordMode;
			half _EmissiveIntensityMode;
			half _SubsurfaceDirectValue;
			half _SubsurfaceAngleValue;
			half _SubsurfaceScatteringValue;
			half _RenderDirect;
			half _CategoryRimLight;
			half _CategoryMatcap;
			half _CategorySubsurface;
			half _CategoryEmissive;
			half _RenderAmbient;
			half _RenderShadow;
			half _IsCoreShader;
			half _VertexPivotMode;
			half _MotionPosition_10;
			float _MotionScale_10;
			half _MotionVariation_10;
			half _VertexDynamicMode;
			half _LayerMotionValue;
			half _SubsurfaceAmbientValue;
			half _InteractionMaskValue;
			half _SubsurfaceShadowValue;
			half _SpaceRenderFade;
			half _EmissiveFlagMode;
			half _SecondUVsMode;
			half _SpaceGlobalLayers;
			half _SpaceGlobalLocals;
			half _SpaceSubsurface;
			half _SpaceMotionLocals;
			half _SpaceMotionGlobals;
			half _SpaceGlobalOptions;
			half _CategoryGlobals;
			half _CategoryMain;
			half _CategoryDetail;
			half _CategoryOcclusion;
			half _CategoryGradient;
			half _CategoryNoise;
			half _CategoryPerspective;
			half _CategorySizeFade;
			half _CategoryMotion;
			half _SubsurfaceNormalValue;
			half _SubsurfaceValue;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			// Property used by ScenePickingPass
			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			// Properties used by SceneSelectionPass
			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(TVE_NoiseTex);
			float3 TVE_WorldOrigin;
			half4 TVE_MotionParams;
			half4 TVE_TimeParams;
			SAMPLER(sampler_Linear_Repeat);
			float TVE_MotionUsage[10];
			TEXTURE2D_ARRAY(TVE_MotionTex);
			half4 TVE_MotionCoords;
			SAMPLER(sampler_Linear_Clamp);
			half TVE_MotionValue_10;
			half TVE_MotionValue_20;
			half TVE_MotionFadeEnd;
			half TVE_MotionFadeStart;
			half TVE_MotionValue_30;
			float TVE_VertexUsage[10];
			TEXTURE2D_ARRAY(TVE_VertexTex);
			half4 TVE_VertexCoords;
			half4 TVE_VertexParams;
			half TVE_DistanceFadeBias;
			half TVE_IsEnabled;
			half _DisableSRPBatcher;
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);
			TEXTURE2D(_SecondAlbedoTex);
			SAMPLER(sampler_SecondAlbedoTex);
			TEXTURE2D(_MainMaskTex);
			TEXTURE2D(_SecondMaskTex);
			float TVE_ColorsUsage[10];
			TEXTURE2D_ARRAY(TVE_ColorsTex);
			half4 TVE_ColorsCoords;
			half4 TVE_ColorsParams;
			half4 TVE_OverlayColor;
			float TVE_ExtrasUsage[10];
			TEXTURE2D_ARRAY(TVE_ExtrasTex);
			half4 TVE_ExtrasCoords;
			half4 TVE_ExtrasParams;
			TEXTURE2D(_MainNormalTex);
			TEXTURE2D(_SecondNormalTex);
			half TVE_WetnessContrast;
			TEXTURE2D(_EmissiveTex);


			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/LightingMetaPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			float2 DecodeFloatToVector2( float enc )
			{
				float2 result ;
				result.y = enc % 2048;
				result.x = floor(enc / 2048);
				return result / (2048 - 1);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 VertexPosition3588_g76959 = v.vertex.xyz;
				float3 appendResult60_g76970 = (float3(v.ase_texcoord3.x , v.ase_texcoord3.z , v.ase_texcoord3.y));
				half3 Mesh_PivotsData2831_g76959 = ( appendResult60_g76970 * _VertexPivotMode );
				half3 Mesh_PivotsOS2291_g76959 = Mesh_PivotsData2831_g76959;
				float3 temp_output_2283_0_g76959 = ( VertexPosition3588_g76959 - Mesh_PivotsOS2291_g76959 );
				half3 VertexPos40_g77080 = temp_output_2283_0_g76959;
				half3 VertexPos40_g77081 = VertexPos40_g77080;
				float3 appendResult74_g77081 = (float3(VertexPos40_g77081.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g77081 = appendResult74_g77081;
				float3 break84_g77081 = VertexPos40_g77081;
				float3 appendResult81_g77081 = (float3(0.0 , break84_g77081.y , break84_g77081.z));
				half3 VertexPosOtherAxis82_g77081 = appendResult81_g77081;
				float3 ase_worldPos = TransformObjectToWorld( (v.vertex).xyz );
				float3 vertexToFrag3890_g76959 = ase_worldPos;
				float3 WorldPosition3905_g76959 = vertexToFrag3890_g76959;
				float3 WorldPosition_Shifted7477_g76959 = ( WorldPosition3905_g76959 - TVE_WorldOrigin );
				float4x4 break19_g77047 = GetObjectToWorldMatrix();
				float3 appendResult20_g77047 = (float3(break19_g77047[ 0 ][ 3 ] , break19_g77047[ 1 ][ 3 ] , break19_g77047[ 2 ][ 3 ]));
				float3 temp_output_122_0_g77047 = Mesh_PivotsData2831_g76959;
				float3 PivotsOnly105_g77047 = (mul( GetObjectToWorldMatrix(), float4( temp_output_122_0_g77047 , 0.0 ) ).xyz).xyz;
				half3 ObjectData20_g77049 = ( appendResult20_g77047 + PivotsOnly105_g77047 );
				half3 WorldData19_g77049 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g77049 = WorldData19_g77049;
				#else
				float3 staticSwitch14_g77049 = ObjectData20_g77049;
				#endif
				float3 temp_output_114_0_g77047 = staticSwitch14_g77049;
				float3 vertexToFrag4224_g76959 = temp_output_114_0_g77047;
				float3 ObjectPosition4223_g76959 = vertexToFrag4224_g76959;
				float3 ObjectPosition_Shifted7481_g76959 = ( ObjectPosition4223_g76959 - TVE_WorldOrigin );
				float3 lerpResult6766_g76959 = lerp( WorldPosition_Shifted7477_g76959 , ObjectPosition_Shifted7481_g76959 , _MotionPosition_10);
				float3 Motion_10_Position6738_g76959 = lerpResult6766_g76959;
				half3 Input_Position419_g77065 = Motion_10_Position6738_g76959;
				float Input_MotionScale287_g77065 = ( _MotionScale_10 + 0.2 );
				float2 temp_output_597_0_g77065 = (( Input_Position419_g77065 * Input_MotionScale287_g77065 * 0.0075 )).xz;
				float2 temp_output_447_0_g76964 = ((TVE_MotionParams).xy*2.0 + -1.0);
				half2 Global_Wind_DirectionWS4683_g76959 = temp_output_447_0_g76964;
				half2 Input_DirectionWS423_g77065 = Global_Wind_DirectionWS4683_g76959;
				float lerpResult115_g77066 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g77065 = _MotionSpeed_10;
				half Input_MotionVariation284_g77065 = _MotionVariation_10;
				half3 Input_Position167_g77037 = ObjectPosition_Shifted7481_g76959;
				float dotResult156_g77037 = dot( (Input_Position167_g77037).xz , float2( 12.9898,78.233 ) );
				half Vertex_DynamicMode5112_g76959 = _VertexDynamicMode;
				half Input_DynamicMode120_g77037 = Vertex_DynamicMode5112_g76959;
				float Postion_Random162_g77037 = ( sin( dotResult156_g77037 ) * ( 1.0 - Input_DynamicMode120_g77037 ) );
				float Mesh_Variation16_g76959 = v.ase_color.r;
				half Input_Variation124_g77037 = Mesh_Variation16_g76959;
				half ObjectData20_g77039 = frac( ( Postion_Random162_g77037 + Input_Variation124_g77037 ) );
				half WorldData19_g77039 = Input_Variation124_g77037;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g77039 = WorldData19_g77039;
				#else
				float staticSwitch14_g77039 = ObjectData20_g77039;
				#endif
				float clampResult17_g77041 = clamp( staticSwitch14_g77039 , 0.0001 , 0.9999 );
				float Global_MeshVariation5104_g76959 = clampResult17_g77041;
				half Input_GlobalMeshVariation569_g77065 = Global_MeshVariation5104_g76959;
				float temp_output_630_0_g77065 = ( ( ( lerpResult115_g77066 * Input_MotionSpeed62_g77065 ) + ( Input_MotionVariation284_g77065 * Input_GlobalMeshVariation569_g77065 ) ) * 0.03 );
				float temp_output_607_0_g77065 = frac( temp_output_630_0_g77065 );
				float4 lerpResult590_g77065 = lerp( SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g77065 + ( -Input_DirectionWS423_g77065 * temp_output_607_0_g77065 ) ), 0.0 ) , SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g77065 + ( -Input_DirectionWS423_g77065 * frac( ( temp_output_630_0_g77065 + 0.5 ) ) ) ), 0.0 ) , ( abs( ( temp_output_607_0_g77065 - 0.5 ) ) / 0.5 ));
				half4 Noise_Complex703_g77065 = lerpResult590_g77065;
				float2 temp_output_645_0_g77065 = ((Noise_Complex703_g77065).rg*2.0 + -1.0);
				float2 break650_g77065 = temp_output_645_0_g77065;
				float3 appendResult649_g77065 = (float3(break650_g77065.x , 0.0 , break650_g77065.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Global_Noise_OS5548_g76959 = (( mul( GetWorldToObjectMatrix(), float4( appendResult649_g77065 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Noise_DirectionOS487_g77073 = Global_Noise_OS5548_g76959;
				float2 break448_g76964 = temp_output_447_0_g76964;
				float3 appendResult452_g76964 = (float3(break448_g76964.x , 0.0 , break448_g76964.y));
				half2 Global_Wind_DirectionOS5692_g76959 = (( mul( GetWorldToObjectMatrix(), float4( appendResult452_g76964 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Wind_DirectionOS458_g77073 = Global_Wind_DirectionOS5692_g76959;
				float temp_output_84_0_g76973 = _LayerMotionValue;
				float temp_output_19_0_g76977 = TVE_MotionUsage[(int)temp_output_84_0_g76973];
				float4 temp_output_91_19_g76973 = TVE_MotionCoords;
				half2 UV94_g76973 = ( (temp_output_91_19_g76973).zw + ( (temp_output_91_19_g76973).xy * (ObjectPosition4223_g76959).xz ) );
				float4 tex2DArrayNode50_g76973 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_Linear_Clamp, UV94_g76973,temp_output_84_0_g76973, 0.0 );
				float4 temp_output_17_0_g76977 = tex2DArrayNode50_g76973;
				float4 temp_output_112_19_g76973 = TVE_MotionParams;
				float4 temp_output_3_0_g76977 = temp_output_112_19_g76973;
				float4 ifLocalVar18_g76977 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76977 >= 0.5 )
				ifLocalVar18_g76977 = temp_output_17_0_g76977;
				else
				ifLocalVar18_g76977 = temp_output_3_0_g76977;
				float4 lerpResult22_g76977 = lerp( temp_output_3_0_g76977 , temp_output_17_0_g76977 , temp_output_19_0_g76977);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76977 = lerpResult22_g76977;
				#else
				float4 staticSwitch24_g76977 = ifLocalVar18_g76977;
				#endif
				half4 Global_Motion_Params3909_g76959 = staticSwitch24_g76977;
				float4 break322_g76964 = Global_Motion_Params3909_g76959;
				half Global_Wind_Power2223_g76959 = break322_g76964.z;
				half Input_WindPower449_g77073 = Global_Wind_Power2223_g76959;
				float temp_output_565_0_g77073 = ( 1.0 - Input_WindPower449_g77073 );
				float2 lerpResult516_g77073 = lerp( Input_Noise_DirectionOS487_g77073 , Input_Wind_DirectionOS458_g77073 , ( ( 1.0 - ( temp_output_565_0_g77073 * temp_output_565_0_g77073 * temp_output_565_0_g77073 ) ) * 0.6 ));
				half Mesh_Height1524_g76959 = v.ase_color.a;
				half Input_MeshHeight388_g77073 = Mesh_Height1524_g76959;
				half ObjectData20_g77074 = Input_MeshHeight388_g77073;
				float enc62_g76967 = v.texcoord0.w;
				float2 localDecodeFloatToVector262_g76967 = DecodeFloatToVector2( enc62_g76967 );
				float2 break63_g76967 = ( localDecodeFloatToVector262_g76967 * 100.0 );
				float Bounds_Height5230_g76959 = break63_g76967.x;
				half Input_BoundsHeight390_g77073 = Bounds_Height5230_g76959;
				half WorldData19_g77074 = ( Input_MeshHeight388_g77073 * Input_MeshHeight388_g77073 * Input_BoundsHeight390_g77073 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g77074 = WorldData19_g77074;
				#else
				float staticSwitch14_g77074 = ObjectData20_g77074;
				#endif
				half Final_Motion10_Mask321_g77073 = ( staticSwitch14_g77074 * 2.0 );
				half Motion_10_Amplitude2258_g76959 = _MotionAmplitude_10;
				half Input_BendingAmplitude376_g77073 = Motion_10_Amplitude2258_g76959;
				half Global_MotionValue640_g77073 = TVE_MotionValue_10;
				half2 Final_Bending631_g77073 = ( lerpResult516_g77073 * ( Final_Motion10_Mask321_g77073 * Input_BendingAmplitude376_g77073 * Input_WindPower449_g77073 * Input_WindPower449_g77073 * Global_MotionValue640_g77073 ) );
				float2 appendResult433_g76964 = (float2(break322_g76964.x , break322_g76964.y));
				float2 temp_output_436_0_g76964 = (appendResult433_g76964*2.0 + -1.0);
				float2 break441_g76964 = temp_output_436_0_g76964;
				float3 appendResult440_g76964 = (float3(break441_g76964.x , 0.0 , break441_g76964.y));
				half2 Global_React_DirectionOS39_g76959 = (( mul( GetWorldToObjectMatrix(), float4( appendResult440_g76964 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_React_DirectionOS358_g77073 = Global_React_DirectionOS39_g76959;
				float clampResult17_g77076 = clamp( Input_MeshHeight388_g77073 , 0.0001 , 0.9999 );
				float temp_output_7_0_g77075 = 0.0;
				half Input_InteractionUseMask62_g77073 = _InteractionMaskValue;
				float temp_output_10_0_g77075 = ( Input_InteractionUseMask62_g77073 - temp_output_7_0_g77075 );
				half Final_InteractionRemap594_g77073 = saturate( ( ( clampResult17_g77076 - temp_output_7_0_g77075 ) / ( temp_output_10_0_g77075 + 0.0001 ) ) );
				half ObjectData20_g77077 = Final_InteractionRemap594_g77073;
				half WorldData19_g77077 = ( Final_InteractionRemap594_g77073 * Final_InteractionRemap594_g77073 * Input_BoundsHeight390_g77073 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g77077 = WorldData19_g77077;
				#else
				float staticSwitch14_g77077 = ObjectData20_g77077;
				#endif
				half Final_InteractionMask373_g77073 = ( staticSwitch14_g77077 * 2.0 );
				half Interaction_Amplitude7501_g76959 = _InteractionAmplitude;
				half Input_InteractionAmplitude58_g77073 = Interaction_Amplitude7501_g76959;
				half2 Final_Interaction632_g77073 = ( Input_React_DirectionOS358_g77073 * Final_InteractionMask373_g77073 * Input_InteractionAmplitude58_g77073 );
				half Global_Interaction_Mask66_g76959 = ( break322_g76964.w * break322_g76964.w * break322_g76964.w * break322_g76964.w );
				float Input_InteractionGlobalMask330_g77073 = Global_Interaction_Mask66_g76959;
				half Final_InteractionValue525_g77073 = saturate( ( Input_InteractionAmplitude58_g77073 * Input_InteractionGlobalMask330_g77073 ) );
				float2 lerpResult551_g77073 = lerp( Final_Bending631_g77073 , Final_Interaction632_g77073 , Final_InteractionValue525_g77073);
				float2 break364_g77073 = lerpResult551_g77073;
				float3 appendResult638_g77073 = (float3(break364_g77073.x , 0.0 , break364_g77073.y));
				half3 Motion_10_Interaction7519_g76959 = appendResult638_g77073;
				half3 Angle44_g77080 = Motion_10_Interaction7519_g76959;
				half Angle44_g77081 = (Angle44_g77080).z;
				half3 VertexPos40_g77082 = ( VertexPosRotationAxis50_g77081 + ( VertexPosOtherAxis82_g77081 * cos( Angle44_g77081 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g77081 ) * sin( Angle44_g77081 ) ) );
				float3 appendResult74_g77082 = (float3(0.0 , 0.0 , VertexPos40_g77082.z));
				half3 VertexPosRotationAxis50_g77082 = appendResult74_g77082;
				float3 break84_g77082 = VertexPos40_g77082;
				float3 appendResult81_g77082 = (float3(break84_g77082.x , break84_g77082.y , 0.0));
				half3 VertexPosOtherAxis82_g77082 = appendResult81_g77082;
				half Angle44_g77082 = -(Angle44_g77080).x;
				half3 Input_Position419_g77078 = WorldPosition_Shifted7477_g76959;
				float3 break459_g77078 = Input_Position419_g77078;
				float Sum_Position446_g77078 = ( break459_g77078.x + break459_g77078.y + break459_g77078.z );
				half Input_MotionScale321_g77078 = ( _MotionScale_20 * 0.1 );
				half Input_MotionVariation330_g77078 = _MotionVariation_20;
				half Input_GlobalVariation400_g77078 = Global_MeshVariation5104_g76959;
				float lerpResult115_g77079 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g77078 = _MotionSpeed_20;
				float temp_output_404_0_g77078 = ( lerpResult115_g77079 * Input_MotionSpeed62_g77078 );
				half Motion_SineA450_g77078 = sin( ( ( Sum_Position446_g77078 * Input_MotionScale321_g77078 ) + ( Input_MotionVariation330_g77078 * Input_GlobalVariation400_g77078 ) + temp_output_404_0_g77078 ) );
				half Motion_SineB395_g77078 = sin( ( ( temp_output_404_0_g77078 * 0.6842 ) + ( Sum_Position446_g77078 * Input_MotionScale321_g77078 ) ) );
				half3 Input_Position419_g76971 = VertexPosition3588_g76959;
				float3 normalizeResult518_g76971 = normalize( Input_Position419_g76971 );
				half2 Input_DirectionOS423_g76971 = Global_React_DirectionOS39_g76959;
				float2 break521_g76971 = -Input_DirectionOS423_g76971;
				float3 appendResult522_g76971 = (float3(break521_g76971.x , 0.0 , break521_g76971.y));
				float dotResult519_g76971 = dot( normalizeResult518_g76971 , appendResult522_g76971 );
				half Input_Value62_g76971 = _MotionFacingValue;
				float lerpResult524_g76971 = lerp( 1.0 , (dotResult519_g76971*0.5 + 0.5) , Input_Value62_g76971);
				half ObjectData20_g76972 = max( lerpResult524_g76971 , 0.001 );
				half WorldData19_g76972 = 1.0;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76972 = WorldData19_g76972;
				#else
				float staticSwitch14_g76972 = ObjectData20_g76972;
				#endif
				half Motion_FacingMask5214_g76959 = staticSwitch14_g76972;
				half Motion_20_Amplitude4381_g76959 = ( _MotionValue_20 * Motion_FacingMask5214_g76959 );
				half Input_MotionAmplitude384_g77078 = Motion_20_Amplitude4381_g76959;
				half Input_GlobalWind407_g77078 = Global_Wind_Power2223_g76959;
				float4 break638_g77065 = abs( Noise_Complex703_g77065 );
				half Global_Noise_B5526_g76959 = break638_g77065.b;
				half Input_GlobalNoise411_g77078 = Global_Noise_B5526_g76959;
				float lerpResult413_g77078 = lerp( 1.6 , 0.4 , Input_GlobalWind407_g77078);
				half Motion_Amplitude418_g77078 = ( Input_MotionAmplitude384_g77078 * Input_GlobalWind407_g77078 * pow( Input_GlobalNoise411_g77078 , lerpResult413_g77078 ) );
				half Input_Squash58_g77078 = _MotionAmplitude_20;
				float enc59_g76967 = v.texcoord0.z;
				float2 localDecodeFloatToVector259_g76967 = DecodeFloatToVector2( enc59_g76967 );
				float2 break61_g76967 = localDecodeFloatToVector259_g76967;
				half Mesh_Motion_2060_g76959 = break61_g76967.x;
				half Input_MeshMotion_20388_g77078 = Mesh_Motion_2060_g76959;
				float Bounds_Radius5231_g76959 = break63_g76967.y;
				half Input_BoundsRadius390_g77078 = Bounds_Radius5231_g76959;
				half Global_MotionValue462_g77078 = TVE_MotionValue_20;
				half2 Input_DirectionOS366_g77078 = Global_React_DirectionOS39_g76959;
				float2 break371_g77078 = Input_DirectionOS366_g77078;
				float3 appendResult372_g77078 = (float3(break371_g77078.x , ( Motion_SineA450_g77078 * 0.3 ) , break371_g77078.y));
				half3 Motion_20_Squash4418_g76959 = ( ( (max( Motion_SineA450_g77078 , Motion_SineB395_g77078 )*0.5 + 0.5) * Motion_Amplitude418_g77078 * Input_Squash58_g77078 * Input_MeshMotion_20388_g77078 * Input_BoundsRadius390_g77078 * Global_MotionValue462_g77078 ) * appendResult372_g77078 );
				half3 VertexPos40_g77057 = ( ( VertexPosRotationAxis50_g77082 + ( VertexPosOtherAxis82_g77082 * cos( Angle44_g77082 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g77082 ) * sin( Angle44_g77082 ) ) ) + Motion_20_Squash4418_g76959 );
				float3 appendResult74_g77057 = (float3(0.0 , VertexPos40_g77057.y , 0.0));
				float3 VertexPosRotationAxis50_g77057 = appendResult74_g77057;
				float3 break84_g77057 = VertexPos40_g77057;
				float3 appendResult81_g77057 = (float3(break84_g77057.x , 0.0 , break84_g77057.z));
				float3 VertexPosOtherAxis82_g77057 = appendResult81_g77057;
				half Input_Rolling379_g77078 = _MotionAmplitude_22;
				half Motion_20_Rolling5257_g76959 = ( Motion_SineA450_g77078 * Motion_Amplitude418_g77078 * Input_Rolling379_g77078 * Input_MeshMotion_20388_g77078 * Global_MotionValue462_g77078 );
				half Angle44_g77057 = Motion_20_Rolling5257_g76959;
				half3 Input_Position500_g77069 = WorldPosition_Shifted7477_g76959;
				half Input_MotionScale321_g77069 = _MotionScale_32;
				half Input_MotionVariation330_g77069 = _MotionVariation_32;
				half Input_GlobalVariation372_g77069 = Global_MeshVariation5104_g76959;
				float lerpResult115_g77072 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g77069 = _MotionSpeed_32;
				float4 tex2DNode460_g77069 = SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( ( (Input_Position500_g77069).xz * Input_MotionScale321_g77069 * 0.03 ) + ( Input_MotionVariation330_g77069 * Input_GlobalVariation372_g77069 ) + ( lerpResult115_g77072 * Input_MotionSpeed62_g77069 * 0.02 ) ), 0.0 );
				float3 appendResult462_g77069 = (float3(tex2DNode460_g77069.r , tex2DNode460_g77069.g , tex2DNode460_g77069.b));
				half3 Flutter_Texture489_g77069 = (appendResult462_g77069*2.0 + -1.0);
				float temp_output_7_0_g77027 = TVE_MotionFadeEnd;
				float temp_output_10_0_g77027 = ( TVE_MotionFadeStart - temp_output_7_0_g77027 );
				half Motion_FadeOut4005_g76959 = saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g77027 ) / ( temp_output_10_0_g77027 + 0.0001 ) ) );
				half Motion_30_Amplitude4960_g76959 = ( _MotionValue_30 * _MotionAmplitude_32 * Motion_FacingMask5214_g76959 * Motion_FadeOut4005_g76959 );
				half Input_MotionAmplitude58_g77069 = Motion_30_Amplitude4960_g76959;
				half Mesh_Motion_30144_g76959 = break61_g76967.y;
				half Input_MeshMotion_30374_g77069 = Mesh_Motion_30144_g76959;
				half Input_GlobalWind471_g77069 = Global_Wind_Power2223_g76959;
				half Global_MotionValue503_g77069 = TVE_MotionValue_30;
				half Input_GlobalNoise472_g77069 = Global_Noise_B5526_g76959;
				float lerpResult466_g77069 = lerp( 2.0 , 0.6 , Input_GlobalWind471_g77069);
				half Flutter_Amplitude491_g77069 = ( Input_MotionAmplitude58_g77069 * Input_MeshMotion_30374_g77069 * Input_GlobalWind471_g77069 * Global_MotionValue503_g77069 * pow( Input_GlobalNoise472_g77069 , lerpResult466_g77069 ) );
				half3 Motion_30_Flutter263_g76959 = ( Flutter_Texture489_g77069 * Flutter_Amplitude491_g77069 );
				float3 Vertex_Motion_Object833_g76959 = ( ( VertexPosRotationAxis50_g77057 + ( VertexPosOtherAxis82_g77057 * cos( Angle44_g77057 ) ) + ( cross( float3(0,1,0) , VertexPosOtherAxis82_g77057 ) * sin( Angle44_g77057 ) ) ) + Motion_30_Flutter263_g76959 );
				half3 ObjectData20_g77062 = Vertex_Motion_Object833_g76959;
				float3 temp_output_3474_0_g76959 = ( VertexPosition3588_g76959 - Mesh_PivotsOS2291_g76959 );
				float3 Vertex_Motion_World1118_g76959 = ( ( ( temp_output_3474_0_g76959 + Motion_10_Interaction7519_g76959 ) + Motion_20_Squash4418_g76959 ) + Motion_30_Flutter263_g76959 );
				half3 WorldData19_g77062 = Vertex_Motion_World1118_g76959;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g77062 = WorldData19_g77062;
				#else
				float3 staticSwitch14_g77062 = ObjectData20_g77062;
				#endif
				float3 temp_output_7495_0_g76959 = staticSwitch14_g77062;
				float3 Vertex_Motion7493_g76959 = temp_output_7495_0_g76959;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 normalizeResult2169_g76959 = normalize( ase_worldViewDir );
				float3 ViewDirection3963_g76959 = normalizeResult2169_g76959;
				float3 break2709_g76959 = cross( ViewDirection3963_g76959 , half3(0,1,0) );
				float3 appendResult2710_g76959 = (float3(-break2709_g76959.z , 0.0 , break2709_g76959.x));
				float3 appendResult2667_g76959 = (float3(Global_MeshVariation5104_g76959 , 0.5 , Global_MeshVariation5104_g76959));
				float dotResult2212_g76959 = dot( ViewDirection3963_g76959 , float3(0,1,0) );
				half Mask_HView2656_g76959 = dotResult2212_g76959;
				float saferPower2652_g76959 = abs( Mask_HView2656_g76959 );
				half3 Grass_Perspective2661_g76959 = ( ( ( mul( GetWorldToObjectMatrix(), float4( appendResult2710_g76959 , 0.0 ) ).xyz * _PerspectivePushValue ) + ( (appendResult2667_g76959*2.0 + -1.0) * _PerspectiveNoiseValue ) ) * Mesh_Height1524_g76959 * pow( saferPower2652_g76959 , _PerspectiveAngleValue ) );
				float temp_output_84_0_g76999 = _LayerVertexValue;
				float temp_output_19_0_g77003 = TVE_VertexUsage[(int)temp_output_84_0_g76999];
				float4 temp_output_94_19_g76999 = TVE_VertexCoords;
				half2 UV97_g76999 = ( (temp_output_94_19_g76999).zw + ( (temp_output_94_19_g76999).xy * (ObjectPosition4223_g76959).xz ) );
				float4 tex2DArrayNode50_g76999 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_VertexTex, sampler_Linear_Clamp, UV97_g76999,temp_output_84_0_g76999, 0.0 );
				float4 temp_output_17_0_g77003 = tex2DArrayNode50_g76999;
				float4 temp_output_111_19_g76999 = TVE_VertexParams;
				float4 temp_output_3_0_g77003 = temp_output_111_19_g76999;
				float4 ifLocalVar18_g77003 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g77003 >= 0.5 )
				ifLocalVar18_g77003 = temp_output_17_0_g77003;
				else
				ifLocalVar18_g77003 = temp_output_3_0_g77003;
				float4 lerpResult22_g77003 = lerp( temp_output_3_0_g77003 , temp_output_17_0_g77003 , temp_output_19_0_g77003);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g77003 = lerpResult22_g77003;
				#else
				float4 staticSwitch24_g77003 = ifLocalVar18_g77003;
				#endif
				half4 Global_Vertex_Params4173_g76959 = staticSwitch24_g77003;
				float4 break322_g77004 = Global_Vertex_Params4173_g76959;
				half Global_VertexSize174_g76959 = saturate( break322_g77004.w );
				float lerpResult346_g76959 = lerp( 1.0 , Global_VertexSize174_g76959 , _GlobalSize);
				float3 appendResult3480_g76959 = (float3(lerpResult346_g76959 , lerpResult346_g76959 , lerpResult346_g76959));
				half3 ObjectData20_g77059 = appendResult3480_g76959;
				half3 _Vector11 = half3(1,1,1);
				half3 WorldData19_g77059 = _Vector11;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g77059 = WorldData19_g77059;
				#else
				float3 staticSwitch14_g77059 = ObjectData20_g77059;
				#endif
				half3 Vertex_Size1741_g76959 = staticSwitch14_g77059;
				float temp_output_7_0_g77060 = _SizeFadeEndValue;
				float temp_output_10_0_g77060 = ( _SizeFadeStartValue - temp_output_7_0_g77060 );
				float temp_output_7453_0_g76959 = saturate( ( ( ( distance( _WorldSpaceCameraPos , ObjectPosition4223_g76959 ) * ( 1.0 / TVE_DistanceFadeBias ) ) - temp_output_7_0_g77060 ) / ( temp_output_10_0_g77060 + 0.0001 ) ) );
				float3 appendResult3482_g76959 = (float3(temp_output_7453_0_g76959 , temp_output_7453_0_g76959 , temp_output_7453_0_g76959));
				half3 ObjectData20_g77058 = appendResult3482_g76959;
				half3 _Vector5 = half3(1,1,1);
				half3 WorldData19_g77058 = _Vector5;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g77058 = WorldData19_g77058;
				#else
				float3 staticSwitch14_g77058 = ObjectData20_g77058;
				#endif
				float3 Vertex_SizeFade1740_g76959 = staticSwitch14_g77058;
				float3 lerpResult16_g77063 = lerp( VertexPosition3588_g76959 , ( ( ( Vertex_Motion7493_g76959 + Grass_Perspective2661_g76959 ) * Vertex_Size1741_g76959 * Vertex_SizeFade1740_g76959 ) + Mesh_PivotsOS2291_g76959 ) , TVE_IsEnabled);
				float3 temp_output_4912_0_g76959 = lerpResult16_g77063;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch4976_g76959 = temp_output_4912_0_g76959;
				#else
				float3 staticSwitch4976_g76959 = temp_output_4912_0_g76959;
				#endif
				float3 temp_output_4918_0_g76959 = ( staticSwitch4976_g76959 + ( _VertexDataMode * 0.0 ) );
				float3 Final_VertexPosition890_g76959 = ( temp_output_4918_0_g76959 + _DisableSRPBatcher );
				
				float4 break33_g76991 = _second_uvs_mode;
				float2 temp_output_30_0_g76991 = ( v.texcoord0.xy * break33_g76991.x );
				float2 appendResult21_g76967 = (float2(v.texcoord1.z , v.texcoord1.w));
				float2 Mesh_DetailCoord3_g76959 = appendResult21_g76967;
				float2 temp_output_29_0_g76991 = ( Mesh_DetailCoord3_g76959 * break33_g76991.y );
				float2 temp_output_31_0_g76991 = ( (WorldPosition_Shifted7477_g76959).xz * break33_g76991.z );
				float2 vertexToFrag11_g76990 = ( ( ( temp_output_30_0_g76991 + temp_output_29_0_g76991 + temp_output_31_0_g76991 ) * (_SecondUVs).xy ) + (_SecondUVs).zw );
				o.ase_texcoord5.xy = vertexToFrag11_g76990;
				half Mesh_DetailMask90_g76959 = v.ase_color.b;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				half3 WorldNormal4101_g76959 = normalizedWorldNormal;
				float lerpResult5730_g76959 = lerp( (WorldNormal4101_g76959).y , v.ase_normal.y , Vertex_DynamicMode5112_g76959);
				half WorldNormal_Y6811_g76959 = lerpResult5730_g76959;
				float lerpResult6884_g76959 = lerp( Mesh_DetailMask90_g76959 , (WorldNormal_Y6811_g76959*0.5 + 0.5) , _DetailMeshMode);
				float lerpResult7357_g76959 = lerp( lerpResult6884_g76959 , ( 1.0 - lerpResult6884_g76959 ) , _DetailMeshInvertMode);
				float lerpResult7546_g76959 = lerp( 1.0 , lerpResult7357_g76959 , _DetailMeshValue);
				float vertexToFrag11_g77083 = lerpResult7546_g76959;
				o.ase_texcoord5.z = vertexToFrag11_g77083;
				o.ase_texcoord6.xyz = vertexToFrag3890_g76959;
				o.ase_texcoord7.xyz = vertexToFrag4224_g76959;
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord8.xyz = ase_worldTangent;
				o.ase_texcoord9.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord10.xyz = ase_worldBitangent;
				half Global_Noise_A4860_g76959 = break638_g77065.a;
				half Tint_Highlight_Value3231_g76959 = ( Global_Noise_A4860_g76959 * Global_Wind_Power2223_g76959 * Motion_FadeOut4005_g76959 * Mesh_Height1524_g76959 );
				float vertexToFrag11_g77009 = Tint_Highlight_Value3231_g76959;
				o.ase_texcoord5.w = vertexToFrag11_g77009;
				
				o.ase_texcoord4 = v.texcoord0;
				o.ase_color = v.ase_color;
				o.ase_normal = v.ase_normal;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord6.w = 0;
				o.ase_texcoord7.w = 0;
				o.ase_texcoord8.w = 0;
				o.ase_texcoord9.w = 0;
				o.ase_texcoord10.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = Final_VertexPosition890_g76959;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.worldPos = positionWS;
				#endif

				o.clipPos = MetaVertexPosition( v.vertex, v.texcoord1.xy, v.texcoord1.xy, unity_LightmapST, unity_DynamicLightmapST );

				#ifdef EDITOR_VISUALIZATION
					float2 VizUV = 0;
					float4 LightCoord = 0;
					UnityEditorVizData(v.vertex.xyz, v.texcoord0.xy, v.texcoord1.xy, v.texcoord2.xy, VizUV, LightCoord);
					o.VizUV = float4(VizUV, 0, 0);
					o.LightCoord = LightCoord;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = o.clipPos;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 texcoord0 : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.texcoord0 = v.texcoord0;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				o.ase_tangent = v.ase_tangent;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.texcoord0 = patch[0].texcoord0 * bary.x + patch[1].texcoord0 * bary.y + patch[2].texcoord0 * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN  ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 WorldPosition = IN.worldPos;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				half2 Main_UVs15_g76959 = ( ( IN.ase_texcoord4.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g76959 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g76959 );
				float3 lerpResult6223_g76959 = lerp( float3( 1,1,1 ) , (tex2DNode29_g76959).rgb , _MainAlbedoValue);
				half3 Main_Albedo99_g76959 = ( (_MainColor).rgb * lerpResult6223_g76959 );
				float2 vertexToFrag11_g76990 = IN.ase_texcoord5.xy;
				half2 Second_UVs17_g76959 = vertexToFrag11_g76990;
				float4 tex2DNode89_g76959 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, Second_UVs17_g76959 );
				float3 lerpResult6225_g76959 = lerp( float3( 1,1,1 ) , (tex2DNode89_g76959).rgb , _SecondAlbedoValue);
				half3 Second_Albedo153_g76959 = ( (_SecondColor).rgb * lerpResult6225_g76959 );
				#ifdef UNITY_COLORSPACE_GAMMA
				float staticSwitch1_g77010 = 2.0;
				#else
				float staticSwitch1_g77010 = 4.594794;
				#endif
				float3 lerpResult4834_g76959 = lerp( ( Main_Albedo99_g76959 * Second_Albedo153_g76959 * staticSwitch1_g77010 ) , Second_Albedo153_g76959 , _DetailBlendMode);
				float4 tex2DNode35_g76959 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_Linear_Repeat, Main_UVs15_g76959 );
				half Main_Mask57_g76959 = tex2DNode35_g76959.b;
				float4 tex2DNode33_g76959 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_Linear_Repeat, Second_UVs17_g76959 );
				half Second_Mask81_g76959 = tex2DNode33_g76959.b;
				float lerpResult6885_g76959 = lerp( Main_Mask57_g76959 , Second_Mask81_g76959 , _DetailMaskMode);
				float lerpResult7354_g76959 = lerp( lerpResult6885_g76959 , ( 1.0 - lerpResult6885_g76959 ) , _DetailMaskInvertMode);
				float lerpResult7547_g76959 = lerp( 1.0 , lerpResult7354_g76959 , _DetailMaskIntensity);
				half Blend_Mask_Texture6794_g76959 = lerpResult7547_g76959;
				float vertexToFrag11_g77083 = IN.ase_texcoord5.z;
				half Blend_Mask_Mesh1540_g76959 = vertexToFrag11_g77083;
				float clampResult17_g77023 = clamp( ( Blend_Mask_Texture6794_g76959 * Blend_Mask_Mesh1540_g76959 ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g77032 = _DetailBlendMinValue;
				float temp_output_10_0_g77032 = ( _DetailBlendMaxValue - temp_output_7_0_g77032 );
				half Blend_Mask147_g76959 = ( saturate( ( ( clampResult17_g77023 - temp_output_7_0_g77032 ) / ( temp_output_10_0_g77032 + 0.0001 ) ) ) * _DetailMode );
				float3 lerpResult235_g76959 = lerp( Main_Albedo99_g76959 , lerpResult4834_g76959 , Blend_Mask147_g76959);
				#ifdef TVE_FEATURE_DETAIL
				float3 staticSwitch255_g76959 = lerpResult235_g76959;
				#else
				float3 staticSwitch255_g76959 = Main_Albedo99_g76959;
				#endif
				half3 Blend_Albedo265_g76959 = staticSwitch255_g76959;
				half Mesh_Height1524_g76959 = IN.ase_color.a;
				float temp_output_7_0_g77030 = _GradientMinValue;
				float temp_output_10_0_g77030 = ( _GradientMaxValue - temp_output_7_0_g77030 );
				half Tint_Gradient_Value2784_g76959 = saturate( ( ( Mesh_Height1524_g76959 - temp_output_7_0_g77030 ) / ( temp_output_10_0_g77030 + 0.0001 ) ) );
				float3 lerpResult2779_g76959 = lerp( (_GradientColorTwo).rgb , (_GradientColorOne).rgb , Tint_Gradient_Value2784_g76959);
				float clampResult17_g77025 = clamp( Main_Mask57_g76959 , 0.0001 , 0.9999 );
				float temp_output_7_0_g77028 = _MainMaskMinValue;
				float temp_output_10_0_g77028 = ( _MainMaskMaxValue - temp_output_7_0_g77028 );
				half Main_Mask_Remap5765_g76959 = saturate( ( ( clampResult17_g77025 - temp_output_7_0_g77028 ) / ( temp_output_10_0_g77028 + 0.0001 ) ) );
				float clampResult17_g77024 = clamp( Second_Mask81_g76959 , 0.0001 , 0.9999 );
				float temp_output_7_0_g77029 = _SecondMaskMinValue;
				float temp_output_10_0_g77029 = ( _SecondMaskMaxValue - temp_output_7_0_g77029 );
				half Second_Mask_Remap6130_g76959 = saturate( ( ( clampResult17_g77024 - temp_output_7_0_g77029 ) / ( temp_output_10_0_g77029 + 0.0001 ) ) );
				float lerpResult6617_g76959 = lerp( Main_Mask_Remap5765_g76959 , Second_Mask_Remap6130_g76959 , Blend_Mask147_g76959);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6623_g76959 = lerpResult6617_g76959;
				#else
				float staticSwitch6623_g76959 = Main_Mask_Remap5765_g76959;
				#endif
				half Blend_Mask_Remap6621_g76959 = staticSwitch6623_g76959;
				half Tint_Gradient_Mask6207_g76959 = Blend_Mask_Remap6621_g76959;
				float3 lerpResult6208_g76959 = lerp( float3( 1,1,1 ) , lerpResult2779_g76959 , Tint_Gradient_Mask6207_g76959);
				half3 Tint_Gradient_Color5769_g76959 = lerpResult6208_g76959;
				half3 Tint_Noise_Color5770_g76959 = float3(1,1,1);
				half3 Tint_User_Color7335_g76959 = float3(1,1,1);
				float Mesh_Occlusion318_g76959 = IN.ase_color.g;
				float clampResult17_g77022 = clamp( Mesh_Occlusion318_g76959 , 0.0001 , 0.9999 );
				float temp_output_7_0_g77035 = _VertexOcclusionMinValue;
				float temp_output_10_0_g77035 = ( _VertexOcclusionMaxValue - temp_output_7_0_g77035 );
				half Occlusion_Mask6432_g76959 = saturate( ( ( clampResult17_g77022 - temp_output_7_0_g77035 ) / ( temp_output_10_0_g77035 + 0.0001 ) ) );
				float3 lerpResult2945_g76959 = lerp( (_VertexOcclusionColor).rgb , float3( 1,1,1 ) , Occlusion_Mask6432_g76959);
				half3 Occlusion_Color648_g76959 = lerpResult2945_g76959;
				half3 Matcap_Color7428_g76959 = half3(0,0,0);
				half3 Blend_Albedo_Tinted2808_g76959 = ( ( Blend_Albedo265_g76959 * Tint_Gradient_Color5769_g76959 * Tint_Noise_Color5770_g76959 * Tint_User_Color7335_g76959 * Occlusion_Color648_g76959 ) + Matcap_Color7428_g76959 );
				float3 temp_output_3_0_g77020 = Blend_Albedo_Tinted2808_g76959;
				float dotResult20_g77020 = dot( temp_output_3_0_g77020 , float3(0.2126,0.7152,0.0722) );
				half Blend_Albedo_Grayscale5939_g76959 = dotResult20_g77020;
				float3 temp_cast_0 = (Blend_Albedo_Grayscale5939_g76959).xxx;
				float temp_output_82_0_g76983 = _LayerColorsValue;
				float temp_output_19_0_g76987 = TVE_ColorsUsage[(int)temp_output_82_0_g76983];
				float4 temp_output_91_19_g76983 = TVE_ColorsCoords;
				float3 vertexToFrag3890_g76959 = IN.ase_texcoord6.xyz;
				float3 WorldPosition3905_g76959 = vertexToFrag3890_g76959;
				float3 vertexToFrag4224_g76959 = IN.ase_texcoord7.xyz;
				float3 ObjectPosition4223_g76959 = vertexToFrag4224_g76959;
				float3 lerpResult4822_g76959 = lerp( WorldPosition3905_g76959 , ObjectPosition4223_g76959 , _ColorsPositionMode);
				half2 UV94_g76983 = ( (temp_output_91_19_g76983).zw + ( (temp_output_91_19_g76983).xy * (lerpResult4822_g76959).xz ) );
				float4 tex2DArrayNode83_g76983 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ColorsTex, sampler_Linear_Clamp, UV94_g76983,temp_output_82_0_g76983, 0.0 );
				float4 temp_output_17_0_g76987 = tex2DArrayNode83_g76983;
				float4 temp_output_92_86_g76983 = TVE_ColorsParams;
				float4 temp_output_3_0_g76987 = temp_output_92_86_g76983;
				float4 ifLocalVar18_g76987 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76987 >= 0.5 )
				ifLocalVar18_g76987 = temp_output_17_0_g76987;
				else
				ifLocalVar18_g76987 = temp_output_3_0_g76987;
				float4 lerpResult22_g76987 = lerp( temp_output_3_0_g76987 , temp_output_17_0_g76987 , temp_output_19_0_g76987);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76987 = lerpResult22_g76987;
				#else
				float4 staticSwitch24_g76987 = ifLocalVar18_g76987;
				#endif
				half4 Global_Colors_Params5434_g76959 = staticSwitch24_g76987;
				float4 temp_output_346_0_g76966 = Global_Colors_Params5434_g76959;
				half Global_Colors_A1701_g76959 = saturate( (temp_output_346_0_g76966).w );
				half Colors_Influence3668_g76959 = Global_Colors_A1701_g76959;
				float temp_output_6306_0_g76959 = ( 1.0 - Colors_Influence3668_g76959 );
				float3 lerpResult3618_g76959 = lerp( Blend_Albedo_Tinted2808_g76959 , temp_cast_0 , ( 1.0 - ( temp_output_6306_0_g76959 * temp_output_6306_0_g76959 ) ));
				half3 Global_Colors_RGB1700_g76959 = (temp_output_346_0_g76966).xyz;
				#ifdef UNITY_COLORSPACE_GAMMA
				float staticSwitch1_g77006 = 2.0;
				#else
				float staticSwitch1_g77006 = 4.594794;
				#endif
				half3 Colors_RGB1954_g76959 = ( Global_Colors_RGB1700_g76959 * staticSwitch1_g77006 );
				half Colors_Value3692_g76959 = ( Blend_Mask_Remap6621_g76959 * _GlobalColors );
				float3 ObjectPosition_Shifted7481_g76959 = ( ObjectPosition4223_g76959 - TVE_WorldOrigin );
				half3 Input_Position167_g77037 = ObjectPosition_Shifted7481_g76959;
				float dotResult156_g77037 = dot( (Input_Position167_g77037).xz , float2( 12.9898,78.233 ) );
				half Vertex_DynamicMode5112_g76959 = _VertexDynamicMode;
				half Input_DynamicMode120_g77037 = Vertex_DynamicMode5112_g76959;
				float Postion_Random162_g77037 = ( sin( dotResult156_g77037 ) * ( 1.0 - Input_DynamicMode120_g77037 ) );
				float Mesh_Variation16_g76959 = IN.ase_color.r;
				half Input_Variation124_g77037 = Mesh_Variation16_g76959;
				half ObjectData20_g77039 = frac( ( Postion_Random162_g77037 + Input_Variation124_g77037 ) );
				half WorldData19_g77039 = Input_Variation124_g77037;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g77039 = WorldData19_g77039;
				#else
				float staticSwitch14_g77039 = ObjectData20_g77039;
				#endif
				float clampResult17_g77041 = clamp( staticSwitch14_g77039 , 0.0001 , 0.9999 );
				float Global_MeshVariation5104_g76959 = clampResult17_g77041;
				float lerpResult3870_g76959 = lerp( 1.0 , Global_MeshVariation5104_g76959 , _ColorsVariationValue);
				half Colors_Variation3650_g76959 = lerpResult3870_g76959;
				half Occlusion_Alpha6463_g76959 = _VertexOcclusionColor.a;
				float lerpResult6459_g76959 = lerp( Occlusion_Mask6432_g76959 , ( 1.0 - Occlusion_Mask6432_g76959 ) , _ColorsMaskMode);
				float lerpResult6461_g76959 = lerp( Occlusion_Alpha6463_g76959 , 1.0 , lerpResult6459_g76959);
				half Occlusion_Colors6450_g76959 = lerpResult6461_g76959;
				float3 temp_output_3_0_g77021 = ( Blend_Albedo265_g76959 * Tint_Gradient_Color5769_g76959 * Tint_Noise_Color5770_g76959 * Tint_User_Color7335_g76959 );
				float dotResult20_g77021 = dot( temp_output_3_0_g77021 , float3(0.2126,0.7152,0.0722) );
				float clampResult6740_g76959 = clamp( saturate( ( dotResult20_g77021 * 5.0 ) ) , 0.2 , 1.0 );
				half Blend_Albedo_Globals6410_g76959 = clampResult6740_g76959;
				float temp_output_7_0_g77033 = 0.1;
				float temp_output_10_0_g77033 = ( 0.2 - temp_output_7_0_g77033 );
				float lerpResult16_g77007 = lerp( 0.0 , saturate( ( ( ( Colors_Value3692_g76959 * Colors_Influence3668_g76959 * Colors_Variation3650_g76959 * Occlusion_Colors6450_g76959 * Blend_Albedo_Globals6410_g76959 ) - temp_output_7_0_g77033 ) / ( temp_output_10_0_g77033 + 0.0001 ) ) ) , TVE_IsEnabled);
				float3 lerpResult3628_g76959 = lerp( Blend_Albedo_Tinted2808_g76959 , ( lerpResult3618_g76959 * Colors_RGB1954_g76959 ) , lerpResult16_g77007);
				half3 Blend_Albedo_Colored_High6027_g76959 = lerpResult3628_g76959;
				half3 Blend_Albedo_Colored863_g76959 = Blend_Albedo_Colored_High6027_g76959;
				half3 Global_OverlayColor1758_g76959 = (TVE_OverlayColor).rgb;
				float temp_output_84_0_g76978 = _LayerExtrasValue;
				float temp_output_19_0_g76982 = TVE_ExtrasUsage[(int)temp_output_84_0_g76978];
				float4 temp_output_93_19_g76978 = TVE_ExtrasCoords;
				float3 lerpResult4827_g76959 = lerp( WorldPosition3905_g76959 , ObjectPosition4223_g76959 , _ExtrasPositionMode);
				half2 UV96_g76978 = ( (temp_output_93_19_g76978).zw + ( (temp_output_93_19_g76978).xy * (lerpResult4827_g76959).xz ) );
				float4 tex2DArrayNode48_g76978 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ExtrasTex, sampler_Linear_Clamp, UV96_g76978,temp_output_84_0_g76978, 0.0 );
				float4 temp_output_17_0_g76982 = tex2DArrayNode48_g76978;
				float4 temp_output_94_85_g76978 = TVE_ExtrasParams;
				float4 temp_output_3_0_g76982 = temp_output_94_85_g76978;
				float4 ifLocalVar18_g76982 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76982 >= 0.5 )
				ifLocalVar18_g76982 = temp_output_17_0_g76982;
				else
				ifLocalVar18_g76982 = temp_output_3_0_g76982;
				float4 lerpResult22_g76982 = lerp( temp_output_3_0_g76982 , temp_output_17_0_g76982 , temp_output_19_0_g76982);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76982 = lerpResult22_g76982;
				#else
				float4 staticSwitch24_g76982 = ifLocalVar18_g76982;
				#endif
				half4 Global_Extras_Params5440_g76959 = staticSwitch24_g76982;
				float4 break456_g76996 = Global_Extras_Params5440_g76959;
				half Global_Extras_Overlay156_g76959 = break456_g76996.z;
				float lerpResult1065_g76959 = lerp( 1.0 , Global_MeshVariation5104_g76959 , _OverlayVariationValue);
				half Overlay_Variation4560_g76959 = lerpResult1065_g76959;
				half Overlay_Value5738_g76959 = ( _GlobalOverlay * Global_Extras_Overlay156_g76959 * Overlay_Variation4560_g76959 );
				half4 Normal_Packed45_g76988 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_Linear_Repeat, Main_UVs15_g76959 );
				float2 appendResult58_g76988 = (float2(( (Normal_Packed45_g76988).x * (Normal_Packed45_g76988).w ) , (Normal_Packed45_g76988).y));
				half2 Normal_Default50_g76988 = appendResult58_g76988;
				half2 Normal_ASTC41_g76988 = (Normal_Packed45_g76988).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g76988 = Normal_ASTC41_g76988;
				#else
				float2 staticSwitch38_g76988 = Normal_Default50_g76988;
				#endif
				half2 Normal_NO_DTX544_g76988 = (Normal_Packed45_g76988).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g76988 = Normal_NO_DTX544_g76988;
				#else
				float2 staticSwitch37_g76988 = staticSwitch38_g76988;
				#endif
				float2 temp_output_6555_0_g76959 = ( (staticSwitch37_g76988*2.0 + -1.0) * _MainNormalValue );
				half2 Main_Normal137_g76959 = temp_output_6555_0_g76959;
				float2 lerpResult3372_g76959 = lerp( float2( 0,0 ) , Main_Normal137_g76959 , _DetailNormalValue);
				half4 Normal_Packed45_g76989 = SAMPLE_TEXTURE2D( _SecondNormalTex, sampler_Linear_Repeat, Second_UVs17_g76959 );
				float2 appendResult58_g76989 = (float2(( (Normal_Packed45_g76989).x * (Normal_Packed45_g76989).w ) , (Normal_Packed45_g76989).y));
				half2 Normal_Default50_g76989 = appendResult58_g76989;
				half2 Normal_ASTC41_g76989 = (Normal_Packed45_g76989).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g76989 = Normal_ASTC41_g76989;
				#else
				float2 staticSwitch38_g76989 = Normal_Default50_g76989;
				#endif
				half2 Normal_NO_DTX544_g76989 = (Normal_Packed45_g76989).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g76989 = Normal_NO_DTX544_g76989;
				#else
				float2 staticSwitch37_g76989 = staticSwitch38_g76989;
				#endif
				half2 Second_Normal179_g76959 = ( (staticSwitch37_g76989*2.0 + -1.0) * _SecondNormalValue );
				float2 temp_output_36_0_g77011 = ( lerpResult3372_g76959 + Second_Normal179_g76959 );
				float2 lerpResult3376_g76959 = lerp( Main_Normal137_g76959 , temp_output_36_0_g77011 , Blend_Mask147_g76959);
				#ifdef TVE_FEATURE_DETAIL
				float2 staticSwitch267_g76959 = lerpResult3376_g76959;
				#else
				float2 staticSwitch267_g76959 = Main_Normal137_g76959;
				#endif
				half2 Blend_Normal312_g76959 = staticSwitch267_g76959;
				float3 appendResult7377_g76959 = (float3(Blend_Normal312_g76959 , 1.0));
				float3 ase_worldTangent = IN.ase_texcoord8.xyz;
				float3 ase_worldNormal = IN.ase_texcoord9.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord10.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal7376_g76959 = appendResult7377_g76959;
				float3 worldNormal7376_g76959 = float3(dot(tanToWorld0,tanNormal7376_g76959), dot(tanToWorld1,tanNormal7376_g76959), dot(tanToWorld2,tanNormal7376_g76959));
				half3 Blend_NormalWS7375_g76959 = worldNormal7376_g76959;
				float lerpResult7446_g76959 = lerp( (Blend_NormalWS7375_g76959).y , IN.ase_normal.y , Vertex_DynamicMode5112_g76959);
				float lerpResult6757_g76959 = lerp( 1.0 , saturate( lerpResult7446_g76959 ) , _OverlayProjectionValue);
				half Overlay_Projection6081_g76959 = lerpResult6757_g76959;
				half Overlay_Shading6688_g76959 = Blend_Albedo_Globals6410_g76959;
				half Overlay_Custom6707_g76959 = 1.0;
				float lerpResult6467_g76959 = lerp( Occlusion_Alpha6463_g76959 , 1.0 , Occlusion_Mask6432_g76959);
				half Occlusion_Overlay6471_g76959 = lerpResult6467_g76959;
				float temp_output_7_0_g77031 = 0.1;
				float temp_output_10_0_g77031 = ( 0.2 - temp_output_7_0_g77031 );
				half Overlay_Mask_High6064_g76959 = saturate( ( ( ( Overlay_Value5738_g76959 * Overlay_Projection6081_g76959 * Overlay_Shading6688_g76959 * Overlay_Custom6707_g76959 * Occlusion_Overlay6471_g76959 ) - temp_output_7_0_g77031 ) / ( temp_output_10_0_g77031 + 0.0001 ) ) );
				half Overlay_Mask269_g76959 = Overlay_Mask_High6064_g76959;
				float3 lerpResult336_g76959 = lerp( Blend_Albedo_Colored863_g76959 , Global_OverlayColor1758_g76959 , Overlay_Mask269_g76959);
				half3 Blend_Albedo_Overlay359_g76959 = lerpResult336_g76959;
				half Global_WetnessContrast6502_g76959 = TVE_WetnessContrast;
				half Global_Extras_Wetness305_g76959 = break456_g76996.y;
				half Wetness_Value6343_g76959 = ( Global_Extras_Wetness305_g76959 * _GlobalWetness );
				float3 lerpResult6367_g76959 = lerp( Blend_Albedo_Overlay359_g76959 , ( Blend_Albedo_Overlay359_g76959 * Blend_Albedo_Overlay359_g76959 ) , ( Global_WetnessContrast6502_g76959 * Wetness_Value6343_g76959 ));
				half3 Blend_Albedo_Wetness6351_g76959 = lerpResult6367_g76959;
				float vertexToFrag11_g77009 = IN.ase_texcoord5.w;
				half3 Tint_Highlight_Color5771_g76959 = ( ( (_MotionHighlightColor).rgb * vertexToFrag11_g77009 ) + float3( 1,1,1 ) );
				half Emissive_Dark6993_g76959 = 1.0;
				float3 temp_output_6309_0_g76959 = ( Blend_Albedo_Wetness6351_g76959 * Tint_Highlight_Color5771_g76959 * Emissive_Dark6993_g76959 );
				half3 Blend_Albedo_Subsurface149_g76959 = temp_output_6309_0_g76959;
				half3 Blend_Albedo_RimLight7316_g76959 = Blend_Albedo_Subsurface149_g76959;
				
				half3 Emissive_Color7162_g76959 = (_EmissiveColor).rgb;
				half2 Emissive_UVs2468_g76959 = ( ( IN.ase_texcoord4.xy * (_EmissiveUVs).xy ) + (_EmissiveUVs).zw );
				half3 Emissive_Texture7022_g76959 = (SAMPLE_TEXTURE2D( _EmissiveTex, sampler_Linear_Repeat, Emissive_UVs2468_g76959 )).rgb;
				half Global_Extras_Emissive4203_g76959 = break456_g76996.x;
				float lerpResult4206_g76959 = lerp( 1.0 , Global_Extras_Emissive4203_g76959 , _GlobalEmissive);
				half Emissive_Value7024_g76959 = ( lerpResult4206_g76959 * _EmissivePhaseValue );
				half3 Emissive_Constant7189_g76959 = ( Emissive_Texture7022_g76959 * Emissive_Value7024_g76959 );
				half3 Emissive_Mask6968_g76959 = Emissive_Constant7189_g76959;
				float3 temp_output_3_0_g76995 = ( Emissive_Color7162_g76959 * Emissive_Mask6968_g76959 );
				float temp_output_15_0_g76995 = _emissive_intensity_value;
				float3 temp_output_23_0_g76995 = ( temp_output_3_0_g76995 * temp_output_15_0_g76995 );
				half3 Final_Emissive2476_g76959 = temp_output_23_0_g76995;
				
				float localCustomAlphaClip19_g77017 = ( 0.0 );
				half Main_Alpha316_g76959 = tex2DNode29_g76959.a;
				half Second_Alpha5007_g76959 = tex2DNode89_g76959.a;
				float lerpResult6153_g76959 = lerp( Main_Alpha316_g76959 , Second_Alpha5007_g76959 , Blend_Mask147_g76959);
				float lerpResult6785_g76959 = lerp( ( Main_Alpha316_g76959 * Second_Alpha5007_g76959 ) , lerpResult6153_g76959 , _DetailAlphaMode);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6158_g76959 = lerpResult6785_g76959;
				#else
				float staticSwitch6158_g76959 = Main_Alpha316_g76959;
				#endif
				half Blend_Alpha6157_g76959 = staticSwitch6158_g76959;
				half AlphaTreshold2132_g76959 = _AlphaClipValue;
				half Global_Extras_Alpha1033_g76959 = saturate( break456_g76996.w );
				float lerpResult5154_g76959 = lerp( 0.0 , Global_MeshVariation5104_g76959 , _AlphaVariationValue);
				half Global_Alpha_Variation5158_g76959 = lerpResult5154_g76959;
				float lerpResult6866_g76959 = lerp( ( 1.0 - Blend_Mask147_g76959 ) , 1.0 , _DetailFadeMode);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6612_g76959 = lerpResult6866_g76959;
				#else
				float staticSwitch6612_g76959 = 1.0;
				#endif
				half Blend_Mask_Invert6260_g76959 = staticSwitch6612_g76959;
				half Alpha_Mask6234_g76959 = ( 1.0 * Blend_Mask_Invert6260_g76959 );
				float lerpResult5203_g76959 = lerp( 1.0 , saturate( ( ( Global_Extras_Alpha1033_g76959 - Global_Alpha_Variation5158_g76959 ) + ( Global_Extras_Alpha1033_g76959 * 0.5 ) ) ) , ( Alpha_Mask6234_g76959 * _GlobalAlpha ));
				float lerpResult16_g77012 = lerp( 1.0 , lerpResult5203_g76959 , TVE_IsEnabled);
				half Global_Alpha315_g76959 = lerpResult16_g77012;
				half Fade_Alpha3727_g76959 = 1.0;
				float Emissive_Alpha6927_g76959 = 1.0;
				half Final_Alpha7344_g76959 = min( min( ( Blend_Alpha6157_g76959 - AlphaTreshold2132_g76959 ) , Global_Alpha315_g76959 ) , min( Fade_Alpha3727_g76959 , Emissive_Alpha6927_g76959 ) );
				float temp_output_3_0_g77017 = Final_Alpha7344_g76959;
				float Alpha19_g77017 = temp_output_3_0_g77017;
				float temp_output_15_0_g77017 = 0.01;
				float Treshold19_g77017 = temp_output_15_0_g77017;
				{
				#if defined (TVE_FEATURE_CLIP)
				#if defined (TVE_IS_HD_PIPELINE)
				#if !defined (SHADERPASS_FORWARD_BYPASS_ALPHA_TEST)
				clip(Alpha19_g77017 - Treshold19_g77017);
				#endif
				#if !defined (SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST)
				clip(Alpha19_g77017 - Treshold19_g77017);
				#endif
				#else
				clip(Alpha19_g77017 - Treshold19_g77017);
				#endif
				#endif
				}
				half Main_Color_Alpha6121_g76959 = _MainColor.a;
				half Second_Color_Alpha6152_g76959 = _SecondColor.a;
				float lerpResult6168_g76959 = lerp( Main_Color_Alpha6121_g76959 , Second_Color_Alpha6152_g76959 , Blend_Mask147_g76959);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6174_g76959 = lerpResult6168_g76959;
				#else
				float staticSwitch6174_g76959 = Main_Color_Alpha6121_g76959;
				#endif
				half Blend_Color_Alpha6167_g76959 = staticSwitch6174_g76959;
				half Final_Clip914_g76959 = saturate( ( Alpha19_g77017 * Blend_Color_Alpha6167_g76959 ) );
				

				float3 BaseColor = Blend_Albedo_RimLight7316_g76959;
				float3 Emission = Final_Emissive2476_g76959;
				float Alpha = Final_Clip914_g76959;
				float AlphaClipThreshold = 0.5;

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				MetaInput metaInput = (MetaInput)0;
				metaInput.Albedo = BaseColor;
				metaInput.Emission = Emission;
				#ifdef EDITOR_VISUALIZATION
					metaInput.VizUV = IN.VizUV.xy;
					metaInput.LightCoord = IN.LightCoord;
				#endif

				return UnityMetaFragment(metaInput);
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "Universal2D"
			Tags { "LightMode"="Universal2D" }

			Blend [_render_src] [_render_dst], One Zero
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA

			HLSLPROGRAM

			#define _SPECULAR_SETUP 1
			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define ASE_TRANSLUCENCY 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140007
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_2D

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_COLOR
			#pragma shader_feature_local_fragment TVE_FEATURE_CLIP
			#pragma shader_feature_local TVE_FEATURE_BATCHING
			#pragma shader_feature_local_fragment TVE_FEATURE_DETAIL
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_UNIVERSAL_PIPELINE
			#define TVE_IS_PLANT_SHADER
			#define TVE_IS_SUBSURFACE_SHADER
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_tangent : TANGENT;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 worldPos : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord : TEXCOORD1;
				#endif
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				float3 ase_normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _DetailBlendRemap;
			float4 _GradientMaskRemap;
			half4 _VertexOcclusionRemap;
			half4 _RimLightRemap;
			half4 _MainColor;
			half4 _MainUVs;
			half4 _MotionHighlightColor;
			half4 _EmissiveColor;
			half4 _EmissiveUVs;
			half4 _SecondColor;
			half4 _VertexOcclusionColor;
			half4 _second_uvs_mode;
			float4 _MaxBoundsInfo;
			half4 _SecondUVs;
			half4 _SecondMaskRemap;
			half4 _MainMaskRemap;
			half4 _GradientColorTwo;
			float4 _SubsurfaceDiffusion_Asset;
			float4 _Color;
			float4 _NoiseMaskRemap;
			half4 _SubsurfaceColor;
			half4 _GradientColorOne;
			half3 _render_normals;
			half _SecondAlbedoValue;
			half _DetailMaskIntensity;
			half _DetailMaskMode;
			half _MainAlbedoValue;
			half _DetailBlendMode;
			half _VertexDataMode;
			half _DetailMaskInvertMode;
			half _SizeFadeStartValue;
			half _render_zw;
			half _GlobalSize;
			half _MotionVariation_20;
			half _MotionSpeed_20;
			half _MotionValue_20;
			half _MotionFacingValue;
			half _MotionAmplitude_20;
			half _MotionAmplitude_22;
			float _MotionScale_32;
			half _SizeFadeEndValue;
			float _MotionVariation_32;
			half _MotionValue_30;
			half _MotionAmplitude_32;
			half _PerspectivePushValue;
			half _PerspectiveNoiseValue;
			half _DetailMeshMode;
			half _PerspectiveAngleValue;
			half _LayerVertexValue;
			float _MotionSpeed_32;
			half _DetailMeshInvertMode;
			half _GradientMinValue;
			half _DetailBlendMinValue;
			half _SecondNormalValue;
			half _OverlayProjectionValue;
			half _GlobalWetness;
			half _GlobalEmissive;
			half _EmissivePhaseValue;
			float _emissive_intensity_value;
			half _RenderSpecular;
			half _DetailNormalValue;
			half _MainSmoothnessValue;
			half _MainOcclusionValue;
			half _SecondOcclusionValue;
			half _DetailAlphaMode;
			half _AlphaClipValue;
			half _AlphaVariationValue;
			half _DetailFadeMode;
			half _GlobalAlpha;
			half _SecondSmoothnessValue;
			half _MainNormalValue;
			half _OverlayVariationValue;
			half _ExtrasPositionMode;
			half _DetailBlendMaxValue;
			half _DetailMode;
			half _MotionScale_20;
			half _GradientMaxValue;
			half _MainMaskMinValue;
			half _MainMaskMaxValue;
			half _SecondMaskMinValue;
			half _SecondMaskMaxValue;
			half _VertexOcclusionMinValue;
			half _VertexOcclusionMaxValue;
			half _LayerColorsValue;
			half _ColorsPositionMode;
			half _GlobalColors;
			half _ColorsVariationValue;
			half _ColorsMaskMode;
			half _GlobalOverlay;
			half _LayerExtrasValue;
			half _DetailMeshValue;
			half _InteractionAmplitude;
			float _MotionSpeed_10;
			half _MotionAmplitude_10;
			half _MessageSecondMask;
			half _MessageMotionVariation;
			half _MessageGlobalsVariation;
			half _MessageMainMask;
			half _MessageSubsurface;
			half _IsTVEShader;
			half _IsIdentifier;
			half _MessageOcclusion;
			half _HasOcclusion;
			half _HasEmissive;
			half _VertexVariationMode;
			half _IsCollected;
			half _IsShared;
			half _IsVersion;
			half _RenderCoverage;
			float _EmissiveIntensityValue;
			half _HasGradient;
			half _RenderNormals;
			half _CategoryRender;
			half _RenderMode;
			half _render_coverage;
			half _render_cull;
			half _render_src;
			half _render_dst;
			float _IsPlantShader;
			half _IsSubsurfaceShader;
			float _SubsurfaceDiffusion;
			half _Cutoff;
			half _ColorsMaskMinValue;
			half _ColorsMaskMaxValue;
			half _RenderDecals;
			half _RenderSSR;
			half _RenderZWrite;
			half _RenderClip;
			half _RenderCull;
			half _RenderQueue;
			half _RenderPriority;
			half _DetailTypeMode;
			half _DetailOpaqueMode;
			half _DetailCoordMode;
			half _EmissiveIntensityMode;
			half _SubsurfaceDirectValue;
			half _SubsurfaceAngleValue;
			half _SubsurfaceScatteringValue;
			half _RenderDirect;
			half _CategoryRimLight;
			half _CategoryMatcap;
			half _CategorySubsurface;
			half _CategoryEmissive;
			half _RenderAmbient;
			half _RenderShadow;
			half _IsCoreShader;
			half _VertexPivotMode;
			half _MotionPosition_10;
			float _MotionScale_10;
			half _MotionVariation_10;
			half _VertexDynamicMode;
			half _LayerMotionValue;
			half _SubsurfaceAmbientValue;
			half _InteractionMaskValue;
			half _SubsurfaceShadowValue;
			half _SpaceRenderFade;
			half _EmissiveFlagMode;
			half _SecondUVsMode;
			half _SpaceGlobalLayers;
			half _SpaceGlobalLocals;
			half _SpaceSubsurface;
			half _SpaceMotionLocals;
			half _SpaceMotionGlobals;
			half _SpaceGlobalOptions;
			half _CategoryGlobals;
			half _CategoryMain;
			half _CategoryDetail;
			half _CategoryOcclusion;
			half _CategoryGradient;
			half _CategoryNoise;
			half _CategoryPerspective;
			half _CategorySizeFade;
			half _CategoryMotion;
			half _SubsurfaceNormalValue;
			half _SubsurfaceValue;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			// Property used by ScenePickingPass
			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			// Properties used by SceneSelectionPass
			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(TVE_NoiseTex);
			float3 TVE_WorldOrigin;
			half4 TVE_MotionParams;
			half4 TVE_TimeParams;
			SAMPLER(sampler_Linear_Repeat);
			float TVE_MotionUsage[10];
			TEXTURE2D_ARRAY(TVE_MotionTex);
			half4 TVE_MotionCoords;
			SAMPLER(sampler_Linear_Clamp);
			half TVE_MotionValue_10;
			half TVE_MotionValue_20;
			half TVE_MotionFadeEnd;
			half TVE_MotionFadeStart;
			half TVE_MotionValue_30;
			float TVE_VertexUsage[10];
			TEXTURE2D_ARRAY(TVE_VertexTex);
			half4 TVE_VertexCoords;
			half4 TVE_VertexParams;
			half TVE_DistanceFadeBias;
			half TVE_IsEnabled;
			half _DisableSRPBatcher;
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);
			TEXTURE2D(_SecondAlbedoTex);
			SAMPLER(sampler_SecondAlbedoTex);
			TEXTURE2D(_MainMaskTex);
			TEXTURE2D(_SecondMaskTex);
			float TVE_ColorsUsage[10];
			TEXTURE2D_ARRAY(TVE_ColorsTex);
			half4 TVE_ColorsCoords;
			half4 TVE_ColorsParams;
			half4 TVE_OverlayColor;
			float TVE_ExtrasUsage[10];
			TEXTURE2D_ARRAY(TVE_ExtrasTex);
			half4 TVE_ExtrasCoords;
			half4 TVE_ExtrasParams;
			TEXTURE2D(_MainNormalTex);
			TEXTURE2D(_SecondNormalTex);
			half TVE_WetnessContrast;


			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/PBR2DPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			float2 DecodeFloatToVector2( float enc )
			{
				float2 result ;
				result.y = enc % 2048;
				result.x = floor(enc / 2048);
				return result / (2048 - 1);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float3 VertexPosition3588_g76959 = v.vertex.xyz;
				float3 appendResult60_g76970 = (float3(v.ase_texcoord3.x , v.ase_texcoord3.z , v.ase_texcoord3.y));
				half3 Mesh_PivotsData2831_g76959 = ( appendResult60_g76970 * _VertexPivotMode );
				half3 Mesh_PivotsOS2291_g76959 = Mesh_PivotsData2831_g76959;
				float3 temp_output_2283_0_g76959 = ( VertexPosition3588_g76959 - Mesh_PivotsOS2291_g76959 );
				half3 VertexPos40_g77080 = temp_output_2283_0_g76959;
				half3 VertexPos40_g77081 = VertexPos40_g77080;
				float3 appendResult74_g77081 = (float3(VertexPos40_g77081.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g77081 = appendResult74_g77081;
				float3 break84_g77081 = VertexPos40_g77081;
				float3 appendResult81_g77081 = (float3(0.0 , break84_g77081.y , break84_g77081.z));
				half3 VertexPosOtherAxis82_g77081 = appendResult81_g77081;
				float3 ase_worldPos = TransformObjectToWorld( (v.vertex).xyz );
				float3 vertexToFrag3890_g76959 = ase_worldPos;
				float3 WorldPosition3905_g76959 = vertexToFrag3890_g76959;
				float3 WorldPosition_Shifted7477_g76959 = ( WorldPosition3905_g76959 - TVE_WorldOrigin );
				float4x4 break19_g77047 = GetObjectToWorldMatrix();
				float3 appendResult20_g77047 = (float3(break19_g77047[ 0 ][ 3 ] , break19_g77047[ 1 ][ 3 ] , break19_g77047[ 2 ][ 3 ]));
				float3 temp_output_122_0_g77047 = Mesh_PivotsData2831_g76959;
				float3 PivotsOnly105_g77047 = (mul( GetObjectToWorldMatrix(), float4( temp_output_122_0_g77047 , 0.0 ) ).xyz).xyz;
				half3 ObjectData20_g77049 = ( appendResult20_g77047 + PivotsOnly105_g77047 );
				half3 WorldData19_g77049 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g77049 = WorldData19_g77049;
				#else
				float3 staticSwitch14_g77049 = ObjectData20_g77049;
				#endif
				float3 temp_output_114_0_g77047 = staticSwitch14_g77049;
				float3 vertexToFrag4224_g76959 = temp_output_114_0_g77047;
				float3 ObjectPosition4223_g76959 = vertexToFrag4224_g76959;
				float3 ObjectPosition_Shifted7481_g76959 = ( ObjectPosition4223_g76959 - TVE_WorldOrigin );
				float3 lerpResult6766_g76959 = lerp( WorldPosition_Shifted7477_g76959 , ObjectPosition_Shifted7481_g76959 , _MotionPosition_10);
				float3 Motion_10_Position6738_g76959 = lerpResult6766_g76959;
				half3 Input_Position419_g77065 = Motion_10_Position6738_g76959;
				float Input_MotionScale287_g77065 = ( _MotionScale_10 + 0.2 );
				float2 temp_output_597_0_g77065 = (( Input_Position419_g77065 * Input_MotionScale287_g77065 * 0.0075 )).xz;
				float2 temp_output_447_0_g76964 = ((TVE_MotionParams).xy*2.0 + -1.0);
				half2 Global_Wind_DirectionWS4683_g76959 = temp_output_447_0_g76964;
				half2 Input_DirectionWS423_g77065 = Global_Wind_DirectionWS4683_g76959;
				float lerpResult115_g77066 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g77065 = _MotionSpeed_10;
				half Input_MotionVariation284_g77065 = _MotionVariation_10;
				half3 Input_Position167_g77037 = ObjectPosition_Shifted7481_g76959;
				float dotResult156_g77037 = dot( (Input_Position167_g77037).xz , float2( 12.9898,78.233 ) );
				half Vertex_DynamicMode5112_g76959 = _VertexDynamicMode;
				half Input_DynamicMode120_g77037 = Vertex_DynamicMode5112_g76959;
				float Postion_Random162_g77037 = ( sin( dotResult156_g77037 ) * ( 1.0 - Input_DynamicMode120_g77037 ) );
				float Mesh_Variation16_g76959 = v.ase_color.r;
				half Input_Variation124_g77037 = Mesh_Variation16_g76959;
				half ObjectData20_g77039 = frac( ( Postion_Random162_g77037 + Input_Variation124_g77037 ) );
				half WorldData19_g77039 = Input_Variation124_g77037;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g77039 = WorldData19_g77039;
				#else
				float staticSwitch14_g77039 = ObjectData20_g77039;
				#endif
				float clampResult17_g77041 = clamp( staticSwitch14_g77039 , 0.0001 , 0.9999 );
				float Global_MeshVariation5104_g76959 = clampResult17_g77041;
				half Input_GlobalMeshVariation569_g77065 = Global_MeshVariation5104_g76959;
				float temp_output_630_0_g77065 = ( ( ( lerpResult115_g77066 * Input_MotionSpeed62_g77065 ) + ( Input_MotionVariation284_g77065 * Input_GlobalMeshVariation569_g77065 ) ) * 0.03 );
				float temp_output_607_0_g77065 = frac( temp_output_630_0_g77065 );
				float4 lerpResult590_g77065 = lerp( SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g77065 + ( -Input_DirectionWS423_g77065 * temp_output_607_0_g77065 ) ), 0.0 ) , SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g77065 + ( -Input_DirectionWS423_g77065 * frac( ( temp_output_630_0_g77065 + 0.5 ) ) ) ), 0.0 ) , ( abs( ( temp_output_607_0_g77065 - 0.5 ) ) / 0.5 ));
				half4 Noise_Complex703_g77065 = lerpResult590_g77065;
				float2 temp_output_645_0_g77065 = ((Noise_Complex703_g77065).rg*2.0 + -1.0);
				float2 break650_g77065 = temp_output_645_0_g77065;
				float3 appendResult649_g77065 = (float3(break650_g77065.x , 0.0 , break650_g77065.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Global_Noise_OS5548_g76959 = (( mul( GetWorldToObjectMatrix(), float4( appendResult649_g77065 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Noise_DirectionOS487_g77073 = Global_Noise_OS5548_g76959;
				float2 break448_g76964 = temp_output_447_0_g76964;
				float3 appendResult452_g76964 = (float3(break448_g76964.x , 0.0 , break448_g76964.y));
				half2 Global_Wind_DirectionOS5692_g76959 = (( mul( GetWorldToObjectMatrix(), float4( appendResult452_g76964 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Wind_DirectionOS458_g77073 = Global_Wind_DirectionOS5692_g76959;
				float temp_output_84_0_g76973 = _LayerMotionValue;
				float temp_output_19_0_g76977 = TVE_MotionUsage[(int)temp_output_84_0_g76973];
				float4 temp_output_91_19_g76973 = TVE_MotionCoords;
				half2 UV94_g76973 = ( (temp_output_91_19_g76973).zw + ( (temp_output_91_19_g76973).xy * (ObjectPosition4223_g76959).xz ) );
				float4 tex2DArrayNode50_g76973 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_Linear_Clamp, UV94_g76973,temp_output_84_0_g76973, 0.0 );
				float4 temp_output_17_0_g76977 = tex2DArrayNode50_g76973;
				float4 temp_output_112_19_g76973 = TVE_MotionParams;
				float4 temp_output_3_0_g76977 = temp_output_112_19_g76973;
				float4 ifLocalVar18_g76977 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76977 >= 0.5 )
				ifLocalVar18_g76977 = temp_output_17_0_g76977;
				else
				ifLocalVar18_g76977 = temp_output_3_0_g76977;
				float4 lerpResult22_g76977 = lerp( temp_output_3_0_g76977 , temp_output_17_0_g76977 , temp_output_19_0_g76977);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76977 = lerpResult22_g76977;
				#else
				float4 staticSwitch24_g76977 = ifLocalVar18_g76977;
				#endif
				half4 Global_Motion_Params3909_g76959 = staticSwitch24_g76977;
				float4 break322_g76964 = Global_Motion_Params3909_g76959;
				half Global_Wind_Power2223_g76959 = break322_g76964.z;
				half Input_WindPower449_g77073 = Global_Wind_Power2223_g76959;
				float temp_output_565_0_g77073 = ( 1.0 - Input_WindPower449_g77073 );
				float2 lerpResult516_g77073 = lerp( Input_Noise_DirectionOS487_g77073 , Input_Wind_DirectionOS458_g77073 , ( ( 1.0 - ( temp_output_565_0_g77073 * temp_output_565_0_g77073 * temp_output_565_0_g77073 ) ) * 0.6 ));
				half Mesh_Height1524_g76959 = v.ase_color.a;
				half Input_MeshHeight388_g77073 = Mesh_Height1524_g76959;
				half ObjectData20_g77074 = Input_MeshHeight388_g77073;
				float enc62_g76967 = v.ase_texcoord.w;
				float2 localDecodeFloatToVector262_g76967 = DecodeFloatToVector2( enc62_g76967 );
				float2 break63_g76967 = ( localDecodeFloatToVector262_g76967 * 100.0 );
				float Bounds_Height5230_g76959 = break63_g76967.x;
				half Input_BoundsHeight390_g77073 = Bounds_Height5230_g76959;
				half WorldData19_g77074 = ( Input_MeshHeight388_g77073 * Input_MeshHeight388_g77073 * Input_BoundsHeight390_g77073 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g77074 = WorldData19_g77074;
				#else
				float staticSwitch14_g77074 = ObjectData20_g77074;
				#endif
				half Final_Motion10_Mask321_g77073 = ( staticSwitch14_g77074 * 2.0 );
				half Motion_10_Amplitude2258_g76959 = _MotionAmplitude_10;
				half Input_BendingAmplitude376_g77073 = Motion_10_Amplitude2258_g76959;
				half Global_MotionValue640_g77073 = TVE_MotionValue_10;
				half2 Final_Bending631_g77073 = ( lerpResult516_g77073 * ( Final_Motion10_Mask321_g77073 * Input_BendingAmplitude376_g77073 * Input_WindPower449_g77073 * Input_WindPower449_g77073 * Global_MotionValue640_g77073 ) );
				float2 appendResult433_g76964 = (float2(break322_g76964.x , break322_g76964.y));
				float2 temp_output_436_0_g76964 = (appendResult433_g76964*2.0 + -1.0);
				float2 break441_g76964 = temp_output_436_0_g76964;
				float3 appendResult440_g76964 = (float3(break441_g76964.x , 0.0 , break441_g76964.y));
				half2 Global_React_DirectionOS39_g76959 = (( mul( GetWorldToObjectMatrix(), float4( appendResult440_g76964 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_React_DirectionOS358_g77073 = Global_React_DirectionOS39_g76959;
				float clampResult17_g77076 = clamp( Input_MeshHeight388_g77073 , 0.0001 , 0.9999 );
				float temp_output_7_0_g77075 = 0.0;
				half Input_InteractionUseMask62_g77073 = _InteractionMaskValue;
				float temp_output_10_0_g77075 = ( Input_InteractionUseMask62_g77073 - temp_output_7_0_g77075 );
				half Final_InteractionRemap594_g77073 = saturate( ( ( clampResult17_g77076 - temp_output_7_0_g77075 ) / ( temp_output_10_0_g77075 + 0.0001 ) ) );
				half ObjectData20_g77077 = Final_InteractionRemap594_g77073;
				half WorldData19_g77077 = ( Final_InteractionRemap594_g77073 * Final_InteractionRemap594_g77073 * Input_BoundsHeight390_g77073 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g77077 = WorldData19_g77077;
				#else
				float staticSwitch14_g77077 = ObjectData20_g77077;
				#endif
				half Final_InteractionMask373_g77073 = ( staticSwitch14_g77077 * 2.0 );
				half Interaction_Amplitude7501_g76959 = _InteractionAmplitude;
				half Input_InteractionAmplitude58_g77073 = Interaction_Amplitude7501_g76959;
				half2 Final_Interaction632_g77073 = ( Input_React_DirectionOS358_g77073 * Final_InteractionMask373_g77073 * Input_InteractionAmplitude58_g77073 );
				half Global_Interaction_Mask66_g76959 = ( break322_g76964.w * break322_g76964.w * break322_g76964.w * break322_g76964.w );
				float Input_InteractionGlobalMask330_g77073 = Global_Interaction_Mask66_g76959;
				half Final_InteractionValue525_g77073 = saturate( ( Input_InteractionAmplitude58_g77073 * Input_InteractionGlobalMask330_g77073 ) );
				float2 lerpResult551_g77073 = lerp( Final_Bending631_g77073 , Final_Interaction632_g77073 , Final_InteractionValue525_g77073);
				float2 break364_g77073 = lerpResult551_g77073;
				float3 appendResult638_g77073 = (float3(break364_g77073.x , 0.0 , break364_g77073.y));
				half3 Motion_10_Interaction7519_g76959 = appendResult638_g77073;
				half3 Angle44_g77080 = Motion_10_Interaction7519_g76959;
				half Angle44_g77081 = (Angle44_g77080).z;
				half3 VertexPos40_g77082 = ( VertexPosRotationAxis50_g77081 + ( VertexPosOtherAxis82_g77081 * cos( Angle44_g77081 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g77081 ) * sin( Angle44_g77081 ) ) );
				float3 appendResult74_g77082 = (float3(0.0 , 0.0 , VertexPos40_g77082.z));
				half3 VertexPosRotationAxis50_g77082 = appendResult74_g77082;
				float3 break84_g77082 = VertexPos40_g77082;
				float3 appendResult81_g77082 = (float3(break84_g77082.x , break84_g77082.y , 0.0));
				half3 VertexPosOtherAxis82_g77082 = appendResult81_g77082;
				half Angle44_g77082 = -(Angle44_g77080).x;
				half3 Input_Position419_g77078 = WorldPosition_Shifted7477_g76959;
				float3 break459_g77078 = Input_Position419_g77078;
				float Sum_Position446_g77078 = ( break459_g77078.x + break459_g77078.y + break459_g77078.z );
				half Input_MotionScale321_g77078 = ( _MotionScale_20 * 0.1 );
				half Input_MotionVariation330_g77078 = _MotionVariation_20;
				half Input_GlobalVariation400_g77078 = Global_MeshVariation5104_g76959;
				float lerpResult115_g77079 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g77078 = _MotionSpeed_20;
				float temp_output_404_0_g77078 = ( lerpResult115_g77079 * Input_MotionSpeed62_g77078 );
				half Motion_SineA450_g77078 = sin( ( ( Sum_Position446_g77078 * Input_MotionScale321_g77078 ) + ( Input_MotionVariation330_g77078 * Input_GlobalVariation400_g77078 ) + temp_output_404_0_g77078 ) );
				half Motion_SineB395_g77078 = sin( ( ( temp_output_404_0_g77078 * 0.6842 ) + ( Sum_Position446_g77078 * Input_MotionScale321_g77078 ) ) );
				half3 Input_Position419_g76971 = VertexPosition3588_g76959;
				float3 normalizeResult518_g76971 = normalize( Input_Position419_g76971 );
				half2 Input_DirectionOS423_g76971 = Global_React_DirectionOS39_g76959;
				float2 break521_g76971 = -Input_DirectionOS423_g76971;
				float3 appendResult522_g76971 = (float3(break521_g76971.x , 0.0 , break521_g76971.y));
				float dotResult519_g76971 = dot( normalizeResult518_g76971 , appendResult522_g76971 );
				half Input_Value62_g76971 = _MotionFacingValue;
				float lerpResult524_g76971 = lerp( 1.0 , (dotResult519_g76971*0.5 + 0.5) , Input_Value62_g76971);
				half ObjectData20_g76972 = max( lerpResult524_g76971 , 0.001 );
				half WorldData19_g76972 = 1.0;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76972 = WorldData19_g76972;
				#else
				float staticSwitch14_g76972 = ObjectData20_g76972;
				#endif
				half Motion_FacingMask5214_g76959 = staticSwitch14_g76972;
				half Motion_20_Amplitude4381_g76959 = ( _MotionValue_20 * Motion_FacingMask5214_g76959 );
				half Input_MotionAmplitude384_g77078 = Motion_20_Amplitude4381_g76959;
				half Input_GlobalWind407_g77078 = Global_Wind_Power2223_g76959;
				float4 break638_g77065 = abs( Noise_Complex703_g77065 );
				half Global_Noise_B5526_g76959 = break638_g77065.b;
				half Input_GlobalNoise411_g77078 = Global_Noise_B5526_g76959;
				float lerpResult413_g77078 = lerp( 1.6 , 0.4 , Input_GlobalWind407_g77078);
				half Motion_Amplitude418_g77078 = ( Input_MotionAmplitude384_g77078 * Input_GlobalWind407_g77078 * pow( Input_GlobalNoise411_g77078 , lerpResult413_g77078 ) );
				half Input_Squash58_g77078 = _MotionAmplitude_20;
				float enc59_g76967 = v.ase_texcoord.z;
				float2 localDecodeFloatToVector259_g76967 = DecodeFloatToVector2( enc59_g76967 );
				float2 break61_g76967 = localDecodeFloatToVector259_g76967;
				half Mesh_Motion_2060_g76959 = break61_g76967.x;
				half Input_MeshMotion_20388_g77078 = Mesh_Motion_2060_g76959;
				float Bounds_Radius5231_g76959 = break63_g76967.y;
				half Input_BoundsRadius390_g77078 = Bounds_Radius5231_g76959;
				half Global_MotionValue462_g77078 = TVE_MotionValue_20;
				half2 Input_DirectionOS366_g77078 = Global_React_DirectionOS39_g76959;
				float2 break371_g77078 = Input_DirectionOS366_g77078;
				float3 appendResult372_g77078 = (float3(break371_g77078.x , ( Motion_SineA450_g77078 * 0.3 ) , break371_g77078.y));
				half3 Motion_20_Squash4418_g76959 = ( ( (max( Motion_SineA450_g77078 , Motion_SineB395_g77078 )*0.5 + 0.5) * Motion_Amplitude418_g77078 * Input_Squash58_g77078 * Input_MeshMotion_20388_g77078 * Input_BoundsRadius390_g77078 * Global_MotionValue462_g77078 ) * appendResult372_g77078 );
				half3 VertexPos40_g77057 = ( ( VertexPosRotationAxis50_g77082 + ( VertexPosOtherAxis82_g77082 * cos( Angle44_g77082 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g77082 ) * sin( Angle44_g77082 ) ) ) + Motion_20_Squash4418_g76959 );
				float3 appendResult74_g77057 = (float3(0.0 , VertexPos40_g77057.y , 0.0));
				float3 VertexPosRotationAxis50_g77057 = appendResult74_g77057;
				float3 break84_g77057 = VertexPos40_g77057;
				float3 appendResult81_g77057 = (float3(break84_g77057.x , 0.0 , break84_g77057.z));
				float3 VertexPosOtherAxis82_g77057 = appendResult81_g77057;
				half Input_Rolling379_g77078 = _MotionAmplitude_22;
				half Motion_20_Rolling5257_g76959 = ( Motion_SineA450_g77078 * Motion_Amplitude418_g77078 * Input_Rolling379_g77078 * Input_MeshMotion_20388_g77078 * Global_MotionValue462_g77078 );
				half Angle44_g77057 = Motion_20_Rolling5257_g76959;
				half3 Input_Position500_g77069 = WorldPosition_Shifted7477_g76959;
				half Input_MotionScale321_g77069 = _MotionScale_32;
				half Input_MotionVariation330_g77069 = _MotionVariation_32;
				half Input_GlobalVariation372_g77069 = Global_MeshVariation5104_g76959;
				float lerpResult115_g77072 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g77069 = _MotionSpeed_32;
				float4 tex2DNode460_g77069 = SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( ( (Input_Position500_g77069).xz * Input_MotionScale321_g77069 * 0.03 ) + ( Input_MotionVariation330_g77069 * Input_GlobalVariation372_g77069 ) + ( lerpResult115_g77072 * Input_MotionSpeed62_g77069 * 0.02 ) ), 0.0 );
				float3 appendResult462_g77069 = (float3(tex2DNode460_g77069.r , tex2DNode460_g77069.g , tex2DNode460_g77069.b));
				half3 Flutter_Texture489_g77069 = (appendResult462_g77069*2.0 + -1.0);
				float temp_output_7_0_g77027 = TVE_MotionFadeEnd;
				float temp_output_10_0_g77027 = ( TVE_MotionFadeStart - temp_output_7_0_g77027 );
				half Motion_FadeOut4005_g76959 = saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g77027 ) / ( temp_output_10_0_g77027 + 0.0001 ) ) );
				half Motion_30_Amplitude4960_g76959 = ( _MotionValue_30 * _MotionAmplitude_32 * Motion_FacingMask5214_g76959 * Motion_FadeOut4005_g76959 );
				half Input_MotionAmplitude58_g77069 = Motion_30_Amplitude4960_g76959;
				half Mesh_Motion_30144_g76959 = break61_g76967.y;
				half Input_MeshMotion_30374_g77069 = Mesh_Motion_30144_g76959;
				half Input_GlobalWind471_g77069 = Global_Wind_Power2223_g76959;
				half Global_MotionValue503_g77069 = TVE_MotionValue_30;
				half Input_GlobalNoise472_g77069 = Global_Noise_B5526_g76959;
				float lerpResult466_g77069 = lerp( 2.0 , 0.6 , Input_GlobalWind471_g77069);
				half Flutter_Amplitude491_g77069 = ( Input_MotionAmplitude58_g77069 * Input_MeshMotion_30374_g77069 * Input_GlobalWind471_g77069 * Global_MotionValue503_g77069 * pow( Input_GlobalNoise472_g77069 , lerpResult466_g77069 ) );
				half3 Motion_30_Flutter263_g76959 = ( Flutter_Texture489_g77069 * Flutter_Amplitude491_g77069 );
				float3 Vertex_Motion_Object833_g76959 = ( ( VertexPosRotationAxis50_g77057 + ( VertexPosOtherAxis82_g77057 * cos( Angle44_g77057 ) ) + ( cross( float3(0,1,0) , VertexPosOtherAxis82_g77057 ) * sin( Angle44_g77057 ) ) ) + Motion_30_Flutter263_g76959 );
				half3 ObjectData20_g77062 = Vertex_Motion_Object833_g76959;
				float3 temp_output_3474_0_g76959 = ( VertexPosition3588_g76959 - Mesh_PivotsOS2291_g76959 );
				float3 Vertex_Motion_World1118_g76959 = ( ( ( temp_output_3474_0_g76959 + Motion_10_Interaction7519_g76959 ) + Motion_20_Squash4418_g76959 ) + Motion_30_Flutter263_g76959 );
				half3 WorldData19_g77062 = Vertex_Motion_World1118_g76959;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g77062 = WorldData19_g77062;
				#else
				float3 staticSwitch14_g77062 = ObjectData20_g77062;
				#endif
				float3 temp_output_7495_0_g76959 = staticSwitch14_g77062;
				float3 Vertex_Motion7493_g76959 = temp_output_7495_0_g76959;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 normalizeResult2169_g76959 = normalize( ase_worldViewDir );
				float3 ViewDirection3963_g76959 = normalizeResult2169_g76959;
				float3 break2709_g76959 = cross( ViewDirection3963_g76959 , half3(0,1,0) );
				float3 appendResult2710_g76959 = (float3(-break2709_g76959.z , 0.0 , break2709_g76959.x));
				float3 appendResult2667_g76959 = (float3(Global_MeshVariation5104_g76959 , 0.5 , Global_MeshVariation5104_g76959));
				float dotResult2212_g76959 = dot( ViewDirection3963_g76959 , float3(0,1,0) );
				half Mask_HView2656_g76959 = dotResult2212_g76959;
				float saferPower2652_g76959 = abs( Mask_HView2656_g76959 );
				half3 Grass_Perspective2661_g76959 = ( ( ( mul( GetWorldToObjectMatrix(), float4( appendResult2710_g76959 , 0.0 ) ).xyz * _PerspectivePushValue ) + ( (appendResult2667_g76959*2.0 + -1.0) * _PerspectiveNoiseValue ) ) * Mesh_Height1524_g76959 * pow( saferPower2652_g76959 , _PerspectiveAngleValue ) );
				float temp_output_84_0_g76999 = _LayerVertexValue;
				float temp_output_19_0_g77003 = TVE_VertexUsage[(int)temp_output_84_0_g76999];
				float4 temp_output_94_19_g76999 = TVE_VertexCoords;
				half2 UV97_g76999 = ( (temp_output_94_19_g76999).zw + ( (temp_output_94_19_g76999).xy * (ObjectPosition4223_g76959).xz ) );
				float4 tex2DArrayNode50_g76999 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_VertexTex, sampler_Linear_Clamp, UV97_g76999,temp_output_84_0_g76999, 0.0 );
				float4 temp_output_17_0_g77003 = tex2DArrayNode50_g76999;
				float4 temp_output_111_19_g76999 = TVE_VertexParams;
				float4 temp_output_3_0_g77003 = temp_output_111_19_g76999;
				float4 ifLocalVar18_g77003 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g77003 >= 0.5 )
				ifLocalVar18_g77003 = temp_output_17_0_g77003;
				else
				ifLocalVar18_g77003 = temp_output_3_0_g77003;
				float4 lerpResult22_g77003 = lerp( temp_output_3_0_g77003 , temp_output_17_0_g77003 , temp_output_19_0_g77003);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g77003 = lerpResult22_g77003;
				#else
				float4 staticSwitch24_g77003 = ifLocalVar18_g77003;
				#endif
				half4 Global_Vertex_Params4173_g76959 = staticSwitch24_g77003;
				float4 break322_g77004 = Global_Vertex_Params4173_g76959;
				half Global_VertexSize174_g76959 = saturate( break322_g77004.w );
				float lerpResult346_g76959 = lerp( 1.0 , Global_VertexSize174_g76959 , _GlobalSize);
				float3 appendResult3480_g76959 = (float3(lerpResult346_g76959 , lerpResult346_g76959 , lerpResult346_g76959));
				half3 ObjectData20_g77059 = appendResult3480_g76959;
				half3 _Vector11 = half3(1,1,1);
				half3 WorldData19_g77059 = _Vector11;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g77059 = WorldData19_g77059;
				#else
				float3 staticSwitch14_g77059 = ObjectData20_g77059;
				#endif
				half3 Vertex_Size1741_g76959 = staticSwitch14_g77059;
				float temp_output_7_0_g77060 = _SizeFadeEndValue;
				float temp_output_10_0_g77060 = ( _SizeFadeStartValue - temp_output_7_0_g77060 );
				float temp_output_7453_0_g76959 = saturate( ( ( ( distance( _WorldSpaceCameraPos , ObjectPosition4223_g76959 ) * ( 1.0 / TVE_DistanceFadeBias ) ) - temp_output_7_0_g77060 ) / ( temp_output_10_0_g77060 + 0.0001 ) ) );
				float3 appendResult3482_g76959 = (float3(temp_output_7453_0_g76959 , temp_output_7453_0_g76959 , temp_output_7453_0_g76959));
				half3 ObjectData20_g77058 = appendResult3482_g76959;
				half3 _Vector5 = half3(1,1,1);
				half3 WorldData19_g77058 = _Vector5;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g77058 = WorldData19_g77058;
				#else
				float3 staticSwitch14_g77058 = ObjectData20_g77058;
				#endif
				float3 Vertex_SizeFade1740_g76959 = staticSwitch14_g77058;
				float3 lerpResult16_g77063 = lerp( VertexPosition3588_g76959 , ( ( ( Vertex_Motion7493_g76959 + Grass_Perspective2661_g76959 ) * Vertex_Size1741_g76959 * Vertex_SizeFade1740_g76959 ) + Mesh_PivotsOS2291_g76959 ) , TVE_IsEnabled);
				float3 temp_output_4912_0_g76959 = lerpResult16_g77063;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch4976_g76959 = temp_output_4912_0_g76959;
				#else
				float3 staticSwitch4976_g76959 = temp_output_4912_0_g76959;
				#endif
				float3 temp_output_4918_0_g76959 = ( staticSwitch4976_g76959 + ( _VertexDataMode * 0.0 ) );
				float3 Final_VertexPosition890_g76959 = ( temp_output_4918_0_g76959 + _DisableSRPBatcher );
				
				float4 break33_g76991 = _second_uvs_mode;
				float2 temp_output_30_0_g76991 = ( v.ase_texcoord.xy * break33_g76991.x );
				float2 appendResult21_g76967 = (float2(v.ase_texcoord1.z , v.ase_texcoord1.w));
				float2 Mesh_DetailCoord3_g76959 = appendResult21_g76967;
				float2 temp_output_29_0_g76991 = ( Mesh_DetailCoord3_g76959 * break33_g76991.y );
				float2 temp_output_31_0_g76991 = ( (WorldPosition_Shifted7477_g76959).xz * break33_g76991.z );
				float2 vertexToFrag11_g76990 = ( ( ( temp_output_30_0_g76991 + temp_output_29_0_g76991 + temp_output_31_0_g76991 ) * (_SecondUVs).xy ) + (_SecondUVs).zw );
				o.ase_texcoord3.xy = vertexToFrag11_g76990;
				half Mesh_DetailMask90_g76959 = v.ase_color.b;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				half3 WorldNormal4101_g76959 = normalizedWorldNormal;
				float lerpResult5730_g76959 = lerp( (WorldNormal4101_g76959).y , v.ase_normal.y , Vertex_DynamicMode5112_g76959);
				half WorldNormal_Y6811_g76959 = lerpResult5730_g76959;
				float lerpResult6884_g76959 = lerp( Mesh_DetailMask90_g76959 , (WorldNormal_Y6811_g76959*0.5 + 0.5) , _DetailMeshMode);
				float lerpResult7357_g76959 = lerp( lerpResult6884_g76959 , ( 1.0 - lerpResult6884_g76959 ) , _DetailMeshInvertMode);
				float lerpResult7546_g76959 = lerp( 1.0 , lerpResult7357_g76959 , _DetailMeshValue);
				float vertexToFrag11_g77083 = lerpResult7546_g76959;
				o.ase_texcoord3.z = vertexToFrag11_g77083;
				o.ase_texcoord4.xyz = vertexToFrag3890_g76959;
				o.ase_texcoord5.xyz = vertexToFrag4224_g76959;
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord6.xyz = ase_worldTangent;
				o.ase_texcoord7.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord8.xyz = ase_worldBitangent;
				half Global_Noise_A4860_g76959 = break638_g77065.a;
				half Tint_Highlight_Value3231_g76959 = ( Global_Noise_A4860_g76959 * Global_Wind_Power2223_g76959 * Motion_FadeOut4005_g76959 * Mesh_Height1524_g76959 );
				float vertexToFrag11_g77009 = Tint_Highlight_Value3231_g76959;
				o.ase_texcoord3.w = vertexToFrag11_g77009;
				
				o.ase_texcoord2 = v.ase_texcoord;
				o.ase_color = v.ase_color;
				o.ase_normal = v.ase_normal;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord4.w = 0;
				o.ase_texcoord5.w = 0;
				o.ase_texcoord6.w = 0;
				o.ase_texcoord7.w = 0;
				o.ase_texcoord8.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = Final_VertexPosition890_g76959;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float4 positionCS = TransformWorldToHClip( positionWS );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.worldPos = positionWS;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.clipPos = positionCS;

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_tangent : TANGENT;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord1 = v.ase_texcoord1;
				o.ase_tangent = v.ase_tangent;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN  ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 WorldPosition = IN.worldPos;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				half2 Main_UVs15_g76959 = ( ( IN.ase_texcoord2.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g76959 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g76959 );
				float3 lerpResult6223_g76959 = lerp( float3( 1,1,1 ) , (tex2DNode29_g76959).rgb , _MainAlbedoValue);
				half3 Main_Albedo99_g76959 = ( (_MainColor).rgb * lerpResult6223_g76959 );
				float2 vertexToFrag11_g76990 = IN.ase_texcoord3.xy;
				half2 Second_UVs17_g76959 = vertexToFrag11_g76990;
				float4 tex2DNode89_g76959 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, Second_UVs17_g76959 );
				float3 lerpResult6225_g76959 = lerp( float3( 1,1,1 ) , (tex2DNode89_g76959).rgb , _SecondAlbedoValue);
				half3 Second_Albedo153_g76959 = ( (_SecondColor).rgb * lerpResult6225_g76959 );
				#ifdef UNITY_COLORSPACE_GAMMA
				float staticSwitch1_g77010 = 2.0;
				#else
				float staticSwitch1_g77010 = 4.594794;
				#endif
				float3 lerpResult4834_g76959 = lerp( ( Main_Albedo99_g76959 * Second_Albedo153_g76959 * staticSwitch1_g77010 ) , Second_Albedo153_g76959 , _DetailBlendMode);
				float4 tex2DNode35_g76959 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_Linear_Repeat, Main_UVs15_g76959 );
				half Main_Mask57_g76959 = tex2DNode35_g76959.b;
				float4 tex2DNode33_g76959 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_Linear_Repeat, Second_UVs17_g76959 );
				half Second_Mask81_g76959 = tex2DNode33_g76959.b;
				float lerpResult6885_g76959 = lerp( Main_Mask57_g76959 , Second_Mask81_g76959 , _DetailMaskMode);
				float lerpResult7354_g76959 = lerp( lerpResult6885_g76959 , ( 1.0 - lerpResult6885_g76959 ) , _DetailMaskInvertMode);
				float lerpResult7547_g76959 = lerp( 1.0 , lerpResult7354_g76959 , _DetailMaskIntensity);
				half Blend_Mask_Texture6794_g76959 = lerpResult7547_g76959;
				float vertexToFrag11_g77083 = IN.ase_texcoord3.z;
				half Blend_Mask_Mesh1540_g76959 = vertexToFrag11_g77083;
				float clampResult17_g77023 = clamp( ( Blend_Mask_Texture6794_g76959 * Blend_Mask_Mesh1540_g76959 ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g77032 = _DetailBlendMinValue;
				float temp_output_10_0_g77032 = ( _DetailBlendMaxValue - temp_output_7_0_g77032 );
				half Blend_Mask147_g76959 = ( saturate( ( ( clampResult17_g77023 - temp_output_7_0_g77032 ) / ( temp_output_10_0_g77032 + 0.0001 ) ) ) * _DetailMode );
				float3 lerpResult235_g76959 = lerp( Main_Albedo99_g76959 , lerpResult4834_g76959 , Blend_Mask147_g76959);
				#ifdef TVE_FEATURE_DETAIL
				float3 staticSwitch255_g76959 = lerpResult235_g76959;
				#else
				float3 staticSwitch255_g76959 = Main_Albedo99_g76959;
				#endif
				half3 Blend_Albedo265_g76959 = staticSwitch255_g76959;
				half Mesh_Height1524_g76959 = IN.ase_color.a;
				float temp_output_7_0_g77030 = _GradientMinValue;
				float temp_output_10_0_g77030 = ( _GradientMaxValue - temp_output_7_0_g77030 );
				half Tint_Gradient_Value2784_g76959 = saturate( ( ( Mesh_Height1524_g76959 - temp_output_7_0_g77030 ) / ( temp_output_10_0_g77030 + 0.0001 ) ) );
				float3 lerpResult2779_g76959 = lerp( (_GradientColorTwo).rgb , (_GradientColorOne).rgb , Tint_Gradient_Value2784_g76959);
				float clampResult17_g77025 = clamp( Main_Mask57_g76959 , 0.0001 , 0.9999 );
				float temp_output_7_0_g77028 = _MainMaskMinValue;
				float temp_output_10_0_g77028 = ( _MainMaskMaxValue - temp_output_7_0_g77028 );
				half Main_Mask_Remap5765_g76959 = saturate( ( ( clampResult17_g77025 - temp_output_7_0_g77028 ) / ( temp_output_10_0_g77028 + 0.0001 ) ) );
				float clampResult17_g77024 = clamp( Second_Mask81_g76959 , 0.0001 , 0.9999 );
				float temp_output_7_0_g77029 = _SecondMaskMinValue;
				float temp_output_10_0_g77029 = ( _SecondMaskMaxValue - temp_output_7_0_g77029 );
				half Second_Mask_Remap6130_g76959 = saturate( ( ( clampResult17_g77024 - temp_output_7_0_g77029 ) / ( temp_output_10_0_g77029 + 0.0001 ) ) );
				float lerpResult6617_g76959 = lerp( Main_Mask_Remap5765_g76959 , Second_Mask_Remap6130_g76959 , Blend_Mask147_g76959);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6623_g76959 = lerpResult6617_g76959;
				#else
				float staticSwitch6623_g76959 = Main_Mask_Remap5765_g76959;
				#endif
				half Blend_Mask_Remap6621_g76959 = staticSwitch6623_g76959;
				half Tint_Gradient_Mask6207_g76959 = Blend_Mask_Remap6621_g76959;
				float3 lerpResult6208_g76959 = lerp( float3( 1,1,1 ) , lerpResult2779_g76959 , Tint_Gradient_Mask6207_g76959);
				half3 Tint_Gradient_Color5769_g76959 = lerpResult6208_g76959;
				half3 Tint_Noise_Color5770_g76959 = float3(1,1,1);
				half3 Tint_User_Color7335_g76959 = float3(1,1,1);
				float Mesh_Occlusion318_g76959 = IN.ase_color.g;
				float clampResult17_g77022 = clamp( Mesh_Occlusion318_g76959 , 0.0001 , 0.9999 );
				float temp_output_7_0_g77035 = _VertexOcclusionMinValue;
				float temp_output_10_0_g77035 = ( _VertexOcclusionMaxValue - temp_output_7_0_g77035 );
				half Occlusion_Mask6432_g76959 = saturate( ( ( clampResult17_g77022 - temp_output_7_0_g77035 ) / ( temp_output_10_0_g77035 + 0.0001 ) ) );
				float3 lerpResult2945_g76959 = lerp( (_VertexOcclusionColor).rgb , float3( 1,1,1 ) , Occlusion_Mask6432_g76959);
				half3 Occlusion_Color648_g76959 = lerpResult2945_g76959;
				half3 Matcap_Color7428_g76959 = half3(0,0,0);
				half3 Blend_Albedo_Tinted2808_g76959 = ( ( Blend_Albedo265_g76959 * Tint_Gradient_Color5769_g76959 * Tint_Noise_Color5770_g76959 * Tint_User_Color7335_g76959 * Occlusion_Color648_g76959 ) + Matcap_Color7428_g76959 );
				float3 temp_output_3_0_g77020 = Blend_Albedo_Tinted2808_g76959;
				float dotResult20_g77020 = dot( temp_output_3_0_g77020 , float3(0.2126,0.7152,0.0722) );
				half Blend_Albedo_Grayscale5939_g76959 = dotResult20_g77020;
				float3 temp_cast_0 = (Blend_Albedo_Grayscale5939_g76959).xxx;
				float temp_output_82_0_g76983 = _LayerColorsValue;
				float temp_output_19_0_g76987 = TVE_ColorsUsage[(int)temp_output_82_0_g76983];
				float4 temp_output_91_19_g76983 = TVE_ColorsCoords;
				float3 vertexToFrag3890_g76959 = IN.ase_texcoord4.xyz;
				float3 WorldPosition3905_g76959 = vertexToFrag3890_g76959;
				float3 vertexToFrag4224_g76959 = IN.ase_texcoord5.xyz;
				float3 ObjectPosition4223_g76959 = vertexToFrag4224_g76959;
				float3 lerpResult4822_g76959 = lerp( WorldPosition3905_g76959 , ObjectPosition4223_g76959 , _ColorsPositionMode);
				half2 UV94_g76983 = ( (temp_output_91_19_g76983).zw + ( (temp_output_91_19_g76983).xy * (lerpResult4822_g76959).xz ) );
				float4 tex2DArrayNode83_g76983 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ColorsTex, sampler_Linear_Clamp, UV94_g76983,temp_output_82_0_g76983, 0.0 );
				float4 temp_output_17_0_g76987 = tex2DArrayNode83_g76983;
				float4 temp_output_92_86_g76983 = TVE_ColorsParams;
				float4 temp_output_3_0_g76987 = temp_output_92_86_g76983;
				float4 ifLocalVar18_g76987 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76987 >= 0.5 )
				ifLocalVar18_g76987 = temp_output_17_0_g76987;
				else
				ifLocalVar18_g76987 = temp_output_3_0_g76987;
				float4 lerpResult22_g76987 = lerp( temp_output_3_0_g76987 , temp_output_17_0_g76987 , temp_output_19_0_g76987);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76987 = lerpResult22_g76987;
				#else
				float4 staticSwitch24_g76987 = ifLocalVar18_g76987;
				#endif
				half4 Global_Colors_Params5434_g76959 = staticSwitch24_g76987;
				float4 temp_output_346_0_g76966 = Global_Colors_Params5434_g76959;
				half Global_Colors_A1701_g76959 = saturate( (temp_output_346_0_g76966).w );
				half Colors_Influence3668_g76959 = Global_Colors_A1701_g76959;
				float temp_output_6306_0_g76959 = ( 1.0 - Colors_Influence3668_g76959 );
				float3 lerpResult3618_g76959 = lerp( Blend_Albedo_Tinted2808_g76959 , temp_cast_0 , ( 1.0 - ( temp_output_6306_0_g76959 * temp_output_6306_0_g76959 ) ));
				half3 Global_Colors_RGB1700_g76959 = (temp_output_346_0_g76966).xyz;
				#ifdef UNITY_COLORSPACE_GAMMA
				float staticSwitch1_g77006 = 2.0;
				#else
				float staticSwitch1_g77006 = 4.594794;
				#endif
				half3 Colors_RGB1954_g76959 = ( Global_Colors_RGB1700_g76959 * staticSwitch1_g77006 );
				half Colors_Value3692_g76959 = ( Blend_Mask_Remap6621_g76959 * _GlobalColors );
				float3 ObjectPosition_Shifted7481_g76959 = ( ObjectPosition4223_g76959 - TVE_WorldOrigin );
				half3 Input_Position167_g77037 = ObjectPosition_Shifted7481_g76959;
				float dotResult156_g77037 = dot( (Input_Position167_g77037).xz , float2( 12.9898,78.233 ) );
				half Vertex_DynamicMode5112_g76959 = _VertexDynamicMode;
				half Input_DynamicMode120_g77037 = Vertex_DynamicMode5112_g76959;
				float Postion_Random162_g77037 = ( sin( dotResult156_g77037 ) * ( 1.0 - Input_DynamicMode120_g77037 ) );
				float Mesh_Variation16_g76959 = IN.ase_color.r;
				half Input_Variation124_g77037 = Mesh_Variation16_g76959;
				half ObjectData20_g77039 = frac( ( Postion_Random162_g77037 + Input_Variation124_g77037 ) );
				half WorldData19_g77039 = Input_Variation124_g77037;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g77039 = WorldData19_g77039;
				#else
				float staticSwitch14_g77039 = ObjectData20_g77039;
				#endif
				float clampResult17_g77041 = clamp( staticSwitch14_g77039 , 0.0001 , 0.9999 );
				float Global_MeshVariation5104_g76959 = clampResult17_g77041;
				float lerpResult3870_g76959 = lerp( 1.0 , Global_MeshVariation5104_g76959 , _ColorsVariationValue);
				half Colors_Variation3650_g76959 = lerpResult3870_g76959;
				half Occlusion_Alpha6463_g76959 = _VertexOcclusionColor.a;
				float lerpResult6459_g76959 = lerp( Occlusion_Mask6432_g76959 , ( 1.0 - Occlusion_Mask6432_g76959 ) , _ColorsMaskMode);
				float lerpResult6461_g76959 = lerp( Occlusion_Alpha6463_g76959 , 1.0 , lerpResult6459_g76959);
				half Occlusion_Colors6450_g76959 = lerpResult6461_g76959;
				float3 temp_output_3_0_g77021 = ( Blend_Albedo265_g76959 * Tint_Gradient_Color5769_g76959 * Tint_Noise_Color5770_g76959 * Tint_User_Color7335_g76959 );
				float dotResult20_g77021 = dot( temp_output_3_0_g77021 , float3(0.2126,0.7152,0.0722) );
				float clampResult6740_g76959 = clamp( saturate( ( dotResult20_g77021 * 5.0 ) ) , 0.2 , 1.0 );
				half Blend_Albedo_Globals6410_g76959 = clampResult6740_g76959;
				float temp_output_7_0_g77033 = 0.1;
				float temp_output_10_0_g77033 = ( 0.2 - temp_output_7_0_g77033 );
				float lerpResult16_g77007 = lerp( 0.0 , saturate( ( ( ( Colors_Value3692_g76959 * Colors_Influence3668_g76959 * Colors_Variation3650_g76959 * Occlusion_Colors6450_g76959 * Blend_Albedo_Globals6410_g76959 ) - temp_output_7_0_g77033 ) / ( temp_output_10_0_g77033 + 0.0001 ) ) ) , TVE_IsEnabled);
				float3 lerpResult3628_g76959 = lerp( Blend_Albedo_Tinted2808_g76959 , ( lerpResult3618_g76959 * Colors_RGB1954_g76959 ) , lerpResult16_g77007);
				half3 Blend_Albedo_Colored_High6027_g76959 = lerpResult3628_g76959;
				half3 Blend_Albedo_Colored863_g76959 = Blend_Albedo_Colored_High6027_g76959;
				half3 Global_OverlayColor1758_g76959 = (TVE_OverlayColor).rgb;
				float temp_output_84_0_g76978 = _LayerExtrasValue;
				float temp_output_19_0_g76982 = TVE_ExtrasUsage[(int)temp_output_84_0_g76978];
				float4 temp_output_93_19_g76978 = TVE_ExtrasCoords;
				float3 lerpResult4827_g76959 = lerp( WorldPosition3905_g76959 , ObjectPosition4223_g76959 , _ExtrasPositionMode);
				half2 UV96_g76978 = ( (temp_output_93_19_g76978).zw + ( (temp_output_93_19_g76978).xy * (lerpResult4827_g76959).xz ) );
				float4 tex2DArrayNode48_g76978 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ExtrasTex, sampler_Linear_Clamp, UV96_g76978,temp_output_84_0_g76978, 0.0 );
				float4 temp_output_17_0_g76982 = tex2DArrayNode48_g76978;
				float4 temp_output_94_85_g76978 = TVE_ExtrasParams;
				float4 temp_output_3_0_g76982 = temp_output_94_85_g76978;
				float4 ifLocalVar18_g76982 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76982 >= 0.5 )
				ifLocalVar18_g76982 = temp_output_17_0_g76982;
				else
				ifLocalVar18_g76982 = temp_output_3_0_g76982;
				float4 lerpResult22_g76982 = lerp( temp_output_3_0_g76982 , temp_output_17_0_g76982 , temp_output_19_0_g76982);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76982 = lerpResult22_g76982;
				#else
				float4 staticSwitch24_g76982 = ifLocalVar18_g76982;
				#endif
				half4 Global_Extras_Params5440_g76959 = staticSwitch24_g76982;
				float4 break456_g76996 = Global_Extras_Params5440_g76959;
				half Global_Extras_Overlay156_g76959 = break456_g76996.z;
				float lerpResult1065_g76959 = lerp( 1.0 , Global_MeshVariation5104_g76959 , _OverlayVariationValue);
				half Overlay_Variation4560_g76959 = lerpResult1065_g76959;
				half Overlay_Value5738_g76959 = ( _GlobalOverlay * Global_Extras_Overlay156_g76959 * Overlay_Variation4560_g76959 );
				half4 Normal_Packed45_g76988 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_Linear_Repeat, Main_UVs15_g76959 );
				float2 appendResult58_g76988 = (float2(( (Normal_Packed45_g76988).x * (Normal_Packed45_g76988).w ) , (Normal_Packed45_g76988).y));
				half2 Normal_Default50_g76988 = appendResult58_g76988;
				half2 Normal_ASTC41_g76988 = (Normal_Packed45_g76988).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g76988 = Normal_ASTC41_g76988;
				#else
				float2 staticSwitch38_g76988 = Normal_Default50_g76988;
				#endif
				half2 Normal_NO_DTX544_g76988 = (Normal_Packed45_g76988).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g76988 = Normal_NO_DTX544_g76988;
				#else
				float2 staticSwitch37_g76988 = staticSwitch38_g76988;
				#endif
				float2 temp_output_6555_0_g76959 = ( (staticSwitch37_g76988*2.0 + -1.0) * _MainNormalValue );
				half2 Main_Normal137_g76959 = temp_output_6555_0_g76959;
				float2 lerpResult3372_g76959 = lerp( float2( 0,0 ) , Main_Normal137_g76959 , _DetailNormalValue);
				half4 Normal_Packed45_g76989 = SAMPLE_TEXTURE2D( _SecondNormalTex, sampler_Linear_Repeat, Second_UVs17_g76959 );
				float2 appendResult58_g76989 = (float2(( (Normal_Packed45_g76989).x * (Normal_Packed45_g76989).w ) , (Normal_Packed45_g76989).y));
				half2 Normal_Default50_g76989 = appendResult58_g76989;
				half2 Normal_ASTC41_g76989 = (Normal_Packed45_g76989).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g76989 = Normal_ASTC41_g76989;
				#else
				float2 staticSwitch38_g76989 = Normal_Default50_g76989;
				#endif
				half2 Normal_NO_DTX544_g76989 = (Normal_Packed45_g76989).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g76989 = Normal_NO_DTX544_g76989;
				#else
				float2 staticSwitch37_g76989 = staticSwitch38_g76989;
				#endif
				half2 Second_Normal179_g76959 = ( (staticSwitch37_g76989*2.0 + -1.0) * _SecondNormalValue );
				float2 temp_output_36_0_g77011 = ( lerpResult3372_g76959 + Second_Normal179_g76959 );
				float2 lerpResult3376_g76959 = lerp( Main_Normal137_g76959 , temp_output_36_0_g77011 , Blend_Mask147_g76959);
				#ifdef TVE_FEATURE_DETAIL
				float2 staticSwitch267_g76959 = lerpResult3376_g76959;
				#else
				float2 staticSwitch267_g76959 = Main_Normal137_g76959;
				#endif
				half2 Blend_Normal312_g76959 = staticSwitch267_g76959;
				float3 appendResult7377_g76959 = (float3(Blend_Normal312_g76959 , 1.0));
				float3 ase_worldTangent = IN.ase_texcoord6.xyz;
				float3 ase_worldNormal = IN.ase_texcoord7.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord8.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal7376_g76959 = appendResult7377_g76959;
				float3 worldNormal7376_g76959 = float3(dot(tanToWorld0,tanNormal7376_g76959), dot(tanToWorld1,tanNormal7376_g76959), dot(tanToWorld2,tanNormal7376_g76959));
				half3 Blend_NormalWS7375_g76959 = worldNormal7376_g76959;
				float lerpResult7446_g76959 = lerp( (Blend_NormalWS7375_g76959).y , IN.ase_normal.y , Vertex_DynamicMode5112_g76959);
				float lerpResult6757_g76959 = lerp( 1.0 , saturate( lerpResult7446_g76959 ) , _OverlayProjectionValue);
				half Overlay_Projection6081_g76959 = lerpResult6757_g76959;
				half Overlay_Shading6688_g76959 = Blend_Albedo_Globals6410_g76959;
				half Overlay_Custom6707_g76959 = 1.0;
				float lerpResult6467_g76959 = lerp( Occlusion_Alpha6463_g76959 , 1.0 , Occlusion_Mask6432_g76959);
				half Occlusion_Overlay6471_g76959 = lerpResult6467_g76959;
				float temp_output_7_0_g77031 = 0.1;
				float temp_output_10_0_g77031 = ( 0.2 - temp_output_7_0_g77031 );
				half Overlay_Mask_High6064_g76959 = saturate( ( ( ( Overlay_Value5738_g76959 * Overlay_Projection6081_g76959 * Overlay_Shading6688_g76959 * Overlay_Custom6707_g76959 * Occlusion_Overlay6471_g76959 ) - temp_output_7_0_g77031 ) / ( temp_output_10_0_g77031 + 0.0001 ) ) );
				half Overlay_Mask269_g76959 = Overlay_Mask_High6064_g76959;
				float3 lerpResult336_g76959 = lerp( Blend_Albedo_Colored863_g76959 , Global_OverlayColor1758_g76959 , Overlay_Mask269_g76959);
				half3 Blend_Albedo_Overlay359_g76959 = lerpResult336_g76959;
				half Global_WetnessContrast6502_g76959 = TVE_WetnessContrast;
				half Global_Extras_Wetness305_g76959 = break456_g76996.y;
				half Wetness_Value6343_g76959 = ( Global_Extras_Wetness305_g76959 * _GlobalWetness );
				float3 lerpResult6367_g76959 = lerp( Blend_Albedo_Overlay359_g76959 , ( Blend_Albedo_Overlay359_g76959 * Blend_Albedo_Overlay359_g76959 ) , ( Global_WetnessContrast6502_g76959 * Wetness_Value6343_g76959 ));
				half3 Blend_Albedo_Wetness6351_g76959 = lerpResult6367_g76959;
				float vertexToFrag11_g77009 = IN.ase_texcoord3.w;
				half3 Tint_Highlight_Color5771_g76959 = ( ( (_MotionHighlightColor).rgb * vertexToFrag11_g77009 ) + float3( 1,1,1 ) );
				half Emissive_Dark6993_g76959 = 1.0;
				float3 temp_output_6309_0_g76959 = ( Blend_Albedo_Wetness6351_g76959 * Tint_Highlight_Color5771_g76959 * Emissive_Dark6993_g76959 );
				half3 Blend_Albedo_Subsurface149_g76959 = temp_output_6309_0_g76959;
				half3 Blend_Albedo_RimLight7316_g76959 = Blend_Albedo_Subsurface149_g76959;
				
				float localCustomAlphaClip19_g77017 = ( 0.0 );
				half Main_Alpha316_g76959 = tex2DNode29_g76959.a;
				half Second_Alpha5007_g76959 = tex2DNode89_g76959.a;
				float lerpResult6153_g76959 = lerp( Main_Alpha316_g76959 , Second_Alpha5007_g76959 , Blend_Mask147_g76959);
				float lerpResult6785_g76959 = lerp( ( Main_Alpha316_g76959 * Second_Alpha5007_g76959 ) , lerpResult6153_g76959 , _DetailAlphaMode);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6158_g76959 = lerpResult6785_g76959;
				#else
				float staticSwitch6158_g76959 = Main_Alpha316_g76959;
				#endif
				half Blend_Alpha6157_g76959 = staticSwitch6158_g76959;
				half AlphaTreshold2132_g76959 = _AlphaClipValue;
				half Global_Extras_Alpha1033_g76959 = saturate( break456_g76996.w );
				float lerpResult5154_g76959 = lerp( 0.0 , Global_MeshVariation5104_g76959 , _AlphaVariationValue);
				half Global_Alpha_Variation5158_g76959 = lerpResult5154_g76959;
				float lerpResult6866_g76959 = lerp( ( 1.0 - Blend_Mask147_g76959 ) , 1.0 , _DetailFadeMode);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6612_g76959 = lerpResult6866_g76959;
				#else
				float staticSwitch6612_g76959 = 1.0;
				#endif
				half Blend_Mask_Invert6260_g76959 = staticSwitch6612_g76959;
				half Alpha_Mask6234_g76959 = ( 1.0 * Blend_Mask_Invert6260_g76959 );
				float lerpResult5203_g76959 = lerp( 1.0 , saturate( ( ( Global_Extras_Alpha1033_g76959 - Global_Alpha_Variation5158_g76959 ) + ( Global_Extras_Alpha1033_g76959 * 0.5 ) ) ) , ( Alpha_Mask6234_g76959 * _GlobalAlpha ));
				float lerpResult16_g77012 = lerp( 1.0 , lerpResult5203_g76959 , TVE_IsEnabled);
				half Global_Alpha315_g76959 = lerpResult16_g77012;
				half Fade_Alpha3727_g76959 = 1.0;
				float Emissive_Alpha6927_g76959 = 1.0;
				half Final_Alpha7344_g76959 = min( min( ( Blend_Alpha6157_g76959 - AlphaTreshold2132_g76959 ) , Global_Alpha315_g76959 ) , min( Fade_Alpha3727_g76959 , Emissive_Alpha6927_g76959 ) );
				float temp_output_3_0_g77017 = Final_Alpha7344_g76959;
				float Alpha19_g77017 = temp_output_3_0_g77017;
				float temp_output_15_0_g77017 = 0.01;
				float Treshold19_g77017 = temp_output_15_0_g77017;
				{
				#if defined (TVE_FEATURE_CLIP)
				#if defined (TVE_IS_HD_PIPELINE)
				#if !defined (SHADERPASS_FORWARD_BYPASS_ALPHA_TEST)
				clip(Alpha19_g77017 - Treshold19_g77017);
				#endif
				#if !defined (SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST)
				clip(Alpha19_g77017 - Treshold19_g77017);
				#endif
				#else
				clip(Alpha19_g77017 - Treshold19_g77017);
				#endif
				#endif
				}
				half Main_Color_Alpha6121_g76959 = _MainColor.a;
				half Second_Color_Alpha6152_g76959 = _SecondColor.a;
				float lerpResult6168_g76959 = lerp( Main_Color_Alpha6121_g76959 , Second_Color_Alpha6152_g76959 , Blend_Mask147_g76959);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6174_g76959 = lerpResult6168_g76959;
				#else
				float staticSwitch6174_g76959 = Main_Color_Alpha6121_g76959;
				#endif
				half Blend_Color_Alpha6167_g76959 = staticSwitch6174_g76959;
				half Final_Clip914_g76959 = saturate( ( Alpha19_g77017 * Blend_Color_Alpha6167_g76959 ) );
				

				float3 BaseColor = Blend_Albedo_RimLight7316_g76959;
				float Alpha = Final_Clip914_g76959;
				float AlphaClipThreshold = 0.5;

				half4 color = half4(BaseColor, Alpha );

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				return color;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthNormals"
			Tags { "LightMode"="DepthNormalsOnly" }

			ZWrite On
			Blend One Zero
			ZTest LEqual
			ZWrite On

			HLSLPROGRAM

			#define _SPECULAR_SETUP 1
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile_fragment _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#pragma multi_compile _ DOTS_INSTANCING_ON
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define ASE_TRANSLUCENCY 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140007
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma vertex vert
			#pragma fragment frag

			#pragma multi_compile_fragment _ _WRITE_RENDERING_LAYERS

			#define SHADERPASS SHADERPASS_DEPTHNORMALSONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_VERT_TANGENT
			#define ASE_NEEDS_FRAG_COLOR
			#pragma shader_feature_local_fragment TVE_FEATURE_CLIP
			#pragma shader_feature_local TVE_FEATURE_BATCHING
			#pragma shader_feature_local_fragment TVE_FEATURE_DETAIL
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_UNIVERSAL_PIPELINE
			#define TVE_IS_PLANT_SHADER
			#define TVE_IS_SUBSURFACE_SHADER
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 worldPos : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord : TEXCOORD1;
				#endif
				float3 worldNormal : TEXCOORD2;
				float4 worldTangent : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_color : COLOR;
				float4 ase_texcoord8 : TEXCOORD8;
				float3 ase_normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _DetailBlendRemap;
			float4 _GradientMaskRemap;
			half4 _VertexOcclusionRemap;
			half4 _RimLightRemap;
			half4 _MainColor;
			half4 _MainUVs;
			half4 _MotionHighlightColor;
			half4 _EmissiveColor;
			half4 _EmissiveUVs;
			half4 _SecondColor;
			half4 _VertexOcclusionColor;
			half4 _second_uvs_mode;
			float4 _MaxBoundsInfo;
			half4 _SecondUVs;
			half4 _SecondMaskRemap;
			half4 _MainMaskRemap;
			half4 _GradientColorTwo;
			float4 _SubsurfaceDiffusion_Asset;
			float4 _Color;
			float4 _NoiseMaskRemap;
			half4 _SubsurfaceColor;
			half4 _GradientColorOne;
			half3 _render_normals;
			half _SecondAlbedoValue;
			half _DetailMaskIntensity;
			half _DetailMaskMode;
			half _MainAlbedoValue;
			half _DetailBlendMode;
			half _VertexDataMode;
			half _DetailMaskInvertMode;
			half _SizeFadeStartValue;
			half _render_zw;
			half _GlobalSize;
			half _MotionVariation_20;
			half _MotionSpeed_20;
			half _MotionValue_20;
			half _MotionFacingValue;
			half _MotionAmplitude_20;
			half _MotionAmplitude_22;
			float _MotionScale_32;
			half _SizeFadeEndValue;
			float _MotionVariation_32;
			half _MotionValue_30;
			half _MotionAmplitude_32;
			half _PerspectivePushValue;
			half _PerspectiveNoiseValue;
			half _DetailMeshMode;
			half _PerspectiveAngleValue;
			half _LayerVertexValue;
			float _MotionSpeed_32;
			half _DetailMeshInvertMode;
			half _GradientMinValue;
			half _DetailBlendMinValue;
			half _SecondNormalValue;
			half _OverlayProjectionValue;
			half _GlobalWetness;
			half _GlobalEmissive;
			half _EmissivePhaseValue;
			float _emissive_intensity_value;
			half _RenderSpecular;
			half _DetailNormalValue;
			half _MainSmoothnessValue;
			half _MainOcclusionValue;
			half _SecondOcclusionValue;
			half _DetailAlphaMode;
			half _AlphaClipValue;
			half _AlphaVariationValue;
			half _DetailFadeMode;
			half _GlobalAlpha;
			half _SecondSmoothnessValue;
			half _MainNormalValue;
			half _OverlayVariationValue;
			half _ExtrasPositionMode;
			half _DetailBlendMaxValue;
			half _DetailMode;
			half _MotionScale_20;
			half _GradientMaxValue;
			half _MainMaskMinValue;
			half _MainMaskMaxValue;
			half _SecondMaskMinValue;
			half _SecondMaskMaxValue;
			half _VertexOcclusionMinValue;
			half _VertexOcclusionMaxValue;
			half _LayerColorsValue;
			half _ColorsPositionMode;
			half _GlobalColors;
			half _ColorsVariationValue;
			half _ColorsMaskMode;
			half _GlobalOverlay;
			half _LayerExtrasValue;
			half _DetailMeshValue;
			half _InteractionAmplitude;
			float _MotionSpeed_10;
			half _MotionAmplitude_10;
			half _MessageSecondMask;
			half _MessageMotionVariation;
			half _MessageGlobalsVariation;
			half _MessageMainMask;
			half _MessageSubsurface;
			half _IsTVEShader;
			half _IsIdentifier;
			half _MessageOcclusion;
			half _HasOcclusion;
			half _HasEmissive;
			half _VertexVariationMode;
			half _IsCollected;
			half _IsShared;
			half _IsVersion;
			half _RenderCoverage;
			float _EmissiveIntensityValue;
			half _HasGradient;
			half _RenderNormals;
			half _CategoryRender;
			half _RenderMode;
			half _render_coverage;
			half _render_cull;
			half _render_src;
			half _render_dst;
			float _IsPlantShader;
			half _IsSubsurfaceShader;
			float _SubsurfaceDiffusion;
			half _Cutoff;
			half _ColorsMaskMinValue;
			half _ColorsMaskMaxValue;
			half _RenderDecals;
			half _RenderSSR;
			half _RenderZWrite;
			half _RenderClip;
			half _RenderCull;
			half _RenderQueue;
			half _RenderPriority;
			half _DetailTypeMode;
			half _DetailOpaqueMode;
			half _DetailCoordMode;
			half _EmissiveIntensityMode;
			half _SubsurfaceDirectValue;
			half _SubsurfaceAngleValue;
			half _SubsurfaceScatteringValue;
			half _RenderDirect;
			half _CategoryRimLight;
			half _CategoryMatcap;
			half _CategorySubsurface;
			half _CategoryEmissive;
			half _RenderAmbient;
			half _RenderShadow;
			half _IsCoreShader;
			half _VertexPivotMode;
			half _MotionPosition_10;
			float _MotionScale_10;
			half _MotionVariation_10;
			half _VertexDynamicMode;
			half _LayerMotionValue;
			half _SubsurfaceAmbientValue;
			half _InteractionMaskValue;
			half _SubsurfaceShadowValue;
			half _SpaceRenderFade;
			half _EmissiveFlagMode;
			half _SecondUVsMode;
			half _SpaceGlobalLayers;
			half _SpaceGlobalLocals;
			half _SpaceSubsurface;
			half _SpaceMotionLocals;
			half _SpaceMotionGlobals;
			half _SpaceGlobalOptions;
			half _CategoryGlobals;
			half _CategoryMain;
			half _CategoryDetail;
			half _CategoryOcclusion;
			half _CategoryGradient;
			half _CategoryNoise;
			half _CategoryPerspective;
			half _CategorySizeFade;
			half _CategoryMotion;
			half _SubsurfaceNormalValue;
			half _SubsurfaceValue;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			// Property used by ScenePickingPass
			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			// Properties used by SceneSelectionPass
			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(TVE_NoiseTex);
			float3 TVE_WorldOrigin;
			half4 TVE_MotionParams;
			half4 TVE_TimeParams;
			SAMPLER(sampler_Linear_Repeat);
			float TVE_MotionUsage[10];
			TEXTURE2D_ARRAY(TVE_MotionTex);
			half4 TVE_MotionCoords;
			SAMPLER(sampler_Linear_Clamp);
			half TVE_MotionValue_10;
			half TVE_MotionValue_20;
			half TVE_MotionFadeEnd;
			half TVE_MotionFadeStart;
			half TVE_MotionValue_30;
			float TVE_VertexUsage[10];
			TEXTURE2D_ARRAY(TVE_VertexTex);
			half4 TVE_VertexCoords;
			half4 TVE_VertexParams;
			half TVE_DistanceFadeBias;
			half TVE_IsEnabled;
			half _DisableSRPBatcher;
			TEXTURE2D(_MainNormalTex);
			TEXTURE2D(_SecondNormalTex);
			TEXTURE2D(_MainMaskTex);
			TEXTURE2D(_SecondMaskTex);
			half TVE_OverlayNormalValue;
			float TVE_ExtrasUsage[10];
			TEXTURE2D_ARRAY(TVE_ExtrasTex);
			half4 TVE_ExtrasCoords;
			half4 TVE_ExtrasParams;
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);
			TEXTURE2D(_SecondAlbedoTex);
			SAMPLER(sampler_SecondAlbedoTex);
			half TVE_WetnessNormalValue;


			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/DepthNormalsOnlyPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			float2 DecodeFloatToVector2( float enc )
			{
				float2 result ;
				result.y = enc % 2048;
				result.x = floor(enc / 2048);
				return result / (2048 - 1);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 VertexPosition3588_g76959 = v.vertex.xyz;
				float3 appendResult60_g76970 = (float3(v.ase_texcoord3.x , v.ase_texcoord3.z , v.ase_texcoord3.y));
				half3 Mesh_PivotsData2831_g76959 = ( appendResult60_g76970 * _VertexPivotMode );
				half3 Mesh_PivotsOS2291_g76959 = Mesh_PivotsData2831_g76959;
				float3 temp_output_2283_0_g76959 = ( VertexPosition3588_g76959 - Mesh_PivotsOS2291_g76959 );
				half3 VertexPos40_g77080 = temp_output_2283_0_g76959;
				half3 VertexPos40_g77081 = VertexPos40_g77080;
				float3 appendResult74_g77081 = (float3(VertexPos40_g77081.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g77081 = appendResult74_g77081;
				float3 break84_g77081 = VertexPos40_g77081;
				float3 appendResult81_g77081 = (float3(0.0 , break84_g77081.y , break84_g77081.z));
				half3 VertexPosOtherAxis82_g77081 = appendResult81_g77081;
				float3 ase_worldPos = TransformObjectToWorld( (v.vertex).xyz );
				float3 vertexToFrag3890_g76959 = ase_worldPos;
				float3 WorldPosition3905_g76959 = vertexToFrag3890_g76959;
				float3 WorldPosition_Shifted7477_g76959 = ( WorldPosition3905_g76959 - TVE_WorldOrigin );
				float4x4 break19_g77047 = GetObjectToWorldMatrix();
				float3 appendResult20_g77047 = (float3(break19_g77047[ 0 ][ 3 ] , break19_g77047[ 1 ][ 3 ] , break19_g77047[ 2 ][ 3 ]));
				float3 temp_output_122_0_g77047 = Mesh_PivotsData2831_g76959;
				float3 PivotsOnly105_g77047 = (mul( GetObjectToWorldMatrix(), float4( temp_output_122_0_g77047 , 0.0 ) ).xyz).xyz;
				half3 ObjectData20_g77049 = ( appendResult20_g77047 + PivotsOnly105_g77047 );
				half3 WorldData19_g77049 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g77049 = WorldData19_g77049;
				#else
				float3 staticSwitch14_g77049 = ObjectData20_g77049;
				#endif
				float3 temp_output_114_0_g77047 = staticSwitch14_g77049;
				float3 vertexToFrag4224_g76959 = temp_output_114_0_g77047;
				float3 ObjectPosition4223_g76959 = vertexToFrag4224_g76959;
				float3 ObjectPosition_Shifted7481_g76959 = ( ObjectPosition4223_g76959 - TVE_WorldOrigin );
				float3 lerpResult6766_g76959 = lerp( WorldPosition_Shifted7477_g76959 , ObjectPosition_Shifted7481_g76959 , _MotionPosition_10);
				float3 Motion_10_Position6738_g76959 = lerpResult6766_g76959;
				half3 Input_Position419_g77065 = Motion_10_Position6738_g76959;
				float Input_MotionScale287_g77065 = ( _MotionScale_10 + 0.2 );
				float2 temp_output_597_0_g77065 = (( Input_Position419_g77065 * Input_MotionScale287_g77065 * 0.0075 )).xz;
				float2 temp_output_447_0_g76964 = ((TVE_MotionParams).xy*2.0 + -1.0);
				half2 Global_Wind_DirectionWS4683_g76959 = temp_output_447_0_g76964;
				half2 Input_DirectionWS423_g77065 = Global_Wind_DirectionWS4683_g76959;
				float lerpResult115_g77066 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g77065 = _MotionSpeed_10;
				half Input_MotionVariation284_g77065 = _MotionVariation_10;
				half3 Input_Position167_g77037 = ObjectPosition_Shifted7481_g76959;
				float dotResult156_g77037 = dot( (Input_Position167_g77037).xz , float2( 12.9898,78.233 ) );
				half Vertex_DynamicMode5112_g76959 = _VertexDynamicMode;
				half Input_DynamicMode120_g77037 = Vertex_DynamicMode5112_g76959;
				float Postion_Random162_g77037 = ( sin( dotResult156_g77037 ) * ( 1.0 - Input_DynamicMode120_g77037 ) );
				float Mesh_Variation16_g76959 = v.ase_color.r;
				half Input_Variation124_g77037 = Mesh_Variation16_g76959;
				half ObjectData20_g77039 = frac( ( Postion_Random162_g77037 + Input_Variation124_g77037 ) );
				half WorldData19_g77039 = Input_Variation124_g77037;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g77039 = WorldData19_g77039;
				#else
				float staticSwitch14_g77039 = ObjectData20_g77039;
				#endif
				float clampResult17_g77041 = clamp( staticSwitch14_g77039 , 0.0001 , 0.9999 );
				float Global_MeshVariation5104_g76959 = clampResult17_g77041;
				half Input_GlobalMeshVariation569_g77065 = Global_MeshVariation5104_g76959;
				float temp_output_630_0_g77065 = ( ( ( lerpResult115_g77066 * Input_MotionSpeed62_g77065 ) + ( Input_MotionVariation284_g77065 * Input_GlobalMeshVariation569_g77065 ) ) * 0.03 );
				float temp_output_607_0_g77065 = frac( temp_output_630_0_g77065 );
				float4 lerpResult590_g77065 = lerp( SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g77065 + ( -Input_DirectionWS423_g77065 * temp_output_607_0_g77065 ) ), 0.0 ) , SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g77065 + ( -Input_DirectionWS423_g77065 * frac( ( temp_output_630_0_g77065 + 0.5 ) ) ) ), 0.0 ) , ( abs( ( temp_output_607_0_g77065 - 0.5 ) ) / 0.5 ));
				half4 Noise_Complex703_g77065 = lerpResult590_g77065;
				float2 temp_output_645_0_g77065 = ((Noise_Complex703_g77065).rg*2.0 + -1.0);
				float2 break650_g77065 = temp_output_645_0_g77065;
				float3 appendResult649_g77065 = (float3(break650_g77065.x , 0.0 , break650_g77065.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Global_Noise_OS5548_g76959 = (( mul( GetWorldToObjectMatrix(), float4( appendResult649_g77065 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Noise_DirectionOS487_g77073 = Global_Noise_OS5548_g76959;
				float2 break448_g76964 = temp_output_447_0_g76964;
				float3 appendResult452_g76964 = (float3(break448_g76964.x , 0.0 , break448_g76964.y));
				half2 Global_Wind_DirectionOS5692_g76959 = (( mul( GetWorldToObjectMatrix(), float4( appendResult452_g76964 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Wind_DirectionOS458_g77073 = Global_Wind_DirectionOS5692_g76959;
				float temp_output_84_0_g76973 = _LayerMotionValue;
				float temp_output_19_0_g76977 = TVE_MotionUsage[(int)temp_output_84_0_g76973];
				float4 temp_output_91_19_g76973 = TVE_MotionCoords;
				half2 UV94_g76973 = ( (temp_output_91_19_g76973).zw + ( (temp_output_91_19_g76973).xy * (ObjectPosition4223_g76959).xz ) );
				float4 tex2DArrayNode50_g76973 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_Linear_Clamp, UV94_g76973,temp_output_84_0_g76973, 0.0 );
				float4 temp_output_17_0_g76977 = tex2DArrayNode50_g76973;
				float4 temp_output_112_19_g76973 = TVE_MotionParams;
				float4 temp_output_3_0_g76977 = temp_output_112_19_g76973;
				float4 ifLocalVar18_g76977 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76977 >= 0.5 )
				ifLocalVar18_g76977 = temp_output_17_0_g76977;
				else
				ifLocalVar18_g76977 = temp_output_3_0_g76977;
				float4 lerpResult22_g76977 = lerp( temp_output_3_0_g76977 , temp_output_17_0_g76977 , temp_output_19_0_g76977);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76977 = lerpResult22_g76977;
				#else
				float4 staticSwitch24_g76977 = ifLocalVar18_g76977;
				#endif
				half4 Global_Motion_Params3909_g76959 = staticSwitch24_g76977;
				float4 break322_g76964 = Global_Motion_Params3909_g76959;
				half Global_Wind_Power2223_g76959 = break322_g76964.z;
				half Input_WindPower449_g77073 = Global_Wind_Power2223_g76959;
				float temp_output_565_0_g77073 = ( 1.0 - Input_WindPower449_g77073 );
				float2 lerpResult516_g77073 = lerp( Input_Noise_DirectionOS487_g77073 , Input_Wind_DirectionOS458_g77073 , ( ( 1.0 - ( temp_output_565_0_g77073 * temp_output_565_0_g77073 * temp_output_565_0_g77073 ) ) * 0.6 ));
				half Mesh_Height1524_g76959 = v.ase_color.a;
				half Input_MeshHeight388_g77073 = Mesh_Height1524_g76959;
				half ObjectData20_g77074 = Input_MeshHeight388_g77073;
				float enc62_g76967 = v.ase_texcoord.w;
				float2 localDecodeFloatToVector262_g76967 = DecodeFloatToVector2( enc62_g76967 );
				float2 break63_g76967 = ( localDecodeFloatToVector262_g76967 * 100.0 );
				float Bounds_Height5230_g76959 = break63_g76967.x;
				half Input_BoundsHeight390_g77073 = Bounds_Height5230_g76959;
				half WorldData19_g77074 = ( Input_MeshHeight388_g77073 * Input_MeshHeight388_g77073 * Input_BoundsHeight390_g77073 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g77074 = WorldData19_g77074;
				#else
				float staticSwitch14_g77074 = ObjectData20_g77074;
				#endif
				half Final_Motion10_Mask321_g77073 = ( staticSwitch14_g77074 * 2.0 );
				half Motion_10_Amplitude2258_g76959 = _MotionAmplitude_10;
				half Input_BendingAmplitude376_g77073 = Motion_10_Amplitude2258_g76959;
				half Global_MotionValue640_g77073 = TVE_MotionValue_10;
				half2 Final_Bending631_g77073 = ( lerpResult516_g77073 * ( Final_Motion10_Mask321_g77073 * Input_BendingAmplitude376_g77073 * Input_WindPower449_g77073 * Input_WindPower449_g77073 * Global_MotionValue640_g77073 ) );
				float2 appendResult433_g76964 = (float2(break322_g76964.x , break322_g76964.y));
				float2 temp_output_436_0_g76964 = (appendResult433_g76964*2.0 + -1.0);
				float2 break441_g76964 = temp_output_436_0_g76964;
				float3 appendResult440_g76964 = (float3(break441_g76964.x , 0.0 , break441_g76964.y));
				half2 Global_React_DirectionOS39_g76959 = (( mul( GetWorldToObjectMatrix(), float4( appendResult440_g76964 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_React_DirectionOS358_g77073 = Global_React_DirectionOS39_g76959;
				float clampResult17_g77076 = clamp( Input_MeshHeight388_g77073 , 0.0001 , 0.9999 );
				float temp_output_7_0_g77075 = 0.0;
				half Input_InteractionUseMask62_g77073 = _InteractionMaskValue;
				float temp_output_10_0_g77075 = ( Input_InteractionUseMask62_g77073 - temp_output_7_0_g77075 );
				half Final_InteractionRemap594_g77073 = saturate( ( ( clampResult17_g77076 - temp_output_7_0_g77075 ) / ( temp_output_10_0_g77075 + 0.0001 ) ) );
				half ObjectData20_g77077 = Final_InteractionRemap594_g77073;
				half WorldData19_g77077 = ( Final_InteractionRemap594_g77073 * Final_InteractionRemap594_g77073 * Input_BoundsHeight390_g77073 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g77077 = WorldData19_g77077;
				#else
				float staticSwitch14_g77077 = ObjectData20_g77077;
				#endif
				half Final_InteractionMask373_g77073 = ( staticSwitch14_g77077 * 2.0 );
				half Interaction_Amplitude7501_g76959 = _InteractionAmplitude;
				half Input_InteractionAmplitude58_g77073 = Interaction_Amplitude7501_g76959;
				half2 Final_Interaction632_g77073 = ( Input_React_DirectionOS358_g77073 * Final_InteractionMask373_g77073 * Input_InteractionAmplitude58_g77073 );
				half Global_Interaction_Mask66_g76959 = ( break322_g76964.w * break322_g76964.w * break322_g76964.w * break322_g76964.w );
				float Input_InteractionGlobalMask330_g77073 = Global_Interaction_Mask66_g76959;
				half Final_InteractionValue525_g77073 = saturate( ( Input_InteractionAmplitude58_g77073 * Input_InteractionGlobalMask330_g77073 ) );
				float2 lerpResult551_g77073 = lerp( Final_Bending631_g77073 , Final_Interaction632_g77073 , Final_InteractionValue525_g77073);
				float2 break364_g77073 = lerpResult551_g77073;
				float3 appendResult638_g77073 = (float3(break364_g77073.x , 0.0 , break364_g77073.y));
				half3 Motion_10_Interaction7519_g76959 = appendResult638_g77073;
				half3 Angle44_g77080 = Motion_10_Interaction7519_g76959;
				half Angle44_g77081 = (Angle44_g77080).z;
				half3 VertexPos40_g77082 = ( VertexPosRotationAxis50_g77081 + ( VertexPosOtherAxis82_g77081 * cos( Angle44_g77081 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g77081 ) * sin( Angle44_g77081 ) ) );
				float3 appendResult74_g77082 = (float3(0.0 , 0.0 , VertexPos40_g77082.z));
				half3 VertexPosRotationAxis50_g77082 = appendResult74_g77082;
				float3 break84_g77082 = VertexPos40_g77082;
				float3 appendResult81_g77082 = (float3(break84_g77082.x , break84_g77082.y , 0.0));
				half3 VertexPosOtherAxis82_g77082 = appendResult81_g77082;
				half Angle44_g77082 = -(Angle44_g77080).x;
				half3 Input_Position419_g77078 = WorldPosition_Shifted7477_g76959;
				float3 break459_g77078 = Input_Position419_g77078;
				float Sum_Position446_g77078 = ( break459_g77078.x + break459_g77078.y + break459_g77078.z );
				half Input_MotionScale321_g77078 = ( _MotionScale_20 * 0.1 );
				half Input_MotionVariation330_g77078 = _MotionVariation_20;
				half Input_GlobalVariation400_g77078 = Global_MeshVariation5104_g76959;
				float lerpResult115_g77079 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g77078 = _MotionSpeed_20;
				float temp_output_404_0_g77078 = ( lerpResult115_g77079 * Input_MotionSpeed62_g77078 );
				half Motion_SineA450_g77078 = sin( ( ( Sum_Position446_g77078 * Input_MotionScale321_g77078 ) + ( Input_MotionVariation330_g77078 * Input_GlobalVariation400_g77078 ) + temp_output_404_0_g77078 ) );
				half Motion_SineB395_g77078 = sin( ( ( temp_output_404_0_g77078 * 0.6842 ) + ( Sum_Position446_g77078 * Input_MotionScale321_g77078 ) ) );
				half3 Input_Position419_g76971 = VertexPosition3588_g76959;
				float3 normalizeResult518_g76971 = normalize( Input_Position419_g76971 );
				half2 Input_DirectionOS423_g76971 = Global_React_DirectionOS39_g76959;
				float2 break521_g76971 = -Input_DirectionOS423_g76971;
				float3 appendResult522_g76971 = (float3(break521_g76971.x , 0.0 , break521_g76971.y));
				float dotResult519_g76971 = dot( normalizeResult518_g76971 , appendResult522_g76971 );
				half Input_Value62_g76971 = _MotionFacingValue;
				float lerpResult524_g76971 = lerp( 1.0 , (dotResult519_g76971*0.5 + 0.5) , Input_Value62_g76971);
				half ObjectData20_g76972 = max( lerpResult524_g76971 , 0.001 );
				half WorldData19_g76972 = 1.0;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76972 = WorldData19_g76972;
				#else
				float staticSwitch14_g76972 = ObjectData20_g76972;
				#endif
				half Motion_FacingMask5214_g76959 = staticSwitch14_g76972;
				half Motion_20_Amplitude4381_g76959 = ( _MotionValue_20 * Motion_FacingMask5214_g76959 );
				half Input_MotionAmplitude384_g77078 = Motion_20_Amplitude4381_g76959;
				half Input_GlobalWind407_g77078 = Global_Wind_Power2223_g76959;
				float4 break638_g77065 = abs( Noise_Complex703_g77065 );
				half Global_Noise_B5526_g76959 = break638_g77065.b;
				half Input_GlobalNoise411_g77078 = Global_Noise_B5526_g76959;
				float lerpResult413_g77078 = lerp( 1.6 , 0.4 , Input_GlobalWind407_g77078);
				half Motion_Amplitude418_g77078 = ( Input_MotionAmplitude384_g77078 * Input_GlobalWind407_g77078 * pow( Input_GlobalNoise411_g77078 , lerpResult413_g77078 ) );
				half Input_Squash58_g77078 = _MotionAmplitude_20;
				float enc59_g76967 = v.ase_texcoord.z;
				float2 localDecodeFloatToVector259_g76967 = DecodeFloatToVector2( enc59_g76967 );
				float2 break61_g76967 = localDecodeFloatToVector259_g76967;
				half Mesh_Motion_2060_g76959 = break61_g76967.x;
				half Input_MeshMotion_20388_g77078 = Mesh_Motion_2060_g76959;
				float Bounds_Radius5231_g76959 = break63_g76967.y;
				half Input_BoundsRadius390_g77078 = Bounds_Radius5231_g76959;
				half Global_MotionValue462_g77078 = TVE_MotionValue_20;
				half2 Input_DirectionOS366_g77078 = Global_React_DirectionOS39_g76959;
				float2 break371_g77078 = Input_DirectionOS366_g77078;
				float3 appendResult372_g77078 = (float3(break371_g77078.x , ( Motion_SineA450_g77078 * 0.3 ) , break371_g77078.y));
				half3 Motion_20_Squash4418_g76959 = ( ( (max( Motion_SineA450_g77078 , Motion_SineB395_g77078 )*0.5 + 0.5) * Motion_Amplitude418_g77078 * Input_Squash58_g77078 * Input_MeshMotion_20388_g77078 * Input_BoundsRadius390_g77078 * Global_MotionValue462_g77078 ) * appendResult372_g77078 );
				half3 VertexPos40_g77057 = ( ( VertexPosRotationAxis50_g77082 + ( VertexPosOtherAxis82_g77082 * cos( Angle44_g77082 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g77082 ) * sin( Angle44_g77082 ) ) ) + Motion_20_Squash4418_g76959 );
				float3 appendResult74_g77057 = (float3(0.0 , VertexPos40_g77057.y , 0.0));
				float3 VertexPosRotationAxis50_g77057 = appendResult74_g77057;
				float3 break84_g77057 = VertexPos40_g77057;
				float3 appendResult81_g77057 = (float3(break84_g77057.x , 0.0 , break84_g77057.z));
				float3 VertexPosOtherAxis82_g77057 = appendResult81_g77057;
				half Input_Rolling379_g77078 = _MotionAmplitude_22;
				half Motion_20_Rolling5257_g76959 = ( Motion_SineA450_g77078 * Motion_Amplitude418_g77078 * Input_Rolling379_g77078 * Input_MeshMotion_20388_g77078 * Global_MotionValue462_g77078 );
				half Angle44_g77057 = Motion_20_Rolling5257_g76959;
				half3 Input_Position500_g77069 = WorldPosition_Shifted7477_g76959;
				half Input_MotionScale321_g77069 = _MotionScale_32;
				half Input_MotionVariation330_g77069 = _MotionVariation_32;
				half Input_GlobalVariation372_g77069 = Global_MeshVariation5104_g76959;
				float lerpResult115_g77072 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g77069 = _MotionSpeed_32;
				float4 tex2DNode460_g77069 = SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( ( (Input_Position500_g77069).xz * Input_MotionScale321_g77069 * 0.03 ) + ( Input_MotionVariation330_g77069 * Input_GlobalVariation372_g77069 ) + ( lerpResult115_g77072 * Input_MotionSpeed62_g77069 * 0.02 ) ), 0.0 );
				float3 appendResult462_g77069 = (float3(tex2DNode460_g77069.r , tex2DNode460_g77069.g , tex2DNode460_g77069.b));
				half3 Flutter_Texture489_g77069 = (appendResult462_g77069*2.0 + -1.0);
				float temp_output_7_0_g77027 = TVE_MotionFadeEnd;
				float temp_output_10_0_g77027 = ( TVE_MotionFadeStart - temp_output_7_0_g77027 );
				half Motion_FadeOut4005_g76959 = saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g77027 ) / ( temp_output_10_0_g77027 + 0.0001 ) ) );
				half Motion_30_Amplitude4960_g76959 = ( _MotionValue_30 * _MotionAmplitude_32 * Motion_FacingMask5214_g76959 * Motion_FadeOut4005_g76959 );
				half Input_MotionAmplitude58_g77069 = Motion_30_Amplitude4960_g76959;
				half Mesh_Motion_30144_g76959 = break61_g76967.y;
				half Input_MeshMotion_30374_g77069 = Mesh_Motion_30144_g76959;
				half Input_GlobalWind471_g77069 = Global_Wind_Power2223_g76959;
				half Global_MotionValue503_g77069 = TVE_MotionValue_30;
				half Input_GlobalNoise472_g77069 = Global_Noise_B5526_g76959;
				float lerpResult466_g77069 = lerp( 2.0 , 0.6 , Input_GlobalWind471_g77069);
				half Flutter_Amplitude491_g77069 = ( Input_MotionAmplitude58_g77069 * Input_MeshMotion_30374_g77069 * Input_GlobalWind471_g77069 * Global_MotionValue503_g77069 * pow( Input_GlobalNoise472_g77069 , lerpResult466_g77069 ) );
				half3 Motion_30_Flutter263_g76959 = ( Flutter_Texture489_g77069 * Flutter_Amplitude491_g77069 );
				float3 Vertex_Motion_Object833_g76959 = ( ( VertexPosRotationAxis50_g77057 + ( VertexPosOtherAxis82_g77057 * cos( Angle44_g77057 ) ) + ( cross( float3(0,1,0) , VertexPosOtherAxis82_g77057 ) * sin( Angle44_g77057 ) ) ) + Motion_30_Flutter263_g76959 );
				half3 ObjectData20_g77062 = Vertex_Motion_Object833_g76959;
				float3 temp_output_3474_0_g76959 = ( VertexPosition3588_g76959 - Mesh_PivotsOS2291_g76959 );
				float3 Vertex_Motion_World1118_g76959 = ( ( ( temp_output_3474_0_g76959 + Motion_10_Interaction7519_g76959 ) + Motion_20_Squash4418_g76959 ) + Motion_30_Flutter263_g76959 );
				half3 WorldData19_g77062 = Vertex_Motion_World1118_g76959;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g77062 = WorldData19_g77062;
				#else
				float3 staticSwitch14_g77062 = ObjectData20_g77062;
				#endif
				float3 temp_output_7495_0_g76959 = staticSwitch14_g77062;
				float3 Vertex_Motion7493_g76959 = temp_output_7495_0_g76959;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 normalizeResult2169_g76959 = normalize( ase_worldViewDir );
				float3 ViewDirection3963_g76959 = normalizeResult2169_g76959;
				float3 break2709_g76959 = cross( ViewDirection3963_g76959 , half3(0,1,0) );
				float3 appendResult2710_g76959 = (float3(-break2709_g76959.z , 0.0 , break2709_g76959.x));
				float3 appendResult2667_g76959 = (float3(Global_MeshVariation5104_g76959 , 0.5 , Global_MeshVariation5104_g76959));
				float dotResult2212_g76959 = dot( ViewDirection3963_g76959 , float3(0,1,0) );
				half Mask_HView2656_g76959 = dotResult2212_g76959;
				float saferPower2652_g76959 = abs( Mask_HView2656_g76959 );
				half3 Grass_Perspective2661_g76959 = ( ( ( mul( GetWorldToObjectMatrix(), float4( appendResult2710_g76959 , 0.0 ) ).xyz * _PerspectivePushValue ) + ( (appendResult2667_g76959*2.0 + -1.0) * _PerspectiveNoiseValue ) ) * Mesh_Height1524_g76959 * pow( saferPower2652_g76959 , _PerspectiveAngleValue ) );
				float temp_output_84_0_g76999 = _LayerVertexValue;
				float temp_output_19_0_g77003 = TVE_VertexUsage[(int)temp_output_84_0_g76999];
				float4 temp_output_94_19_g76999 = TVE_VertexCoords;
				half2 UV97_g76999 = ( (temp_output_94_19_g76999).zw + ( (temp_output_94_19_g76999).xy * (ObjectPosition4223_g76959).xz ) );
				float4 tex2DArrayNode50_g76999 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_VertexTex, sampler_Linear_Clamp, UV97_g76999,temp_output_84_0_g76999, 0.0 );
				float4 temp_output_17_0_g77003 = tex2DArrayNode50_g76999;
				float4 temp_output_111_19_g76999 = TVE_VertexParams;
				float4 temp_output_3_0_g77003 = temp_output_111_19_g76999;
				float4 ifLocalVar18_g77003 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g77003 >= 0.5 )
				ifLocalVar18_g77003 = temp_output_17_0_g77003;
				else
				ifLocalVar18_g77003 = temp_output_3_0_g77003;
				float4 lerpResult22_g77003 = lerp( temp_output_3_0_g77003 , temp_output_17_0_g77003 , temp_output_19_0_g77003);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g77003 = lerpResult22_g77003;
				#else
				float4 staticSwitch24_g77003 = ifLocalVar18_g77003;
				#endif
				half4 Global_Vertex_Params4173_g76959 = staticSwitch24_g77003;
				float4 break322_g77004 = Global_Vertex_Params4173_g76959;
				half Global_VertexSize174_g76959 = saturate( break322_g77004.w );
				float lerpResult346_g76959 = lerp( 1.0 , Global_VertexSize174_g76959 , _GlobalSize);
				float3 appendResult3480_g76959 = (float3(lerpResult346_g76959 , lerpResult346_g76959 , lerpResult346_g76959));
				half3 ObjectData20_g77059 = appendResult3480_g76959;
				half3 _Vector11 = half3(1,1,1);
				half3 WorldData19_g77059 = _Vector11;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g77059 = WorldData19_g77059;
				#else
				float3 staticSwitch14_g77059 = ObjectData20_g77059;
				#endif
				half3 Vertex_Size1741_g76959 = staticSwitch14_g77059;
				float temp_output_7_0_g77060 = _SizeFadeEndValue;
				float temp_output_10_0_g77060 = ( _SizeFadeStartValue - temp_output_7_0_g77060 );
				float temp_output_7453_0_g76959 = saturate( ( ( ( distance( _WorldSpaceCameraPos , ObjectPosition4223_g76959 ) * ( 1.0 / TVE_DistanceFadeBias ) ) - temp_output_7_0_g77060 ) / ( temp_output_10_0_g77060 + 0.0001 ) ) );
				float3 appendResult3482_g76959 = (float3(temp_output_7453_0_g76959 , temp_output_7453_0_g76959 , temp_output_7453_0_g76959));
				half3 ObjectData20_g77058 = appendResult3482_g76959;
				half3 _Vector5 = half3(1,1,1);
				half3 WorldData19_g77058 = _Vector5;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g77058 = WorldData19_g77058;
				#else
				float3 staticSwitch14_g77058 = ObjectData20_g77058;
				#endif
				float3 Vertex_SizeFade1740_g76959 = staticSwitch14_g77058;
				float3 lerpResult16_g77063 = lerp( VertexPosition3588_g76959 , ( ( ( Vertex_Motion7493_g76959 + Grass_Perspective2661_g76959 ) * Vertex_Size1741_g76959 * Vertex_SizeFade1740_g76959 ) + Mesh_PivotsOS2291_g76959 ) , TVE_IsEnabled);
				float3 temp_output_4912_0_g76959 = lerpResult16_g77063;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch4976_g76959 = temp_output_4912_0_g76959;
				#else
				float3 staticSwitch4976_g76959 = temp_output_4912_0_g76959;
				#endif
				float3 temp_output_4918_0_g76959 = ( staticSwitch4976_g76959 + ( _VertexDataMode * 0.0 ) );
				float3 Final_VertexPosition890_g76959 = ( temp_output_4918_0_g76959 + _DisableSRPBatcher );
				
				float4 break33_g76991 = _second_uvs_mode;
				float2 temp_output_30_0_g76991 = ( v.ase_texcoord.xy * break33_g76991.x );
				float2 appendResult21_g76967 = (float2(v.ase_texcoord1.z , v.ase_texcoord1.w));
				float2 Mesh_DetailCoord3_g76959 = appendResult21_g76967;
				float2 temp_output_29_0_g76991 = ( Mesh_DetailCoord3_g76959 * break33_g76991.y );
				float2 temp_output_31_0_g76991 = ( (WorldPosition_Shifted7477_g76959).xz * break33_g76991.z );
				float2 vertexToFrag11_g76990 = ( ( ( temp_output_30_0_g76991 + temp_output_29_0_g76991 + temp_output_31_0_g76991 ) * (_SecondUVs).xy ) + (_SecondUVs).zw );
				o.ase_texcoord5.xy = vertexToFrag11_g76990;
				half Mesh_DetailMask90_g76959 = v.ase_color.b;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				half3 WorldNormal4101_g76959 = normalizedWorldNormal;
				float lerpResult5730_g76959 = lerp( (WorldNormal4101_g76959).y , v.ase_normal.y , Vertex_DynamicMode5112_g76959);
				half WorldNormal_Y6811_g76959 = lerpResult5730_g76959;
				float lerpResult6884_g76959 = lerp( Mesh_DetailMask90_g76959 , (WorldNormal_Y6811_g76959*0.5 + 0.5) , _DetailMeshMode);
				float lerpResult7357_g76959 = lerp( lerpResult6884_g76959 , ( 1.0 - lerpResult6884_g76959 ) , _DetailMeshInvertMode);
				float lerpResult7546_g76959 = lerp( 1.0 , lerpResult7357_g76959 , _DetailMeshValue);
				float vertexToFrag11_g77083 = lerpResult7546_g76959;
				o.ase_texcoord5.z = vertexToFrag11_g77083;
				o.ase_texcoord6.xyz = vertexToFrag3890_g76959;
				o.ase_texcoord7.xyz = vertexToFrag4224_g76959;
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord8.xyz = ase_worldBitangent;
				
				o.ase_texcoord4 = v.ase_texcoord;
				o.ase_color = v.ase_color;
				o.ase_normal = v.ase_normal;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord5.w = 0;
				o.ase_texcoord6.w = 0;
				o.ase_texcoord7.w = 0;
				o.ase_texcoord8.w = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = Final_VertexPosition890_g76959;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;
				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float3 normalWS = TransformObjectToWorldNormal( v.ase_normal );
				float4 tangentWS = float4(TransformObjectToWorldDir( v.ase_tangent.xyz), v.ase_tangent.w);
				float4 positionCS = TransformWorldToHClip( positionWS );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.worldPos = positionWS;
				#endif

				o.worldNormal = normalWS;
				o.worldTangent = tangentWS;

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.clipPos = positionCS;

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_tangent = v.ase_tangent;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord1 = v.ase_texcoord1;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE)
				#define ASE_SV_DEPTH SV_DepthLessEqual
			#else
				#define ASE_SV_DEPTH SV_Depth
			#endif

			void frag(	VertexOutput IN
						, out half4 outNormalWS : SV_Target0
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						#ifdef _WRITE_RENDERING_LAYERS
						, out float4 outRenderingLayers : SV_Target1
						#endif
						, bool ase_vface : SV_IsFrontFace )
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 WorldPosition = IN.worldPos;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );
				float3 WorldNormal = IN.worldNormal;
				float4 WorldTangent = IN.worldTangent;

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				half2 Main_UVs15_g76959 = ( ( IN.ase_texcoord4.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				half4 Normal_Packed45_g76988 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_Linear_Repeat, Main_UVs15_g76959 );
				float2 appendResult58_g76988 = (float2(( (Normal_Packed45_g76988).x * (Normal_Packed45_g76988).w ) , (Normal_Packed45_g76988).y));
				half2 Normal_Default50_g76988 = appendResult58_g76988;
				half2 Normal_ASTC41_g76988 = (Normal_Packed45_g76988).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g76988 = Normal_ASTC41_g76988;
				#else
				float2 staticSwitch38_g76988 = Normal_Default50_g76988;
				#endif
				half2 Normal_NO_DTX544_g76988 = (Normal_Packed45_g76988).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g76988 = Normal_NO_DTX544_g76988;
				#else
				float2 staticSwitch37_g76988 = staticSwitch38_g76988;
				#endif
				float2 temp_output_6555_0_g76959 = ( (staticSwitch37_g76988*2.0 + -1.0) * _MainNormalValue );
				half2 Main_Normal137_g76959 = temp_output_6555_0_g76959;
				float2 lerpResult3372_g76959 = lerp( float2( 0,0 ) , Main_Normal137_g76959 , _DetailNormalValue);
				float2 vertexToFrag11_g76990 = IN.ase_texcoord5.xy;
				half2 Second_UVs17_g76959 = vertexToFrag11_g76990;
				half4 Normal_Packed45_g76989 = SAMPLE_TEXTURE2D( _SecondNormalTex, sampler_Linear_Repeat, Second_UVs17_g76959 );
				float2 appendResult58_g76989 = (float2(( (Normal_Packed45_g76989).x * (Normal_Packed45_g76989).w ) , (Normal_Packed45_g76989).y));
				half2 Normal_Default50_g76989 = appendResult58_g76989;
				half2 Normal_ASTC41_g76989 = (Normal_Packed45_g76989).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g76989 = Normal_ASTC41_g76989;
				#else
				float2 staticSwitch38_g76989 = Normal_Default50_g76989;
				#endif
				half2 Normal_NO_DTX544_g76989 = (Normal_Packed45_g76989).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g76989 = Normal_NO_DTX544_g76989;
				#else
				float2 staticSwitch37_g76989 = staticSwitch38_g76989;
				#endif
				half2 Second_Normal179_g76959 = ( (staticSwitch37_g76989*2.0 + -1.0) * _SecondNormalValue );
				float2 temp_output_36_0_g77011 = ( lerpResult3372_g76959 + Second_Normal179_g76959 );
				float4 tex2DNode35_g76959 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_Linear_Repeat, Main_UVs15_g76959 );
				half Main_Mask57_g76959 = tex2DNode35_g76959.b;
				float4 tex2DNode33_g76959 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_Linear_Repeat, Second_UVs17_g76959 );
				half Second_Mask81_g76959 = tex2DNode33_g76959.b;
				float lerpResult6885_g76959 = lerp( Main_Mask57_g76959 , Second_Mask81_g76959 , _DetailMaskMode);
				float lerpResult7354_g76959 = lerp( lerpResult6885_g76959 , ( 1.0 - lerpResult6885_g76959 ) , _DetailMaskInvertMode);
				float lerpResult7547_g76959 = lerp( 1.0 , lerpResult7354_g76959 , _DetailMaskIntensity);
				half Blend_Mask_Texture6794_g76959 = lerpResult7547_g76959;
				float vertexToFrag11_g77083 = IN.ase_texcoord5.z;
				half Blend_Mask_Mesh1540_g76959 = vertexToFrag11_g77083;
				float clampResult17_g77023 = clamp( ( Blend_Mask_Texture6794_g76959 * Blend_Mask_Mesh1540_g76959 ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g77032 = _DetailBlendMinValue;
				float temp_output_10_0_g77032 = ( _DetailBlendMaxValue - temp_output_7_0_g77032 );
				half Blend_Mask147_g76959 = ( saturate( ( ( clampResult17_g77023 - temp_output_7_0_g77032 ) / ( temp_output_10_0_g77032 + 0.0001 ) ) ) * _DetailMode );
				float2 lerpResult3376_g76959 = lerp( Main_Normal137_g76959 , temp_output_36_0_g77011 , Blend_Mask147_g76959);
				#ifdef TVE_FEATURE_DETAIL
				float2 staticSwitch267_g76959 = lerpResult3376_g76959;
				#else
				float2 staticSwitch267_g76959 = Main_Normal137_g76959;
				#endif
				half2 Blend_Normal312_g76959 = staticSwitch267_g76959;
				half Global_OverlayNormalScale6581_g76959 = TVE_OverlayNormalValue;
				float temp_output_84_0_g76978 = _LayerExtrasValue;
				float temp_output_19_0_g76982 = TVE_ExtrasUsage[(int)temp_output_84_0_g76978];
				float4 temp_output_93_19_g76978 = TVE_ExtrasCoords;
				float3 vertexToFrag3890_g76959 = IN.ase_texcoord6.xyz;
				float3 WorldPosition3905_g76959 = vertexToFrag3890_g76959;
				float3 vertexToFrag4224_g76959 = IN.ase_texcoord7.xyz;
				float3 ObjectPosition4223_g76959 = vertexToFrag4224_g76959;
				float3 lerpResult4827_g76959 = lerp( WorldPosition3905_g76959 , ObjectPosition4223_g76959 , _ExtrasPositionMode);
				half2 UV96_g76978 = ( (temp_output_93_19_g76978).zw + ( (temp_output_93_19_g76978).xy * (lerpResult4827_g76959).xz ) );
				float4 tex2DArrayNode48_g76978 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ExtrasTex, sampler_Linear_Clamp, UV96_g76978,temp_output_84_0_g76978, 0.0 );
				float4 temp_output_17_0_g76982 = tex2DArrayNode48_g76978;
				float4 temp_output_94_85_g76978 = TVE_ExtrasParams;
				float4 temp_output_3_0_g76982 = temp_output_94_85_g76978;
				float4 ifLocalVar18_g76982 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76982 >= 0.5 )
				ifLocalVar18_g76982 = temp_output_17_0_g76982;
				else
				ifLocalVar18_g76982 = temp_output_3_0_g76982;
				float4 lerpResult22_g76982 = lerp( temp_output_3_0_g76982 , temp_output_17_0_g76982 , temp_output_19_0_g76982);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76982 = lerpResult22_g76982;
				#else
				float4 staticSwitch24_g76982 = ifLocalVar18_g76982;
				#endif
				half4 Global_Extras_Params5440_g76959 = staticSwitch24_g76982;
				float4 break456_g76996 = Global_Extras_Params5440_g76959;
				half Global_Extras_Overlay156_g76959 = break456_g76996.z;
				float3 ObjectPosition_Shifted7481_g76959 = ( ObjectPosition4223_g76959 - TVE_WorldOrigin );
				half3 Input_Position167_g77037 = ObjectPosition_Shifted7481_g76959;
				float dotResult156_g77037 = dot( (Input_Position167_g77037).xz , float2( 12.9898,78.233 ) );
				half Vertex_DynamicMode5112_g76959 = _VertexDynamicMode;
				half Input_DynamicMode120_g77037 = Vertex_DynamicMode5112_g76959;
				float Postion_Random162_g77037 = ( sin( dotResult156_g77037 ) * ( 1.0 - Input_DynamicMode120_g77037 ) );
				float Mesh_Variation16_g76959 = IN.ase_color.r;
				half Input_Variation124_g77037 = Mesh_Variation16_g76959;
				half ObjectData20_g77039 = frac( ( Postion_Random162_g77037 + Input_Variation124_g77037 ) );
				half WorldData19_g77039 = Input_Variation124_g77037;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g77039 = WorldData19_g77039;
				#else
				float staticSwitch14_g77039 = ObjectData20_g77039;
				#endif
				float clampResult17_g77041 = clamp( staticSwitch14_g77039 , 0.0001 , 0.9999 );
				float Global_MeshVariation5104_g76959 = clampResult17_g77041;
				float lerpResult1065_g76959 = lerp( 1.0 , Global_MeshVariation5104_g76959 , _OverlayVariationValue);
				half Overlay_Variation4560_g76959 = lerpResult1065_g76959;
				half Overlay_Value5738_g76959 = ( _GlobalOverlay * Global_Extras_Overlay156_g76959 * Overlay_Variation4560_g76959 );
				float3 appendResult7377_g76959 = (float3(Blend_Normal312_g76959 , 1.0));
				float3 ase_worldBitangent = IN.ase_texcoord8.xyz;
				float3 tanToWorld0 = float3( WorldTangent.xyz.x, ase_worldBitangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.xyz.y, ase_worldBitangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.xyz.z, ase_worldBitangent.z, WorldNormal.z );
				float3 tanNormal7376_g76959 = appendResult7377_g76959;
				float3 worldNormal7376_g76959 = float3(dot(tanToWorld0,tanNormal7376_g76959), dot(tanToWorld1,tanNormal7376_g76959), dot(tanToWorld2,tanNormal7376_g76959));
				half3 Blend_NormalWS7375_g76959 = worldNormal7376_g76959;
				float lerpResult7446_g76959 = lerp( (Blend_NormalWS7375_g76959).y , IN.ase_normal.y , Vertex_DynamicMode5112_g76959);
				float lerpResult6757_g76959 = lerp( 1.0 , saturate( lerpResult7446_g76959 ) , _OverlayProjectionValue);
				half Overlay_Projection6081_g76959 = lerpResult6757_g76959;
				float4 tex2DNode29_g76959 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g76959 );
				float3 lerpResult6223_g76959 = lerp( float3( 1,1,1 ) , (tex2DNode29_g76959).rgb , _MainAlbedoValue);
				half3 Main_Albedo99_g76959 = ( (_MainColor).rgb * lerpResult6223_g76959 );
				float4 tex2DNode89_g76959 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, Second_UVs17_g76959 );
				float3 lerpResult6225_g76959 = lerp( float3( 1,1,1 ) , (tex2DNode89_g76959).rgb , _SecondAlbedoValue);
				half3 Second_Albedo153_g76959 = ( (_SecondColor).rgb * lerpResult6225_g76959 );
				#ifdef UNITY_COLORSPACE_GAMMA
				float staticSwitch1_g77010 = 2.0;
				#else
				float staticSwitch1_g77010 = 4.594794;
				#endif
				float3 lerpResult4834_g76959 = lerp( ( Main_Albedo99_g76959 * Second_Albedo153_g76959 * staticSwitch1_g77010 ) , Second_Albedo153_g76959 , _DetailBlendMode);
				float3 lerpResult235_g76959 = lerp( Main_Albedo99_g76959 , lerpResult4834_g76959 , Blend_Mask147_g76959);
				#ifdef TVE_FEATURE_DETAIL
				float3 staticSwitch255_g76959 = lerpResult235_g76959;
				#else
				float3 staticSwitch255_g76959 = Main_Albedo99_g76959;
				#endif
				half3 Blend_Albedo265_g76959 = staticSwitch255_g76959;
				half Mesh_Height1524_g76959 = IN.ase_color.a;
				float temp_output_7_0_g77030 = _GradientMinValue;
				float temp_output_10_0_g77030 = ( _GradientMaxValue - temp_output_7_0_g77030 );
				half Tint_Gradient_Value2784_g76959 = saturate( ( ( Mesh_Height1524_g76959 - temp_output_7_0_g77030 ) / ( temp_output_10_0_g77030 + 0.0001 ) ) );
				float3 lerpResult2779_g76959 = lerp( (_GradientColorTwo).rgb , (_GradientColorOne).rgb , Tint_Gradient_Value2784_g76959);
				float clampResult17_g77025 = clamp( Main_Mask57_g76959 , 0.0001 , 0.9999 );
				float temp_output_7_0_g77028 = _MainMaskMinValue;
				float temp_output_10_0_g77028 = ( _MainMaskMaxValue - temp_output_7_0_g77028 );
				half Main_Mask_Remap5765_g76959 = saturate( ( ( clampResult17_g77025 - temp_output_7_0_g77028 ) / ( temp_output_10_0_g77028 + 0.0001 ) ) );
				float clampResult17_g77024 = clamp( Second_Mask81_g76959 , 0.0001 , 0.9999 );
				float temp_output_7_0_g77029 = _SecondMaskMinValue;
				float temp_output_10_0_g77029 = ( _SecondMaskMaxValue - temp_output_7_0_g77029 );
				half Second_Mask_Remap6130_g76959 = saturate( ( ( clampResult17_g77024 - temp_output_7_0_g77029 ) / ( temp_output_10_0_g77029 + 0.0001 ) ) );
				float lerpResult6617_g76959 = lerp( Main_Mask_Remap5765_g76959 , Second_Mask_Remap6130_g76959 , Blend_Mask147_g76959);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6623_g76959 = lerpResult6617_g76959;
				#else
				float staticSwitch6623_g76959 = Main_Mask_Remap5765_g76959;
				#endif
				half Blend_Mask_Remap6621_g76959 = staticSwitch6623_g76959;
				half Tint_Gradient_Mask6207_g76959 = Blend_Mask_Remap6621_g76959;
				float3 lerpResult6208_g76959 = lerp( float3( 1,1,1 ) , lerpResult2779_g76959 , Tint_Gradient_Mask6207_g76959);
				half3 Tint_Gradient_Color5769_g76959 = lerpResult6208_g76959;
				half3 Tint_Noise_Color5770_g76959 = float3(1,1,1);
				half3 Tint_User_Color7335_g76959 = float3(1,1,1);
				float3 temp_output_3_0_g77021 = ( Blend_Albedo265_g76959 * Tint_Gradient_Color5769_g76959 * Tint_Noise_Color5770_g76959 * Tint_User_Color7335_g76959 );
				float dotResult20_g77021 = dot( temp_output_3_0_g77021 , float3(0.2126,0.7152,0.0722) );
				float clampResult6740_g76959 = clamp( saturate( ( dotResult20_g77021 * 5.0 ) ) , 0.2 , 1.0 );
				half Blend_Albedo_Globals6410_g76959 = clampResult6740_g76959;
				half Overlay_Shading6688_g76959 = Blend_Albedo_Globals6410_g76959;
				half Overlay_Custom6707_g76959 = 1.0;
				half Occlusion_Alpha6463_g76959 = _VertexOcclusionColor.a;
				float Mesh_Occlusion318_g76959 = IN.ase_color.g;
				float clampResult17_g77022 = clamp( Mesh_Occlusion318_g76959 , 0.0001 , 0.9999 );
				float temp_output_7_0_g77035 = _VertexOcclusionMinValue;
				float temp_output_10_0_g77035 = ( _VertexOcclusionMaxValue - temp_output_7_0_g77035 );
				half Occlusion_Mask6432_g76959 = saturate( ( ( clampResult17_g77022 - temp_output_7_0_g77035 ) / ( temp_output_10_0_g77035 + 0.0001 ) ) );
				float lerpResult6467_g76959 = lerp( Occlusion_Alpha6463_g76959 , 1.0 , Occlusion_Mask6432_g76959);
				half Occlusion_Overlay6471_g76959 = lerpResult6467_g76959;
				float temp_output_7_0_g77031 = 0.1;
				float temp_output_10_0_g77031 = ( 0.2 - temp_output_7_0_g77031 );
				half Overlay_Mask_High6064_g76959 = saturate( ( ( ( Overlay_Value5738_g76959 * Overlay_Projection6081_g76959 * Overlay_Shading6688_g76959 * Overlay_Custom6707_g76959 * Occlusion_Overlay6471_g76959 ) - temp_output_7_0_g77031 ) / ( temp_output_10_0_g77031 + 0.0001 ) ) );
				half Overlay_Mask269_g76959 = Overlay_Mask_High6064_g76959;
				float lerpResult6585_g76959 = lerp( 1.0 , Global_OverlayNormalScale6581_g76959 , Overlay_Mask269_g76959);
				half2 Blend_Normal_Overlay366_g76959 = ( Blend_Normal312_g76959 * lerpResult6585_g76959 );
				half Global_WetnessNormalScale6571_g76959 = TVE_WetnessNormalValue;
				half Global_Extras_Wetness305_g76959 = break456_g76996.y;
				half Wetness_Value6343_g76959 = ( Global_Extras_Wetness305_g76959 * _GlobalWetness );
				float lerpResult6579_g76959 = lerp( 1.0 , Global_WetnessNormalScale6571_g76959 , ( Wetness_Value6343_g76959 * Wetness_Value6343_g76959 ));
				half2 Blend_Normal_Wetness6372_g76959 = ( Blend_Normal_Overlay366_g76959 * lerpResult6579_g76959 );
				float3 appendResult6568_g76959 = (float3(Blend_Normal_Wetness6372_g76959 , 1.0));
				float3 temp_output_13_0_g76997 = appendResult6568_g76959;
				float3 temp_output_33_0_g76997 = ( temp_output_13_0_g76997 * _render_normals );
				float3 switchResult12_g76997 = (((ase_vface>0)?(temp_output_13_0_g76997):(temp_output_33_0_g76997)));
				
				float localCustomAlphaClip19_g77017 = ( 0.0 );
				half Main_Alpha316_g76959 = tex2DNode29_g76959.a;
				half Second_Alpha5007_g76959 = tex2DNode89_g76959.a;
				float lerpResult6153_g76959 = lerp( Main_Alpha316_g76959 , Second_Alpha5007_g76959 , Blend_Mask147_g76959);
				float lerpResult6785_g76959 = lerp( ( Main_Alpha316_g76959 * Second_Alpha5007_g76959 ) , lerpResult6153_g76959 , _DetailAlphaMode);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6158_g76959 = lerpResult6785_g76959;
				#else
				float staticSwitch6158_g76959 = Main_Alpha316_g76959;
				#endif
				half Blend_Alpha6157_g76959 = staticSwitch6158_g76959;
				half AlphaTreshold2132_g76959 = _AlphaClipValue;
				half Global_Extras_Alpha1033_g76959 = saturate( break456_g76996.w );
				float lerpResult5154_g76959 = lerp( 0.0 , Global_MeshVariation5104_g76959 , _AlphaVariationValue);
				half Global_Alpha_Variation5158_g76959 = lerpResult5154_g76959;
				float lerpResult6866_g76959 = lerp( ( 1.0 - Blend_Mask147_g76959 ) , 1.0 , _DetailFadeMode);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6612_g76959 = lerpResult6866_g76959;
				#else
				float staticSwitch6612_g76959 = 1.0;
				#endif
				half Blend_Mask_Invert6260_g76959 = staticSwitch6612_g76959;
				half Alpha_Mask6234_g76959 = ( 1.0 * Blend_Mask_Invert6260_g76959 );
				float lerpResult5203_g76959 = lerp( 1.0 , saturate( ( ( Global_Extras_Alpha1033_g76959 - Global_Alpha_Variation5158_g76959 ) + ( Global_Extras_Alpha1033_g76959 * 0.5 ) ) ) , ( Alpha_Mask6234_g76959 * _GlobalAlpha ));
				float lerpResult16_g77012 = lerp( 1.0 , lerpResult5203_g76959 , TVE_IsEnabled);
				half Global_Alpha315_g76959 = lerpResult16_g77012;
				half Fade_Alpha3727_g76959 = 1.0;
				float Emissive_Alpha6927_g76959 = 1.0;
				half Final_Alpha7344_g76959 = min( min( ( Blend_Alpha6157_g76959 - AlphaTreshold2132_g76959 ) , Global_Alpha315_g76959 ) , min( Fade_Alpha3727_g76959 , Emissive_Alpha6927_g76959 ) );
				float temp_output_3_0_g77017 = Final_Alpha7344_g76959;
				float Alpha19_g77017 = temp_output_3_0_g77017;
				float temp_output_15_0_g77017 = 0.01;
				float Treshold19_g77017 = temp_output_15_0_g77017;
				{
				#if defined (TVE_FEATURE_CLIP)
				#if defined (TVE_IS_HD_PIPELINE)
				#if !defined (SHADERPASS_FORWARD_BYPASS_ALPHA_TEST)
				clip(Alpha19_g77017 - Treshold19_g77017);
				#endif
				#if !defined (SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST)
				clip(Alpha19_g77017 - Treshold19_g77017);
				#endif
				#else
				clip(Alpha19_g77017 - Treshold19_g77017);
				#endif
				#endif
				}
				half Main_Color_Alpha6121_g76959 = _MainColor.a;
				half Second_Color_Alpha6152_g76959 = _SecondColor.a;
				float lerpResult6168_g76959 = lerp( Main_Color_Alpha6121_g76959 , Second_Color_Alpha6152_g76959 , Blend_Mask147_g76959);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6174_g76959 = lerpResult6168_g76959;
				#else
				float staticSwitch6174_g76959 = Main_Color_Alpha6121_g76959;
				#endif
				half Blend_Color_Alpha6167_g76959 = staticSwitch6174_g76959;
				half Final_Clip914_g76959 = saturate( ( Alpha19_g77017 * Blend_Color_Alpha6167_g76959 ) );
				

				float3 Normal = switchResult12_g76997;
				float Alpha = Final_Clip914_g76959;
				float AlphaClipThreshold = 0.5;
				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = 0;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODFadeCrossFade( IN.clipPos );
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				#if defined(_GBUFFER_NORMALS_OCT)
					float2 octNormalWS = PackNormalOctQuadEncode(WorldNormal);
					float2 remappedOctNormalWS = saturate(octNormalWS * 0.5 + 0.5);
					half3 packedNormalWS = PackFloat2To888(remappedOctNormalWS);
					outNormalWS = half4(packedNormalWS, 0.0);
				#else
					#if defined(_NORMALMAP)
						#if _NORMAL_DROPOFF_TS
							float crossSign = (WorldTangent.w > 0.0 ? 1.0 : -1.0) * GetOddNegativeScale();
							float3 bitangent = crossSign * cross(WorldNormal.xyz, WorldTangent.xyz);
							float3 normalWS = TransformTangentToWorld(Normal, half3x3(WorldTangent.xyz, bitangent, WorldNormal.xyz));
						#elif _NORMAL_DROPOFF_OS
							float3 normalWS = TransformObjectToWorldNormal(Normal);
						#elif _NORMAL_DROPOFF_WS
							float3 normalWS = Normal;
						#endif
					#else
						float3 normalWS = WorldNormal;
					#endif
					outNormalWS = half4(NormalizeNormalPerPixel(normalWS), 0.0);
				#endif

				#ifdef _WRITE_RENDERING_LAYERS
					uint renderingLayers = GetMeshRenderingLayer();
					outRenderingLayers = float4( EncodeMeshRenderingLayer( renderingLayers ), 0, 0, 0 );
				#endif
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "SceneSelectionPass"
			Tags { "LightMode"="SceneSelectionPass" }

			Cull Off

			HLSLPROGRAM

			#define _SPECULAR_SETUP 1
			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define ASE_TRANSLUCENCY 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140007
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma vertex vert
			#pragma fragment frag

			#define SCENESELECTIONPASS 1

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define SHADERPASS SHADERPASS_DEPTHONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#pragma shader_feature_local_fragment TVE_FEATURE_CLIP
			#pragma shader_feature_local TVE_FEATURE_BATCHING
			#pragma shader_feature_local_fragment TVE_FEATURE_DETAIL
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_UNIVERSAL_PIPELINE
			#define TVE_IS_PLANT_SHADER
			#define TVE_IS_SUBSURFACE_SHADER
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _DetailBlendRemap;
			float4 _GradientMaskRemap;
			half4 _VertexOcclusionRemap;
			half4 _RimLightRemap;
			half4 _MainColor;
			half4 _MainUVs;
			half4 _MotionHighlightColor;
			half4 _EmissiveColor;
			half4 _EmissiveUVs;
			half4 _SecondColor;
			half4 _VertexOcclusionColor;
			half4 _second_uvs_mode;
			float4 _MaxBoundsInfo;
			half4 _SecondUVs;
			half4 _SecondMaskRemap;
			half4 _MainMaskRemap;
			half4 _GradientColorTwo;
			float4 _SubsurfaceDiffusion_Asset;
			float4 _Color;
			float4 _NoiseMaskRemap;
			half4 _SubsurfaceColor;
			half4 _GradientColorOne;
			half3 _render_normals;
			half _SecondAlbedoValue;
			half _DetailMaskIntensity;
			half _DetailMaskMode;
			half _MainAlbedoValue;
			half _DetailBlendMode;
			half _VertexDataMode;
			half _DetailMaskInvertMode;
			half _SizeFadeStartValue;
			half _render_zw;
			half _GlobalSize;
			half _MotionVariation_20;
			half _MotionSpeed_20;
			half _MotionValue_20;
			half _MotionFacingValue;
			half _MotionAmplitude_20;
			half _MotionAmplitude_22;
			float _MotionScale_32;
			half _SizeFadeEndValue;
			float _MotionVariation_32;
			half _MotionValue_30;
			half _MotionAmplitude_32;
			half _PerspectivePushValue;
			half _PerspectiveNoiseValue;
			half _DetailMeshMode;
			half _PerspectiveAngleValue;
			half _LayerVertexValue;
			float _MotionSpeed_32;
			half _DetailMeshInvertMode;
			half _GradientMinValue;
			half _DetailBlendMinValue;
			half _SecondNormalValue;
			half _OverlayProjectionValue;
			half _GlobalWetness;
			half _GlobalEmissive;
			half _EmissivePhaseValue;
			float _emissive_intensity_value;
			half _RenderSpecular;
			half _DetailNormalValue;
			half _MainSmoothnessValue;
			half _MainOcclusionValue;
			half _SecondOcclusionValue;
			half _DetailAlphaMode;
			half _AlphaClipValue;
			half _AlphaVariationValue;
			half _DetailFadeMode;
			half _GlobalAlpha;
			half _SecondSmoothnessValue;
			half _MainNormalValue;
			half _OverlayVariationValue;
			half _ExtrasPositionMode;
			half _DetailBlendMaxValue;
			half _DetailMode;
			half _MotionScale_20;
			half _GradientMaxValue;
			half _MainMaskMinValue;
			half _MainMaskMaxValue;
			half _SecondMaskMinValue;
			half _SecondMaskMaxValue;
			half _VertexOcclusionMinValue;
			half _VertexOcclusionMaxValue;
			half _LayerColorsValue;
			half _ColorsPositionMode;
			half _GlobalColors;
			half _ColorsVariationValue;
			half _ColorsMaskMode;
			half _GlobalOverlay;
			half _LayerExtrasValue;
			half _DetailMeshValue;
			half _InteractionAmplitude;
			float _MotionSpeed_10;
			half _MotionAmplitude_10;
			half _MessageSecondMask;
			half _MessageMotionVariation;
			half _MessageGlobalsVariation;
			half _MessageMainMask;
			half _MessageSubsurface;
			half _IsTVEShader;
			half _IsIdentifier;
			half _MessageOcclusion;
			half _HasOcclusion;
			half _HasEmissive;
			half _VertexVariationMode;
			half _IsCollected;
			half _IsShared;
			half _IsVersion;
			half _RenderCoverage;
			float _EmissiveIntensityValue;
			half _HasGradient;
			half _RenderNormals;
			half _CategoryRender;
			half _RenderMode;
			half _render_coverage;
			half _render_cull;
			half _render_src;
			half _render_dst;
			float _IsPlantShader;
			half _IsSubsurfaceShader;
			float _SubsurfaceDiffusion;
			half _Cutoff;
			half _ColorsMaskMinValue;
			half _ColorsMaskMaxValue;
			half _RenderDecals;
			half _RenderSSR;
			half _RenderZWrite;
			half _RenderClip;
			half _RenderCull;
			half _RenderQueue;
			half _RenderPriority;
			half _DetailTypeMode;
			half _DetailOpaqueMode;
			half _DetailCoordMode;
			half _EmissiveIntensityMode;
			half _SubsurfaceDirectValue;
			half _SubsurfaceAngleValue;
			half _SubsurfaceScatteringValue;
			half _RenderDirect;
			half _CategoryRimLight;
			half _CategoryMatcap;
			half _CategorySubsurface;
			half _CategoryEmissive;
			half _RenderAmbient;
			half _RenderShadow;
			half _IsCoreShader;
			half _VertexPivotMode;
			half _MotionPosition_10;
			float _MotionScale_10;
			half _MotionVariation_10;
			half _VertexDynamicMode;
			half _LayerMotionValue;
			half _SubsurfaceAmbientValue;
			half _InteractionMaskValue;
			half _SubsurfaceShadowValue;
			half _SpaceRenderFade;
			half _EmissiveFlagMode;
			half _SecondUVsMode;
			half _SpaceGlobalLayers;
			half _SpaceGlobalLocals;
			half _SpaceSubsurface;
			half _SpaceMotionLocals;
			half _SpaceMotionGlobals;
			half _SpaceGlobalOptions;
			half _CategoryGlobals;
			half _CategoryMain;
			half _CategoryDetail;
			half _CategoryOcclusion;
			half _CategoryGradient;
			half _CategoryNoise;
			half _CategoryPerspective;
			half _CategorySizeFade;
			half _CategoryMotion;
			half _SubsurfaceNormalValue;
			half _SubsurfaceValue;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			// Property used by ScenePickingPass
			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			// Properties used by SceneSelectionPass
			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(TVE_NoiseTex);
			float3 TVE_WorldOrigin;
			half4 TVE_MotionParams;
			half4 TVE_TimeParams;
			SAMPLER(sampler_Linear_Repeat);
			float TVE_MotionUsage[10];
			TEXTURE2D_ARRAY(TVE_MotionTex);
			half4 TVE_MotionCoords;
			SAMPLER(sampler_Linear_Clamp);
			half TVE_MotionValue_10;
			half TVE_MotionValue_20;
			half TVE_MotionFadeEnd;
			half TVE_MotionFadeStart;
			half TVE_MotionValue_30;
			float TVE_VertexUsage[10];
			TEXTURE2D_ARRAY(TVE_VertexTex);
			half4 TVE_VertexCoords;
			half4 TVE_VertexParams;
			half TVE_DistanceFadeBias;
			half TVE_IsEnabled;
			half _DisableSRPBatcher;
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);
			TEXTURE2D(_SecondAlbedoTex);
			SAMPLER(sampler_SecondAlbedoTex);
			TEXTURE2D(_MainMaskTex);
			TEXTURE2D(_SecondMaskTex);
			float TVE_ExtrasUsage[10];
			TEXTURE2D_ARRAY(TVE_ExtrasTex);
			half4 TVE_ExtrasCoords;
			half4 TVE_ExtrasParams;


			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/SelectionPickingPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			float2 DecodeFloatToVector2( float enc )
			{
				float2 result ;
				result.y = enc % 2048;
				result.x = floor(enc / 2048);
				return result / (2048 - 1);
			}
			

			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};

			VertexOutput VertexFunction(VertexInput v  )
			{
				VertexOutput o;
				ZERO_INITIALIZE(VertexOutput, o);

				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 VertexPosition3588_g76959 = v.vertex.xyz;
				float3 appendResult60_g76970 = (float3(v.ase_texcoord3.x , v.ase_texcoord3.z , v.ase_texcoord3.y));
				half3 Mesh_PivotsData2831_g76959 = ( appendResult60_g76970 * _VertexPivotMode );
				half3 Mesh_PivotsOS2291_g76959 = Mesh_PivotsData2831_g76959;
				float3 temp_output_2283_0_g76959 = ( VertexPosition3588_g76959 - Mesh_PivotsOS2291_g76959 );
				half3 VertexPos40_g77080 = temp_output_2283_0_g76959;
				half3 VertexPos40_g77081 = VertexPos40_g77080;
				float3 appendResult74_g77081 = (float3(VertexPos40_g77081.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g77081 = appendResult74_g77081;
				float3 break84_g77081 = VertexPos40_g77081;
				float3 appendResult81_g77081 = (float3(0.0 , break84_g77081.y , break84_g77081.z));
				half3 VertexPosOtherAxis82_g77081 = appendResult81_g77081;
				float3 ase_worldPos = TransformObjectToWorld( (v.vertex).xyz );
				float3 vertexToFrag3890_g76959 = ase_worldPos;
				float3 WorldPosition3905_g76959 = vertexToFrag3890_g76959;
				float3 WorldPosition_Shifted7477_g76959 = ( WorldPosition3905_g76959 - TVE_WorldOrigin );
				float4x4 break19_g77047 = GetObjectToWorldMatrix();
				float3 appendResult20_g77047 = (float3(break19_g77047[ 0 ][ 3 ] , break19_g77047[ 1 ][ 3 ] , break19_g77047[ 2 ][ 3 ]));
				float3 temp_output_122_0_g77047 = Mesh_PivotsData2831_g76959;
				float3 PivotsOnly105_g77047 = (mul( GetObjectToWorldMatrix(), float4( temp_output_122_0_g77047 , 0.0 ) ).xyz).xyz;
				half3 ObjectData20_g77049 = ( appendResult20_g77047 + PivotsOnly105_g77047 );
				half3 WorldData19_g77049 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g77049 = WorldData19_g77049;
				#else
				float3 staticSwitch14_g77049 = ObjectData20_g77049;
				#endif
				float3 temp_output_114_0_g77047 = staticSwitch14_g77049;
				float3 vertexToFrag4224_g76959 = temp_output_114_0_g77047;
				float3 ObjectPosition4223_g76959 = vertexToFrag4224_g76959;
				float3 ObjectPosition_Shifted7481_g76959 = ( ObjectPosition4223_g76959 - TVE_WorldOrigin );
				float3 lerpResult6766_g76959 = lerp( WorldPosition_Shifted7477_g76959 , ObjectPosition_Shifted7481_g76959 , _MotionPosition_10);
				float3 Motion_10_Position6738_g76959 = lerpResult6766_g76959;
				half3 Input_Position419_g77065 = Motion_10_Position6738_g76959;
				float Input_MotionScale287_g77065 = ( _MotionScale_10 + 0.2 );
				float2 temp_output_597_0_g77065 = (( Input_Position419_g77065 * Input_MotionScale287_g77065 * 0.0075 )).xz;
				float2 temp_output_447_0_g76964 = ((TVE_MotionParams).xy*2.0 + -1.0);
				half2 Global_Wind_DirectionWS4683_g76959 = temp_output_447_0_g76964;
				half2 Input_DirectionWS423_g77065 = Global_Wind_DirectionWS4683_g76959;
				float lerpResult115_g77066 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g77065 = _MotionSpeed_10;
				half Input_MotionVariation284_g77065 = _MotionVariation_10;
				half3 Input_Position167_g77037 = ObjectPosition_Shifted7481_g76959;
				float dotResult156_g77037 = dot( (Input_Position167_g77037).xz , float2( 12.9898,78.233 ) );
				half Vertex_DynamicMode5112_g76959 = _VertexDynamicMode;
				half Input_DynamicMode120_g77037 = Vertex_DynamicMode5112_g76959;
				float Postion_Random162_g77037 = ( sin( dotResult156_g77037 ) * ( 1.0 - Input_DynamicMode120_g77037 ) );
				float Mesh_Variation16_g76959 = v.ase_color.r;
				half Input_Variation124_g77037 = Mesh_Variation16_g76959;
				half ObjectData20_g77039 = frac( ( Postion_Random162_g77037 + Input_Variation124_g77037 ) );
				half WorldData19_g77039 = Input_Variation124_g77037;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g77039 = WorldData19_g77039;
				#else
				float staticSwitch14_g77039 = ObjectData20_g77039;
				#endif
				float clampResult17_g77041 = clamp( staticSwitch14_g77039 , 0.0001 , 0.9999 );
				float Global_MeshVariation5104_g76959 = clampResult17_g77041;
				half Input_GlobalMeshVariation569_g77065 = Global_MeshVariation5104_g76959;
				float temp_output_630_0_g77065 = ( ( ( lerpResult115_g77066 * Input_MotionSpeed62_g77065 ) + ( Input_MotionVariation284_g77065 * Input_GlobalMeshVariation569_g77065 ) ) * 0.03 );
				float temp_output_607_0_g77065 = frac( temp_output_630_0_g77065 );
				float4 lerpResult590_g77065 = lerp( SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g77065 + ( -Input_DirectionWS423_g77065 * temp_output_607_0_g77065 ) ), 0.0 ) , SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g77065 + ( -Input_DirectionWS423_g77065 * frac( ( temp_output_630_0_g77065 + 0.5 ) ) ) ), 0.0 ) , ( abs( ( temp_output_607_0_g77065 - 0.5 ) ) / 0.5 ));
				half4 Noise_Complex703_g77065 = lerpResult590_g77065;
				float2 temp_output_645_0_g77065 = ((Noise_Complex703_g77065).rg*2.0 + -1.0);
				float2 break650_g77065 = temp_output_645_0_g77065;
				float3 appendResult649_g77065 = (float3(break650_g77065.x , 0.0 , break650_g77065.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Global_Noise_OS5548_g76959 = (( mul( GetWorldToObjectMatrix(), float4( appendResult649_g77065 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Noise_DirectionOS487_g77073 = Global_Noise_OS5548_g76959;
				float2 break448_g76964 = temp_output_447_0_g76964;
				float3 appendResult452_g76964 = (float3(break448_g76964.x , 0.0 , break448_g76964.y));
				half2 Global_Wind_DirectionOS5692_g76959 = (( mul( GetWorldToObjectMatrix(), float4( appendResult452_g76964 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Wind_DirectionOS458_g77073 = Global_Wind_DirectionOS5692_g76959;
				float temp_output_84_0_g76973 = _LayerMotionValue;
				float temp_output_19_0_g76977 = TVE_MotionUsage[(int)temp_output_84_0_g76973];
				float4 temp_output_91_19_g76973 = TVE_MotionCoords;
				half2 UV94_g76973 = ( (temp_output_91_19_g76973).zw + ( (temp_output_91_19_g76973).xy * (ObjectPosition4223_g76959).xz ) );
				float4 tex2DArrayNode50_g76973 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_Linear_Clamp, UV94_g76973,temp_output_84_0_g76973, 0.0 );
				float4 temp_output_17_0_g76977 = tex2DArrayNode50_g76973;
				float4 temp_output_112_19_g76973 = TVE_MotionParams;
				float4 temp_output_3_0_g76977 = temp_output_112_19_g76973;
				float4 ifLocalVar18_g76977 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76977 >= 0.5 )
				ifLocalVar18_g76977 = temp_output_17_0_g76977;
				else
				ifLocalVar18_g76977 = temp_output_3_0_g76977;
				float4 lerpResult22_g76977 = lerp( temp_output_3_0_g76977 , temp_output_17_0_g76977 , temp_output_19_0_g76977);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76977 = lerpResult22_g76977;
				#else
				float4 staticSwitch24_g76977 = ifLocalVar18_g76977;
				#endif
				half4 Global_Motion_Params3909_g76959 = staticSwitch24_g76977;
				float4 break322_g76964 = Global_Motion_Params3909_g76959;
				half Global_Wind_Power2223_g76959 = break322_g76964.z;
				half Input_WindPower449_g77073 = Global_Wind_Power2223_g76959;
				float temp_output_565_0_g77073 = ( 1.0 - Input_WindPower449_g77073 );
				float2 lerpResult516_g77073 = lerp( Input_Noise_DirectionOS487_g77073 , Input_Wind_DirectionOS458_g77073 , ( ( 1.0 - ( temp_output_565_0_g77073 * temp_output_565_0_g77073 * temp_output_565_0_g77073 ) ) * 0.6 ));
				half Mesh_Height1524_g76959 = v.ase_color.a;
				half Input_MeshHeight388_g77073 = Mesh_Height1524_g76959;
				half ObjectData20_g77074 = Input_MeshHeight388_g77073;
				float enc62_g76967 = v.ase_texcoord.w;
				float2 localDecodeFloatToVector262_g76967 = DecodeFloatToVector2( enc62_g76967 );
				float2 break63_g76967 = ( localDecodeFloatToVector262_g76967 * 100.0 );
				float Bounds_Height5230_g76959 = break63_g76967.x;
				half Input_BoundsHeight390_g77073 = Bounds_Height5230_g76959;
				half WorldData19_g77074 = ( Input_MeshHeight388_g77073 * Input_MeshHeight388_g77073 * Input_BoundsHeight390_g77073 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g77074 = WorldData19_g77074;
				#else
				float staticSwitch14_g77074 = ObjectData20_g77074;
				#endif
				half Final_Motion10_Mask321_g77073 = ( staticSwitch14_g77074 * 2.0 );
				half Motion_10_Amplitude2258_g76959 = _MotionAmplitude_10;
				half Input_BendingAmplitude376_g77073 = Motion_10_Amplitude2258_g76959;
				half Global_MotionValue640_g77073 = TVE_MotionValue_10;
				half2 Final_Bending631_g77073 = ( lerpResult516_g77073 * ( Final_Motion10_Mask321_g77073 * Input_BendingAmplitude376_g77073 * Input_WindPower449_g77073 * Input_WindPower449_g77073 * Global_MotionValue640_g77073 ) );
				float2 appendResult433_g76964 = (float2(break322_g76964.x , break322_g76964.y));
				float2 temp_output_436_0_g76964 = (appendResult433_g76964*2.0 + -1.0);
				float2 break441_g76964 = temp_output_436_0_g76964;
				float3 appendResult440_g76964 = (float3(break441_g76964.x , 0.0 , break441_g76964.y));
				half2 Global_React_DirectionOS39_g76959 = (( mul( GetWorldToObjectMatrix(), float4( appendResult440_g76964 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_React_DirectionOS358_g77073 = Global_React_DirectionOS39_g76959;
				float clampResult17_g77076 = clamp( Input_MeshHeight388_g77073 , 0.0001 , 0.9999 );
				float temp_output_7_0_g77075 = 0.0;
				half Input_InteractionUseMask62_g77073 = _InteractionMaskValue;
				float temp_output_10_0_g77075 = ( Input_InteractionUseMask62_g77073 - temp_output_7_0_g77075 );
				half Final_InteractionRemap594_g77073 = saturate( ( ( clampResult17_g77076 - temp_output_7_0_g77075 ) / ( temp_output_10_0_g77075 + 0.0001 ) ) );
				half ObjectData20_g77077 = Final_InteractionRemap594_g77073;
				half WorldData19_g77077 = ( Final_InteractionRemap594_g77073 * Final_InteractionRemap594_g77073 * Input_BoundsHeight390_g77073 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g77077 = WorldData19_g77077;
				#else
				float staticSwitch14_g77077 = ObjectData20_g77077;
				#endif
				half Final_InteractionMask373_g77073 = ( staticSwitch14_g77077 * 2.0 );
				half Interaction_Amplitude7501_g76959 = _InteractionAmplitude;
				half Input_InteractionAmplitude58_g77073 = Interaction_Amplitude7501_g76959;
				half2 Final_Interaction632_g77073 = ( Input_React_DirectionOS358_g77073 * Final_InteractionMask373_g77073 * Input_InteractionAmplitude58_g77073 );
				half Global_Interaction_Mask66_g76959 = ( break322_g76964.w * break322_g76964.w * break322_g76964.w * break322_g76964.w );
				float Input_InteractionGlobalMask330_g77073 = Global_Interaction_Mask66_g76959;
				half Final_InteractionValue525_g77073 = saturate( ( Input_InteractionAmplitude58_g77073 * Input_InteractionGlobalMask330_g77073 ) );
				float2 lerpResult551_g77073 = lerp( Final_Bending631_g77073 , Final_Interaction632_g77073 , Final_InteractionValue525_g77073);
				float2 break364_g77073 = lerpResult551_g77073;
				float3 appendResult638_g77073 = (float3(break364_g77073.x , 0.0 , break364_g77073.y));
				half3 Motion_10_Interaction7519_g76959 = appendResult638_g77073;
				half3 Angle44_g77080 = Motion_10_Interaction7519_g76959;
				half Angle44_g77081 = (Angle44_g77080).z;
				half3 VertexPos40_g77082 = ( VertexPosRotationAxis50_g77081 + ( VertexPosOtherAxis82_g77081 * cos( Angle44_g77081 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g77081 ) * sin( Angle44_g77081 ) ) );
				float3 appendResult74_g77082 = (float3(0.0 , 0.0 , VertexPos40_g77082.z));
				half3 VertexPosRotationAxis50_g77082 = appendResult74_g77082;
				float3 break84_g77082 = VertexPos40_g77082;
				float3 appendResult81_g77082 = (float3(break84_g77082.x , break84_g77082.y , 0.0));
				half3 VertexPosOtherAxis82_g77082 = appendResult81_g77082;
				half Angle44_g77082 = -(Angle44_g77080).x;
				half3 Input_Position419_g77078 = WorldPosition_Shifted7477_g76959;
				float3 break459_g77078 = Input_Position419_g77078;
				float Sum_Position446_g77078 = ( break459_g77078.x + break459_g77078.y + break459_g77078.z );
				half Input_MotionScale321_g77078 = ( _MotionScale_20 * 0.1 );
				half Input_MotionVariation330_g77078 = _MotionVariation_20;
				half Input_GlobalVariation400_g77078 = Global_MeshVariation5104_g76959;
				float lerpResult115_g77079 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g77078 = _MotionSpeed_20;
				float temp_output_404_0_g77078 = ( lerpResult115_g77079 * Input_MotionSpeed62_g77078 );
				half Motion_SineA450_g77078 = sin( ( ( Sum_Position446_g77078 * Input_MotionScale321_g77078 ) + ( Input_MotionVariation330_g77078 * Input_GlobalVariation400_g77078 ) + temp_output_404_0_g77078 ) );
				half Motion_SineB395_g77078 = sin( ( ( temp_output_404_0_g77078 * 0.6842 ) + ( Sum_Position446_g77078 * Input_MotionScale321_g77078 ) ) );
				half3 Input_Position419_g76971 = VertexPosition3588_g76959;
				float3 normalizeResult518_g76971 = normalize( Input_Position419_g76971 );
				half2 Input_DirectionOS423_g76971 = Global_React_DirectionOS39_g76959;
				float2 break521_g76971 = -Input_DirectionOS423_g76971;
				float3 appendResult522_g76971 = (float3(break521_g76971.x , 0.0 , break521_g76971.y));
				float dotResult519_g76971 = dot( normalizeResult518_g76971 , appendResult522_g76971 );
				half Input_Value62_g76971 = _MotionFacingValue;
				float lerpResult524_g76971 = lerp( 1.0 , (dotResult519_g76971*0.5 + 0.5) , Input_Value62_g76971);
				half ObjectData20_g76972 = max( lerpResult524_g76971 , 0.001 );
				half WorldData19_g76972 = 1.0;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76972 = WorldData19_g76972;
				#else
				float staticSwitch14_g76972 = ObjectData20_g76972;
				#endif
				half Motion_FacingMask5214_g76959 = staticSwitch14_g76972;
				half Motion_20_Amplitude4381_g76959 = ( _MotionValue_20 * Motion_FacingMask5214_g76959 );
				half Input_MotionAmplitude384_g77078 = Motion_20_Amplitude4381_g76959;
				half Input_GlobalWind407_g77078 = Global_Wind_Power2223_g76959;
				float4 break638_g77065 = abs( Noise_Complex703_g77065 );
				half Global_Noise_B5526_g76959 = break638_g77065.b;
				half Input_GlobalNoise411_g77078 = Global_Noise_B5526_g76959;
				float lerpResult413_g77078 = lerp( 1.6 , 0.4 , Input_GlobalWind407_g77078);
				half Motion_Amplitude418_g77078 = ( Input_MotionAmplitude384_g77078 * Input_GlobalWind407_g77078 * pow( Input_GlobalNoise411_g77078 , lerpResult413_g77078 ) );
				half Input_Squash58_g77078 = _MotionAmplitude_20;
				float enc59_g76967 = v.ase_texcoord.z;
				float2 localDecodeFloatToVector259_g76967 = DecodeFloatToVector2( enc59_g76967 );
				float2 break61_g76967 = localDecodeFloatToVector259_g76967;
				half Mesh_Motion_2060_g76959 = break61_g76967.x;
				half Input_MeshMotion_20388_g77078 = Mesh_Motion_2060_g76959;
				float Bounds_Radius5231_g76959 = break63_g76967.y;
				half Input_BoundsRadius390_g77078 = Bounds_Radius5231_g76959;
				half Global_MotionValue462_g77078 = TVE_MotionValue_20;
				half2 Input_DirectionOS366_g77078 = Global_React_DirectionOS39_g76959;
				float2 break371_g77078 = Input_DirectionOS366_g77078;
				float3 appendResult372_g77078 = (float3(break371_g77078.x , ( Motion_SineA450_g77078 * 0.3 ) , break371_g77078.y));
				half3 Motion_20_Squash4418_g76959 = ( ( (max( Motion_SineA450_g77078 , Motion_SineB395_g77078 )*0.5 + 0.5) * Motion_Amplitude418_g77078 * Input_Squash58_g77078 * Input_MeshMotion_20388_g77078 * Input_BoundsRadius390_g77078 * Global_MotionValue462_g77078 ) * appendResult372_g77078 );
				half3 VertexPos40_g77057 = ( ( VertexPosRotationAxis50_g77082 + ( VertexPosOtherAxis82_g77082 * cos( Angle44_g77082 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g77082 ) * sin( Angle44_g77082 ) ) ) + Motion_20_Squash4418_g76959 );
				float3 appendResult74_g77057 = (float3(0.0 , VertexPos40_g77057.y , 0.0));
				float3 VertexPosRotationAxis50_g77057 = appendResult74_g77057;
				float3 break84_g77057 = VertexPos40_g77057;
				float3 appendResult81_g77057 = (float3(break84_g77057.x , 0.0 , break84_g77057.z));
				float3 VertexPosOtherAxis82_g77057 = appendResult81_g77057;
				half Input_Rolling379_g77078 = _MotionAmplitude_22;
				half Motion_20_Rolling5257_g76959 = ( Motion_SineA450_g77078 * Motion_Amplitude418_g77078 * Input_Rolling379_g77078 * Input_MeshMotion_20388_g77078 * Global_MotionValue462_g77078 );
				half Angle44_g77057 = Motion_20_Rolling5257_g76959;
				half3 Input_Position500_g77069 = WorldPosition_Shifted7477_g76959;
				half Input_MotionScale321_g77069 = _MotionScale_32;
				half Input_MotionVariation330_g77069 = _MotionVariation_32;
				half Input_GlobalVariation372_g77069 = Global_MeshVariation5104_g76959;
				float lerpResult115_g77072 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g77069 = _MotionSpeed_32;
				float4 tex2DNode460_g77069 = SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( ( (Input_Position500_g77069).xz * Input_MotionScale321_g77069 * 0.03 ) + ( Input_MotionVariation330_g77069 * Input_GlobalVariation372_g77069 ) + ( lerpResult115_g77072 * Input_MotionSpeed62_g77069 * 0.02 ) ), 0.0 );
				float3 appendResult462_g77069 = (float3(tex2DNode460_g77069.r , tex2DNode460_g77069.g , tex2DNode460_g77069.b));
				half3 Flutter_Texture489_g77069 = (appendResult462_g77069*2.0 + -1.0);
				float temp_output_7_0_g77027 = TVE_MotionFadeEnd;
				float temp_output_10_0_g77027 = ( TVE_MotionFadeStart - temp_output_7_0_g77027 );
				half Motion_FadeOut4005_g76959 = saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g77027 ) / ( temp_output_10_0_g77027 + 0.0001 ) ) );
				half Motion_30_Amplitude4960_g76959 = ( _MotionValue_30 * _MotionAmplitude_32 * Motion_FacingMask5214_g76959 * Motion_FadeOut4005_g76959 );
				half Input_MotionAmplitude58_g77069 = Motion_30_Amplitude4960_g76959;
				half Mesh_Motion_30144_g76959 = break61_g76967.y;
				half Input_MeshMotion_30374_g77069 = Mesh_Motion_30144_g76959;
				half Input_GlobalWind471_g77069 = Global_Wind_Power2223_g76959;
				half Global_MotionValue503_g77069 = TVE_MotionValue_30;
				half Input_GlobalNoise472_g77069 = Global_Noise_B5526_g76959;
				float lerpResult466_g77069 = lerp( 2.0 , 0.6 , Input_GlobalWind471_g77069);
				half Flutter_Amplitude491_g77069 = ( Input_MotionAmplitude58_g77069 * Input_MeshMotion_30374_g77069 * Input_GlobalWind471_g77069 * Global_MotionValue503_g77069 * pow( Input_GlobalNoise472_g77069 , lerpResult466_g77069 ) );
				half3 Motion_30_Flutter263_g76959 = ( Flutter_Texture489_g77069 * Flutter_Amplitude491_g77069 );
				float3 Vertex_Motion_Object833_g76959 = ( ( VertexPosRotationAxis50_g77057 + ( VertexPosOtherAxis82_g77057 * cos( Angle44_g77057 ) ) + ( cross( float3(0,1,0) , VertexPosOtherAxis82_g77057 ) * sin( Angle44_g77057 ) ) ) + Motion_30_Flutter263_g76959 );
				half3 ObjectData20_g77062 = Vertex_Motion_Object833_g76959;
				float3 temp_output_3474_0_g76959 = ( VertexPosition3588_g76959 - Mesh_PivotsOS2291_g76959 );
				float3 Vertex_Motion_World1118_g76959 = ( ( ( temp_output_3474_0_g76959 + Motion_10_Interaction7519_g76959 ) + Motion_20_Squash4418_g76959 ) + Motion_30_Flutter263_g76959 );
				half3 WorldData19_g77062 = Vertex_Motion_World1118_g76959;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g77062 = WorldData19_g77062;
				#else
				float3 staticSwitch14_g77062 = ObjectData20_g77062;
				#endif
				float3 temp_output_7495_0_g76959 = staticSwitch14_g77062;
				float3 Vertex_Motion7493_g76959 = temp_output_7495_0_g76959;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 normalizeResult2169_g76959 = normalize( ase_worldViewDir );
				float3 ViewDirection3963_g76959 = normalizeResult2169_g76959;
				float3 break2709_g76959 = cross( ViewDirection3963_g76959 , half3(0,1,0) );
				float3 appendResult2710_g76959 = (float3(-break2709_g76959.z , 0.0 , break2709_g76959.x));
				float3 appendResult2667_g76959 = (float3(Global_MeshVariation5104_g76959 , 0.5 , Global_MeshVariation5104_g76959));
				float dotResult2212_g76959 = dot( ViewDirection3963_g76959 , float3(0,1,0) );
				half Mask_HView2656_g76959 = dotResult2212_g76959;
				float saferPower2652_g76959 = abs( Mask_HView2656_g76959 );
				half3 Grass_Perspective2661_g76959 = ( ( ( mul( GetWorldToObjectMatrix(), float4( appendResult2710_g76959 , 0.0 ) ).xyz * _PerspectivePushValue ) + ( (appendResult2667_g76959*2.0 + -1.0) * _PerspectiveNoiseValue ) ) * Mesh_Height1524_g76959 * pow( saferPower2652_g76959 , _PerspectiveAngleValue ) );
				float temp_output_84_0_g76999 = _LayerVertexValue;
				float temp_output_19_0_g77003 = TVE_VertexUsage[(int)temp_output_84_0_g76999];
				float4 temp_output_94_19_g76999 = TVE_VertexCoords;
				half2 UV97_g76999 = ( (temp_output_94_19_g76999).zw + ( (temp_output_94_19_g76999).xy * (ObjectPosition4223_g76959).xz ) );
				float4 tex2DArrayNode50_g76999 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_VertexTex, sampler_Linear_Clamp, UV97_g76999,temp_output_84_0_g76999, 0.0 );
				float4 temp_output_17_0_g77003 = tex2DArrayNode50_g76999;
				float4 temp_output_111_19_g76999 = TVE_VertexParams;
				float4 temp_output_3_0_g77003 = temp_output_111_19_g76999;
				float4 ifLocalVar18_g77003 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g77003 >= 0.5 )
				ifLocalVar18_g77003 = temp_output_17_0_g77003;
				else
				ifLocalVar18_g77003 = temp_output_3_0_g77003;
				float4 lerpResult22_g77003 = lerp( temp_output_3_0_g77003 , temp_output_17_0_g77003 , temp_output_19_0_g77003);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g77003 = lerpResult22_g77003;
				#else
				float4 staticSwitch24_g77003 = ifLocalVar18_g77003;
				#endif
				half4 Global_Vertex_Params4173_g76959 = staticSwitch24_g77003;
				float4 break322_g77004 = Global_Vertex_Params4173_g76959;
				half Global_VertexSize174_g76959 = saturate( break322_g77004.w );
				float lerpResult346_g76959 = lerp( 1.0 , Global_VertexSize174_g76959 , _GlobalSize);
				float3 appendResult3480_g76959 = (float3(lerpResult346_g76959 , lerpResult346_g76959 , lerpResult346_g76959));
				half3 ObjectData20_g77059 = appendResult3480_g76959;
				half3 _Vector11 = half3(1,1,1);
				half3 WorldData19_g77059 = _Vector11;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g77059 = WorldData19_g77059;
				#else
				float3 staticSwitch14_g77059 = ObjectData20_g77059;
				#endif
				half3 Vertex_Size1741_g76959 = staticSwitch14_g77059;
				float temp_output_7_0_g77060 = _SizeFadeEndValue;
				float temp_output_10_0_g77060 = ( _SizeFadeStartValue - temp_output_7_0_g77060 );
				float temp_output_7453_0_g76959 = saturate( ( ( ( distance( _WorldSpaceCameraPos , ObjectPosition4223_g76959 ) * ( 1.0 / TVE_DistanceFadeBias ) ) - temp_output_7_0_g77060 ) / ( temp_output_10_0_g77060 + 0.0001 ) ) );
				float3 appendResult3482_g76959 = (float3(temp_output_7453_0_g76959 , temp_output_7453_0_g76959 , temp_output_7453_0_g76959));
				half3 ObjectData20_g77058 = appendResult3482_g76959;
				half3 _Vector5 = half3(1,1,1);
				half3 WorldData19_g77058 = _Vector5;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g77058 = WorldData19_g77058;
				#else
				float3 staticSwitch14_g77058 = ObjectData20_g77058;
				#endif
				float3 Vertex_SizeFade1740_g76959 = staticSwitch14_g77058;
				float3 lerpResult16_g77063 = lerp( VertexPosition3588_g76959 , ( ( ( Vertex_Motion7493_g76959 + Grass_Perspective2661_g76959 ) * Vertex_Size1741_g76959 * Vertex_SizeFade1740_g76959 ) + Mesh_PivotsOS2291_g76959 ) , TVE_IsEnabled);
				float3 temp_output_4912_0_g76959 = lerpResult16_g77063;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch4976_g76959 = temp_output_4912_0_g76959;
				#else
				float3 staticSwitch4976_g76959 = temp_output_4912_0_g76959;
				#endif
				float3 temp_output_4918_0_g76959 = ( staticSwitch4976_g76959 + ( _VertexDataMode * 0.0 ) );
				float3 Final_VertexPosition890_g76959 = ( temp_output_4918_0_g76959 + _DisableSRPBatcher );
				
				float4 break33_g76991 = _second_uvs_mode;
				float2 temp_output_30_0_g76991 = ( v.ase_texcoord.xy * break33_g76991.x );
				float2 appendResult21_g76967 = (float2(v.ase_texcoord1.z , v.ase_texcoord1.w));
				float2 Mesh_DetailCoord3_g76959 = appendResult21_g76967;
				float2 temp_output_29_0_g76991 = ( Mesh_DetailCoord3_g76959 * break33_g76991.y );
				float2 temp_output_31_0_g76991 = ( (WorldPosition_Shifted7477_g76959).xz * break33_g76991.z );
				float2 vertexToFrag11_g76990 = ( ( ( temp_output_30_0_g76991 + temp_output_29_0_g76991 + temp_output_31_0_g76991 ) * (_SecondUVs).xy ) + (_SecondUVs).zw );
				o.ase_texcoord1.xy = vertexToFrag11_g76990;
				half Mesh_DetailMask90_g76959 = v.ase_color.b;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				half3 WorldNormal4101_g76959 = normalizedWorldNormal;
				float lerpResult5730_g76959 = lerp( (WorldNormal4101_g76959).y , v.ase_normal.y , Vertex_DynamicMode5112_g76959);
				half WorldNormal_Y6811_g76959 = lerpResult5730_g76959;
				float lerpResult6884_g76959 = lerp( Mesh_DetailMask90_g76959 , (WorldNormal_Y6811_g76959*0.5 + 0.5) , _DetailMeshMode);
				float lerpResult7357_g76959 = lerp( lerpResult6884_g76959 , ( 1.0 - lerpResult6884_g76959 ) , _DetailMeshInvertMode);
				float lerpResult7546_g76959 = lerp( 1.0 , lerpResult7357_g76959 , _DetailMeshValue);
				float vertexToFrag11_g77083 = lerpResult7546_g76959;
				o.ase_texcoord1.z = vertexToFrag11_g77083;
				o.ase_texcoord2.xyz = vertexToFrag3890_g76959;
				o.ase_texcoord3.xyz = vertexToFrag4224_g76959;
				
				o.ase_texcoord = v.ase_texcoord;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord1.w = 0;
				o.ase_texcoord2.w = 0;
				o.ase_texcoord3.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = Final_VertexPosition890_g76959;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );

				o.clipPos = TransformWorldToHClip(positionWS);

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord1 = v.ase_texcoord1;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN ) : SV_TARGET
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				float localCustomAlphaClip19_g77017 = ( 0.0 );
				half2 Main_UVs15_g76959 = ( ( IN.ase_texcoord.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g76959 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g76959 );
				half Main_Alpha316_g76959 = tex2DNode29_g76959.a;
				float2 vertexToFrag11_g76990 = IN.ase_texcoord1.xy;
				half2 Second_UVs17_g76959 = vertexToFrag11_g76990;
				float4 tex2DNode89_g76959 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, Second_UVs17_g76959 );
				half Second_Alpha5007_g76959 = tex2DNode89_g76959.a;
				float4 tex2DNode35_g76959 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_Linear_Repeat, Main_UVs15_g76959 );
				half Main_Mask57_g76959 = tex2DNode35_g76959.b;
				float4 tex2DNode33_g76959 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_Linear_Repeat, Second_UVs17_g76959 );
				half Second_Mask81_g76959 = tex2DNode33_g76959.b;
				float lerpResult6885_g76959 = lerp( Main_Mask57_g76959 , Second_Mask81_g76959 , _DetailMaskMode);
				float lerpResult7354_g76959 = lerp( lerpResult6885_g76959 , ( 1.0 - lerpResult6885_g76959 ) , _DetailMaskInvertMode);
				float lerpResult7547_g76959 = lerp( 1.0 , lerpResult7354_g76959 , _DetailMaskIntensity);
				half Blend_Mask_Texture6794_g76959 = lerpResult7547_g76959;
				float vertexToFrag11_g77083 = IN.ase_texcoord1.z;
				half Blend_Mask_Mesh1540_g76959 = vertexToFrag11_g77083;
				float clampResult17_g77023 = clamp( ( Blend_Mask_Texture6794_g76959 * Blend_Mask_Mesh1540_g76959 ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g77032 = _DetailBlendMinValue;
				float temp_output_10_0_g77032 = ( _DetailBlendMaxValue - temp_output_7_0_g77032 );
				half Blend_Mask147_g76959 = ( saturate( ( ( clampResult17_g77023 - temp_output_7_0_g77032 ) / ( temp_output_10_0_g77032 + 0.0001 ) ) ) * _DetailMode );
				float lerpResult6153_g76959 = lerp( Main_Alpha316_g76959 , Second_Alpha5007_g76959 , Blend_Mask147_g76959);
				float lerpResult6785_g76959 = lerp( ( Main_Alpha316_g76959 * Second_Alpha5007_g76959 ) , lerpResult6153_g76959 , _DetailAlphaMode);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6158_g76959 = lerpResult6785_g76959;
				#else
				float staticSwitch6158_g76959 = Main_Alpha316_g76959;
				#endif
				half Blend_Alpha6157_g76959 = staticSwitch6158_g76959;
				half AlphaTreshold2132_g76959 = _AlphaClipValue;
				float temp_output_84_0_g76978 = _LayerExtrasValue;
				float temp_output_19_0_g76982 = TVE_ExtrasUsage[(int)temp_output_84_0_g76978];
				float4 temp_output_93_19_g76978 = TVE_ExtrasCoords;
				float3 vertexToFrag3890_g76959 = IN.ase_texcoord2.xyz;
				float3 WorldPosition3905_g76959 = vertexToFrag3890_g76959;
				float3 vertexToFrag4224_g76959 = IN.ase_texcoord3.xyz;
				float3 ObjectPosition4223_g76959 = vertexToFrag4224_g76959;
				float3 lerpResult4827_g76959 = lerp( WorldPosition3905_g76959 , ObjectPosition4223_g76959 , _ExtrasPositionMode);
				half2 UV96_g76978 = ( (temp_output_93_19_g76978).zw + ( (temp_output_93_19_g76978).xy * (lerpResult4827_g76959).xz ) );
				float4 tex2DArrayNode48_g76978 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ExtrasTex, sampler_Linear_Clamp, UV96_g76978,temp_output_84_0_g76978, 0.0 );
				float4 temp_output_17_0_g76982 = tex2DArrayNode48_g76978;
				float4 temp_output_94_85_g76978 = TVE_ExtrasParams;
				float4 temp_output_3_0_g76982 = temp_output_94_85_g76978;
				float4 ifLocalVar18_g76982 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76982 >= 0.5 )
				ifLocalVar18_g76982 = temp_output_17_0_g76982;
				else
				ifLocalVar18_g76982 = temp_output_3_0_g76982;
				float4 lerpResult22_g76982 = lerp( temp_output_3_0_g76982 , temp_output_17_0_g76982 , temp_output_19_0_g76982);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76982 = lerpResult22_g76982;
				#else
				float4 staticSwitch24_g76982 = ifLocalVar18_g76982;
				#endif
				half4 Global_Extras_Params5440_g76959 = staticSwitch24_g76982;
				float4 break456_g76996 = Global_Extras_Params5440_g76959;
				half Global_Extras_Alpha1033_g76959 = saturate( break456_g76996.w );
				float3 ObjectPosition_Shifted7481_g76959 = ( ObjectPosition4223_g76959 - TVE_WorldOrigin );
				half3 Input_Position167_g77037 = ObjectPosition_Shifted7481_g76959;
				float dotResult156_g77037 = dot( (Input_Position167_g77037).xz , float2( 12.9898,78.233 ) );
				half Vertex_DynamicMode5112_g76959 = _VertexDynamicMode;
				half Input_DynamicMode120_g77037 = Vertex_DynamicMode5112_g76959;
				float Postion_Random162_g77037 = ( sin( dotResult156_g77037 ) * ( 1.0 - Input_DynamicMode120_g77037 ) );
				float Mesh_Variation16_g76959 = IN.ase_color.r;
				half Input_Variation124_g77037 = Mesh_Variation16_g76959;
				half ObjectData20_g77039 = frac( ( Postion_Random162_g77037 + Input_Variation124_g77037 ) );
				half WorldData19_g77039 = Input_Variation124_g77037;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g77039 = WorldData19_g77039;
				#else
				float staticSwitch14_g77039 = ObjectData20_g77039;
				#endif
				float clampResult17_g77041 = clamp( staticSwitch14_g77039 , 0.0001 , 0.9999 );
				float Global_MeshVariation5104_g76959 = clampResult17_g77041;
				float lerpResult5154_g76959 = lerp( 0.0 , Global_MeshVariation5104_g76959 , _AlphaVariationValue);
				half Global_Alpha_Variation5158_g76959 = lerpResult5154_g76959;
				float lerpResult6866_g76959 = lerp( ( 1.0 - Blend_Mask147_g76959 ) , 1.0 , _DetailFadeMode);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6612_g76959 = lerpResult6866_g76959;
				#else
				float staticSwitch6612_g76959 = 1.0;
				#endif
				half Blend_Mask_Invert6260_g76959 = staticSwitch6612_g76959;
				half Alpha_Mask6234_g76959 = ( 1.0 * Blend_Mask_Invert6260_g76959 );
				float lerpResult5203_g76959 = lerp( 1.0 , saturate( ( ( Global_Extras_Alpha1033_g76959 - Global_Alpha_Variation5158_g76959 ) + ( Global_Extras_Alpha1033_g76959 * 0.5 ) ) ) , ( Alpha_Mask6234_g76959 * _GlobalAlpha ));
				float lerpResult16_g77012 = lerp( 1.0 , lerpResult5203_g76959 , TVE_IsEnabled);
				half Global_Alpha315_g76959 = lerpResult16_g77012;
				half Fade_Alpha3727_g76959 = 1.0;
				float Emissive_Alpha6927_g76959 = 1.0;
				half Final_Alpha7344_g76959 = min( min( ( Blend_Alpha6157_g76959 - AlphaTreshold2132_g76959 ) , Global_Alpha315_g76959 ) , min( Fade_Alpha3727_g76959 , Emissive_Alpha6927_g76959 ) );
				float temp_output_3_0_g77017 = Final_Alpha7344_g76959;
				float Alpha19_g77017 = temp_output_3_0_g77017;
				float temp_output_15_0_g77017 = 0.01;
				float Treshold19_g77017 = temp_output_15_0_g77017;
				{
				#if defined (TVE_FEATURE_CLIP)
				#if defined (TVE_IS_HD_PIPELINE)
				#if !defined (SHADERPASS_FORWARD_BYPASS_ALPHA_TEST)
				clip(Alpha19_g77017 - Treshold19_g77017);
				#endif
				#if !defined (SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST)
				clip(Alpha19_g77017 - Treshold19_g77017);
				#endif
				#else
				clip(Alpha19_g77017 - Treshold19_g77017);
				#endif
				#endif
				}
				half Main_Color_Alpha6121_g76959 = _MainColor.a;
				half Second_Color_Alpha6152_g76959 = _SecondColor.a;
				float lerpResult6168_g76959 = lerp( Main_Color_Alpha6121_g76959 , Second_Color_Alpha6152_g76959 , Blend_Mask147_g76959);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6174_g76959 = lerpResult6168_g76959;
				#else
				float staticSwitch6174_g76959 = Main_Color_Alpha6121_g76959;
				#endif
				half Blend_Color_Alpha6167_g76959 = staticSwitch6174_g76959;
				half Final_Clip914_g76959 = saturate( ( Alpha19_g77017 * Blend_Color_Alpha6167_g76959 ) );
				

				surfaceDescription.Alpha = Final_Clip914_g76959;
				surfaceDescription.AlphaClipThreshold = 0.5;

				#if _ALPHATEST_ON
					float alphaClipThreshold = 0.01f;
					#if ALPHA_CLIP_THRESHOLD
						alphaClipThreshold = surfaceDescription.AlphaClipThreshold;
					#endif
					clip(surfaceDescription.Alpha - alphaClipThreshold);
				#endif

				half4 outColor = 0;

				#ifdef SCENESELECTIONPASS
					outColor = half4(_ObjectId, _PassValue, 1.0, 1.0);
				#elif defined(SCENEPICKINGPASS)
					outColor = _SelectionID;
				#endif

				return outColor;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "ScenePickingPass"
			Tags { "LightMode"="Picking" }

			HLSLPROGRAM

			#define _SPECULAR_SETUP 1
			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define ASE_TRANSLUCENCY 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140007
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma vertex vert
			#pragma fragment frag

		    #define SCENEPICKINGPASS 1

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define SHADERPASS SHADERPASS_DEPTHONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#pragma shader_feature_local_fragment TVE_FEATURE_CLIP
			#pragma shader_feature_local TVE_FEATURE_BATCHING
			#pragma shader_feature_local_fragment TVE_FEATURE_DETAIL
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_UNIVERSAL_PIPELINE
			#define TVE_IS_PLANT_SHADER
			#define TVE_IS_SUBSURFACE_SHADER
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _DetailBlendRemap;
			float4 _GradientMaskRemap;
			half4 _VertexOcclusionRemap;
			half4 _RimLightRemap;
			half4 _MainColor;
			half4 _MainUVs;
			half4 _MotionHighlightColor;
			half4 _EmissiveColor;
			half4 _EmissiveUVs;
			half4 _SecondColor;
			half4 _VertexOcclusionColor;
			half4 _second_uvs_mode;
			float4 _MaxBoundsInfo;
			half4 _SecondUVs;
			half4 _SecondMaskRemap;
			half4 _MainMaskRemap;
			half4 _GradientColorTwo;
			float4 _SubsurfaceDiffusion_Asset;
			float4 _Color;
			float4 _NoiseMaskRemap;
			half4 _SubsurfaceColor;
			half4 _GradientColorOne;
			half3 _render_normals;
			half _SecondAlbedoValue;
			half _DetailMaskIntensity;
			half _DetailMaskMode;
			half _MainAlbedoValue;
			half _DetailBlendMode;
			half _VertexDataMode;
			half _DetailMaskInvertMode;
			half _SizeFadeStartValue;
			half _render_zw;
			half _GlobalSize;
			half _MotionVariation_20;
			half _MotionSpeed_20;
			half _MotionValue_20;
			half _MotionFacingValue;
			half _MotionAmplitude_20;
			half _MotionAmplitude_22;
			float _MotionScale_32;
			half _SizeFadeEndValue;
			float _MotionVariation_32;
			half _MotionValue_30;
			half _MotionAmplitude_32;
			half _PerspectivePushValue;
			half _PerspectiveNoiseValue;
			half _DetailMeshMode;
			half _PerspectiveAngleValue;
			half _LayerVertexValue;
			float _MotionSpeed_32;
			half _DetailMeshInvertMode;
			half _GradientMinValue;
			half _DetailBlendMinValue;
			half _SecondNormalValue;
			half _OverlayProjectionValue;
			half _GlobalWetness;
			half _GlobalEmissive;
			half _EmissivePhaseValue;
			float _emissive_intensity_value;
			half _RenderSpecular;
			half _DetailNormalValue;
			half _MainSmoothnessValue;
			half _MainOcclusionValue;
			half _SecondOcclusionValue;
			half _DetailAlphaMode;
			half _AlphaClipValue;
			half _AlphaVariationValue;
			half _DetailFadeMode;
			half _GlobalAlpha;
			half _SecondSmoothnessValue;
			half _MainNormalValue;
			half _OverlayVariationValue;
			half _ExtrasPositionMode;
			half _DetailBlendMaxValue;
			half _DetailMode;
			half _MotionScale_20;
			half _GradientMaxValue;
			half _MainMaskMinValue;
			half _MainMaskMaxValue;
			half _SecondMaskMinValue;
			half _SecondMaskMaxValue;
			half _VertexOcclusionMinValue;
			half _VertexOcclusionMaxValue;
			half _LayerColorsValue;
			half _ColorsPositionMode;
			half _GlobalColors;
			half _ColorsVariationValue;
			half _ColorsMaskMode;
			half _GlobalOverlay;
			half _LayerExtrasValue;
			half _DetailMeshValue;
			half _InteractionAmplitude;
			float _MotionSpeed_10;
			half _MotionAmplitude_10;
			half _MessageSecondMask;
			half _MessageMotionVariation;
			half _MessageGlobalsVariation;
			half _MessageMainMask;
			half _MessageSubsurface;
			half _IsTVEShader;
			half _IsIdentifier;
			half _MessageOcclusion;
			half _HasOcclusion;
			half _HasEmissive;
			half _VertexVariationMode;
			half _IsCollected;
			half _IsShared;
			half _IsVersion;
			half _RenderCoverage;
			float _EmissiveIntensityValue;
			half _HasGradient;
			half _RenderNormals;
			half _CategoryRender;
			half _RenderMode;
			half _render_coverage;
			half _render_cull;
			half _render_src;
			half _render_dst;
			float _IsPlantShader;
			half _IsSubsurfaceShader;
			float _SubsurfaceDiffusion;
			half _Cutoff;
			half _ColorsMaskMinValue;
			half _ColorsMaskMaxValue;
			half _RenderDecals;
			half _RenderSSR;
			half _RenderZWrite;
			half _RenderClip;
			half _RenderCull;
			half _RenderQueue;
			half _RenderPriority;
			half _DetailTypeMode;
			half _DetailOpaqueMode;
			half _DetailCoordMode;
			half _EmissiveIntensityMode;
			half _SubsurfaceDirectValue;
			half _SubsurfaceAngleValue;
			half _SubsurfaceScatteringValue;
			half _RenderDirect;
			half _CategoryRimLight;
			half _CategoryMatcap;
			half _CategorySubsurface;
			half _CategoryEmissive;
			half _RenderAmbient;
			half _RenderShadow;
			half _IsCoreShader;
			half _VertexPivotMode;
			half _MotionPosition_10;
			float _MotionScale_10;
			half _MotionVariation_10;
			half _VertexDynamicMode;
			half _LayerMotionValue;
			half _SubsurfaceAmbientValue;
			half _InteractionMaskValue;
			half _SubsurfaceShadowValue;
			half _SpaceRenderFade;
			half _EmissiveFlagMode;
			half _SecondUVsMode;
			half _SpaceGlobalLayers;
			half _SpaceGlobalLocals;
			half _SpaceSubsurface;
			half _SpaceMotionLocals;
			half _SpaceMotionGlobals;
			half _SpaceGlobalOptions;
			half _CategoryGlobals;
			half _CategoryMain;
			half _CategoryDetail;
			half _CategoryOcclusion;
			half _CategoryGradient;
			half _CategoryNoise;
			half _CategoryPerspective;
			half _CategorySizeFade;
			half _CategoryMotion;
			half _SubsurfaceNormalValue;
			half _SubsurfaceValue;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			// Property used by ScenePickingPass
			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			// Properties used by SceneSelectionPass
			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(TVE_NoiseTex);
			float3 TVE_WorldOrigin;
			half4 TVE_MotionParams;
			half4 TVE_TimeParams;
			SAMPLER(sampler_Linear_Repeat);
			float TVE_MotionUsage[10];
			TEXTURE2D_ARRAY(TVE_MotionTex);
			half4 TVE_MotionCoords;
			SAMPLER(sampler_Linear_Clamp);
			half TVE_MotionValue_10;
			half TVE_MotionValue_20;
			half TVE_MotionFadeEnd;
			half TVE_MotionFadeStart;
			half TVE_MotionValue_30;
			float TVE_VertexUsage[10];
			TEXTURE2D_ARRAY(TVE_VertexTex);
			half4 TVE_VertexCoords;
			half4 TVE_VertexParams;
			half TVE_DistanceFadeBias;
			half TVE_IsEnabled;
			half _DisableSRPBatcher;
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);
			TEXTURE2D(_SecondAlbedoTex);
			SAMPLER(sampler_SecondAlbedoTex);
			TEXTURE2D(_MainMaskTex);
			TEXTURE2D(_SecondMaskTex);
			float TVE_ExtrasUsage[10];
			TEXTURE2D_ARRAY(TVE_ExtrasTex);
			half4 TVE_ExtrasCoords;
			half4 TVE_ExtrasParams;


			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/SelectionPickingPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			float2 DecodeFloatToVector2( float enc )
			{
				float2 result ;
				result.y = enc % 2048;
				result.x = floor(enc / 2048);
				return result / (2048 - 1);
			}
			

			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};

			VertexOutput VertexFunction(VertexInput v  )
			{
				VertexOutput o;
				ZERO_INITIALIZE(VertexOutput, o);

				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 VertexPosition3588_g76959 = v.vertex.xyz;
				float3 appendResult60_g76970 = (float3(v.ase_texcoord3.x , v.ase_texcoord3.z , v.ase_texcoord3.y));
				half3 Mesh_PivotsData2831_g76959 = ( appendResult60_g76970 * _VertexPivotMode );
				half3 Mesh_PivotsOS2291_g76959 = Mesh_PivotsData2831_g76959;
				float3 temp_output_2283_0_g76959 = ( VertexPosition3588_g76959 - Mesh_PivotsOS2291_g76959 );
				half3 VertexPos40_g77080 = temp_output_2283_0_g76959;
				half3 VertexPos40_g77081 = VertexPos40_g77080;
				float3 appendResult74_g77081 = (float3(VertexPos40_g77081.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g77081 = appendResult74_g77081;
				float3 break84_g77081 = VertexPos40_g77081;
				float3 appendResult81_g77081 = (float3(0.0 , break84_g77081.y , break84_g77081.z));
				half3 VertexPosOtherAxis82_g77081 = appendResult81_g77081;
				float3 ase_worldPos = TransformObjectToWorld( (v.vertex).xyz );
				float3 vertexToFrag3890_g76959 = ase_worldPos;
				float3 WorldPosition3905_g76959 = vertexToFrag3890_g76959;
				float3 WorldPosition_Shifted7477_g76959 = ( WorldPosition3905_g76959 - TVE_WorldOrigin );
				float4x4 break19_g77047 = GetObjectToWorldMatrix();
				float3 appendResult20_g77047 = (float3(break19_g77047[ 0 ][ 3 ] , break19_g77047[ 1 ][ 3 ] , break19_g77047[ 2 ][ 3 ]));
				float3 temp_output_122_0_g77047 = Mesh_PivotsData2831_g76959;
				float3 PivotsOnly105_g77047 = (mul( GetObjectToWorldMatrix(), float4( temp_output_122_0_g77047 , 0.0 ) ).xyz).xyz;
				half3 ObjectData20_g77049 = ( appendResult20_g77047 + PivotsOnly105_g77047 );
				half3 WorldData19_g77049 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g77049 = WorldData19_g77049;
				#else
				float3 staticSwitch14_g77049 = ObjectData20_g77049;
				#endif
				float3 temp_output_114_0_g77047 = staticSwitch14_g77049;
				float3 vertexToFrag4224_g76959 = temp_output_114_0_g77047;
				float3 ObjectPosition4223_g76959 = vertexToFrag4224_g76959;
				float3 ObjectPosition_Shifted7481_g76959 = ( ObjectPosition4223_g76959 - TVE_WorldOrigin );
				float3 lerpResult6766_g76959 = lerp( WorldPosition_Shifted7477_g76959 , ObjectPosition_Shifted7481_g76959 , _MotionPosition_10);
				float3 Motion_10_Position6738_g76959 = lerpResult6766_g76959;
				half3 Input_Position419_g77065 = Motion_10_Position6738_g76959;
				float Input_MotionScale287_g77065 = ( _MotionScale_10 + 0.2 );
				float2 temp_output_597_0_g77065 = (( Input_Position419_g77065 * Input_MotionScale287_g77065 * 0.0075 )).xz;
				float2 temp_output_447_0_g76964 = ((TVE_MotionParams).xy*2.0 + -1.0);
				half2 Global_Wind_DirectionWS4683_g76959 = temp_output_447_0_g76964;
				half2 Input_DirectionWS423_g77065 = Global_Wind_DirectionWS4683_g76959;
				float lerpResult115_g77066 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g77065 = _MotionSpeed_10;
				half Input_MotionVariation284_g77065 = _MotionVariation_10;
				half3 Input_Position167_g77037 = ObjectPosition_Shifted7481_g76959;
				float dotResult156_g77037 = dot( (Input_Position167_g77037).xz , float2( 12.9898,78.233 ) );
				half Vertex_DynamicMode5112_g76959 = _VertexDynamicMode;
				half Input_DynamicMode120_g77037 = Vertex_DynamicMode5112_g76959;
				float Postion_Random162_g77037 = ( sin( dotResult156_g77037 ) * ( 1.0 - Input_DynamicMode120_g77037 ) );
				float Mesh_Variation16_g76959 = v.ase_color.r;
				half Input_Variation124_g77037 = Mesh_Variation16_g76959;
				half ObjectData20_g77039 = frac( ( Postion_Random162_g77037 + Input_Variation124_g77037 ) );
				half WorldData19_g77039 = Input_Variation124_g77037;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g77039 = WorldData19_g77039;
				#else
				float staticSwitch14_g77039 = ObjectData20_g77039;
				#endif
				float clampResult17_g77041 = clamp( staticSwitch14_g77039 , 0.0001 , 0.9999 );
				float Global_MeshVariation5104_g76959 = clampResult17_g77041;
				half Input_GlobalMeshVariation569_g77065 = Global_MeshVariation5104_g76959;
				float temp_output_630_0_g77065 = ( ( ( lerpResult115_g77066 * Input_MotionSpeed62_g77065 ) + ( Input_MotionVariation284_g77065 * Input_GlobalMeshVariation569_g77065 ) ) * 0.03 );
				float temp_output_607_0_g77065 = frac( temp_output_630_0_g77065 );
				float4 lerpResult590_g77065 = lerp( SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g77065 + ( -Input_DirectionWS423_g77065 * temp_output_607_0_g77065 ) ), 0.0 ) , SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g77065 + ( -Input_DirectionWS423_g77065 * frac( ( temp_output_630_0_g77065 + 0.5 ) ) ) ), 0.0 ) , ( abs( ( temp_output_607_0_g77065 - 0.5 ) ) / 0.5 ));
				half4 Noise_Complex703_g77065 = lerpResult590_g77065;
				float2 temp_output_645_0_g77065 = ((Noise_Complex703_g77065).rg*2.0 + -1.0);
				float2 break650_g77065 = temp_output_645_0_g77065;
				float3 appendResult649_g77065 = (float3(break650_g77065.x , 0.0 , break650_g77065.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Global_Noise_OS5548_g76959 = (( mul( GetWorldToObjectMatrix(), float4( appendResult649_g77065 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Noise_DirectionOS487_g77073 = Global_Noise_OS5548_g76959;
				float2 break448_g76964 = temp_output_447_0_g76964;
				float3 appendResult452_g76964 = (float3(break448_g76964.x , 0.0 , break448_g76964.y));
				half2 Global_Wind_DirectionOS5692_g76959 = (( mul( GetWorldToObjectMatrix(), float4( appendResult452_g76964 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Wind_DirectionOS458_g77073 = Global_Wind_DirectionOS5692_g76959;
				float temp_output_84_0_g76973 = _LayerMotionValue;
				float temp_output_19_0_g76977 = TVE_MotionUsage[(int)temp_output_84_0_g76973];
				float4 temp_output_91_19_g76973 = TVE_MotionCoords;
				half2 UV94_g76973 = ( (temp_output_91_19_g76973).zw + ( (temp_output_91_19_g76973).xy * (ObjectPosition4223_g76959).xz ) );
				float4 tex2DArrayNode50_g76973 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_Linear_Clamp, UV94_g76973,temp_output_84_0_g76973, 0.0 );
				float4 temp_output_17_0_g76977 = tex2DArrayNode50_g76973;
				float4 temp_output_112_19_g76973 = TVE_MotionParams;
				float4 temp_output_3_0_g76977 = temp_output_112_19_g76973;
				float4 ifLocalVar18_g76977 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76977 >= 0.5 )
				ifLocalVar18_g76977 = temp_output_17_0_g76977;
				else
				ifLocalVar18_g76977 = temp_output_3_0_g76977;
				float4 lerpResult22_g76977 = lerp( temp_output_3_0_g76977 , temp_output_17_0_g76977 , temp_output_19_0_g76977);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76977 = lerpResult22_g76977;
				#else
				float4 staticSwitch24_g76977 = ifLocalVar18_g76977;
				#endif
				half4 Global_Motion_Params3909_g76959 = staticSwitch24_g76977;
				float4 break322_g76964 = Global_Motion_Params3909_g76959;
				half Global_Wind_Power2223_g76959 = break322_g76964.z;
				half Input_WindPower449_g77073 = Global_Wind_Power2223_g76959;
				float temp_output_565_0_g77073 = ( 1.0 - Input_WindPower449_g77073 );
				float2 lerpResult516_g77073 = lerp( Input_Noise_DirectionOS487_g77073 , Input_Wind_DirectionOS458_g77073 , ( ( 1.0 - ( temp_output_565_0_g77073 * temp_output_565_0_g77073 * temp_output_565_0_g77073 ) ) * 0.6 ));
				half Mesh_Height1524_g76959 = v.ase_color.a;
				half Input_MeshHeight388_g77073 = Mesh_Height1524_g76959;
				half ObjectData20_g77074 = Input_MeshHeight388_g77073;
				float enc62_g76967 = v.ase_texcoord.w;
				float2 localDecodeFloatToVector262_g76967 = DecodeFloatToVector2( enc62_g76967 );
				float2 break63_g76967 = ( localDecodeFloatToVector262_g76967 * 100.0 );
				float Bounds_Height5230_g76959 = break63_g76967.x;
				half Input_BoundsHeight390_g77073 = Bounds_Height5230_g76959;
				half WorldData19_g77074 = ( Input_MeshHeight388_g77073 * Input_MeshHeight388_g77073 * Input_BoundsHeight390_g77073 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g77074 = WorldData19_g77074;
				#else
				float staticSwitch14_g77074 = ObjectData20_g77074;
				#endif
				half Final_Motion10_Mask321_g77073 = ( staticSwitch14_g77074 * 2.0 );
				half Motion_10_Amplitude2258_g76959 = _MotionAmplitude_10;
				half Input_BendingAmplitude376_g77073 = Motion_10_Amplitude2258_g76959;
				half Global_MotionValue640_g77073 = TVE_MotionValue_10;
				half2 Final_Bending631_g77073 = ( lerpResult516_g77073 * ( Final_Motion10_Mask321_g77073 * Input_BendingAmplitude376_g77073 * Input_WindPower449_g77073 * Input_WindPower449_g77073 * Global_MotionValue640_g77073 ) );
				float2 appendResult433_g76964 = (float2(break322_g76964.x , break322_g76964.y));
				float2 temp_output_436_0_g76964 = (appendResult433_g76964*2.0 + -1.0);
				float2 break441_g76964 = temp_output_436_0_g76964;
				float3 appendResult440_g76964 = (float3(break441_g76964.x , 0.0 , break441_g76964.y));
				half2 Global_React_DirectionOS39_g76959 = (( mul( GetWorldToObjectMatrix(), float4( appendResult440_g76964 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_React_DirectionOS358_g77073 = Global_React_DirectionOS39_g76959;
				float clampResult17_g77076 = clamp( Input_MeshHeight388_g77073 , 0.0001 , 0.9999 );
				float temp_output_7_0_g77075 = 0.0;
				half Input_InteractionUseMask62_g77073 = _InteractionMaskValue;
				float temp_output_10_0_g77075 = ( Input_InteractionUseMask62_g77073 - temp_output_7_0_g77075 );
				half Final_InteractionRemap594_g77073 = saturate( ( ( clampResult17_g77076 - temp_output_7_0_g77075 ) / ( temp_output_10_0_g77075 + 0.0001 ) ) );
				half ObjectData20_g77077 = Final_InteractionRemap594_g77073;
				half WorldData19_g77077 = ( Final_InteractionRemap594_g77073 * Final_InteractionRemap594_g77073 * Input_BoundsHeight390_g77073 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g77077 = WorldData19_g77077;
				#else
				float staticSwitch14_g77077 = ObjectData20_g77077;
				#endif
				half Final_InteractionMask373_g77073 = ( staticSwitch14_g77077 * 2.0 );
				half Interaction_Amplitude7501_g76959 = _InteractionAmplitude;
				half Input_InteractionAmplitude58_g77073 = Interaction_Amplitude7501_g76959;
				half2 Final_Interaction632_g77073 = ( Input_React_DirectionOS358_g77073 * Final_InteractionMask373_g77073 * Input_InteractionAmplitude58_g77073 );
				half Global_Interaction_Mask66_g76959 = ( break322_g76964.w * break322_g76964.w * break322_g76964.w * break322_g76964.w );
				float Input_InteractionGlobalMask330_g77073 = Global_Interaction_Mask66_g76959;
				half Final_InteractionValue525_g77073 = saturate( ( Input_InteractionAmplitude58_g77073 * Input_InteractionGlobalMask330_g77073 ) );
				float2 lerpResult551_g77073 = lerp( Final_Bending631_g77073 , Final_Interaction632_g77073 , Final_InteractionValue525_g77073);
				float2 break364_g77073 = lerpResult551_g77073;
				float3 appendResult638_g77073 = (float3(break364_g77073.x , 0.0 , break364_g77073.y));
				half3 Motion_10_Interaction7519_g76959 = appendResult638_g77073;
				half3 Angle44_g77080 = Motion_10_Interaction7519_g76959;
				half Angle44_g77081 = (Angle44_g77080).z;
				half3 VertexPos40_g77082 = ( VertexPosRotationAxis50_g77081 + ( VertexPosOtherAxis82_g77081 * cos( Angle44_g77081 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g77081 ) * sin( Angle44_g77081 ) ) );
				float3 appendResult74_g77082 = (float3(0.0 , 0.0 , VertexPos40_g77082.z));
				half3 VertexPosRotationAxis50_g77082 = appendResult74_g77082;
				float3 break84_g77082 = VertexPos40_g77082;
				float3 appendResult81_g77082 = (float3(break84_g77082.x , break84_g77082.y , 0.0));
				half3 VertexPosOtherAxis82_g77082 = appendResult81_g77082;
				half Angle44_g77082 = -(Angle44_g77080).x;
				half3 Input_Position419_g77078 = WorldPosition_Shifted7477_g76959;
				float3 break459_g77078 = Input_Position419_g77078;
				float Sum_Position446_g77078 = ( break459_g77078.x + break459_g77078.y + break459_g77078.z );
				half Input_MotionScale321_g77078 = ( _MotionScale_20 * 0.1 );
				half Input_MotionVariation330_g77078 = _MotionVariation_20;
				half Input_GlobalVariation400_g77078 = Global_MeshVariation5104_g76959;
				float lerpResult115_g77079 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g77078 = _MotionSpeed_20;
				float temp_output_404_0_g77078 = ( lerpResult115_g77079 * Input_MotionSpeed62_g77078 );
				half Motion_SineA450_g77078 = sin( ( ( Sum_Position446_g77078 * Input_MotionScale321_g77078 ) + ( Input_MotionVariation330_g77078 * Input_GlobalVariation400_g77078 ) + temp_output_404_0_g77078 ) );
				half Motion_SineB395_g77078 = sin( ( ( temp_output_404_0_g77078 * 0.6842 ) + ( Sum_Position446_g77078 * Input_MotionScale321_g77078 ) ) );
				half3 Input_Position419_g76971 = VertexPosition3588_g76959;
				float3 normalizeResult518_g76971 = normalize( Input_Position419_g76971 );
				half2 Input_DirectionOS423_g76971 = Global_React_DirectionOS39_g76959;
				float2 break521_g76971 = -Input_DirectionOS423_g76971;
				float3 appendResult522_g76971 = (float3(break521_g76971.x , 0.0 , break521_g76971.y));
				float dotResult519_g76971 = dot( normalizeResult518_g76971 , appendResult522_g76971 );
				half Input_Value62_g76971 = _MotionFacingValue;
				float lerpResult524_g76971 = lerp( 1.0 , (dotResult519_g76971*0.5 + 0.5) , Input_Value62_g76971);
				half ObjectData20_g76972 = max( lerpResult524_g76971 , 0.001 );
				half WorldData19_g76972 = 1.0;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76972 = WorldData19_g76972;
				#else
				float staticSwitch14_g76972 = ObjectData20_g76972;
				#endif
				half Motion_FacingMask5214_g76959 = staticSwitch14_g76972;
				half Motion_20_Amplitude4381_g76959 = ( _MotionValue_20 * Motion_FacingMask5214_g76959 );
				half Input_MotionAmplitude384_g77078 = Motion_20_Amplitude4381_g76959;
				half Input_GlobalWind407_g77078 = Global_Wind_Power2223_g76959;
				float4 break638_g77065 = abs( Noise_Complex703_g77065 );
				half Global_Noise_B5526_g76959 = break638_g77065.b;
				half Input_GlobalNoise411_g77078 = Global_Noise_B5526_g76959;
				float lerpResult413_g77078 = lerp( 1.6 , 0.4 , Input_GlobalWind407_g77078);
				half Motion_Amplitude418_g77078 = ( Input_MotionAmplitude384_g77078 * Input_GlobalWind407_g77078 * pow( Input_GlobalNoise411_g77078 , lerpResult413_g77078 ) );
				half Input_Squash58_g77078 = _MotionAmplitude_20;
				float enc59_g76967 = v.ase_texcoord.z;
				float2 localDecodeFloatToVector259_g76967 = DecodeFloatToVector2( enc59_g76967 );
				float2 break61_g76967 = localDecodeFloatToVector259_g76967;
				half Mesh_Motion_2060_g76959 = break61_g76967.x;
				half Input_MeshMotion_20388_g77078 = Mesh_Motion_2060_g76959;
				float Bounds_Radius5231_g76959 = break63_g76967.y;
				half Input_BoundsRadius390_g77078 = Bounds_Radius5231_g76959;
				half Global_MotionValue462_g77078 = TVE_MotionValue_20;
				half2 Input_DirectionOS366_g77078 = Global_React_DirectionOS39_g76959;
				float2 break371_g77078 = Input_DirectionOS366_g77078;
				float3 appendResult372_g77078 = (float3(break371_g77078.x , ( Motion_SineA450_g77078 * 0.3 ) , break371_g77078.y));
				half3 Motion_20_Squash4418_g76959 = ( ( (max( Motion_SineA450_g77078 , Motion_SineB395_g77078 )*0.5 + 0.5) * Motion_Amplitude418_g77078 * Input_Squash58_g77078 * Input_MeshMotion_20388_g77078 * Input_BoundsRadius390_g77078 * Global_MotionValue462_g77078 ) * appendResult372_g77078 );
				half3 VertexPos40_g77057 = ( ( VertexPosRotationAxis50_g77082 + ( VertexPosOtherAxis82_g77082 * cos( Angle44_g77082 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g77082 ) * sin( Angle44_g77082 ) ) ) + Motion_20_Squash4418_g76959 );
				float3 appendResult74_g77057 = (float3(0.0 , VertexPos40_g77057.y , 0.0));
				float3 VertexPosRotationAxis50_g77057 = appendResult74_g77057;
				float3 break84_g77057 = VertexPos40_g77057;
				float3 appendResult81_g77057 = (float3(break84_g77057.x , 0.0 , break84_g77057.z));
				float3 VertexPosOtherAxis82_g77057 = appendResult81_g77057;
				half Input_Rolling379_g77078 = _MotionAmplitude_22;
				half Motion_20_Rolling5257_g76959 = ( Motion_SineA450_g77078 * Motion_Amplitude418_g77078 * Input_Rolling379_g77078 * Input_MeshMotion_20388_g77078 * Global_MotionValue462_g77078 );
				half Angle44_g77057 = Motion_20_Rolling5257_g76959;
				half3 Input_Position500_g77069 = WorldPosition_Shifted7477_g76959;
				half Input_MotionScale321_g77069 = _MotionScale_32;
				half Input_MotionVariation330_g77069 = _MotionVariation_32;
				half Input_GlobalVariation372_g77069 = Global_MeshVariation5104_g76959;
				float lerpResult115_g77072 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g77069 = _MotionSpeed_32;
				float4 tex2DNode460_g77069 = SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( ( (Input_Position500_g77069).xz * Input_MotionScale321_g77069 * 0.03 ) + ( Input_MotionVariation330_g77069 * Input_GlobalVariation372_g77069 ) + ( lerpResult115_g77072 * Input_MotionSpeed62_g77069 * 0.02 ) ), 0.0 );
				float3 appendResult462_g77069 = (float3(tex2DNode460_g77069.r , tex2DNode460_g77069.g , tex2DNode460_g77069.b));
				half3 Flutter_Texture489_g77069 = (appendResult462_g77069*2.0 + -1.0);
				float temp_output_7_0_g77027 = TVE_MotionFadeEnd;
				float temp_output_10_0_g77027 = ( TVE_MotionFadeStart - temp_output_7_0_g77027 );
				half Motion_FadeOut4005_g76959 = saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g77027 ) / ( temp_output_10_0_g77027 + 0.0001 ) ) );
				half Motion_30_Amplitude4960_g76959 = ( _MotionValue_30 * _MotionAmplitude_32 * Motion_FacingMask5214_g76959 * Motion_FadeOut4005_g76959 );
				half Input_MotionAmplitude58_g77069 = Motion_30_Amplitude4960_g76959;
				half Mesh_Motion_30144_g76959 = break61_g76967.y;
				half Input_MeshMotion_30374_g77069 = Mesh_Motion_30144_g76959;
				half Input_GlobalWind471_g77069 = Global_Wind_Power2223_g76959;
				half Global_MotionValue503_g77069 = TVE_MotionValue_30;
				half Input_GlobalNoise472_g77069 = Global_Noise_B5526_g76959;
				float lerpResult466_g77069 = lerp( 2.0 , 0.6 , Input_GlobalWind471_g77069);
				half Flutter_Amplitude491_g77069 = ( Input_MotionAmplitude58_g77069 * Input_MeshMotion_30374_g77069 * Input_GlobalWind471_g77069 * Global_MotionValue503_g77069 * pow( Input_GlobalNoise472_g77069 , lerpResult466_g77069 ) );
				half3 Motion_30_Flutter263_g76959 = ( Flutter_Texture489_g77069 * Flutter_Amplitude491_g77069 );
				float3 Vertex_Motion_Object833_g76959 = ( ( VertexPosRotationAxis50_g77057 + ( VertexPosOtherAxis82_g77057 * cos( Angle44_g77057 ) ) + ( cross( float3(0,1,0) , VertexPosOtherAxis82_g77057 ) * sin( Angle44_g77057 ) ) ) + Motion_30_Flutter263_g76959 );
				half3 ObjectData20_g77062 = Vertex_Motion_Object833_g76959;
				float3 temp_output_3474_0_g76959 = ( VertexPosition3588_g76959 - Mesh_PivotsOS2291_g76959 );
				float3 Vertex_Motion_World1118_g76959 = ( ( ( temp_output_3474_0_g76959 + Motion_10_Interaction7519_g76959 ) + Motion_20_Squash4418_g76959 ) + Motion_30_Flutter263_g76959 );
				half3 WorldData19_g77062 = Vertex_Motion_World1118_g76959;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g77062 = WorldData19_g77062;
				#else
				float3 staticSwitch14_g77062 = ObjectData20_g77062;
				#endif
				float3 temp_output_7495_0_g76959 = staticSwitch14_g77062;
				float3 Vertex_Motion7493_g76959 = temp_output_7495_0_g76959;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 normalizeResult2169_g76959 = normalize( ase_worldViewDir );
				float3 ViewDirection3963_g76959 = normalizeResult2169_g76959;
				float3 break2709_g76959 = cross( ViewDirection3963_g76959 , half3(0,1,0) );
				float3 appendResult2710_g76959 = (float3(-break2709_g76959.z , 0.0 , break2709_g76959.x));
				float3 appendResult2667_g76959 = (float3(Global_MeshVariation5104_g76959 , 0.5 , Global_MeshVariation5104_g76959));
				float dotResult2212_g76959 = dot( ViewDirection3963_g76959 , float3(0,1,0) );
				half Mask_HView2656_g76959 = dotResult2212_g76959;
				float saferPower2652_g76959 = abs( Mask_HView2656_g76959 );
				half3 Grass_Perspective2661_g76959 = ( ( ( mul( GetWorldToObjectMatrix(), float4( appendResult2710_g76959 , 0.0 ) ).xyz * _PerspectivePushValue ) + ( (appendResult2667_g76959*2.0 + -1.0) * _PerspectiveNoiseValue ) ) * Mesh_Height1524_g76959 * pow( saferPower2652_g76959 , _PerspectiveAngleValue ) );
				float temp_output_84_0_g76999 = _LayerVertexValue;
				float temp_output_19_0_g77003 = TVE_VertexUsage[(int)temp_output_84_0_g76999];
				float4 temp_output_94_19_g76999 = TVE_VertexCoords;
				half2 UV97_g76999 = ( (temp_output_94_19_g76999).zw + ( (temp_output_94_19_g76999).xy * (ObjectPosition4223_g76959).xz ) );
				float4 tex2DArrayNode50_g76999 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_VertexTex, sampler_Linear_Clamp, UV97_g76999,temp_output_84_0_g76999, 0.0 );
				float4 temp_output_17_0_g77003 = tex2DArrayNode50_g76999;
				float4 temp_output_111_19_g76999 = TVE_VertexParams;
				float4 temp_output_3_0_g77003 = temp_output_111_19_g76999;
				float4 ifLocalVar18_g77003 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g77003 >= 0.5 )
				ifLocalVar18_g77003 = temp_output_17_0_g77003;
				else
				ifLocalVar18_g77003 = temp_output_3_0_g77003;
				float4 lerpResult22_g77003 = lerp( temp_output_3_0_g77003 , temp_output_17_0_g77003 , temp_output_19_0_g77003);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g77003 = lerpResult22_g77003;
				#else
				float4 staticSwitch24_g77003 = ifLocalVar18_g77003;
				#endif
				half4 Global_Vertex_Params4173_g76959 = staticSwitch24_g77003;
				float4 break322_g77004 = Global_Vertex_Params4173_g76959;
				half Global_VertexSize174_g76959 = saturate( break322_g77004.w );
				float lerpResult346_g76959 = lerp( 1.0 , Global_VertexSize174_g76959 , _GlobalSize);
				float3 appendResult3480_g76959 = (float3(lerpResult346_g76959 , lerpResult346_g76959 , lerpResult346_g76959));
				half3 ObjectData20_g77059 = appendResult3480_g76959;
				half3 _Vector11 = half3(1,1,1);
				half3 WorldData19_g77059 = _Vector11;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g77059 = WorldData19_g77059;
				#else
				float3 staticSwitch14_g77059 = ObjectData20_g77059;
				#endif
				half3 Vertex_Size1741_g76959 = staticSwitch14_g77059;
				float temp_output_7_0_g77060 = _SizeFadeEndValue;
				float temp_output_10_0_g77060 = ( _SizeFadeStartValue - temp_output_7_0_g77060 );
				float temp_output_7453_0_g76959 = saturate( ( ( ( distance( _WorldSpaceCameraPos , ObjectPosition4223_g76959 ) * ( 1.0 / TVE_DistanceFadeBias ) ) - temp_output_7_0_g77060 ) / ( temp_output_10_0_g77060 + 0.0001 ) ) );
				float3 appendResult3482_g76959 = (float3(temp_output_7453_0_g76959 , temp_output_7453_0_g76959 , temp_output_7453_0_g76959));
				half3 ObjectData20_g77058 = appendResult3482_g76959;
				half3 _Vector5 = half3(1,1,1);
				half3 WorldData19_g77058 = _Vector5;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g77058 = WorldData19_g77058;
				#else
				float3 staticSwitch14_g77058 = ObjectData20_g77058;
				#endif
				float3 Vertex_SizeFade1740_g76959 = staticSwitch14_g77058;
				float3 lerpResult16_g77063 = lerp( VertexPosition3588_g76959 , ( ( ( Vertex_Motion7493_g76959 + Grass_Perspective2661_g76959 ) * Vertex_Size1741_g76959 * Vertex_SizeFade1740_g76959 ) + Mesh_PivotsOS2291_g76959 ) , TVE_IsEnabled);
				float3 temp_output_4912_0_g76959 = lerpResult16_g77063;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch4976_g76959 = temp_output_4912_0_g76959;
				#else
				float3 staticSwitch4976_g76959 = temp_output_4912_0_g76959;
				#endif
				float3 temp_output_4918_0_g76959 = ( staticSwitch4976_g76959 + ( _VertexDataMode * 0.0 ) );
				float3 Final_VertexPosition890_g76959 = ( temp_output_4918_0_g76959 + _DisableSRPBatcher );
				
				float4 break33_g76991 = _second_uvs_mode;
				float2 temp_output_30_0_g76991 = ( v.ase_texcoord.xy * break33_g76991.x );
				float2 appendResult21_g76967 = (float2(v.ase_texcoord1.z , v.ase_texcoord1.w));
				float2 Mesh_DetailCoord3_g76959 = appendResult21_g76967;
				float2 temp_output_29_0_g76991 = ( Mesh_DetailCoord3_g76959 * break33_g76991.y );
				float2 temp_output_31_0_g76991 = ( (WorldPosition_Shifted7477_g76959).xz * break33_g76991.z );
				float2 vertexToFrag11_g76990 = ( ( ( temp_output_30_0_g76991 + temp_output_29_0_g76991 + temp_output_31_0_g76991 ) * (_SecondUVs).xy ) + (_SecondUVs).zw );
				o.ase_texcoord1.xy = vertexToFrag11_g76990;
				half Mesh_DetailMask90_g76959 = v.ase_color.b;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				half3 WorldNormal4101_g76959 = normalizedWorldNormal;
				float lerpResult5730_g76959 = lerp( (WorldNormal4101_g76959).y , v.ase_normal.y , Vertex_DynamicMode5112_g76959);
				half WorldNormal_Y6811_g76959 = lerpResult5730_g76959;
				float lerpResult6884_g76959 = lerp( Mesh_DetailMask90_g76959 , (WorldNormal_Y6811_g76959*0.5 + 0.5) , _DetailMeshMode);
				float lerpResult7357_g76959 = lerp( lerpResult6884_g76959 , ( 1.0 - lerpResult6884_g76959 ) , _DetailMeshInvertMode);
				float lerpResult7546_g76959 = lerp( 1.0 , lerpResult7357_g76959 , _DetailMeshValue);
				float vertexToFrag11_g77083 = lerpResult7546_g76959;
				o.ase_texcoord1.z = vertexToFrag11_g77083;
				o.ase_texcoord2.xyz = vertexToFrag3890_g76959;
				o.ase_texcoord3.xyz = vertexToFrag4224_g76959;
				
				o.ase_texcoord = v.ase_texcoord;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord1.w = 0;
				o.ase_texcoord2.w = 0;
				o.ase_texcoord3.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = Final_VertexPosition890_g76959;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				o.clipPos = TransformWorldToHClip(positionWS);

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord1 = v.ase_texcoord1;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN ) : SV_TARGET
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				float localCustomAlphaClip19_g77017 = ( 0.0 );
				half2 Main_UVs15_g76959 = ( ( IN.ase_texcoord.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g76959 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g76959 );
				half Main_Alpha316_g76959 = tex2DNode29_g76959.a;
				float2 vertexToFrag11_g76990 = IN.ase_texcoord1.xy;
				half2 Second_UVs17_g76959 = vertexToFrag11_g76990;
				float4 tex2DNode89_g76959 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, Second_UVs17_g76959 );
				half Second_Alpha5007_g76959 = tex2DNode89_g76959.a;
				float4 tex2DNode35_g76959 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_Linear_Repeat, Main_UVs15_g76959 );
				half Main_Mask57_g76959 = tex2DNode35_g76959.b;
				float4 tex2DNode33_g76959 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_Linear_Repeat, Second_UVs17_g76959 );
				half Second_Mask81_g76959 = tex2DNode33_g76959.b;
				float lerpResult6885_g76959 = lerp( Main_Mask57_g76959 , Second_Mask81_g76959 , _DetailMaskMode);
				float lerpResult7354_g76959 = lerp( lerpResult6885_g76959 , ( 1.0 - lerpResult6885_g76959 ) , _DetailMaskInvertMode);
				float lerpResult7547_g76959 = lerp( 1.0 , lerpResult7354_g76959 , _DetailMaskIntensity);
				half Blend_Mask_Texture6794_g76959 = lerpResult7547_g76959;
				float vertexToFrag11_g77083 = IN.ase_texcoord1.z;
				half Blend_Mask_Mesh1540_g76959 = vertexToFrag11_g77083;
				float clampResult17_g77023 = clamp( ( Blend_Mask_Texture6794_g76959 * Blend_Mask_Mesh1540_g76959 ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g77032 = _DetailBlendMinValue;
				float temp_output_10_0_g77032 = ( _DetailBlendMaxValue - temp_output_7_0_g77032 );
				half Blend_Mask147_g76959 = ( saturate( ( ( clampResult17_g77023 - temp_output_7_0_g77032 ) / ( temp_output_10_0_g77032 + 0.0001 ) ) ) * _DetailMode );
				float lerpResult6153_g76959 = lerp( Main_Alpha316_g76959 , Second_Alpha5007_g76959 , Blend_Mask147_g76959);
				float lerpResult6785_g76959 = lerp( ( Main_Alpha316_g76959 * Second_Alpha5007_g76959 ) , lerpResult6153_g76959 , _DetailAlphaMode);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6158_g76959 = lerpResult6785_g76959;
				#else
				float staticSwitch6158_g76959 = Main_Alpha316_g76959;
				#endif
				half Blend_Alpha6157_g76959 = staticSwitch6158_g76959;
				half AlphaTreshold2132_g76959 = _AlphaClipValue;
				float temp_output_84_0_g76978 = _LayerExtrasValue;
				float temp_output_19_0_g76982 = TVE_ExtrasUsage[(int)temp_output_84_0_g76978];
				float4 temp_output_93_19_g76978 = TVE_ExtrasCoords;
				float3 vertexToFrag3890_g76959 = IN.ase_texcoord2.xyz;
				float3 WorldPosition3905_g76959 = vertexToFrag3890_g76959;
				float3 vertexToFrag4224_g76959 = IN.ase_texcoord3.xyz;
				float3 ObjectPosition4223_g76959 = vertexToFrag4224_g76959;
				float3 lerpResult4827_g76959 = lerp( WorldPosition3905_g76959 , ObjectPosition4223_g76959 , _ExtrasPositionMode);
				half2 UV96_g76978 = ( (temp_output_93_19_g76978).zw + ( (temp_output_93_19_g76978).xy * (lerpResult4827_g76959).xz ) );
				float4 tex2DArrayNode48_g76978 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ExtrasTex, sampler_Linear_Clamp, UV96_g76978,temp_output_84_0_g76978, 0.0 );
				float4 temp_output_17_0_g76982 = tex2DArrayNode48_g76978;
				float4 temp_output_94_85_g76978 = TVE_ExtrasParams;
				float4 temp_output_3_0_g76982 = temp_output_94_85_g76978;
				float4 ifLocalVar18_g76982 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76982 >= 0.5 )
				ifLocalVar18_g76982 = temp_output_17_0_g76982;
				else
				ifLocalVar18_g76982 = temp_output_3_0_g76982;
				float4 lerpResult22_g76982 = lerp( temp_output_3_0_g76982 , temp_output_17_0_g76982 , temp_output_19_0_g76982);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76982 = lerpResult22_g76982;
				#else
				float4 staticSwitch24_g76982 = ifLocalVar18_g76982;
				#endif
				half4 Global_Extras_Params5440_g76959 = staticSwitch24_g76982;
				float4 break456_g76996 = Global_Extras_Params5440_g76959;
				half Global_Extras_Alpha1033_g76959 = saturate( break456_g76996.w );
				float3 ObjectPosition_Shifted7481_g76959 = ( ObjectPosition4223_g76959 - TVE_WorldOrigin );
				half3 Input_Position167_g77037 = ObjectPosition_Shifted7481_g76959;
				float dotResult156_g77037 = dot( (Input_Position167_g77037).xz , float2( 12.9898,78.233 ) );
				half Vertex_DynamicMode5112_g76959 = _VertexDynamicMode;
				half Input_DynamicMode120_g77037 = Vertex_DynamicMode5112_g76959;
				float Postion_Random162_g77037 = ( sin( dotResult156_g77037 ) * ( 1.0 - Input_DynamicMode120_g77037 ) );
				float Mesh_Variation16_g76959 = IN.ase_color.r;
				half Input_Variation124_g77037 = Mesh_Variation16_g76959;
				half ObjectData20_g77039 = frac( ( Postion_Random162_g77037 + Input_Variation124_g77037 ) );
				half WorldData19_g77039 = Input_Variation124_g77037;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g77039 = WorldData19_g77039;
				#else
				float staticSwitch14_g77039 = ObjectData20_g77039;
				#endif
				float clampResult17_g77041 = clamp( staticSwitch14_g77039 , 0.0001 , 0.9999 );
				float Global_MeshVariation5104_g76959 = clampResult17_g77041;
				float lerpResult5154_g76959 = lerp( 0.0 , Global_MeshVariation5104_g76959 , _AlphaVariationValue);
				half Global_Alpha_Variation5158_g76959 = lerpResult5154_g76959;
				float lerpResult6866_g76959 = lerp( ( 1.0 - Blend_Mask147_g76959 ) , 1.0 , _DetailFadeMode);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6612_g76959 = lerpResult6866_g76959;
				#else
				float staticSwitch6612_g76959 = 1.0;
				#endif
				half Blend_Mask_Invert6260_g76959 = staticSwitch6612_g76959;
				half Alpha_Mask6234_g76959 = ( 1.0 * Blend_Mask_Invert6260_g76959 );
				float lerpResult5203_g76959 = lerp( 1.0 , saturate( ( ( Global_Extras_Alpha1033_g76959 - Global_Alpha_Variation5158_g76959 ) + ( Global_Extras_Alpha1033_g76959 * 0.5 ) ) ) , ( Alpha_Mask6234_g76959 * _GlobalAlpha ));
				float lerpResult16_g77012 = lerp( 1.0 , lerpResult5203_g76959 , TVE_IsEnabled);
				half Global_Alpha315_g76959 = lerpResult16_g77012;
				half Fade_Alpha3727_g76959 = 1.0;
				float Emissive_Alpha6927_g76959 = 1.0;
				half Final_Alpha7344_g76959 = min( min( ( Blend_Alpha6157_g76959 - AlphaTreshold2132_g76959 ) , Global_Alpha315_g76959 ) , min( Fade_Alpha3727_g76959 , Emissive_Alpha6927_g76959 ) );
				float temp_output_3_0_g77017 = Final_Alpha7344_g76959;
				float Alpha19_g77017 = temp_output_3_0_g77017;
				float temp_output_15_0_g77017 = 0.01;
				float Treshold19_g77017 = temp_output_15_0_g77017;
				{
				#if defined (TVE_FEATURE_CLIP)
				#if defined (TVE_IS_HD_PIPELINE)
				#if !defined (SHADERPASS_FORWARD_BYPASS_ALPHA_TEST)
				clip(Alpha19_g77017 - Treshold19_g77017);
				#endif
				#if !defined (SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST)
				clip(Alpha19_g77017 - Treshold19_g77017);
				#endif
				#else
				clip(Alpha19_g77017 - Treshold19_g77017);
				#endif
				#endif
				}
				half Main_Color_Alpha6121_g76959 = _MainColor.a;
				half Second_Color_Alpha6152_g76959 = _SecondColor.a;
				float lerpResult6168_g76959 = lerp( Main_Color_Alpha6121_g76959 , Second_Color_Alpha6152_g76959 , Blend_Mask147_g76959);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6174_g76959 = lerpResult6168_g76959;
				#else
				float staticSwitch6174_g76959 = Main_Color_Alpha6121_g76959;
				#endif
				half Blend_Color_Alpha6167_g76959 = staticSwitch6174_g76959;
				half Final_Clip914_g76959 = saturate( ( Alpha19_g77017 * Blend_Color_Alpha6167_g76959 ) );
				

				surfaceDescription.Alpha = Final_Clip914_g76959;
				surfaceDescription.AlphaClipThreshold = 0.5;

				#if _ALPHATEST_ON
					float alphaClipThreshold = 0.01f;
					#if ALPHA_CLIP_THRESHOLD
						alphaClipThreshold = surfaceDescription.AlphaClipThreshold;
					#endif
						clip(surfaceDescription.Alpha - alphaClipThreshold);
				#endif

				half4 outColor = 0;

				#ifdef SCENESELECTIONPASS
					outColor = half4(_ObjectId, _PassValue, 1.0, 1.0);
				#elif defined(SCENEPICKINGPASS)
					outColor = _SelectionID;
				#endif

				return outColor;
			}

			ENDHLSL
		}
		
	}
	
	CustomEditor "TVEShaderCoreGUI"
	FallBack "Hidden/Shader Graph/FallbackError"
	
	Fallback "Hidden/BOXOPHOBIC/The Vegetation Engine/Fallback"
}
/*ASEBEGIN
Version=19105
Node;AmplifyShaderEditor.RangedFloatNode;17;-1632,-640;Half;False;Property;_render_zw;_render_zw;232;1;[HideInInspector];Create;True;0;2;Opaque;0;Transparent;1;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1030;-1408,-640;Half;False;Property;_render_coverage;_render_coverage;233;1;[HideInInspector];Create;True;0;2;Opaque;0;Transparent;1;0;True;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;10;-2176,-640;Half;False;Property;_render_cull;_render_cull;229;1;[HideInInspector];Create;True;0;3;Both;0;Back;1;Front;2;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;20;-2000,-640;Half;False;Property;_render_src;_render_src;230;1;[HideInInspector];Create;True;0;0;0;True;0;False;5;5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;7;-1808,-640;Half;False;Property;_render_dst;_render_dst;231;1;[HideInInspector];Create;True;0;2;Opaque;0;Transparent;1;0;True;0;False;10;10;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1028;-1376,-176;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;SceneSelectionPass;0;8;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;2;True;11;d3d11;glcore;gles;gles3;metal;vulkan;xboxone;xboxseries;playstation;ps4;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1015;-1376,-256;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;0;True;11;d3d11;glcore;gles;gles3;metal;vulkan;xboxone;xboxseries;playstation;ps4;switch;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;0;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1027;-1376,-256;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;GBuffer;0;7;GBuffer;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;0;True;11;d3d11;glcore;gles;gles3;metal;vulkan;xboxone;xboxseries;playstation;ps4;switch;0;False;True;1;1;True;_render_src;0;True;_render_dst;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalGBuffer;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1029;-1376,-176;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;ScenePickingPass;0;9;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;2;True;11;d3d11;glcore;gles;gles3;metal;vulkan;xboxone;xboxseries;playstation;ps4;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1020;-1376,-256;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;0;True;11;d3d11;glcore;gles;gles3;metal;vulkan;xboxone;xboxseries;playstation;ps4;switch;0;False;True;1;1;True;_render_src;0;True;_render_dst;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=Universal2D;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1026;-1376,105;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;DepthNormals;0;6;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;0;True;11;d3d11;glcore;gles;gles3;metal;vulkan;xboxone;xboxseries;playstation;ps4;switch;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormalsOnly;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1019;-1376,-256;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;0;True;11;d3d11;glcore;gles;gles3;metal;vulkan;xboxone;xboxseries;playstation;ps4;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1017;-1376,-256;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;0;True;11;d3d11;glcore;gles;gles3;metal;vulkan;xboxone;xboxseries;playstation;ps4;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1018;-1376,-256;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;0;True;11;d3d11;glcore;gles;gles3;metal;vulkan;xboxone;xboxseries;playstation;ps4;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.CommentaryNode;33;-2176,-384;Inherit;False;1281.392;100;Final;0;;0,1,0.5,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;37;-2176,-768;Inherit;False;1278.392;100;Internal;0;;1,0.252,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;449;-2176,512;Inherit;False;1279.438;100;Features;0;;0,1,0.5,1;0;0
Node;AmplifyShaderEditor.FunctionNode;1023;-2176,640;Inherit;False;Define Pipeline Universal;-1;;76954;71dc7add32e5f6247b1fb74ecceddd3e;0;0;1;FLOAT;529
Node;AmplifyShaderEditor.FunctionNode;471;-1664,640;Inherit;False;Define ShaderType Plant;236;;76955;b458122dd75182d488380bd0f592b9e6;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1049;-1920,640;Inherit;False;Define Lighting Subsurface;234;;76956;77137addbb4a22f4c818adc8782926be;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1025;-1280,640;Inherit;False;Compile Core;-1;;76957;634b02fd1f32e6a4c875d8fc2c450956;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1024;-1088,640;Inherit;False;Compile All Shaders;-1;;76958;e67c8238031dbf04ab79a5d4d63d1b4f;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1016;-1152,-256;Float;False;True;-1;2;TVEShaderCoreGUI;0;16;BOXOPHOBIC/The Vegetation Engine/Default/Plant Subsurface Lit;28cd5599e02859647ae1798e4fcaef6c;True;Forward;0;1;Forward;19;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;_render_coverage;True;True;2;True;_render_cull;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;True;True;1;True;_render_zw;True;0;False;;True;False;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;True;True;1;1;True;_render_src;0;True;_render_dst;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;True;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalForwardOnly;False;False;0;Hidden/BOXOPHOBIC/The Vegetation Engine/Fallback;0;0;Standard;41;Workflow;0;0;Surface;0;0;  Refraction Model;0;0;  Blend;0;0;Two Sided;0;0;Fragment Normal Space,InvertActionOnDeselection;0;0;Forward Only;1;0;Transmission;0;637860544313299116;  Transmission Shadow;0.5,True,;0;Translucency;1;637860544319029513;  Translucency Strength;1,False,;0;  Normal Distortion;0.5,False,;0;  Scattering;2,False,;0;  Direct;0.9,False,;0;  Ambient;0.1,False,;0;  Shadow;0.5,False,;0;Cast Shadows;1;0;  Use Shadow Threshold;0;0;Receive Shadows;1;0;GPU Instancing;1;0;LOD CrossFade;1;0;Built-in Fog;1;0;_FinalColorxAlpha;0;0;Meta Pass;1;0;Override Baked GI;0;0;Extra Pre Pass;0;0;DOTS Instancing;1;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,False,;0;  Type;0;0;  Tess;16,False,;0;  Min;10,False,;0;  Max;25,False,;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Write Depth;0;0;  Early Z;0;0;Vertex Position,InvertActionOnDeselection;0;0;Debug Display;0;0;Clear Coat;0;0;0;10;False;True;True;True;True;True;True;False;True;True;False;;True;0
Node;AmplifyShaderEditor.FunctionNode;1048;-2177,-257;Inherit;False;Base Shader;0;;76959;856f7164d1c579d43a5cf4968a75ca43;91,7343,0,3880,1,4028,1,3900,1,3908,1,4172,1,4179,1,6791,1,1298,1,6792,1,1300,1,3586,0,4499,1,1708,1,6056,1,3509,1,3873,1,893,1,6230,0,5156,1,5345,0,1718,1,1717,1,1714,1,1715,1,6116,1,5075,1,6068,1,6076,1,6592,1,6692,0,6729,1,1776,1,3475,1,6352,1,6378,1,6655,1,4210,1,1745,1,3479,0,1646,0,3501,1,2807,1,6206,1,4999,0,6194,0,3887,0,7321,0,7332,0,3957,0,6647,0,6257,0,5357,0,2172,1,3883,0,3728,1,5350,0,2658,1,1742,1,3484,0,6320,1,6848,1,1734,1,4837,1,1737,1,1736,1,1735,1,6166,1,6161,1,6622,1,7429,0,7350,0,7348,0,7349,0,860,1,6721,1,2261,1,2260,1,2032,1,2054,1,5258,1,2039,1,2062,1,3243,1,5220,1,4217,1,6699,1,5339,0,7492,0,5090,1,4242,1;9;7333;FLOAT3;1,1,1;False;6196;FLOAT;1;False;6693;FLOAT;1;False;6201;FLOAT;1;False;6205;FLOAT;1;False;5143;FLOAT;1;False;6231;FLOAT;1;False;6198;FLOAT;1;False;5340;FLOAT3;0,0,0;False;23;FLOAT3;0;FLOAT3;528;FLOAT3;2489;FLOAT;531;FLOAT;4842;FLOAT;529;FLOAT;3678;FLOAT;530;FLOAT;4122;FLOAT;4134;FLOAT;1235;FLOAT;532;FLOAT;5389;FLOAT;721;FLOAT3;1230;FLOAT;5296;FLOAT;1461;FLOAT;1290;FLOAT;629;FLOAT3;534;FLOAT;4867;FLOAT4;5246;FLOAT4;4841
WireConnection;1016;0;1048;0
WireConnection;1016;1;1048;528
WireConnection;1016;2;1048;2489
WireConnection;1016;9;1048;3678
WireConnection;1016;4;1048;530
WireConnection;1016;5;1048;531
WireConnection;1016;6;1048;532
WireConnection;1016;15;1048;1230
WireConnection;1016;8;1048;534
ASEEND*/
//CHKSM=D4FB1BA107177167CF03C5DB73A3915CFB6D3C51

// Upgrade NOTE: upgraded instancing buffer 'BOXOPHOBICTheVegetationEngineElementsDefaultVertexSizeFade' to new syntax.

// Made with Amplify Shader Editor v1.9.1.5
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BOXOPHOBIC/The Vegetation Engine/Elements/Default/Vertex Size Fade"
{
	Properties
	{
		[StyledMessage(Info, Use the Size elements to add scale variation or combine it with seasons to add dynamic vegetation growing. Element Texture R and Particle Color R are used as value multipliers. Element Texture A and Particle Color A are used as element as alpha mask., 0,0)]_Message("Message", Float) = 0
		[StyledCategory(Render Settings)]_CategoryRender("[ Category Render ]", Float) = 0
		_ElementIntensity("Render Intensity", Range( 0 , 1)) = 1
		[HideInInspector]_ElementParams("Render Params", Vector) = (1,1,1,1)
		[StyledMessage(Warning, When using all layers the Global Volume will create one render texture for each layer to render the elements. Try using fewer layers when possible., _ElementLayerWarning, 1, 10, 10)]_ElementLayerWarning("Render Layer Warning", Float) = 0
		[StyledMessage(Info, When using a higher Layer number the Global Volume will create more render textures to render the elements. Try using fewer layers when possible., _ElementLayerMessage, 1, 10, 10)]_ElementLayerMessage("Render Layer Message", Float) = 0
		[StyledMask(TVELayers, Default 0 Layer_1 1 Layer_2 2 Layer_3 3 Layer_4 4 Layer_5 5 Layer_6 6 Layer_7 7 Layer_8 8, 0, 0)]_ElementLayerMask("Render Layer", Float) = 1
		[Enum(Constant,0,Seasons,1)]_ElementMode("Render Mode", Float) = 0
		[Enum(Multiply,0,Additive,1)]_ElementBlendA("Render Blend", Float) = 0
		[StyledCategory(Element Settings)]_CategoryElement("[ Category Element ]", Float) = 0
		[NoScaleOffset][StyledTextureSingleLine]_MainTex("Element Texture", 2D) = "white" {}
		[Space(10)][StyledVector(9)]_MainUVs("Element UVs", Vector) = (1,1,0,0)
		[StyledRemapSlider(_MainTexColorMinValue, _MainTexColorMaxValue, 0, 1)]_MainTexColorRemap("Element Color", Vector) = (0,0,0,0)
		[StyledRemapSlider(_MainTexAlphaMinValue, _MainTexAlphaMaxValue, 0, 1)]_MainTexAlphaRemap("Element Alpha", Vector) = (0,0,0,0)
		[HideInInspector]_MainTexColorMinValue("Element Color Min", Range( 0 , 1)) = 0
		[HideInInspector]_MainTexColorMaxValue("Element Color Max", Range( 0 , 1)) = 1
		[HideInInspector]_MainTexAlphaMinValue("Element Alpha Min", Range( 0 , 1)) = 0
		[HideInInspector]_MainTexAlphaMaxValue("Element Alpha Max", Range( 0 , 1)) = 1
		[Space(10)]_MainValue("Element Value", Range( 0 , 1)) = 1
		[Space(10)]_AdditionalValue1("Winter Value", Range( 0 , 1)) = 1
		_AdditionalValue2("Spring Value", Range( 0 , 1)) = 1
		_AdditionalValue3("Summer Value", Range( 0 , 1)) = 1
		_AdditionalValue4("Autumn Value", Range( 0 , 1)) = 1
		[StyledRemapSlider(_NoiseMinValue, _NoiseMaxValue, 0, 1)]_NoiseRemap("Noise Remap", Vector) = (0,0,0,0)
		[StyledMessage(Info, The Particle Velocity mode requires the particle to have custom vertex streams for Velocity and Speed set after the UV stream under the particle Renderer module. , _ElementDirectionMode, 40, 10, 0)]_ElementDirectionMessage("Element Direction Message", Float) = 0
		[Enum(Element Forward,10,Element Texture,20,Particle Translate,30,Particle Velocity,40)][Space(10)]_ElementDirectionMode("Direction Mode", Float) = 20
		[StyledCategory(Fading Settings)]_CategoryFade("[ Category Fade ]", Float) = 0
		[HDR][StyledToggle]_ElementRaycastMode("Enable Raycast Fading", Float) = 0
		[StyledToggle]_ElementVolumeFadeMode("Enable Volume Edge Fading", Float) = 0
		[Space(10)][StyledLayers()]_RaycastLayerMask("Raycast Layer", Float) = 1
		[ASEEnd]_RaycastDistanceEndValue("Raycast Distance", Float) = 2
		[HideInInspector]_ElementLayerValue("Legacy Layer Value", Float) = -1
		[HideInInspector]_InvertX("Legacy Invert Mode", Float) = 0
		[HideInInspector]_ElementFadeSupport("Legacy Edge Fading", Float) = 0
		[HideInInspector]_IsElementShader("_IsElementShader", Float) = 1
		[HideInInspector]_IsVersion("_IsVersion", Float) = 900
		[HideInInspector]_IsVertexElement("_IsVertexElement", Float) = 1
		[HideInInspector]_render_src("_render_src", Float) = 2
		[HideInInspector]_render_dst("_render_dst", Float) = 0

	}
	
	SubShader
	{
		
		
		Tags { "RenderType"="Transparent" "Queue"="Transparent" "PreviewType"="Plane" "DisableBatching"="True" }
	LOD 0

		CGINCLUDE
		#pragma target 3.0
		ENDCG
		Blend One Zero, [_render_src] [_render_dst]
		AlphaToMask Off
		Cull Off
		ColorMask A
		ZWrite Off
		ZTest LEqual
		
		
		
		Pass
		{
			Name "Unlit"

			CGPROGRAM

			

			#ifndef UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX
			//only defining to not throw compilation error over Unity 5.5
			#define UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input)
			#endif
			#pragma vertex vert
			#pragma fragment frag
			#pragma multi_compile_instancing
			#include "UnityCG.cginc"
			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define TVE_IS_VERTEX_ELEMENT


			struct appdata
			{
				float4 vertex : POSITION;
				float4 color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
			
			struct v2f
			{
				float4 vertex : SV_POSITION;
				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				float3 worldPos : TEXCOORD0;
				#endif
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			uniform half _IsVertexElement;
			uniform float _render_dst;
			uniform float _render_src;
			uniform half _Message;
			uniform half _ElementLayerMask;
			uniform half _ElementDirectionMessage;
			uniform half _ElementLayerMessage;
			uniform half _ElementLayerWarning;
			uniform float _ElementDirectionMode;
			uniform half _ElementRaycastMode;
			uniform half _RaycastLayerMask;
			uniform half _RaycastDistanceEndValue;
			uniform half4 _NoiseRemap;
			uniform half _CategoryFade;
			uniform float _ElementFadeSupport;
			uniform half _ElementLayerValue;
			uniform float _InvertX;
			uniform half _IsVersion;
			uniform half _IsElementShader;
			uniform half _CategoryRender;
			uniform half _CategoryElement;
			uniform half4 _MainTexAlphaRemap;
			uniform half4 _MainTexColorRemap;
			uniform half _MainValue;
			uniform half4 TVE_SeasonOptions;
			uniform half _AdditionalValue1;
			uniform half _AdditionalValue2;
			uniform half TVE_SeasonLerp;
			uniform half _AdditionalValue3;
			uniform half _AdditionalValue4;
			uniform float _ElementMode;
			uniform sampler2D _MainTex;
			uniform half4 _MainUVs;
			uniform half _MainTexColorMinValue;
			uniform half _MainTexColorMaxValue;
			uniform float _ElementIntensity;
			uniform half _MainTexAlphaMinValue;
			uniform half _MainTexAlphaMaxValue;
			uniform half4 TVE_ColorsCoords;
			uniform half4 TVE_ExtrasCoords;
			uniform half4 TVE_MotionCoords;
			uniform half4 TVE_VertexCoords;
			uniform half TVE_ElementsFadeValue;
			uniform float _ElementVolumeFadeMode;
			uniform half _ElementBlendA;
			UNITY_INSTANCING_BUFFER_START(BOXOPHOBICTheVegetationEngineElementsDefaultVertexSizeFade)
				UNITY_DEFINE_INSTANCED_PROP(half4, _ElementParams)
#define _ElementParams_arr BOXOPHOBICTheVegetationEngineElementsDefaultVertexSizeFade
			UNITY_INSTANCING_BUFFER_END(BOXOPHOBICTheVegetationEngineElementsDefaultVertexSizeFade)
			half4 IS_ELEMENT( half4 Colors, half4 Extras, half4 Motion, half4 Vertex )
			{
				#if defined (TVE_IS_COLORS_ELEMENT)
				return Colors;
				#elif defined (TVE_IS_EXTRAS_ELEMENT)
				return Extras;
				#elif defined (TVE_IS_MOTION_ELEMENT)
				return Motion;
				#elif defined (TVE_IS_VERTEX_ELEMENT)
				return Vertex;
				#else
				return Colors;
				#endif
			}
			

			
			v2f vert ( appdata v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);

				half TVE_SeasonOptions_X50_g22053 = TVE_SeasonOptions.x;
				half Value_Winter158_g22053 = _AdditionalValue1;
				half Value_Spring159_g22053 = _AdditionalValue2;
				half TVE_SeasonLerp54_g22053 = TVE_SeasonLerp;
				float lerpResult168_g22053 = lerp( Value_Winter158_g22053 , Value_Spring159_g22053 , TVE_SeasonLerp54_g22053);
				half TVE_SeasonOptions_Y51_g22053 = TVE_SeasonOptions.y;
				half Value_Summer160_g22053 = _AdditionalValue3;
				float lerpResult167_g22053 = lerp( Value_Spring159_g22053 , Value_Summer160_g22053 , TVE_SeasonLerp54_g22053);
				half TVE_SeasonOptions_Z52_g22053 = TVE_SeasonOptions.z;
				half Value_Autumn161_g22053 = _AdditionalValue4;
				float lerpResult166_g22053 = lerp( Value_Summer160_g22053 , Value_Autumn161_g22053 , TVE_SeasonLerp54_g22053);
				half TVE_SeasonOptions_W53_g22053 = TVE_SeasonOptions.w;
				float lerpResult165_g22053 = lerp( Value_Autumn161_g22053 , Value_Winter158_g22053 , TVE_SeasonLerp54_g22053);
				float vertexToFrag11_g22056 = ( ( ( TVE_SeasonOptions_X50_g22053 * lerpResult168_g22053 ) + ( TVE_SeasonOptions_Y51_g22053 * lerpResult167_g22053 ) ) + ( ( TVE_SeasonOptions_Z52_g22053 * lerpResult166_g22053 ) + ( TVE_SeasonOptions_W53_g22053 * lerpResult165_g22053 ) ) );
				o.ase_texcoord1.x = vertexToFrag11_g22056;
				
				o.ase_texcoord1.yz = v.ase_texcoord.xy;
				o.ase_color = v.color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord1.w = 0;
				float3 vertexValue = float3(0, 0, 0);
				#if ASE_ABSOLUTE_VERTEX_POS
				vertexValue = v.vertex.xyz;
				#endif
				vertexValue = vertexValue;
				#if ASE_ABSOLUTE_VERTEX_POS
				v.vertex.xyz = vertexValue;
				#else
				v.vertex.xyz += vertexValue;
				#endif
				o.vertex = UnityObjectToClipPos(v.vertex);

				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				o.worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
				#endif
				return o;
			}
			
			fixed4 frag (v2f i ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(i);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(i);
				fixed4 finalColor;
				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				float3 WorldPosition = i.worldPos;
				#endif
				half Value_Main157_g22053 = _MainValue;
				float vertexToFrag11_g22056 = i.ase_texcoord1.x;
				half Value_Seasons1721_g22053 = vertexToFrag11_g22056;
				half Element_Mode55_g22053 = _ElementMode;
				float lerpResult181_g22053 = lerp( Value_Main157_g22053 , Value_Seasons1721_g22053 , Element_Mode55_g22053);
				half4 MainTex_RGBA587_g22053 = tex2D( _MainTex, ( ( ( 1.0 - i.ase_texcoord1.yz ) * (_MainUVs).xy ) + (_MainUVs).zw ) );
				float3 temp_cast_0 = (0.0001).xxx;
				float3 temp_cast_1 = (0.9999).xxx;
				float3 clampResult17_g22063 = clamp( (MainTex_RGBA587_g22053).rgb , temp_cast_0 , temp_cast_1 );
				float temp_output_7_0_g22067 = _MainTexColorMinValue;
				float3 temp_cast_2 = (temp_output_7_0_g22067).xxx;
				float temp_output_10_0_g22067 = ( _MainTexColorMaxValue - temp_output_7_0_g22067 );
				float3 temp_output_1765_0_g22053 = saturate( ( ( clampResult17_g22063 - temp_cast_2 ) / temp_output_10_0_g22067 ) );
				half Element_Remap_R73_g22053 = (temp_output_1765_0_g22053).x;
				half4 _ElementParams_Instance = UNITY_ACCESS_INSTANCED_PROP(_ElementParams_arr, _ElementParams);
				half Element_Params_R1738_g22053 = _ElementParams_Instance.x;
				half Element_Value1744_g22053 = ( Element_Remap_R73_g22053 * Element_Params_R1738_g22053 * i.ase_color.r );
				half Final_Extras_RGB213_g22053 = ( lerpResult181_g22053 * Element_Value1744_g22053 );
				float clampResult17_g22062 = clamp( (MainTex_RGBA587_g22053).a , 0.0001 , 0.9999 );
				float temp_output_7_0_g22064 = _MainTexAlphaMinValue;
				float temp_output_10_0_g22064 = ( _MainTexAlphaMaxValue - temp_output_7_0_g22064 );
				half Element_Remap_A74_g22053 = saturate( ( ( clampResult17_g22062 - temp_output_7_0_g22064 ) / ( temp_output_10_0_g22064 + 0.0001 ) ) );
				half Element_Params_A1737_g22053 = _ElementParams_Instance.w;
				half4 Colors37_g22070 = TVE_ColorsCoords;
				half4 Extras37_g22070 = TVE_ExtrasCoords;
				half4 Motion37_g22070 = TVE_MotionCoords;
				half4 Vertex37_g22070 = TVE_VertexCoords;
				half4 localIS_ELEMENT37_g22070 = IS_ELEMENT( Colors37_g22070 , Extras37_g22070 , Motion37_g22070 , Vertex37_g22070 );
				float4 temp_output_35_0_g22074 = localIS_ELEMENT37_g22070;
				float temp_output_7_0_g22075 = TVE_ElementsFadeValue;
				float2 temp_cast_3 = (temp_output_7_0_g22075).xx;
				float temp_output_10_0_g22075 = ( 1.0 - temp_output_7_0_g22075 );
				float2 temp_output_16_0_g22068 = saturate( ( ( abs( (( (temp_output_35_0_g22074).zw + ( (temp_output_35_0_g22074).xy * (WorldPosition).xz ) )*2.002 + -1.001) ) - temp_cast_3 ) / temp_output_10_0_g22075 ) );
				float2 temp_output_12_0_g22068 = ( temp_output_16_0_g22068 * temp_output_16_0_g22068 );
				float lerpResult842_g22053 = lerp( 1.0 , ( 1.0 - saturate( ( (temp_output_12_0_g22068).x + (temp_output_12_0_g22068).y ) ) ) , _ElementVolumeFadeMode);
				half Element_Alpha56_g22053 = ( _ElementIntensity * Element_Remap_A74_g22053 * Element_Params_A1737_g22053 * i.ase_color.a * lerpResult842_g22053 );
				float lerpResult1634_g22053 = lerp( 1.0 , Final_Extras_RGB213_g22053 , Element_Alpha56_g22053);
				half Element_BlendA918_g22053 = _ElementBlendA;
				float lerpResult933_g22053 = lerp( lerpResult1634_g22053 , ( Final_Extras_RGB213_g22053 * Element_Alpha56_g22053 ) , Element_BlendA918_g22053);
				half Final_Extras_Blend211_g22053 = lerpResult933_g22053;
				float4 appendResult473_g22053 = (float4(0.0 , 0.0 , 0.0 , Final_Extras_Blend211_g22053));
				
				
				finalColor = appendResult473_g22053;
				return finalColor;
			}
			ENDCG
		}
	}
	CustomEditor "TVEShaderElementGUI"
	
	Fallback Off
}
/*ASEBEGIN
Version=19105
Node;AmplifyShaderEditor.FunctionNode;136;-768,-1280;Inherit;False;Define Element Vertex;67;;20497;9f8670cd8fdc98444822270656343d82;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;133;-608,-1152;Inherit;False;Property;_render_dst;_render_dst;70;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;132;-768,-1152;Inherit;False;Property;_render_src;_render_src;69;1;[HideInInspector];Create;True;0;0;0;True;0;False;2;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;0;-432,-1024;Float;False;True;-1;2;TVEShaderElementGUI;0;5;BOXOPHOBIC/The Vegetation Engine/Elements/Default/Vertex Size Fade;0770190933193b94aaa3065e307002fa;True;Unlit;0;0;Unlit;2;True;True;0;2;False;;0;False;;1;0;True;_render_src;0;True;_render_dst;True;0;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;2;False;;True;True;False;False;False;True;0;False;;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;2;False;;True;0;False;;True;False;0;False;;0;False;;True;4;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;PreviewType=Plane;DisableBatching=True=DisableBatching;True;2;False;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;0;;0;0;Standard;1;Vertex Position,InvertActionOnDeselection;1;0;0;1;True;False;;False;0
Node;AmplifyShaderEditor.RangedFloatNode;112;-384,-1280;Half;False;Property;_Message;Message;1;0;Create;True;0;0;0;True;1;StyledMessage(Info, Use the Size elements to add scale variation or combine it with seasons to add dynamic vegetation growing. Element Texture R and Particle Color R are used as value multipliers. Element Texture A and Particle Color A are used as element as alpha mask., 0,0);False;0;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;109;-512,-1280;Half;False;Property;_Banner;Banner;0;0;Create;True;0;0;0;False;1;StyledBanner(Vertex Size Element);False;0;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;137;-128,-1280;Inherit;False;Compile All Elements;-1;;21472;5302407fc6d65554791e558e67d59358;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;162;-768,-1025;Inherit;False;Base Element;2;;22053;0e972c73cae2ee54ea51acc9738801d0;4,477,3,478,0,145,1,481,2;0;1;FLOAT4;0
WireConnection;0;0;162;0
ASEEND*/
//CHKSM=C6D1424A0B4285803966C6EB60D49118ABE21067
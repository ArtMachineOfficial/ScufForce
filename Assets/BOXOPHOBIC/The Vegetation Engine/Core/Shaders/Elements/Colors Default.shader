// Upgrade NOTE: upgraded instancing buffer 'BOXOPHOBICTheVegetationEngineElementsDefaultColorsDefault' to new syntax.

// Made with Amplify Shader Editor v1.9.1.5
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BOXOPHOBIC/The Vegetation Engine/Elements/Default/Colors Default"
{
	Properties
	{
		[StyledMessage(Info, Use the Colors elements to add color tinting to the vegetation assets. Element Texture RGB and Particle Color RGB are used as value multipliers. Element Texture A and Particle Color A are used as element as alpha mask., 0,0)]_Message("Message", Float) = 0
		[StyledCategory(Render Settings)]_CategoryRender("[ Category Render ]", Float) = 0
		_ElementIntensity("Render Intensity", Range( 0 , 1)) = 1
		[HideInInspector]_ElementParams("Render Params", Vector) = (1,1,1,1)
		[StyledMessage(Warning, When using all layers the Global Volume will create one render texture for each layer to render the elements. Try using fewer layers when possible., _ElementLayerWarning, 1, 10, 10)]_ElementLayerWarning("Render Layer Warning", Float) = 0
		[StyledMessage(Info, When using a higher Layer number the Global Volume will create more render textures to render the elements. Try using fewer layers when possible., _ElementLayerMessage, 1, 10, 10)]_ElementLayerMessage("Render Layer Message", Float) = 0
		[StyledMask(TVELayers, Default 0 Layer_1 1 Layer_2 2 Layer_3 3 Layer_4 4 Layer_5 5 Layer_6 6 Layer_7 7 Layer_8 8, 0, 0)]_ElementLayerMask("Render Layer", Float) = 1
		[Enum(Constant,0,Seasons,1)]_ElementMode("Render Mode", Float) = 0
		[StyledCategory(Element Settings)]_CategoryElement("[ Category Element ]", Float) = 0
		[NoScaleOffset][StyledTextureSingleLine]_MainTex("Element Texture", 2D) = "white" {}
		[Space(10)][StyledVector(9)]_MainUVs("Element UVs", Vector) = (1,1,0,0)
		[StyledRemapSlider(_MainTexColorMinValue, _MainTexColorMaxValue, 0, 1)]_MainTexColorRemap("Element Color", Vector) = (0,0,0,0)
		[StyledRemapSlider(_MainTexAlphaMinValue, _MainTexAlphaMaxValue, 0, 1)]_MainTexAlphaRemap("Element Alpha", Vector) = (0,0,0,0)
		[HideInInspector]_MainTexColorMinValue("Element Color Min", Range( 0 , 1)) = 0
		[HideInInspector]_MainTexColorMaxValue("Element Color Max", Range( 0 , 1)) = 1
		[HideInInspector]_MainTexAlphaMinValue("Element Alpha Min", Range( 0 , 1)) = 0
		[HideInInspector]_MainTexAlphaMaxValue("Element Alpha Max", Range( 0 , 1)) = 1
		[HDR][Gamma][Space(10)]_MainColor("Element Color", Color) = (0.5019608,0.5019608,0.5019608,1)
		[HDR][Gamma][Space(10)]_AdditionalColor1("Winter Color", Color) = (0.5019608,0.5019608,0.5019608,1)
		[HDR][Gamma]_AdditionalColor2("Spring Color", Color) = (0.5019608,0.5019608,0.5019608,1)
		[HDR][Gamma]_AdditionalColor3("Summer Color", Color) = (0.5019608,0.5019608,0.5019608,1)
		[HDR][Gamma]_AdditionalColor4("Autumn Color", Color) = (0.5019608,0.5019608,0.5019608,1)
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
		[HideInInspector]_IsColorsElement("_IsColorsElement", Float) = 1
		[HideInInspector]_render_colormask("_render_colormask", Float) = 15

	}
	
	SubShader
	{
		
		
		Tags { "RenderType"="Transparent" "Queue"="Transparent" "PreviewType"="Plane" "DisableBatching"="True" }
	LOD 0

		CGINCLUDE
		#pragma target 3.0
		ENDCG
		Blend SrcAlpha OneMinusSrcAlpha
		AlphaToMask Off
		Cull Off
		ColorMask RGBA
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
			#define TVE_IS_COLORS_ELEMENT


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
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			uniform half _IsColorsElement;
			uniform half _render_colormask;
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
			uniform half4 _MainColor;
			uniform half4 TVE_SeasonOptions;
			uniform half4 _AdditionalColor1;
			uniform half4 _AdditionalColor2;
			uniform half TVE_SeasonLerp;
			uniform half4 _AdditionalColor3;
			uniform half4 _AdditionalColor4;
			uniform half _ElementMode;
			uniform sampler2D _MainTex;
			uniform half4 _MainUVs;
			uniform half _MainTexColorMinValue;
			uniform half _MainTexColorMaxValue;
			uniform half _ElementIntensity;
			uniform half _MainTexAlphaMinValue;
			uniform half _MainTexAlphaMaxValue;
			uniform half4 TVE_ColorsCoords;
			uniform half4 TVE_ExtrasCoords;
			uniform half4 TVE_MotionCoords;
			uniform half4 TVE_VertexCoords;
			uniform half TVE_ElementsFadeValue;
			uniform half _ElementVolumeFadeMode;
			UNITY_INSTANCING_BUFFER_START(BOXOPHOBICTheVegetationEngineElementsDefaultColorsDefault)
				UNITY_DEFINE_INSTANCED_PROP(half4, _ElementParams)
#define _ElementParams_arr BOXOPHOBICTheVegetationEngineElementsDefaultColorsDefault
			UNITY_INSTANCING_BUFFER_END(BOXOPHOBICTheVegetationEngineElementsDefaultColorsDefault)
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

				half TVE_SeasonOptions_X50_g21502 = TVE_SeasonOptions.x;
				half4 Color_Winter_RGBA58_g21502 = _AdditionalColor1;
				half4 Color_Spring_RGBA59_g21502 = _AdditionalColor2;
				half TVE_SeasonLerp54_g21502 = TVE_SeasonLerp;
				half4 lerpResult13_g21502 = lerp( Color_Winter_RGBA58_g21502 , Color_Spring_RGBA59_g21502 , TVE_SeasonLerp54_g21502);
				half TVE_SeasonOptions_Y51_g21502 = TVE_SeasonOptions.y;
				half4 Color_Summer_RGBA60_g21502 = _AdditionalColor3;
				half4 lerpResult14_g21502 = lerp( Color_Spring_RGBA59_g21502 , Color_Summer_RGBA60_g21502 , TVE_SeasonLerp54_g21502);
				half TVE_SeasonOptions_Z52_g21502 = TVE_SeasonOptions.z;
				half4 Color_Autumn_RGBA61_g21502 = _AdditionalColor4;
				half4 lerpResult15_g21502 = lerp( Color_Summer_RGBA60_g21502 , Color_Autumn_RGBA61_g21502 , TVE_SeasonLerp54_g21502);
				half TVE_SeasonOptions_W53_g21502 = TVE_SeasonOptions.w;
				half4 lerpResult12_g21502 = lerp( Color_Autumn_RGBA61_g21502 , Color_Winter_RGBA58_g21502 , TVE_SeasonLerp54_g21502);
				half4 vertexToFrag11_g21504 = ( ( TVE_SeasonOptions_X50_g21502 * lerpResult13_g21502 ) + ( TVE_SeasonOptions_Y51_g21502 * lerpResult14_g21502 ) + ( TVE_SeasonOptions_Z52_g21502 * lerpResult15_g21502 ) + ( TVE_SeasonOptions_W53_g21502 * lerpResult12_g21502 ) );
				o.ase_texcoord1 = vertexToFrag11_g21504;
				
				o.ase_texcoord2.xy = v.ase_texcoord.xy;
				o.ase_color = v.color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.zw = 0;
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
				half4 Color_Main_RGBA49_g21502 = _MainColor;
				half4 vertexToFrag11_g21504 = i.ase_texcoord1;
				half4 Color_Seasons1715_g21502 = vertexToFrag11_g21504;
				half Element_Mode55_g21502 = _ElementMode;
				half4 lerpResult30_g21502 = lerp( Color_Main_RGBA49_g21502 , Color_Seasons1715_g21502 , Element_Mode55_g21502);
				half4 MainTex_RGBA587_g21502 = tex2D( _MainTex, ( ( ( 1.0 - i.ase_texcoord2.xy ) * (_MainUVs).xy ) + (_MainUVs).zw ) );
				half3 temp_cast_0 = (0.0001).xxx;
				half3 temp_cast_1 = (0.9999).xxx;
				half3 clampResult17_g21512 = clamp( (MainTex_RGBA587_g21502).rgb , temp_cast_0 , temp_cast_1 );
				half temp_output_7_0_g21516 = _MainTexColorMinValue;
				half3 temp_cast_2 = (temp_output_7_0_g21516).xxx;
				half temp_output_10_0_g21516 = ( _MainTexColorMaxValue - temp_output_7_0_g21516 );
				half3 temp_output_1765_0_g21502 = saturate( ( ( clampResult17_g21512 - temp_cast_2 ) / temp_output_10_0_g21516 ) );
				half3 Element_Remap_RGB1555_g21502 = temp_output_1765_0_g21502;
				half4 _ElementParams_Instance = UNITY_ACCESS_INSTANCED_PROP(_ElementParams_arr, _ElementParams);
				half3 Element_Params_RGB1735_g21502 = (_ElementParams_Instance).xyz;
				half3 Element_Color1756_g21502 = ( Element_Remap_RGB1555_g21502 * Element_Params_RGB1735_g21502 * (i.ase_color).rgb );
				half3 Final_Colors_RGB142_g21502 = ( (lerpResult30_g21502).rgb * Element_Color1756_g21502 );
				half clampResult17_g21511 = clamp( (MainTex_RGBA587_g21502).a , 0.0001 , 0.9999 );
				half temp_output_7_0_g21513 = _MainTexAlphaMinValue;
				half temp_output_10_0_g21513 = ( _MainTexAlphaMaxValue - temp_output_7_0_g21513 );
				half Element_Remap_A74_g21502 = saturate( ( ( clampResult17_g21511 - temp_output_7_0_g21513 ) / ( temp_output_10_0_g21513 + 0.0001 ) ) );
				half Element_Params_A1737_g21502 = _ElementParams_Instance.w;
				half4 Colors37_g21519 = TVE_ColorsCoords;
				half4 Extras37_g21519 = TVE_ExtrasCoords;
				half4 Motion37_g21519 = TVE_MotionCoords;
				half4 Vertex37_g21519 = TVE_VertexCoords;
				half4 localIS_ELEMENT37_g21519 = IS_ELEMENT( Colors37_g21519 , Extras37_g21519 , Motion37_g21519 , Vertex37_g21519 );
				half4 temp_output_35_0_g21523 = localIS_ELEMENT37_g21519;
				half temp_output_7_0_g21524 = TVE_ElementsFadeValue;
				half2 temp_cast_3 = (temp_output_7_0_g21524).xx;
				half temp_output_10_0_g21524 = ( 1.0 - temp_output_7_0_g21524 );
				half2 temp_output_16_0_g21517 = saturate( ( ( abs( (( (temp_output_35_0_g21523).zw + ( (temp_output_35_0_g21523).xy * (WorldPosition).xz ) )*2.002 + -1.001) ) - temp_cast_3 ) / temp_output_10_0_g21524 ) );
				half2 temp_output_12_0_g21517 = ( temp_output_16_0_g21517 * temp_output_16_0_g21517 );
				half lerpResult842_g21502 = lerp( 1.0 , ( 1.0 - saturate( ( (temp_output_12_0_g21517).x + (temp_output_12_0_g21517).y ) ) ) , _ElementVolumeFadeMode);
				half Element_Alpha56_g21502 = ( _ElementIntensity * Element_Remap_A74_g21502 * Element_Params_A1737_g21502 * i.ase_color.a * lerpResult842_g21502 );
				half Final_Colors_A144_g21502 = ( (lerpResult30_g21502).a * Element_Alpha56_g21502 );
				half4 appendResult470_g21502 = (half4(Final_Colors_RGB142_g21502 , Final_Colors_A144_g21502));
				
				
				finalColor = appendResult470_g21502;
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
Node;AmplifyShaderEditor.FunctionNode;186;-640,-768;Inherit;False;Define Element Colors;67;;19978;378049ebac362e14aae08c2daa8ed737;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;0;-304,-512;Half;False;True;-1;2;TVEShaderElementGUI;0;5;BOXOPHOBIC/The Vegetation Engine/Elements/Default/Colors Default;0770190933193b94aaa3065e307002fa;True;Unlit;0;0;Unlit;2;True;True;2;5;False;;10;False;;0;1;False;;1;False;;True;0;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;2;False;;True;True;True;True;True;True;0;False;_render_colormask;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;2;False;;True;0;False;;True;False;0;False;;0;False;;True;4;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;PreviewType=Plane;DisableBatching=True=DisableBatching;True;2;False;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;0;;0;0;Standard;1;Vertex Position,InvertActionOnDeselection;1;0;0;1;True;False;;False;0
Node;AmplifyShaderEditor.RangedFloatNode;178;-640,-640;Half;False;Property;_render_colormask;_render_colormask;69;1;[HideInInspector];Create;True;0;0;0;True;0;False;15;14;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;100;-256,-768;Half;False;Property;_Message;Message;1;0;Create;True;0;0;0;True;1;StyledMessage(Info, Use the Colors elements to add color tinting to the vegetation assets. Element Texture RGB and Particle Color RGB are used as value multipliers. Element Texture A and Particle Color A are used as element as alpha mask., 0,0);False;0;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;97;-384,-768;Half;False;Property;_Banner;Banner;0;0;Create;True;0;0;0;False;1;StyledBanner(Color Element);False;0;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;248;0,-768;Inherit;False;Compile All Elements;-1;;21475;5302407fc6d65554791e558e67d59358;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;266;-640,-512;Inherit;False;Base Element;2;;21502;0e972c73cae2ee54ea51acc9738801d0;4,477,0,478,0,145,0,481,0;0;1;FLOAT4;0
WireConnection;0;0;266;0
ASEEND*/
//CHKSM=856A72A95AB4DD22A7921B987A49A4318F8B0CEB
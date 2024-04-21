// Upgrade NOTE: upgraded instancing buffer 'BOXOPHOBICTheVegetationEngineElementsDefaultColorsNoise' to new syntax.

// Made with Amplify Shader Editor v1.9.1.5
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BOXOPHOBIC/The Vegetation Engine/Elements/Default/Colors Noise"
{
	Properties
	{
		[StyledMessage(Info, Use the Colors Noise elements to add two colors noise tinting to the vegetation assets. Element Texture A is used as alpha mask., 0,0)]_Message("Message", Float) = 0
		[StyledCategory(Render Settings)]_CategoryRender("[ Category Render ]", Float) = 0
		_ElementIntensity("Render Intensity", Range( 0 , 1)) = 1
		[HideInInspector]_ElementParams("Render Params", Vector) = (1,1,1,1)
		[StyledMessage(Warning, When using all layers the Global Volume will create one render texture for each layer to render the elements. Try using fewer layers when possible., _ElementLayerWarning, 1, 10, 10)]_ElementLayerWarning("Render Layer Warning", Float) = 0
		[StyledMessage(Info, When using a higher Layer number the Global Volume will create more render textures to render the elements. Try using fewer layers when possible., _ElementLayerMessage, 1, 10, 10)]_ElementLayerMessage("Render Layer Message", Float) = 0
		[StyledMask(TVELayers, Default 0 Layer_1 1 Layer_2 2 Layer_3 3 Layer_4 4 Layer_5 5 Layer_6 6 Layer_7 7 Layer_8 8, 0, 0)]_ElementLayerMask("Render Layer", Float) = 1
		[StyledCategory(Element Settings)]_CategoryElement("[ Category Element ]", Float) = 0
		[NoScaleOffset][StyledTextureSingleLine]_MainTex("Element Texture", 2D) = "white" {}
		[Space(10)][StyledVector(9)]_MainUVs("Element UVs", Vector) = (1,1,0,0)
		[StyledRemapSlider(_MainTexColorMinValue, _MainTexColorMaxValue, 0, 1)]_MainTexColorRemap("Element Color", Vector) = (0,0,0,0)
		[StyledRemapSlider(_MainTexAlphaMinValue, _MainTexAlphaMaxValue, 0, 1)]_MainTexAlphaRemap("Element Alpha", Vector) = (0,0,0,0)
		[HideInInspector]_MainTexAlphaMinValue("Element Alpha Min", Range( 0 , 1)) = 0
		[HideInInspector]_MainTexAlphaMaxValue("Element Alpha Max", Range( 0 , 1)) = 1
		[HDR][Gamma][Space(10)]_NoiseColorOne("Noise Color One", Color) = (0,1,0,1)
		[HDR][Gamma]_NoiseColorTwo("Noise Color Two", Color) = (1,0,0,1)
		[StyledRemapSlider(_NoiseMinValue, _NoiseMaxValue, 0, 1)]_NoiseRemap("Noise Remap", Vector) = (0,0,0,0)
		[HideInInspector]_NoiseMinValue("Noise Min", Range( 0 , 1)) = 0
		[HideInInspector]_NoiseMaxValue("Noise Max", Range( 0 , 1)) = 1
		_NoiseScaleValue("Noise Scale", Float) = 1
		[StyledMessage(Info, The Particle Velocity mode requires the particle to have custom vertex streams for Velocity and Speed set after the UV stream under the particle Renderer module. , _ElementDirectionMode, 40, 10, 0)]_ElementDirectionMessage("Element Direction Message", Float) = 0
		[Enum(Element Forward,10,Element Texture,20,Particle Translate,30,Particle Velocity,40)][Space(10)]_ElementDirectionMode("Direction Mode", Float) = 20
		[Space(10)]_InfluenceValue1("Winter Influence", Range( 0 , 1)) = 1
		_InfluenceValue2("Spring Influence", Range( 0 , 1)) = 1
		_InfluenceValue3("Summer Influence", Range( 0 , 1)) = 1
		_InfluenceValue4("Autumn Influence", Range( 0 , 1)) = 1
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
			uniform half4 _NoiseColorOne;
			uniform half4 _NoiseColorTwo;
			uniform half _NoiseScaleValue;
			uniform half _NoiseMinValue;
			uniform half _NoiseMaxValue;
			uniform half _ElementIntensity;
			uniform sampler2D _MainTex;
			uniform half4 _MainUVs;
			uniform half _MainTexAlphaMinValue;
			uniform half _MainTexAlphaMaxValue;
			uniform half4 TVE_ColorsCoords;
			uniform half4 TVE_ExtrasCoords;
			uniform half4 TVE_MotionCoords;
			uniform half4 TVE_VertexCoords;
			uniform half TVE_ElementsFadeValue;
			uniform half _ElementVolumeFadeMode;
			uniform half4 TVE_SeasonOptions;
			uniform half _InfluenceValue1;
			uniform half _InfluenceValue2;
			uniform half TVE_SeasonLerp;
			uniform half _InfluenceValue3;
			uniform half _InfluenceValue4;
			UNITY_INSTANCING_BUFFER_START(BOXOPHOBICTheVegetationEngineElementsDefaultColorsNoise)
				UNITY_DEFINE_INSTANCED_PROP(half4, _ElementParams)
#define _ElementParams_arr BOXOPHOBICTheVegetationEngineElementsDefaultColorsNoise
			UNITY_INSTANCING_BUFFER_END(BOXOPHOBICTheVegetationEngineElementsDefaultColorsNoise)
			inline float noise_randomValue (float2 uv) { return frac(sin(dot(uv, float2(12.9898, 78.233)))*43758.5453); }
			inline float noise_interpolate (float a, float b, float t) { return (1.0-t)*a + (t*b); }
			inline float valueNoise (float2 uv)
			{
				float2 i = floor(uv);
				float2 f = frac( uv );
				f = f* f * (3.0 - 2.0 * f);
				uv = abs( frac(uv) - 0.5);
				float2 c0 = i + float2( 0.0, 0.0 );
				float2 c1 = i + float2( 1.0, 0.0 );
				float2 c2 = i + float2( 0.0, 1.0 );
				float2 c3 = i + float2( 1.0, 1.0 );
				float r0 = noise_randomValue( c0 );
				float r1 = noise_randomValue( c1 );
				float r2 = noise_randomValue( c2 );
				float r3 = noise_randomValue( c3 );
				float bottomOfGrid = noise_interpolate( r0, r1, f.x );
				float topOfGrid = noise_interpolate( r2, r3, f.x );
				float t = noise_interpolate( bottomOfGrid, topOfGrid, f.y );
				return t;
			}
			
			float SimpleNoise(float2 UV)
			{
				float t = 0.0;
				float freq = pow( 2.0, float( 0 ) );
				float amp = pow( 0.5, float( 3 - 0 ) );
				t += valueNoise( UV/freq )*amp;
				freq = pow(2.0, float(1));
				amp = pow(0.5, float(3-1));
				t += valueNoise( UV/freq )*amp;
				freq = pow(2.0, float(2));
				amp = pow(0.5, float(3-2));
				t += valueNoise( UV/freq )*amp;
				return t;
			}
			
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

				half TVE_SeasonOptions_X50_g21473 = TVE_SeasonOptions.x;
				half Influence_Winter808_g21473 = _InfluenceValue1;
				half Influence_Spring814_g21473 = _InfluenceValue2;
				half TVE_SeasonLerp54_g21473 = TVE_SeasonLerp;
				half lerpResult829_g21473 = lerp( Influence_Winter808_g21473 , Influence_Spring814_g21473 , TVE_SeasonLerp54_g21473);
				half TVE_SeasonOptions_Y51_g21473 = TVE_SeasonOptions.y;
				half Influence_Summer815_g21473 = _InfluenceValue3;
				half lerpResult833_g21473 = lerp( Influence_Spring814_g21473 , Influence_Summer815_g21473 , TVE_SeasonLerp54_g21473);
				half TVE_SeasonOptions_Z52_g21473 = TVE_SeasonOptions.z;
				half Influence_Autumn810_g21473 = _InfluenceValue4;
				half lerpResult816_g21473 = lerp( Influence_Summer815_g21473 , Influence_Autumn810_g21473 , TVE_SeasonLerp54_g21473);
				half TVE_SeasonOptions_W53_g21473 = TVE_SeasonOptions.w;
				half lerpResult817_g21473 = lerp( Influence_Autumn810_g21473 , Influence_Winter808_g21473 , TVE_SeasonLerp54_g21473);
				half vertexToFrag11_g21477 = ( ( TVE_SeasonOptions_X50_g21473 * lerpResult829_g21473 ) + ( TVE_SeasonOptions_Y51_g21473 * lerpResult833_g21473 ) + ( TVE_SeasonOptions_Z52_g21473 * lerpResult816_g21473 ) + ( TVE_SeasonOptions_W53_g21473 * lerpResult817_g21473 ) );
				o.ase_texcoord1.z = vertexToFrag11_g21477;
				
				o.ase_texcoord1.xy = v.ase_texcoord.xy;
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
				half Noise_Scale892_g21473 = _NoiseScaleValue;
				half simpleNoise775_g21473 = SimpleNoise( i.ase_texcoord1.xy*Noise_Scale892_g21473 );
				half Noise_Min893_g21473 = _NoiseMinValue;
				half temp_output_7_0_g21485 = Noise_Min893_g21473;
				half Noise_Max894_g21473 = _NoiseMaxValue;
				half temp_output_10_0_g21485 = ( Noise_Max894_g21473 - temp_output_7_0_g21485 );
				half WorldNoise1483_g21473 = saturate( ( ( simpleNoise775_g21473 - temp_output_7_0_g21485 ) / temp_output_10_0_g21485 ) );
				half4 lerpResult772_g21473 = lerp( _NoiseColorOne , _NoiseColorTwo , WorldNoise1483_g21473);
				half3 Final_ColorsNoise_RGB784_g21473 = (lerpResult772_g21473).rgb;
				half4 MainTex_RGBA587_g21473 = tex2D( _MainTex, ( ( ( 1.0 - i.ase_texcoord1.xy ) * (_MainUVs).xy ) + (_MainUVs).zw ) );
				half clampResult17_g21482 = clamp( (MainTex_RGBA587_g21473).a , 0.0001 , 0.9999 );
				half temp_output_7_0_g21484 = _MainTexAlphaMinValue;
				half temp_output_10_0_g21484 = ( _MainTexAlphaMaxValue - temp_output_7_0_g21484 );
				half Element_Remap_A74_g21473 = saturate( ( ( clampResult17_g21482 - temp_output_7_0_g21484 ) / ( temp_output_10_0_g21484 + 0.0001 ) ) );
				half4 _ElementParams_Instance = UNITY_ACCESS_INSTANCED_PROP(_ElementParams_arr, _ElementParams);
				half Element_Params_A1737_g21473 = _ElementParams_Instance.w;
				half4 Colors37_g21490 = TVE_ColorsCoords;
				half4 Extras37_g21490 = TVE_ExtrasCoords;
				half4 Motion37_g21490 = TVE_MotionCoords;
				half4 Vertex37_g21490 = TVE_VertexCoords;
				half4 localIS_ELEMENT37_g21490 = IS_ELEMENT( Colors37_g21490 , Extras37_g21490 , Motion37_g21490 , Vertex37_g21490 );
				half4 temp_output_35_0_g21494 = localIS_ELEMENT37_g21490;
				half temp_output_7_0_g21495 = TVE_ElementsFadeValue;
				half2 temp_cast_0 = (temp_output_7_0_g21495).xx;
				half temp_output_10_0_g21495 = ( 1.0 - temp_output_7_0_g21495 );
				half2 temp_output_16_0_g21488 = saturate( ( ( abs( (( (temp_output_35_0_g21494).zw + ( (temp_output_35_0_g21494).xy * (WorldPosition).xz ) )*2.002 + -1.001) ) - temp_cast_0 ) / temp_output_10_0_g21495 ) );
				half2 temp_output_12_0_g21488 = ( temp_output_16_0_g21488 * temp_output_16_0_g21488 );
				half lerpResult842_g21473 = lerp( 1.0 , ( 1.0 - saturate( ( (temp_output_12_0_g21488).x + (temp_output_12_0_g21488).y ) ) ) , _ElementVolumeFadeMode);
				half Element_Alpha56_g21473 = ( _ElementIntensity * Element_Remap_A74_g21473 * Element_Params_A1737_g21473 * i.ase_color.a * lerpResult842_g21473 );
				half vertexToFrag11_g21477 = i.ase_texcoord1.z;
				half Element_Seasons834_g21473 = vertexToFrag11_g21477;
				half Final_ColorsNoise_A785_g21473 = ( (lerpResult772_g21473).a * Element_Alpha56_g21473 * Element_Seasons834_g21473 );
				half4 appendResult790_g21473 = (half4(Final_ColorsNoise_RGB784_g21473 , Final_ColorsNoise_A785_g21473));
				
				
				finalColor = appendResult790_g21473;
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
Node;AmplifyShaderEditor.FunctionNode;108;-640,-768;Inherit;False;Define Element Colors;67;;20749;378049ebac362e14aae08c2daa8ed737;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;159;-640,-640;Half;False;Property;_render_colormask;_render_colormask;69;1;[HideInInspector];Create;True;0;0;0;True;0;False;15;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;0;-304,-512;Half;False;True;-1;2;TVEShaderElementGUI;0;5;BOXOPHOBIC/The Vegetation Engine/Elements/Default/Colors Noise;0770190933193b94aaa3065e307002fa;True;Unlit;0;0;Unlit;2;False;True;2;5;False;;10;False;;0;1;False;;0;False;;True;0;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;2;False;;True;True;True;True;True;True;0;False;_render_colormask;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;2;False;;True;0;False;;True;False;0;False;;0;False;;True;4;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;PreviewType=Plane;DisableBatching=True=DisableBatching;True;2;False;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;0;;0;0;Standard;1;Vertex Position,InvertActionOnDeselection;1;0;0;1;True;False;;False;0
Node;AmplifyShaderEditor.RangedFloatNode;100;-256,-768;Half;False;Property;_Message;Message;1;0;Create;True;0;0;0;True;1;StyledMessage(Info, Use the Colors Noise elements to add two colors noise tinting to the vegetation assets. Element Texture A is used as alpha mask., 0,0);False;0;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;97;-384,-768;Half;False;Property;_Banner;Banner;0;0;Create;True;0;0;0;False;1;StyledBanner(Color Noise Element);False;0;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;181;0,-768;Inherit;False;Compile All Elements;-1;;21472;5302407fc6d65554791e558e67d59358;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;180;-640,-512;Inherit;False;Base Element;2;;21473;0e972c73cae2ee54ea51acc9738801d0;4,477,0,478,2,145,0,481,0;0;1;FLOAT4;0
WireConnection;0;0;180;0
ASEEND*/
//CHKSM=DC962F5AC77E63CE898A5630C39D1716305B7E65
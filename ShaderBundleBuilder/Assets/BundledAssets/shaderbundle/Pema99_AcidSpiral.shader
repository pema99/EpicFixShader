Shader "Pema99/AcidSpiral" {
	Properties {
		[Header(General)] _MainTex ("MainTex", 2D) = "white" {}
		_Color ("Color", Vector) = (1.,1.,1.,1.)
		_Exponent ("Color Exponent", Range(0., 30.)) = 1.
		_Alpha ("Alpha", Range(0., 1.)) = 1.
		_UVX ("UV Offset X", Range(-1., 1.)) = 0.
		_UVY ("UV Offset Y", Range(-1., 1.)) = 0.
		_Speed ("Speed", Range(0., 10.)) = 1.
		_Period ("Period", Range(0., 5.)) = 1.33000004291534423828125
		_Bri ("Wave Coefficient", Range(0.00999999977648258209228515625, 3.)) = 1.
		[HDR] _Tint ("Tint", Vector) = (10.,17.,1.7999999523162841796875,1.)
		[Header(Rays)] _Rays ("Rays", Range(0., 20.)) = 3.
		_SpinSpeed ("Spin Speed", Range(0., 10.)) = 1.
		_BounceSpeed ("Bounce Speed", Range(0., 20.)) = 1.
		[Header(Rings)] _Outer ("Outer Rings", Range(0., 20.)) = 5.
		_Inner ("Inner Rings", Range(0., 20.)) = 5.
		_RingSpeed ("Ring Speed", Range(0., 10.)) = 1.
		[Header(Rendering)] [Enum(UnityEngine.Rendering.CullMode)] _Cull ("Cull", Float) = 2.
		[Toggle] _ZWrite ("ZWrite", Float) = 1.
	}
	SubShader {
		Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
		Pass {
			Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
			Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
			ZWrite Off
			Cull Off
			// GpuProgramID 36321
			CGPROGRAM
			#include "UnityCG.cginc"
			#pragma shader_feature UNITY_SINGLE_PASS_STEREO
			#pragma shader_feature STEREO_INSTANCING_ON
			#if !(UNITY_SINGLE_PASS_STEREO || STEREO_INSTANCING_ON)
			#pragma target 4.0
					
			
			struct VertexIn
			{
			    float4 in_POSITION0 : POSITION0;
			    float2 in_TEXCOORD0 : TEXCOORD0;
			    UNITY_VERTEX_INPUT_INSTANCE_ID
			};
			
			struct VertexOut
			{
			    float4 gl_Position : SV_POSITION0;
			    float2 vs_TEXCOORD0 : TEXCOORD0;
			    UNITY_VERTEX_OUTPUT_STEREO
			};
			
			#define VERTEX_INPUT VertexIn
			#define STAGE_VERTEX 1
			#pragma vertex vert
			VertexOut vert(VERTEX_INPUT vertexIn)
			{
			    VertexOut vertexOut = (VertexOut)0;
			    UNITY_SETUP_INSTANCE_ID(vertexIn);
			    UNITY_INITIALIZE_OUTPUT(VertexOut, vertexOut);
			    UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(vertexOut);
			    //--- Start Early Main ---
			    float4 u_xlat0;
			    float4 u_xlat1;
			    //--- End Early Main ---
			    //MUL
			    u_xlat0 = vertexIn.in_POSITION0.yyyy * unity_ObjectToWorld._m01_m11_m21_m31;
			    //MAD
			    u_xlat0 = unity_ObjectToWorld._m00_m10_m20_m30 * vertexIn.in_POSITION0.xxxx + u_xlat0;
			    //MAD
			    u_xlat0 = unity_ObjectToWorld._m02_m12_m22_m32 * vertexIn.in_POSITION0.zzzz + u_xlat0;
			    //ADD
			    u_xlat0 = u_xlat0 + unity_ObjectToWorld._m03_m13_m23_m33;
			    //MUL
			    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP._m01_m11_m21_m31;
			    //MAD
			    u_xlat1 = unity_MatrixVP._m00_m10_m20_m30 * u_xlat0.xxxx + u_xlat1;
			    //MAD
			    u_xlat1 = unity_MatrixVP._m02_m12_m22_m32 * u_xlat0.zzzz + u_xlat1;
			    //MAD
			    vertexOut.gl_Position = unity_MatrixVP._m03_m13_m23_m33 * u_xlat0.wwww + u_xlat1;
			    //MOV
			    vertexOut.vs_TEXCOORD0.xy = vertexIn.in_TEXCOORD0.xy;
			    //RET
			    return vertexOut;
			}
			#endif
			#if (UNITY_SINGLE_PASS_STEREO) && !(STEREO_INSTANCING_ON)
			#pragma target 4.0
					
			
			struct VertexIn
			{
			    float4 in_POSITION0 : POSITION0;
			    float2 in_TEXCOORD0 : TEXCOORD0;
			    UNITY_VERTEX_INPUT_INSTANCE_ID
			};
			
			struct VertexOut
			{
			    float4 gl_Position : SV_POSITION0;
			    float2 vs_TEXCOORD0 : TEXCOORD0;
			    UNITY_VERTEX_OUTPUT_STEREO
			};
			
			#define VERTEX_INPUT VertexIn
			#define STAGE_VERTEX 1
			#pragma vertex vert
			VertexOut vert(VERTEX_INPUT vertexIn)
			{
			    VertexOut vertexOut = (VertexOut)0;
			    UNITY_SETUP_INSTANCE_ID(vertexIn);
			    UNITY_INITIALIZE_OUTPUT(VertexOut, vertexOut);
			    UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(vertexOut);
			    //--- Start Early Main ---
			    float4 u_xlat0;
			    int u_xlati1;
			    float4 u_xlat2;
			    //--- End Early Main ---
			    //MUL
			    u_xlat0 = vertexIn.in_POSITION0.yyyy * unity_ObjectToWorld._m01_m11_m21_m31;
			    //MAD
			    u_xlat0 = unity_ObjectToWorld._m00_m10_m20_m30 * vertexIn.in_POSITION0.xxxx + u_xlat0;
			    //MAD
			    u_xlat0 = unity_ObjectToWorld._m02_m12_m22_m32 * vertexIn.in_POSITION0.zzzz + u_xlat0;
			    //ADD
			    u_xlat0 = u_xlat0 + unity_ObjectToWorld._m03_m13_m23_m33;
			    //ISHL
			    u_xlati1 = unity_StereoEyeIndex << 2;
			    //MUL
			    u_xlat2 = u_xlat0.yyyy * unity_StereoMatrixVP[(u_xlati1 + 1) / 4][(u_xlati1 + 1) % 4];
			    //MAD
			    u_xlat2 = unity_StereoMatrixVP[u_xlati1 / 4][u_xlati1 % 4] * u_xlat0.xxxx + u_xlat2;
			    //MAD
			    u_xlat2 = unity_StereoMatrixVP[(u_xlati1 + 2) / 4][(u_xlati1 + 2) % 4] * u_xlat0.zzzz + u_xlat2;
			    //MAD
			    vertexOut.gl_Position = unity_StereoMatrixVP[(u_xlati1 + 3) / 4][(u_xlati1 + 3) % 4] * u_xlat0.wwww + u_xlat2;
			    //MOV
			    vertexOut.vs_TEXCOORD0.xy = vertexIn.in_TEXCOORD0.xy;
			    //RET
			    return vertexOut;
			}
			#endif
			#if (STEREO_INSTANCING_ON) && !(UNITY_SINGLE_PASS_STEREO)
			#pragma target 4.0
					
			
			struct VertexIn
			{
			    float4 in_POSITION0 : POSITION0;
			    float2 in_TEXCOORD0 : TEXCOORD0;
			    UNITY_VERTEX_INPUT_INSTANCE_ID
			};
			
			struct VertexOut
			{
			    float4 gl_Position : SV_POSITION0;
			    float2 vs_TEXCOORD0 : TEXCOORD0;
			    UNITY_VERTEX_OUTPUT_STEREO
			};
			
			#define VERTEX_INPUT VertexIn
			#define STAGE_VERTEX 1
			#pragma vertex vert
			VertexOut vert(VERTEX_INPUT vertexIn)
			{
			    VertexOut vertexOut = (VertexOut)0;
			    UNITY_SETUP_INSTANCE_ID(vertexIn);
			    UNITY_INITIALIZE_OUTPUT(VertexOut, vertexOut);
			    UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(vertexOut);
			    //--- Start Early Main ---
			    float4 u_xlat0;
			    float4 u_xlat1;
			    //--- End Early Main ---
			    //MUL
			    u_xlat0 = vertexIn.in_POSITION0.yyyy * unity_ObjectToWorld._m01_m11_m21_m31;
			    //MAD
			    u_xlat0 = unity_ObjectToWorld._m00_m10_m20_m30 * vertexIn.in_POSITION0.xxxx + u_xlat0;
			    //MAD
			    u_xlat0 = unity_ObjectToWorld._m02_m12_m22_m32 * vertexIn.in_POSITION0.zzzz + u_xlat0;
			    //ADD
			    u_xlat0 = u_xlat0 + unity_ObjectToWorld._m03_m13_m23_m33;
			    //MUL
			    u_xlat1 = u_xlat0.yyyy * unity_StereoMatrixVP[1 / 4][1 % 4];
			    //MAD
			    u_xlat1 = unity_StereoMatrixVP[0 / 4][0 % 4] * u_xlat0.xxxx + u_xlat1;
			    //MAD
			    u_xlat1 = unity_StereoMatrixVP[2 / 4][2 % 4] * u_xlat0.zzzz + u_xlat1;
			    //MAD
			    vertexOut.gl_Position = unity_StereoMatrixVP[3 / 4][3 % 4] * u_xlat0.wwww + u_xlat1;
			    //MOV
			    vertexOut.vs_TEXCOORD0.xy = vertexIn.in_TEXCOORD0.xy;
			    //RET
			    return vertexOut;
			}
			#endif
			#if !(UNITY_SINGLE_PASS_STEREO || STEREO_INSTANCING_ON)
			#pragma target 4.0
					
			
			#ifndef _Alpha_DEFINED
			#define _Alpha_DEFINED
			uniform float _Alpha;
			#endif
			#ifndef _UVX_DEFINED
			#define _UVX_DEFINED
			uniform float _UVX;
			#endif
			#ifndef _UVY_DEFINED
			#define _UVY_DEFINED
			uniform float _UVY;
			#endif
			#ifndef _Period_DEFINED
			#define _Period_DEFINED
			uniform float _Period;
			#endif
			#ifndef _Speed_DEFINED
			#define _Speed_DEFINED
			uniform float _Speed;
			#endif
			#ifndef _Bri_DEFINED
			#define _Bri_DEFINED
			uniform float _Bri;
			#endif
			#ifndef _Rays_DEFINED
			#define _Rays_DEFINED
			uniform float _Rays;
			#endif
			#ifndef _Outer_DEFINED
			#define _Outer_DEFINED
			uniform float _Outer;
			#endif
			#ifndef _Inner_DEFINED
			#define _Inner_DEFINED
			uniform float _Inner;
			#endif
			#ifndef _Tint_DEFINED
			#define _Tint_DEFINED
			uniform float3 _Tint;
			#endif
			#ifndef _SpinSpeed_DEFINED
			#define _SpinSpeed_DEFINED
			uniform float _SpinSpeed;
			#endif
			#ifndef _BounceSpeed_DEFINED
			#define _BounceSpeed_DEFINED
			uniform float _BounceSpeed;
			#endif
			#ifndef _RingSpeed_DEFINED
			#define _RingSpeed_DEFINED
			uniform float _RingSpeed;
			#endif
			#ifndef _Color_DEFINED
			#define _Color_DEFINED
			uniform float4 _Color;
			#endif
			#ifndef _Exponent_DEFINED
			#define _Exponent_DEFINED
			uniform float _Exponent;
			#endif
			#ifndef _MainTex_DEFINED
			#define _MainTex_DEFINED
			uniform sampler2D _MainTex;
			#endif
			struct FragmentIn
			{
			    float2 vs_TEXCOORD0 : TEXCOORD0;
			};
			
			struct FragmentOut
			{
			    float4 SV_Target0 : SV_Target0;
			};
			
			#if STAGE_GEOMETRY
			#define FRAGMENT_INPUT GeometryOut
			#elif STAGE_DOMAIN
			#define FRAGMENT_INPUT VertexOutPostTess
			#else
			#define FRAGMENT_INPUT VertexOut
			#endif
			#define STAGE_FRAGMENT 1
			#pragma fragment frag
			FragmentOut frag(FRAGMENT_INPUT fragmentIn)
			{
			    FragmentOut fragmentOut = (FragmentOut)0;
			    UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(fragmentIn);
			    //--- Start Early Main ---
			    float3 u_xlat0;
			    float4 u_xlat1;
			    float u_xlat2;
			    bool u_xlatb2;
			    bool u_xlatb3;
			    float2 u_xlat4;
			    float u_xlat6;
			    bool u_xlatb6;
			    //--- End Early Main ---
			    //ADD
			    u_xlat0.xy = fragmentIn.vs_TEXCOORD0.xy + float2(-0.5, -0.5);
			    //ADD
			    u_xlat0.xy = u_xlat0.xy + (-float2(_UVX, _UVY));
			    //MAX
			    u_xlat4.x = max(abs(u_xlat0.y), abs(u_xlat0.x));
			    //DIV
			    u_xlat4.x = float(1.0) / u_xlat4.x;
			    //MIN
			    u_xlat6 = min(abs(u_xlat0.y), abs(u_xlat0.x));
			    //MUL
			    u_xlat4.x = u_xlat4.x * u_xlat6;
			    //MUL
			    u_xlat6 = u_xlat4.x * u_xlat4.x;
			    //MAD
			    u_xlat1.x = u_xlat6 * 0.0208350997 + -0.0851330012;
			    //MAD
			    u_xlat1.x = u_xlat6 * u_xlat1.x + 0.180141002;
			    //MAD
			    u_xlat1.x = u_xlat6 * u_xlat1.x + -0.330299497;
			    //MAD
			    u_xlat6 = u_xlat6 * u_xlat1.x + 0.999866009;
			    //MUL
			    u_xlat1.x = u_xlat6 * u_xlat4.x;
			    //MAD
			    u_xlat1.x = u_xlat1.x * -2.0 + 1.57079637;
			    //LT
			    u_xlatb3 = abs(u_xlat0.y)<abs(u_xlat0.x);
			    //AND
			    u_xlat1.x = u_xlatb3 ? u_xlat1.x : float(0.0);
			    //MAD
			    u_xlat4.x = u_xlat4.x * u_xlat6 + u_xlat1.x;
			    //LT
			    u_xlatb6 = u_xlat0.y<(-u_xlat0.y);
			    //AND
			    u_xlat6 = u_xlatb6 ? -3.14159274 : float(0.0);
			    //ADD
			    u_xlat4.x = u_xlat6 + u_xlat4.x;
			    //MIN
			    u_xlat6 = min(u_xlat0.y, u_xlat0.x);
			    //LT
			    u_xlatb6 = u_xlat6<(-u_xlat6);
			    //MAX
			    u_xlat1.x = max(u_xlat0.y, u_xlat0.x);
			    //DP2
			    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
			    //SQRT
			    u_xlat0.x = sqrt(u_xlat0.x);
			    //GE
			    u_xlatb2 = u_xlat1.x>=(-u_xlat1.x);
			    //AND
			    u_xlatb2 = u_xlatb2 && u_xlatb6;
			    //MOVC
			    u_xlat2 = (u_xlatb2) ? (-u_xlat4.x) : u_xlat4.x;
			    //MUL
			    u_xlat4.x = _Speed * _Time.y;
			    //MUL
			    u_xlat1.xyz = u_xlat4.xxx * float3(_BounceSpeed, _SpinSpeed, _RingSpeed);
			    //MUL
			    u_xlat4.x = u_xlat1.x * 0.209999993;
			    //SINCOS
			    u_xlat4.x = sin(u_xlat4.x);
			    //MAD
			    u_xlat0.x = u_xlat4.x * 0.200000003 + u_xlat0.x;
			    //MAD
			    u_xlat4.x = u_xlat1.y * 0.100000001 + u_xlat0.x;
			    //MAD
			    u_xlat4.y = u_xlat0.x * _Inner + (-u_xlat1.z);
			    //SINCOS
			    u_xlat4.xy = sin(u_xlat4.xy);
			    //MAD
			    u_xlat6 = u_xlat4.y * 0.5 + 1.0;
			    //MAD
			    u_xlat0.y = u_xlat2 * 0.318310142 + u_xlat4.x;
			    //MUL
			    u_xlat0.xy = u_xlat0.xy * float2(_Outer, _Rays);
			    //MUL
			    u_xlat4.x = u_xlat0.y * 0.5;
			    //ROUND_NI
			    u_xlat4.x = floor(u_xlat4.x);
			    //MAD
			    u_xlat2 = (-u_xlat4.x) * 2.0 + u_xlat0.y;
			    //ADD
			    u_xlat2 = u_xlat2 + (-_Period);
			    //MOV
			    u_xlat1.x = abs(u_xlat2);
			    //MUL
			    u_xlat2 = u_xlat0.x * 0.5;
			    //ROUND_NI
			    u_xlat2 = floor(u_xlat2);
			    //MAD
			    u_xlat0.x = (-u_xlat2) * 2.0 + u_xlat0.x;
			    //ADD
			    u_xlat0.x = u_xlat0.x + (-_Period);
			    //MOV
			    u_xlat1.y = abs(u_xlat0.x);
			    //SAMPLE
			    u_xlat1 = tex2D(_MainTex, u_xlat1.xy);
			    //MUL
			    u_xlat0.xyz = (float3)(u_xlat6) * u_xlat1.xyz;
			    //MUL
			    u_xlat0.xyz = u_xlat0.xyz * (float3)(float3(_Bri, _Bri, _Bri));
			    //MUL
			    u_xlat0.xyz = u_xlat0.xyz * float3(_Tint.x, _Tint.y, _Tint.z);
			    //SINCOS
			    u_xlat0.xyz = sin(u_xlat0.xyz);
			    //MAD
			    u_xlat0.xyz = u_xlat0.xyz * float3(0.5, 0.5, 0.5) + float3(0.5, 0.5, 0.5);
			    //MUL
			    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
			    //LOG
			    u_xlat0.xyz = log2(u_xlat0.xyz);
			    //MUL
			    u_xlat0.xyz = u_xlat0.xyz * (float3)(_Exponent);
			    //EXP
			    fragmentOut.SV_Target0.xyz = exp2(u_xlat0.xyz);
			    //MOV
			    fragmentOut.SV_Target0.w = _Alpha;
			    //RET
			    return fragmentOut;
			}
			#endif
			#if (UNITY_SINGLE_PASS_STEREO) && !(STEREO_INSTANCING_ON)
			#pragma target 4.0
					
			
			#ifndef _Alpha_DEFINED
			#define _Alpha_DEFINED
			uniform float _Alpha;
			#endif
			#ifndef _UVX_DEFINED
			#define _UVX_DEFINED
			uniform float _UVX;
			#endif
			#ifndef _UVY_DEFINED
			#define _UVY_DEFINED
			uniform float _UVY;
			#endif
			#ifndef _Period_DEFINED
			#define _Period_DEFINED
			uniform float _Period;
			#endif
			#ifndef _Speed_DEFINED
			#define _Speed_DEFINED
			uniform float _Speed;
			#endif
			#ifndef _Bri_DEFINED
			#define _Bri_DEFINED
			uniform float _Bri;
			#endif
			#ifndef _Rays_DEFINED
			#define _Rays_DEFINED
			uniform float _Rays;
			#endif
			#ifndef _Outer_DEFINED
			#define _Outer_DEFINED
			uniform float _Outer;
			#endif
			#ifndef _Inner_DEFINED
			#define _Inner_DEFINED
			uniform float _Inner;
			#endif
			#ifndef _Tint_DEFINED
			#define _Tint_DEFINED
			uniform float3 _Tint;
			#endif
			#ifndef _SpinSpeed_DEFINED
			#define _SpinSpeed_DEFINED
			uniform float _SpinSpeed;
			#endif
			#ifndef _BounceSpeed_DEFINED
			#define _BounceSpeed_DEFINED
			uniform float _BounceSpeed;
			#endif
			#ifndef _RingSpeed_DEFINED
			#define _RingSpeed_DEFINED
			uniform float _RingSpeed;
			#endif
			#ifndef _Color_DEFINED
			#define _Color_DEFINED
			uniform float4 _Color;
			#endif
			#ifndef _Exponent_DEFINED
			#define _Exponent_DEFINED
			uniform float _Exponent;
			#endif
			#ifndef _MainTex_DEFINED
			#define _MainTex_DEFINED
			uniform sampler2D _MainTex;
			#endif
			struct FragmentIn
			{
			    float2 vs_TEXCOORD0 : TEXCOORD0;
			};
			
			struct FragmentOut
			{
			    float4 SV_Target0 : SV_Target0;
			};
			
			#if STAGE_GEOMETRY
			#define FRAGMENT_INPUT GeometryOut
			#elif STAGE_DOMAIN
			#define FRAGMENT_INPUT VertexOutPostTess
			#else
			#define FRAGMENT_INPUT VertexOut
			#endif
			#define STAGE_FRAGMENT 1
			#pragma fragment frag
			FragmentOut frag(FRAGMENT_INPUT fragmentIn)
			{
			    FragmentOut fragmentOut = (FragmentOut)0;
			    UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(fragmentIn);
			    //--- Start Early Main ---
			    float3 u_xlat0;
			    float4 u_xlat1;
			    float u_xlat2;
			    bool u_xlatb2;
			    bool u_xlatb3;
			    float2 u_xlat4;
			    float u_xlat6;
			    bool u_xlatb6;
			    //--- End Early Main ---
			    //ADD
			    u_xlat0.xy = fragmentIn.vs_TEXCOORD0.xy + float2(-0.5, -0.5);
			    //ADD
			    u_xlat0.xy = u_xlat0.xy + (-float2(_UVX, _UVY));
			    //MAX
			    u_xlat4.x = max(abs(u_xlat0.y), abs(u_xlat0.x));
			    //DIV
			    u_xlat4.x = float(1.0) / u_xlat4.x;
			    //MIN
			    u_xlat6 = min(abs(u_xlat0.y), abs(u_xlat0.x));
			    //MUL
			    u_xlat4.x = u_xlat4.x * u_xlat6;
			    //MUL
			    u_xlat6 = u_xlat4.x * u_xlat4.x;
			    //MAD
			    u_xlat1.x = u_xlat6 * 0.0208350997 + -0.0851330012;
			    //MAD
			    u_xlat1.x = u_xlat6 * u_xlat1.x + 0.180141002;
			    //MAD
			    u_xlat1.x = u_xlat6 * u_xlat1.x + -0.330299497;
			    //MAD
			    u_xlat6 = u_xlat6 * u_xlat1.x + 0.999866009;
			    //MUL
			    u_xlat1.x = u_xlat6 * u_xlat4.x;
			    //MAD
			    u_xlat1.x = u_xlat1.x * -2.0 + 1.57079637;
			    //LT
			    u_xlatb3 = abs(u_xlat0.y)<abs(u_xlat0.x);
			    //AND
			    u_xlat1.x = u_xlatb3 ? u_xlat1.x : float(0.0);
			    //MAD
			    u_xlat4.x = u_xlat4.x * u_xlat6 + u_xlat1.x;
			    //LT
			    u_xlatb6 = u_xlat0.y<(-u_xlat0.y);
			    //AND
			    u_xlat6 = u_xlatb6 ? -3.14159274 : float(0.0);
			    //ADD
			    u_xlat4.x = u_xlat6 + u_xlat4.x;
			    //MIN
			    u_xlat6 = min(u_xlat0.y, u_xlat0.x);
			    //LT
			    u_xlatb6 = u_xlat6<(-u_xlat6);
			    //MAX
			    u_xlat1.x = max(u_xlat0.y, u_xlat0.x);
			    //DP2
			    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
			    //SQRT
			    u_xlat0.x = sqrt(u_xlat0.x);
			    //GE
			    u_xlatb2 = u_xlat1.x>=(-u_xlat1.x);
			    //AND
			    u_xlatb2 = u_xlatb2 && u_xlatb6;
			    //MOVC
			    u_xlat2 = (u_xlatb2) ? (-u_xlat4.x) : u_xlat4.x;
			    //MUL
			    u_xlat4.x = _Speed * _Time.y;
			    //MUL
			    u_xlat1.xyz = u_xlat4.xxx * float3(_BounceSpeed, _SpinSpeed, _RingSpeed);
			    //MUL
			    u_xlat4.x = u_xlat1.x * 0.209999993;
			    //SINCOS
			    u_xlat4.x = sin(u_xlat4.x);
			    //MAD
			    u_xlat0.x = u_xlat4.x * 0.200000003 + u_xlat0.x;
			    //MAD
			    u_xlat4.x = u_xlat1.y * 0.100000001 + u_xlat0.x;
			    //MAD
			    u_xlat4.y = u_xlat0.x * _Inner + (-u_xlat1.z);
			    //SINCOS
			    u_xlat4.xy = sin(u_xlat4.xy);
			    //MAD
			    u_xlat6 = u_xlat4.y * 0.5 + 1.0;
			    //MAD
			    u_xlat0.y = u_xlat2 * 0.318310142 + u_xlat4.x;
			    //MUL
			    u_xlat0.xy = u_xlat0.xy * float2(_Outer, _Rays);
			    //MUL
			    u_xlat4.x = u_xlat0.y * 0.5;
			    //ROUND_NI
			    u_xlat4.x = floor(u_xlat4.x);
			    //MAD
			    u_xlat2 = (-u_xlat4.x) * 2.0 + u_xlat0.y;
			    //ADD
			    u_xlat2 = u_xlat2 + (-_Period);
			    //MOV
			    u_xlat1.x = abs(u_xlat2);
			    //MUL
			    u_xlat2 = u_xlat0.x * 0.5;
			    //ROUND_NI
			    u_xlat2 = floor(u_xlat2);
			    //MAD
			    u_xlat0.x = (-u_xlat2) * 2.0 + u_xlat0.x;
			    //ADD
			    u_xlat0.x = u_xlat0.x + (-_Period);
			    //MOV
			    u_xlat1.y = abs(u_xlat0.x);
			    //SAMPLE
			    u_xlat1 = tex2D(_MainTex, u_xlat1.xy);
			    //MUL
			    u_xlat0.xyz = (float3)(u_xlat6) * u_xlat1.xyz;
			    //MUL
			    u_xlat0.xyz = u_xlat0.xyz * (float3)(float3(_Bri, _Bri, _Bri));
			    //MUL
			    u_xlat0.xyz = u_xlat0.xyz * float3(_Tint.x, _Tint.y, _Tint.z);
			    //SINCOS
			    u_xlat0.xyz = sin(u_xlat0.xyz);
			    //MAD
			    u_xlat0.xyz = u_xlat0.xyz * float3(0.5, 0.5, 0.5) + float3(0.5, 0.5, 0.5);
			    //MUL
			    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
			    //LOG
			    u_xlat0.xyz = log2(u_xlat0.xyz);
			    //MUL
			    u_xlat0.xyz = u_xlat0.xyz * (float3)(_Exponent);
			    //EXP
			    fragmentOut.SV_Target0.xyz = exp2(u_xlat0.xyz);
			    //MOV
			    fragmentOut.SV_Target0.w = _Alpha;
			    //RET
			    return fragmentOut;
			}
			#endif
			#if (STEREO_INSTANCING_ON) && !(UNITY_SINGLE_PASS_STEREO)
			#pragma target 4.0
					
			
			#ifndef _Alpha_DEFINED
			#define _Alpha_DEFINED
			uniform float _Alpha;
			#endif
			#ifndef _UVX_DEFINED
			#define _UVX_DEFINED
			uniform float _UVX;
			#endif
			#ifndef _UVY_DEFINED
			#define _UVY_DEFINED
			uniform float _UVY;
			#endif
			#ifndef _Period_DEFINED
			#define _Period_DEFINED
			uniform float _Period;
			#endif
			#ifndef _Speed_DEFINED
			#define _Speed_DEFINED
			uniform float _Speed;
			#endif
			#ifndef _Bri_DEFINED
			#define _Bri_DEFINED
			uniform float _Bri;
			#endif
			#ifndef _Rays_DEFINED
			#define _Rays_DEFINED
			uniform float _Rays;
			#endif
			#ifndef _Outer_DEFINED
			#define _Outer_DEFINED
			uniform float _Outer;
			#endif
			#ifndef _Inner_DEFINED
			#define _Inner_DEFINED
			uniform float _Inner;
			#endif
			#ifndef _Tint_DEFINED
			#define _Tint_DEFINED
			uniform float3 _Tint;
			#endif
			#ifndef _SpinSpeed_DEFINED
			#define _SpinSpeed_DEFINED
			uniform float _SpinSpeed;
			#endif
			#ifndef _BounceSpeed_DEFINED
			#define _BounceSpeed_DEFINED
			uniform float _BounceSpeed;
			#endif
			#ifndef _RingSpeed_DEFINED
			#define _RingSpeed_DEFINED
			uniform float _RingSpeed;
			#endif
			#ifndef _Color_DEFINED
			#define _Color_DEFINED
			uniform float4 _Color;
			#endif
			#ifndef _Exponent_DEFINED
			#define _Exponent_DEFINED
			uniform float _Exponent;
			#endif
			#ifndef _MainTex_DEFINED
			#define _MainTex_DEFINED
			uniform sampler2D _MainTex;
			#endif
			struct FragmentIn
			{
			    float2 vs_TEXCOORD0 : TEXCOORD0;
			};
			
			struct FragmentOut
			{
			    float4 SV_Target0 : SV_Target0;
			};
			
			#if STAGE_GEOMETRY
			#define FRAGMENT_INPUT GeometryOut
			#elif STAGE_DOMAIN
			#define FRAGMENT_INPUT VertexOutPostTess
			#else
			#define FRAGMENT_INPUT VertexOut
			#endif
			#define STAGE_FRAGMENT 1
			#pragma fragment frag
			FragmentOut frag(FRAGMENT_INPUT fragmentIn)
			{
			    FragmentOut fragmentOut = (FragmentOut)0;
			    UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(fragmentIn);
			    //--- Start Early Main ---
			    float3 u_xlat0;
			    float4 u_xlat1;
			    float u_xlat2;
			    bool u_xlatb2;
			    bool u_xlatb3;
			    float2 u_xlat4;
			    float u_xlat6;
			    bool u_xlatb6;
			    //--- End Early Main ---
			    //ADD
			    u_xlat0.xy = fragmentIn.vs_TEXCOORD0.xy + float2(-0.5, -0.5);
			    //ADD
			    u_xlat0.xy = u_xlat0.xy + (-float2(_UVX, _UVY));
			    //MAX
			    u_xlat4.x = max(abs(u_xlat0.y), abs(u_xlat0.x));
			    //DIV
			    u_xlat4.x = float(1.0) / u_xlat4.x;
			    //MIN
			    u_xlat6 = min(abs(u_xlat0.y), abs(u_xlat0.x));
			    //MUL
			    u_xlat4.x = u_xlat4.x * u_xlat6;
			    //MUL
			    u_xlat6 = u_xlat4.x * u_xlat4.x;
			    //MAD
			    u_xlat1.x = u_xlat6 * 0.0208350997 + -0.0851330012;
			    //MAD
			    u_xlat1.x = u_xlat6 * u_xlat1.x + 0.180141002;
			    //MAD
			    u_xlat1.x = u_xlat6 * u_xlat1.x + -0.330299497;
			    //MAD
			    u_xlat6 = u_xlat6 * u_xlat1.x + 0.999866009;
			    //MUL
			    u_xlat1.x = u_xlat6 * u_xlat4.x;
			    //MAD
			    u_xlat1.x = u_xlat1.x * -2.0 + 1.57079637;
			    //LT
			    u_xlatb3 = abs(u_xlat0.y)<abs(u_xlat0.x);
			    //AND
			    u_xlat1.x = u_xlatb3 ? u_xlat1.x : float(0.0);
			    //MAD
			    u_xlat4.x = u_xlat4.x * u_xlat6 + u_xlat1.x;
			    //LT
			    u_xlatb6 = u_xlat0.y<(-u_xlat0.y);
			    //AND
			    u_xlat6 = u_xlatb6 ? -3.14159274 : float(0.0);
			    //ADD
			    u_xlat4.x = u_xlat6 + u_xlat4.x;
			    //MIN
			    u_xlat6 = min(u_xlat0.y, u_xlat0.x);
			    //LT
			    u_xlatb6 = u_xlat6<(-u_xlat6);
			    //MAX
			    u_xlat1.x = max(u_xlat0.y, u_xlat0.x);
			    //DP2
			    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
			    //SQRT
			    u_xlat0.x = sqrt(u_xlat0.x);
			    //GE
			    u_xlatb2 = u_xlat1.x>=(-u_xlat1.x);
			    //AND
			    u_xlatb2 = u_xlatb2 && u_xlatb6;
			    //MOVC
			    u_xlat2 = (u_xlatb2) ? (-u_xlat4.x) : u_xlat4.x;
			    //MUL
			    u_xlat4.x = _Speed * _Time.y;
			    //MUL
			    u_xlat1.xyz = u_xlat4.xxx * float3(_BounceSpeed, _SpinSpeed, _RingSpeed);
			    //MUL
			    u_xlat4.x = u_xlat1.x * 0.209999993;
			    //SINCOS
			    u_xlat4.x = sin(u_xlat4.x);
			    //MAD
			    u_xlat0.x = u_xlat4.x * 0.200000003 + u_xlat0.x;
			    //MAD
			    u_xlat4.x = u_xlat1.y * 0.100000001 + u_xlat0.x;
			    //MAD
			    u_xlat4.y = u_xlat0.x * _Inner + (-u_xlat1.z);
			    //SINCOS
			    u_xlat4.xy = sin(u_xlat4.xy);
			    //MAD
			    u_xlat6 = u_xlat4.y * 0.5 + 1.0;
			    //MAD
			    u_xlat0.y = u_xlat2 * 0.318310142 + u_xlat4.x;
			    //MUL
			    u_xlat0.xy = u_xlat0.xy * float2(_Outer, _Rays);
			    //MUL
			    u_xlat4.x = u_xlat0.y * 0.5;
			    //ROUND_NI
			    u_xlat4.x = floor(u_xlat4.x);
			    //MAD
			    u_xlat2 = (-u_xlat4.x) * 2.0 + u_xlat0.y;
			    //ADD
			    u_xlat2 = u_xlat2 + (-_Period);
			    //MOV
			    u_xlat1.x = abs(u_xlat2);
			    //MUL
			    u_xlat2 = u_xlat0.x * 0.5;
			    //ROUND_NI
			    u_xlat2 = floor(u_xlat2);
			    //MAD
			    u_xlat0.x = (-u_xlat2) * 2.0 + u_xlat0.x;
			    //ADD
			    u_xlat0.x = u_xlat0.x + (-_Period);
			    //MOV
			    u_xlat1.y = abs(u_xlat0.x);
			    //SAMPLE
			    u_xlat1 = tex2D(_MainTex, u_xlat1.xy);
			    //MUL
			    u_xlat0.xyz = (float3)(u_xlat6) * u_xlat1.xyz;
			    //MUL
			    u_xlat0.xyz = u_xlat0.xyz * (float3)(float3(_Bri, _Bri, _Bri));
			    //MUL
			    u_xlat0.xyz = u_xlat0.xyz * float3(_Tint.x, _Tint.y, _Tint.z);
			    //SINCOS
			    u_xlat0.xyz = sin(u_xlat0.xyz);
			    //MAD
			    u_xlat0.xyz = u_xlat0.xyz * float3(0.5, 0.5, 0.5) + float3(0.5, 0.5, 0.5);
			    //MUL
			    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
			    //LOG
			    u_xlat0.xyz = log2(u_xlat0.xyz);
			    //MUL
			    u_xlat0.xyz = u_xlat0.xyz * (float3)(_Exponent);
			    //EXP
			    fragmentOut.SV_Target0.xyz = exp2(u_xlat0.xyz);
			    //MOV
			    fragmentOut.SV_Target0.w = _Alpha;
			    //RET
			    return fragmentOut;
			}
			#endif
			ENDCG
		}
	}
}
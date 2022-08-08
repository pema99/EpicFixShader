Shader "Pema99/StrawBerryMarch" {
	Properties {
		[Header(General)] _Iterations ("Iterations", Range(1., 256.)) = 50.
		_MaxDist ("Max distance", Range(0., 4000.)) = 100.
		_Cutoff ("Cutoff", Range(0., 0.100000001490116119384765625)) = 0.00999999977648258209228515625
		_Epsilon ("Epsilon", Range(0.0000009999999974752427078783512115478515625, 0.100000001490116119384765625)) = 0.00999999977648258209228515625
		_Scale ("Scale", Range(0.100000001490116119384765625, 15.)) = 3.
		_NoiseTex ("Noise Tex", 2D) = "white" {}
	}
	SubShader {
		Tags { "DisableBatching" = "true" "QUEUE" = "Transparent+500" }
		Pass {
			Tags { "DisableBatching" = "true" "QUEUE" = "Transparent+500" }
			Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
			Cull Off
			// GpuProgramID 50327
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
			    float2 vs_TEXCOORD0 : TEXCOORD0;
			    float4 gl_Position : SV_POSITION0;
			    float3 vs_TEXCOORD1 : TEXCOORD1;
			    float3 vs_TEXCOORD2 : TEXCOORD2;
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
			    //MOV
			    vertexOut.vs_TEXCOORD0.xy = vertexIn.in_TEXCOORD0.xy;
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
			    //MUL
			    u_xlat0.xyz = _WorldSpaceCameraPos.yyy * unity_WorldToObject._m01_m11_m21_m31.xyz;
			    //MAD
			    u_xlat0.xyz = unity_WorldToObject._m00_m10_m20_m30.xyz * _WorldSpaceCameraPos.xxx + u_xlat0.xyz;
			    //MAD
			    u_xlat0.xyz = unity_WorldToObject._m02_m12_m22_m32.xyz * _WorldSpaceCameraPos.zzz + u_xlat0.xyz;
			    //ADD
			    vertexOut.vs_TEXCOORD1.xyz = u_xlat0.xyz + unity_WorldToObject._m03_m13_m23_m33.xyz;
			    //MOV
			    vertexOut.vs_TEXCOORD2.xyz = vertexIn.in_POSITION0.xyz;
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
			    float2 vs_TEXCOORD0 : TEXCOORD0;
			    float4 gl_Position : SV_POSITION0;
			    float3 vs_TEXCOORD1 : TEXCOORD1;
			    float3 vs_TEXCOORD2 : TEXCOORD2;
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
			    int u_xlati0;
			    int u_xlati1;
			    float4 u_xlat2;
			    float3 u_xlat3;
			    //--- End Early Main ---
			    //MOV
			    vertexOut.vs_TEXCOORD0.xy = vertexIn.in_TEXCOORD0.xy;
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
			    u_xlati0 = unity_StereoEyeIndex;
			    //MUL
			    u_xlat3.xyz = unity_WorldToObject._m01_m11_m21_m31.xyz * unity_StereoWorldSpaceCameraPos[u_xlati0].yyy;
			    //MAD
			    u_xlat3.xyz = unity_WorldToObject._m00_m10_m20_m30.xyz * unity_StereoWorldSpaceCameraPos[u_xlati0].xxx + u_xlat3.xyz;
			    //MAD
			    u_xlat0.xyz = unity_WorldToObject._m02_m12_m22_m32.xyz * unity_StereoWorldSpaceCameraPos[u_xlati0].zzz + u_xlat3.xyz;
			    //ADD
			    vertexOut.vs_TEXCOORD1.xyz = u_xlat0.xyz + unity_WorldToObject._m03_m13_m23_m33.xyz;
			    //MOV
			    vertexOut.vs_TEXCOORD2.xyz = vertexIn.in_POSITION0.xyz;
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
			    float2 vs_TEXCOORD0 : TEXCOORD0;
			    float4 gl_Position : SV_POSITION0;
			    float3 vs_TEXCOORD1 : TEXCOORD1;
			    float3 vs_TEXCOORD2 : TEXCOORD2;
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
			    //MOV
			    vertexOut.vs_TEXCOORD0.xy = vertexIn.in_TEXCOORD0.xy;
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
			    //MUL
			    u_xlat0.xyz = unity_WorldToObject._m01_m11_m21_m31.xyz * unity_StereoWorldSpaceCameraPos[0].yyy;
			    //MAD
			    u_xlat0.xyz = unity_WorldToObject._m00_m10_m20_m30.xyz * unity_StereoWorldSpaceCameraPos[0].xxx + u_xlat0.xyz;
			    //MAD
			    u_xlat0.xyz = unity_WorldToObject._m02_m12_m22_m32.xyz * unity_StereoWorldSpaceCameraPos[0].zzz + u_xlat0.xyz;
			    //ADD
			    vertexOut.vs_TEXCOORD1.xyz = u_xlat0.xyz + unity_WorldToObject._m03_m13_m23_m33.xyz;
			    //MOV
			    vertexOut.vs_TEXCOORD2.xyz = vertexIn.in_POSITION0.xyz;
			    //RET
			    return vertexOut;
			}
			#endif
			#if !(UNITY_SINGLE_PASS_STEREO || STEREO_INSTANCING_ON)
			#pragma target 4.0
					
			
			#ifndef _Iterations_DEFINED
			#define _Iterations_DEFINED
			uniform float _Iterations;
			#endif
			#ifndef _MaxDist_DEFINED
			#define _MaxDist_DEFINED
			uniform float _MaxDist;
			#endif
			#ifndef _Epsilon_DEFINED
			#define _Epsilon_DEFINED
			uniform float _Epsilon;
			#endif
			#ifndef _NoiseTex_DEFINED
			#define _NoiseTex_DEFINED
			uniform sampler2D _NoiseTex;
			#endif
			struct FragmentIn
			{
			    float3 vs_TEXCOORD1 : TEXCOORD1;
			    float3 vs_TEXCOORD2 : TEXCOORD2;
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
			FragmentOut frag(FRAGMENT_INPUT fragmentIn, uint gl_FrontFacing : SV_IsFrontFace0)
			{
			    FragmentOut fragmentOut = (FragmentOut)0;
			    UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(fragmentIn);
			    //--- Start Early Main ---
			    float4 u_xlat0;
			    float3 u_xlat1;
			    float4 u_xlat2;
			    int u_xlati2;
			    float4 u_xlat3;
			    uint u_xlatu3;
			    bool2 u_xlatb3;
			    float4 u_xlat4;
			    uint u_xlatu4;
			    bool2 u_xlatb4;
			    float4 u_xlat5;
			    uint2 u_xlatu5;
			    bool u_xlatb5;
			    float4 u_xlat6;
			    bool2 u_xlatb6;
			    float4 u_xlat7;
			    bool2 u_xlatb7;
			    float4 u_xlat8;
			    float4 u_xlat9;
			    float4 u_xlat10;
			    float3 u_xlat11;
			    float3 u_xlat12;
			    bool u_xlatb12;
			    float3 u_xlat13;
			    bool u_xlatb13;
			    float3 u_xlat14;
			    bool u_xlatb14;
			    float3 u_xlat15;
			    uint u_xlatu15;
			    bool u_xlatb15;
			    float3 u_xlat16;
			    float3 u_xlat17;
			    bool u_xlatb17;
			    float3 u_xlat18;
			    bool u_xlatb18;
			    float2 u_xlat24;
			    uint u_xlatu24;
			    bool u_xlatb24;
			    float u_xlat25;
			    bool u_xlatb25;
			    float2 u_xlat26;
			    uint u_xlatu26;
			    bool u_xlatb26;
			    float2 u_xlat27;
			    bool u_xlatb27;
			    float2 u_xlat28;
			    uint2 u_xlatu28;
			    bool u_xlatb28;
			    float2 u_xlat29;
			    bool u_xlatb29;
			    float2 u_xlat30;
			    float2 u_xlat31;
			    uint u_xlatu31;
			    float2 u_xlat32;
			    float u_xlat36;
			    bool u_xlatb36;
			    float u_xlat37;
			    uint u_xlatu37;
			    bool u_xlatb37;
			    float u_xlat38;
			    bool u_xlatb38;
			    float u_xlat39;
			    bool u_xlatb39;
			    float u_xlat40;
			    uint u_xlatu40;
			    bool u_xlatb40;
			    float u_xlat41;
			    uint u_xlatu41;
			    bool u_xlatb41;
			    //--- End Early Main ---
			    //ADD
			    u_xlat0.xyz = (-fragmentIn.vs_TEXCOORD1.xyz) + fragmentIn.vs_TEXCOORD2.xyz;
			    //DP3
			    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
			    //RSQ
			    u_xlat36 = rsqrt(u_xlat36);
			    //MUL
			    u_xlat0.xyz = (float3)(u_xlat36) * u_xlat0.xyz;
			    //MOVC
			    u_xlat1.xyz = (gl_FrontFacing != uint(0)) ? fragmentIn.vs_TEXCOORD2.xyz : fragmentIn.vs_TEXCOORD1.xyz;
			    //MUL
			    u_xlat36 = _Time.y * 10.0;
			    //MOV
			    u_xlat37 = 0.0;
			    //MOV
			    u_xlati2 = 0;
			    //LOOP
			    while(true){
			        //ITOF
			        u_xlat14.x = float(u_xlati2);
			        //GE
			        u_xlatb14 = u_xlat14.x>=_Iterations;
			        //BREAKC
			        if(u_xlatb14){break;}
			        //MAD
			        u_xlat14.xyz = u_xlat0.xyz * (float3)(u_xlat37) + u_xlat1.xyz;
			        //MAD
			        u_xlat15.z = u_xlat14.z * 3.33333325 + (-u_xlat36);
			        //ADD
			        u_xlat14.z = u_xlat15.z + 3.0;
			        //MUL
			        u_xlat14.xyz = u_xlat14.xyz * float3(3.33333325, 3.33333325, 0.0500000007);
			        //SINCOS
			        u_xlat3.x = sin(u_xlat14.z);
			        u_xlat4.x = cos(u_xlat14.z);
			        //MOV
			        u_xlat5.x = (-u_xlat3.x);
			        //MOV
			        u_xlat5.y = u_xlat4.x;
			        //MOV
			        u_xlat5.z = u_xlat3.x;
			        //DP2
			        u_xlat15.x = dot(u_xlat14.xy, u_xlat5.yz);
			        //DP2
			        u_xlat15.y = dot(u_xlat14.xy, u_xlat5.xy);
			        //ADD
			        u_xlat14.xyz = u_xlat15.xyz + float3(3.0, 3.0, 3.0);
			        //MUL
			        u_xlat3.xyz = u_xlat14.xyz * float3(0.166666672, 0.166666672, 0.166666672);
			        //ROUND_NI
			        u_xlat3.xyz = floor(u_xlat3.xyz);
			        //EQ
			        u_xlatb4.xy = ((u_xlat3.xyxx) == (float4(0.0, 0.0, 0.0, 0.0))).xy;
			        //OR
			        u_xlatb39 = u_xlatb4.y || u_xlatb4.x;
			        //IF
			        if(!u_xlatb39){
			            //MAD
			            u_xlat14.xyz = (-u_xlat3.xyz) * float3(6.0, 6.0, 6.0) + u_xlat14.xyz;
			            //ADD
			            u_xlat4.yzw = u_xlat14.xyz + float3(-3.0, -3.0, -3.0);
			            //MAD
			            u_xlat14.xyz = _Time.yyy * float3(1.29999995, 0.800000012, 1.20000005) + u_xlat3.xyz;
			            //SINCOS
			            u_xlat5.x = sin(u_xlat14.x);
			            u_xlat6.x = cos(u_xlat14.x);
			            //MOV
			            u_xlat7.x = (-u_xlat5.x);
			            //MOV
			            u_xlat7.y = u_xlat6.x;
			            //MOV
			            u_xlat7.z = u_xlat5.x;
			            //DP2
			            u_xlat4.x = dot(u_xlat4.yz, u_xlat7.yz);
			            //DP2
			            u_xlat5.x = dot(u_xlat4.yz, u_xlat7.xy);
			            //SINCOS
			            u_xlat6.x = sin(u_xlat14.y);
			            u_xlat7.x = cos(u_xlat14.y);
			            //MOV
			            u_xlat8.x = (-u_xlat6.x);
			            //MOV
			            u_xlat8.y = u_xlat7.x;
			            //MOV
			            u_xlat8.z = u_xlat6.x;
			            //DP2
			            u_xlat6.x = dot(u_xlat4.xw, u_xlat8.yz);
			            //DP2
			            u_xlat5.y = dot(u_xlat4.xw, u_xlat8.xy);
			            //SINCOS
			            u_xlat4.x = sin(u_xlat14.z);
			            u_xlat7.x = cos(u_xlat14.z);
			            //MOV
			            u_xlat8.x = (-u_xlat4.x);
			            //MOV
			            u_xlat8.y = u_xlat7.x;
			            //MOV
			            u_xlat8.z = u_xlat4.x;
			            //DP2
			            u_xlat6.y = dot(u_xlat5.xy, u_xlat8.yz);
			            //DP2
			            u_xlat6.z = dot(u_xlat5.xy, u_xlat8.xy);
			            //ADD
			            u_xlat14.x = u_xlat3.x + _Time.y;
			            //SINCOS
			            u_xlat14.x = sin(u_xlat14.x);
			            //MAD
			            u_xlat14.x = u_xlat14.x * 0.5 + 0.5;
			            //MAD
			            u_xlat14.x = u_xlat14.x * 0.199999988 + 0.800000012;
			            //MUL
			            u_xlat3.xyz = u_xlat14.xxx * u_xlat6.xyz;
			            //MAD
			            u_xlat4 = u_xlat6.yxyz * u_xlat14.xxxx + float4(-1.0, -0.0, -1.32000005, -0.0);
			            //MIN
			            u_xlat14.x = min(abs(u_xlat4.y), abs(u_xlat4.w));
			            //MAX
			            u_xlat26.x = max(abs(u_xlat4.y), abs(u_xlat4.w));
			            //DIV
			            u_xlat26.x = float(1.0) / u_xlat26.x;
			            //MUL
			            u_xlat14.x = u_xlat26.x * u_xlat14.x;
			            //MUL
			            u_xlat26.x = u_xlat14.x * u_xlat14.x;
			            //MAD
			            u_xlat38 = u_xlat26.x * 0.0208350997 + -0.0851330012;
			            //MAD
			            u_xlat38 = u_xlat26.x * u_xlat38 + 0.180141002;
			            //MAD
			            u_xlat38 = u_xlat26.x * u_xlat38 + -0.330299497;
			            //MAD
			            u_xlat26.x = u_xlat26.x * u_xlat38 + 0.999866009;
			            //MUL
			            u_xlat38 = u_xlat26.x * u_xlat14.x;
			            //LT
			            u_xlatb39 = abs(u_xlat4.y)<abs(u_xlat4.w);
			            //MAD
			            u_xlat38 = u_xlat38 * -2.0 + 1.57079637;
			            //AND
			            u_xlat38 = u_xlatb39 ? u_xlat38 : float(0.0);
			            //MAD
			            u_xlat14.x = u_xlat14.x * u_xlat26.x + u_xlat38;
			            //LT
			            u_xlatb26 = u_xlat4.y<(-u_xlat4.y);
			            //AND
			            u_xlat26.x = u_xlatb26 ? -3.14159274 : float(0.0);
			            //ADD
			            u_xlat14.x = u_xlat26.x + u_xlat14.x;
			            //MIN
			            u_xlat26.x = min(u_xlat4.y, u_xlat4.w);
			            //MAX
			            u_xlat38 = max(u_xlat4.y, u_xlat4.w);
			            //LT
			            u_xlatb26 = u_xlat26.x<(-u_xlat26.x);
			            //GE
			            u_xlatb38 = u_xlat38>=(-u_xlat38);
			            //AND
			            u_xlatb26 = u_xlatb38 && u_xlatb26;
			            //MOVC
			            u_xlat14.x = (u_xlatb26) ? (-u_xlat14.x) : u_xlat14.x;
			            //DP2
			            u_xlat26.x = dot(u_xlat4.yw, u_xlat4.yw);
			            //SQRT
			            u_xlat26.x = sqrt(u_xlat26.x);
			            //ADD
			            u_xlat14.x = u_xlat14.x + 0.314159274;
			            //MUL
			            u_xlat38 = u_xlat14.x * 1.5915494;
			            //ROUND_NI
			            u_xlat38 = floor(u_xlat38);
			            //MAD
			            u_xlat14.x = (-u_xlat38) * 0.628318548 + u_xlat14.x;
			            //ADD
			            u_xlat14.x = u_xlat14.x + -0.314159274;
			            //SINCOS
			            u_xlat5.x = sin(u_xlat14.x);
			            u_xlat6.x = cos(u_xlat14.x);
			            //MOV
			            u_xlat6.xz = u_xlat6.xx;
			            //MOV
			            u_xlat6.y = u_xlat5.x;
			            //MUL
			            u_xlat14.xyz = u_xlat26.xxx * u_xlat6.xyz;
			            //MAD
			            u_xlat14.xyz = u_xlat14.xyz * float3(2.0, 2.0, 2.0) + float3(-1.0, -0.0, -1.0);
			            //MUL
			            u_xlat5.xyz = u_xlat14.xyz * float3(0.5, 0.5, 3.0);
			            //SINCOS
			            u_xlat14.x = sin(u_xlat5.z);
			            //MAD
			            u_xlat6.y = u_xlat14.x * 0.100000001 + u_xlat4.z;
			            //ADD
			            u_xlat5.w = abs(u_xlat5.y) + 0.600000024;
			            //DP2
			            u_xlat14.x = dot(u_xlat5.xw, u_xlat5.xw);
			            //SQRT
			            u_xlat6.x = sqrt(u_xlat14.x);
			            //ADD
			            u_xlat14.xy = abs(u_xlat6.xy) + float2(-0.699999988, -0.00999999978);
			            //MAX
			            u_xlat38 = max(u_xlat14.y, u_xlat14.x);
			            //MIN
			            u_xlat38 = min(u_xlat38, 0.0);
			            //MAX
			            u_xlat14.xy = max(u_xlat14.xy, float2(0.0, 0.0));
			            //DP2
			            u_xlat14.x = dot(u_xlat14.xy, u_xlat14.xy);
			            //SQRT
			            u_xlat14.x = sqrt(u_xlat14.x);
			            //ADD
			            u_xlat14.x = u_xlat14.x + u_xlat38;
			            //MOV
			            u_xlat6.zw = u_xlat5.xy;
			            //ADD
			            u_xlat5.xyz = u_xlat6.zyw + float3(-0.0, -0.00999999978, -0.0);
			            //ADD
			            u_xlat5.xyz = abs(u_xlat5.xyz) + float3(-0.449999988, -0.0130000003, -0.00100000005);
			            //MAX
			            u_xlat26.x = max(u_xlat5.z, u_xlat5.y);
			            //MAX
			            u_xlat26.x = max(u_xlat26.x, u_xlat5.x);
			            //MIN
			            u_xlat26.x = min(u_xlat26.x, 0.0);
			            //MAX
			            u_xlat5.xyz = max(u_xlat5.xyz, float3(0.0, 0.0, 0.0));
			            //DP3
			            u_xlat38 = dot(u_xlat5.xyz, u_xlat5.xyz);
			            //SQRT
			            u_xlat38 = sqrt(u_xlat38);
			            //ADD
			            u_xlat26.x = u_xlat38 + u_xlat26.x;
			            //ADD
			            u_xlat38 = (-u_xlat14.x) + u_xlat26.x;
			            //MAD
			            u_xlat38 = u_xlat38 * 10.0 + 0.5;
			            u_xlat38 = clamp(u_xlat38, 0.0, 1.0);
			            //ADD
			            u_xlat14.x = (-u_xlat26.x) + u_xlat14.x;
			            //MAD
			            u_xlat14.x = u_xlat38 * u_xlat14.x + u_xlat26.x;
			            //MUL
			            u_xlat26.x = u_xlat38 * 0.0500000007;
			            //ADD
			            u_xlat38 = (-u_xlat38) + 1.0;
			            //MAD
			            u_xlat14.x = (-u_xlat26.x) * u_xlat38 + u_xlat14.x;
			            //MUL
			            u_xlat26.x = u_xlat4.z * 4.0;
			            //SINCOS
			            u_xlat26.x = sin(u_xlat26.x);
			            //MAD
			            u_xlat26.x = u_xlat26.x * 0.100000001 + u_xlat4.y;
			            //ADD
			            u_xlat5.x = u_xlat26.x + -0.0500000007;
			            //MOV
			            u_xlat5.yw = u_xlat4.wz;
			            //DP2
			            u_xlat26.x = dot(u_xlat5.xy, u_xlat5.xy);
			            //SQRT
			            u_xlat5.z = sqrt(u_xlat26.x);
			            //ADD
			            u_xlat26.xy = abs(u_xlat5.zw) + float2(-0.0399999991, -0.699999988);
			            //MAX
			            u_xlat39 = max(u_xlat26.y, u_xlat26.x);
			            //MIN
			            u_xlat39 = min(u_xlat39, 0.0);
			            //MAX
			            u_xlat26.xy = max(u_xlat26.xy, float2(0.0, 0.0));
			            //DP2
			            u_xlat26.x = dot(u_xlat26.xy, u_xlat26.xy);
			            //SQRT
			            u_xlat26.x = sqrt(u_xlat26.x);
			            //ADD
			            u_xlat26.x = u_xlat26.x + u_xlat39;
			            //ADD
			            u_xlat38 = (-u_xlat14.x) + u_xlat26.x;
			            //MAD
			            u_xlat38 = u_xlat38 * 1.66666663 + 0.5;
			            u_xlat38 = clamp(u_xlat38, 0.0, 1.0);
			            //ADD
			            u_xlat14.x = (-u_xlat26.x) + u_xlat14.x;
			            //MAD
			            u_xlat14.x = u_xlat38 * u_xlat14.x + u_xlat26.x;
			            //MUL
			            u_xlat26.x = u_xlat38 * 0.300000012;
			            //ADD
			            u_xlat38 = (-u_xlat38) + 1.0;
			            //MAD
			            u_xlat14.x = (-u_xlat26.x) * u_xlat38 + u_xlat14.x;
			            //MOV
			            u_xlat26.x = u_xlat3.y;
			            u_xlat26.x = clamp(u_xlat26.x, 0.0, 1.0);
			            //MAD
			            u_xlat38 = u_xlat26.x * -2.0 + 3.0;
			            //MUL
			            u_xlat26.x = u_xlat26.x * u_xlat26.x;
			            //MOV
			            u_xlat4.x = u_xlat4.x;
			            u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
			            //MAD
			            u_xlat39 = u_xlat4.x * -2.0 + 3.0;
			            //MUL
			            u_xlat4.x = u_xlat4.x * u_xlat4.x;
			            //MUL
			            u_xlat39 = u_xlat39 * u_xlat4.x;
			            //MUL
			            u_xlat39 = u_xlat39 * 3.0;
			            //MAD
			            u_xlat26.x = u_xlat38 * u_xlat26.x + (-u_xlat39);
			            //MAD
			            u_xlat26.x = (-u_xlat26.x) * 0.159999996 + 1.0;
			            //MUL
			            u_xlat3.xzw = u_xlat26.xxx * u_xlat3.xyz;
			            //MUL
			            u_xlat26.y = u_xlat3.z * 2.22222233;
			            u_xlat26.y = clamp(u_xlat26.y, 0.0, 1.0);
			            //MAD
			            u_xlat4.x = u_xlat26.y * -2.0 + 3.0;
			            //MAD
			            u_xlat26.x = u_xlat3.y * u_xlat26.x + -0.449999988;
			            //MUL
			            u_xlat26.x = u_xlat26.x * 2.22222233;
			            u_xlat26.x = clamp(u_xlat26.x, 0.0, 1.0);
			            //MAD
			            u_xlat15.x = u_xlat26.x * -2.0 + 3.0;
			            //MUL
			            u_xlat26.xy = u_xlat26.xy * u_xlat26.xy;
			            //MUL
			            u_xlat26.x = u_xlat26.x * u_xlat15.x;
			            //MAD
			            u_xlat26.x = u_xlat4.x * u_xlat26.y + (-u_xlat26.x);
			            //MAD
			            u_xlat26.x = (-u_xlat26.x) * 0.0700000003 + 1.0;
			            //MUL
			            u_xlat4.xyz = u_xlat26.xxx * u_xlat3.xwz;
			            //MAD
			            u_xlat26.x = u_xlat3.z * u_xlat26.x + 0.600000024;
			            //MUL
			            u_xlat26.x = u_xlat26.x * 1.25;
			            u_xlat26.x = clamp(u_xlat26.x, 0.0, 1.0);
			            //MAD
			            u_xlat38 = u_xlat26.x * -2.0 + 3.0;
			            //MUL
			            u_xlat26.x = u_xlat26.x * u_xlat26.x;
			            //MAD
			            u_xlat26.x = (-u_xlat38) * u_xlat26.x + 1.0;
			            //MAD
			            u_xlat26.x = u_xlat26.x * 0.200000003 + 1.0;
			            //MUL
			            u_xlat4.xy = u_xlat26.xx * u_xlat4.xy;
			            //MUL
			            u_xlat4.w = u_xlat4.z * 0.800000012;
			            //MUL
			            u_xlat3.xyz = u_xlat4.xzy * float3(0.449999988, 0.359999985, 0.449999988);
			            //DP3
			            u_xlat26.x = dot(u_xlat4.xyw, u_xlat4.xyw);
			            //RSQ
			            u_xlat38 = rsqrt(u_xlat26.x);
			            //MUL
			            u_xlat5 = (float4)(u_xlat38) * u_xlat4.xxwy;
			            //MAD
			            u_xlat6.xy = u_xlat4.xz * float2(0.449999988, 0.359999985) + float2(-0.140000001, -0.140000001);
			            //SAMPLE_L
			            u_xlat6 = tex2Dlod(_NoiseTex, float4(u_xlat6.xy, 0.0,1.5));
			            //SAMPLE_L
			            u_xlat7 = tex2Dlod(_NoiseTex, float4(u_xlat3.xz, 0.0,0.0));
			            //SAMPLE_L
			            u_xlat3 = tex2Dlod(_NoiseTex, float4(u_xlat3.yz, 0.0,1.5));
			            //MUL
			            u_xlat15.x = abs(u_xlat5.z) * u_xlat7.x;
			            //MAD
			            u_xlat15.x = u_xlat6.x * abs(u_xlat5.w) + u_xlat15.x;
			            //MAD
			            u_xlat3.x = u_xlat3.x * abs(u_xlat5.y) + u_xlat15.x;
			            //SQRT
			            u_xlat26.x = sqrt(u_xlat26.x);
			            //ADD
			            u_xlat26.x = u_xlat26.x + -1.0;
			            //MAD
			            u_xlat26.x = (-u_xlat3.x) * 0.100000001 + u_xlat26.x;
			            //MIN
			            u_xlat3.x = min(abs(u_xlat5.y), abs(u_xlat5.z));
			            //MAX
			            u_xlat15.x = max(abs(u_xlat5.y), abs(u_xlat5.z));
			            //DIV
			            u_xlat15.x = float(1.0) / u_xlat15.x;
			            //MUL
			            u_xlat3.x = u_xlat15.x * u_xlat3.x;
			            //MUL
			            u_xlat15.x = u_xlat3.x * u_xlat3.x;
			            //MAD
			            u_xlat27.x = u_xlat15.x * 0.0208350997 + -0.0851330012;
			            //MAD
			            u_xlat27.x = u_xlat15.x * u_xlat27.x + 0.180141002;
			            //MAD
			            u_xlat27.x = u_xlat15.x * u_xlat27.x + -0.330299497;
			            //MAD
			            u_xlat15.x = u_xlat15.x * u_xlat27.x + 0.999866009;
			            //MUL
			            u_xlat27.x = u_xlat15.x * u_xlat3.x;
			            //LT
			            u_xlatb39 = abs(u_xlat5.y)<abs(u_xlat5.z);
			            //MAD
			            u_xlat27.x = u_xlat27.x * -2.0 + 1.57079637;
			            //AND
			            u_xlat27.x = u_xlatb39 ? u_xlat27.x : float(0.0);
			            //MAD
			            u_xlat3.x = u_xlat3.x * u_xlat15.x + u_xlat27.x;
			            //LT
			            u_xlatb15 = u_xlat5.y<(-u_xlat5.x);
			            //AND
			            u_xlat15.x = u_xlatb15 ? -3.14159274 : float(0.0);
			            //ADD
			            u_xlat3.x = u_xlat15.x + u_xlat3.x;
			            //MIN
			            u_xlat15.x = min(u_xlat5.y, u_xlat5.z);
			            //MAX
			            u_xlat27.x = max(u_xlat5.y, u_xlat5.z);
			            //LT
			            u_xlatb15 = u_xlat15.x<(-u_xlat15.x);
			            //GE
			            u_xlatb27 = u_xlat27.x>=(-u_xlat27.x);
			            //AND
			            u_xlatb15 = u_xlatb27 && u_xlatb15;
			            //MOVC
			            u_xlat3.x = (u_xlatb15) ? (-u_xlat3.x) : u_xlat3.x;
			            //MIN
			            u_xlat3.x = min(u_xlat3.x, 3.14159012);
			            //MAD
			            u_xlat27.x = (-u_xlat5.w) * u_xlat5.w + 1.0;
			            //MUL
			            u_xlat27.x = u_xlat27.x * 899.175598;
			            //LOG
			            u_xlat27.x = log2(u_xlat27.x);
			            //MUL
			            u_xlat27.x = u_xlat27.x * 0.720210016;
			            //ROUND_NI
			            u_xlat27.x = floor(u_xlat27.x);
			            //MAX
			            u_xlat27.x = max(u_xlat27.x, 2.0);
			            //MUL
			            u_xlat27.x = u_xlat27.x * 0.694241941;
			            //EXP
			            u_xlat27.x = exp2(u_xlat27.x);
			            //MUL
			            u_xlat27.xy = u_xlat27.xx * float2(0.44721359, 0.723606825);
			            //ROUND_NE
			            u_xlat27.xy = round(u_xlat27.xy);
			            //ADD
			            u_xlat5.xy = u_xlat27.yx + float2(1.0, 1.0);
			            //MUL
			            u_xlat29.xy = u_xlat5.xy * float2(0.618034005, 0.618034005);
			            //ROUND_NI
			            u_xlat29.xy = floor(u_xlat29.xy);
			            //MAD
			            u_xlat5.xy = u_xlat5.xy * float2(0.618034005, 0.618034005) + (-u_xlat29.xy);
			            //MAD
			            u_xlat5.xy = u_xlat5.xy * float2(6.28318024, 6.28318024) + float2(-3.88321877, -3.88321877);
			            //MUL
			            u_xlat27.xy = u_xlat27.xy * float2(-0.015625, -0.015625);
			            //MUL
			            u_xlat28.x = u_xlat27.x * u_xlat5.x;
			            //MAD
			            u_xlat28.x = u_xlat5.y * u_xlat27.y + (-u_xlat28.x);
			            //MUL
			            u_xlat6.xz = u_xlat27.yx * float2(1.0, -1.0);
			            //MUL
			            u_xlat6.yw = u_xlat5.xy * float2(-1.0, 1.0);
			            //DIV
			            u_xlat5 = u_xlat6 / u_xlat28.xxxx;
			            //MAD
			            u_xlat3.y = u_xlat4.y * u_xlat38 + -0.9921875;
			            //DP2
			            u_xlat28.x = dot(u_xlat5.xy, u_xlat3.xy);
			            //DP2
			            u_xlat3.x = dot(u_xlat5.zw, u_xlat3.xy);
			            //ROUND_NI
			            u_xlat5.x = floor(u_xlat28.x);
			            //ROUND_NI
			            u_xlat5.y = floor(u_xlat3.x);
			            //MOV
			            u_xlat6.x = float(100000.0);
			            //MOV
			            u_xlat6.y = float(0.0);
			            //MOV
			            u_xlat6.z = float(0.0);
			            //MOV
			            u_xlat6.w = float(0.0);
			            //LOOP
			            for(uint u_xlatu_loop_1 = 0u ; u_xlatu_loop_1<4u ; u_xlatu_loop_1++)
			            {
			                //AND
			                u_xlatu15 = u_xlatu_loop_1 & 1u;
			                //USHR
			                u_xlatu28.x = u_xlatu_loop_1 >> 1u;
			                //UTOF
			                u_xlat7.x = float(u_xlatu15);
			                //UTOF
			                u_xlat7.y = float(u_xlatu28.x);
			                //ADD
			                u_xlat29.xy = u_xlat5.xy + u_xlat7.xy;
			                //DP2
			                u_xlat15.x = dot(u_xlat27.xy, u_xlat29.xy);
			                //ADD
			                u_xlat15.x = u_xlat15.x + 0.9921875;
			                //MAX
			                u_xlat28.x = max(u_xlat15.x, -1.0);
			                //MIN
			                u_xlat28.x = min(u_xlat28.x, 1.0);
			                //MAD
			                u_xlat15.x = u_xlat28.x * 2.0 + (-u_xlat15.x);
			                //MAD
			                u_xlat15.x = (-u_xlat15.x) * 64.0 + 64.0;
			                //ROUND_NI
			                u_xlat15.x = floor(u_xlat15.x);
			                //MUL
			                u_xlat28.x = u_xlat15.x * 0.618034005;
			                //ROUND_NI
			                u_xlat28.x = floor(u_xlat28.x);
			                //MAD
			                u_xlat28.x = u_xlat15.x * 0.618034005 + (-u_xlat28.x);
			                //MUL
			                u_xlat28.x = u_xlat28.x * 6.28318024;
			                //MAD
			                u_xlat15.x = u_xlat15.x * 2.0 + 1.0;
			                //MAD
			                u_xlat7.w = (-u_xlat15.x) * 0.0078125 + 1.0;
			                //MAD
			                u_xlat15.x = (-u_xlat7.w) * u_xlat7.w + 1.0;
			                //SQRT
			                u_xlat15.x = sqrt(u_xlat15.x);
			                //SINCOS
			                u_xlat8.x = sin(u_xlat28.x);
			                u_xlat9.x = cos(u_xlat28.x);
			                //MUL
			                u_xlat7.y = u_xlat15.x * u_xlat9.x;
			                //MUL
			                u_xlat7.z = u_xlat15.x * u_xlat8.x;
			                //MAD
			                u_xlat8.xyz = (-u_xlat4.xwy) * (float3)(u_xlat38) + u_xlat7.yzw;
			                //DP3
			                u_xlat7.x = dot(u_xlat8.xyz, u_xlat8.xyz);
			                //LT
			                u_xlatb15 = u_xlat7.x<u_xlat6.x;
			                //MOVC
			                u_xlat6 = ((bool)(u_xlatb15)) ? u_xlat7 : u_xlat6;
			            //ENDLOOP
			            }
			            //MAD
			            u_xlat3.xyz = (-u_xlat6.yzw) * float3(1.01999998, 1.01999998, 1.01999998) + u_xlat4.xwy;
			            //DP3
			            u_xlat38 = dot(u_xlat3.xyz, u_xlat3.xyz);
			            //SQRT
			            u_xlat38 = sqrt(u_xlat38);
			            //ADD
			            u_xlat38 = u_xlat38 + -0.0599999987;
			            //ADD
			            u_xlat3.x = (-u_xlat38) + u_xlat26.x;
			            //MAD
			            u_xlat3.x = u_xlat3.x * 50.0 + 0.5;
			            u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
			            //ADD
			            u_xlat38 = (-u_xlat26.x) + u_xlat38;
			            //MAD
			            u_xlat38 = u_xlat3.x * u_xlat38 + u_xlat26.x;
			            //MUL
			            u_xlat15.x = u_xlat3.x * 0.00999999978;
			            //ADD
			            u_xlat3.x = (-u_xlat3.x) + 1.0;
			            //MAD
			            u_xlat38 = (-u_xlat15.x) * u_xlat3.x + u_xlat38;
			            //LT
			            u_xlatb3.x = u_xlat38<u_xlat26.x;
			            //MOVC
			            u_xlat26.x = (u_xlatb3.x) ? u_xlat38 : u_xlat26.x;
			            //LT
			            u_xlatb38 = u_xlat14.x<u_xlat26.x;
			            //MOVC
			            u_xlat14.x = (u_xlatb38) ? u_xlat14.x : u_xlat26.x;
			            //MUL
			            u_xlat14.x = u_xlat14.x * 0.300000012;
			        //ELSE
			        } else {
			            //MOV
			            u_xlat14.x = 1.0;
			        //ENDIF
			        }
			        //ADD
			        u_xlat26.x = u_xlat37 + u_xlat14.x;
			        //LT
			        u_xlatb38 = _MaxDist<u_xlat26.x;
			        //MAD
			        u_xlat3.x = u_xlat26.x * 0.25 + 1.0;
			        //MUL
			        u_xlat3.x = u_xlat3.x * 0.00200000009;
			        //LT
			        u_xlatb14 = abs(u_xlat14.x)<u_xlat3.x;
			        //OR
			        u_xlatb14 = u_xlatb14 || u_xlatb38;
			        //IF
			        if(u_xlatb14){
			            //MOV
			            u_xlat37 = u_xlat26.x;
			            //BREAK
			            break;
			        //ENDIF
			        }
			        //IADD
			        u_xlati2 = u_xlati2 + 1;
			        //MOV
			        u_xlat37 = u_xlat26.x;
			    //ENDLOOP
			    }
			    //ITOF
			    u_xlat2.x = float(u_xlati2);
			    //MAD
			    u_xlat0.xyz = (float3)(u_xlat37) * u_xlat0.xyz + u_xlat1.xyz;
			    //DIV
			    u_xlat1.x = u_xlat2.x / _Iterations;
			    //LOG
			    u_xlat1.x = log2(u_xlat1.x);
			    //MUL
			    u_xlat1.x = u_xlat1.x * 0.75;
			    //EXP
			    u_xlat1.x = exp2(u_xlat1.x);
			    //ADD
			    u_xlat1.x = (-u_xlat1.x) + 1.0;
			    //MUL
			    u_xlat13.xy = u_xlat0.xy * float2(3.33333325, 3.33333325);
			    //MAD
			    u_xlat14.z = u_xlat0.z * 3.33333325 + (-u_xlat36);
			    //ADD
			    u_xlat37 = u_xlat14.z + 3.0;
			    //MUL
			    u_xlat37 = u_xlat37 * 0.0500000007;
			    //SINCOS
			    u_xlat2.x = sin(u_xlat37);
			    u_xlat3.x = cos(u_xlat37);
			    //MOV
			    u_xlat4.x = (-u_xlat2.x);
			    //MOV
			    u_xlat4.y = u_xlat3.x;
			    //MOV
			    u_xlat4.z = u_xlat2.x;
			    //DP2
			    u_xlat14.x = dot(u_xlat13.xy, u_xlat4.yz);
			    //DP2
			    u_xlat14.y = dot(u_xlat13.xy, u_xlat4.xy);
			    //ADD
			    u_xlat13.xyz = u_xlat14.xyz + float3(3.0, 3.0, 3.0);
			    //MUL
			    u_xlat2.xyz = u_xlat13.xyz * float3(0.166666672, 0.166666672, 0.166666672);
			    //ROUND_NI
			    u_xlat2.xyz = floor(u_xlat2.xyz);
			    //EQ
			    u_xlatb3.xy = ((u_xlat2.xyxx) == (float4(0.0, 0.0, 0.0, 0.0))).xy;
			    //OR
			    u_xlatb38 = u_xlatb3.y || u_xlatb3.x;
			    //IF
			    if(!u_xlatb38){
			        //MAD
			        u_xlat3.xyz = (-u_xlat2.xyz) * float3(6.0, 6.0, 6.0) + u_xlat13.xyz;
			        //ADD
			        u_xlat3.yzw = u_xlat3.xyz + float3(-3.0, -3.0, -3.0);
			        //MAD
			        u_xlat4.xyz = _Time.yyy * float3(1.29999995, 0.800000012, 1.20000005) + u_xlat2.xyz;
			        //SINCOS
			        u_xlat5.x = cos(u_xlat4.x);
			        u_xlat4.x = sin(u_xlat4.x);
			        //MOV
			        u_xlat6.x = (-u_xlat4.x);
			        //MOV
			        u_xlat6.y = u_xlat5.x;
			        //MOV
			        u_xlat6.z = u_xlat4.x;
			        //DP2
			        u_xlat3.x = dot(u_xlat3.yz, u_xlat6.yz);
			        //DP2
			        u_xlat5.x = dot(u_xlat3.yz, u_xlat6.xy);
			        //SINCOS
			        u_xlat6.x = cos(u_xlat4.y);
			        u_xlat4.x = sin(u_xlat4.y);
			        //MOV
			        u_xlat7.x = (-u_xlat4.x);
			        //MOV
			        u_xlat7.y = u_xlat6.x;
			        //MOV
			        u_xlat7.z = u_xlat4.x;
			        //DP2
			        u_xlat6.x = dot(u_xlat3.xw, u_xlat7.yz);
			        //DP2
			        u_xlat5.y = dot(u_xlat3.xw, u_xlat7.xy);
			        //SINCOS
			        u_xlat3.x = sin(u_xlat4.z);
			        u_xlat4.x = cos(u_xlat4.z);
			        //MOV
			        u_xlat7.x = (-u_xlat3.x);
			        //MOV
			        u_xlat7.y = u_xlat4.x;
			        //MOV
			        u_xlat7.z = u_xlat3.x;
			        //DP2
			        u_xlat6.y = dot(u_xlat5.xy, u_xlat7.yz);
			        //DP2
			        u_xlat6.z = dot(u_xlat5.xy, u_xlat7.xy);
			        //ADD
			        u_xlat3.x = u_xlat2.x + _Time.y;
			        //SINCOS
			        u_xlat3.x = sin(u_xlat3.x);
			        //MAD
			        u_xlat3.x = u_xlat3.x * 0.5 + 0.5;
			        //MAD
			        u_xlat3.x = u_xlat3.x * 0.199999988 + 0.800000012;
			        //MUL
			        u_xlat15.xyz = u_xlat3.xxx * u_xlat6.xyz;
			        //MAD
			        u_xlat4 = u_xlat6.yxyz * u_xlat3.xxxx + float4(-1.0, -0.0, -1.32000005, -0.0);
			        //MIN
			        u_xlat3.x = min(abs(u_xlat4.y), abs(u_xlat4.w));
			        //MAX
			        u_xlat5.x = max(abs(u_xlat4.y), abs(u_xlat4.w));
			        //DIV
			        u_xlat5.x = float(1.0) / u_xlat5.x;
			        //MUL
			        u_xlat3.x = u_xlat3.x * u_xlat5.x;
			        //MUL
			        u_xlat5.x = u_xlat3.x * u_xlat3.x;
			        //MAD
			        u_xlat17.x = u_xlat5.x * 0.0208350997 + -0.0851330012;
			        //MAD
			        u_xlat17.x = u_xlat5.x * u_xlat17.x + 0.180141002;
			        //MAD
			        u_xlat17.x = u_xlat5.x * u_xlat17.x + -0.330299497;
			        //MAD
			        u_xlat5.x = u_xlat5.x * u_xlat17.x + 0.999866009;
			        //MUL
			        u_xlat17.x = u_xlat3.x * u_xlat5.x;
			        //LT
			        u_xlatb29 = abs(u_xlat4.y)<abs(u_xlat4.w);
			        //MAD
			        u_xlat17.x = u_xlat17.x * -2.0 + 1.57079637;
			        //AND
			        u_xlat17.x = u_xlatb29 ? u_xlat17.x : float(0.0);
			        //MAD
			        u_xlat3.x = u_xlat3.x * u_xlat5.x + u_xlat17.x;
			        //LT
			        u_xlatb5 = u_xlat4.y<(-u_xlat4.y);
			        //AND
			        u_xlat5.x = u_xlatb5 ? -3.14159274 : float(0.0);
			        //ADD
			        u_xlat3.x = u_xlat3.x + u_xlat5.x;
			        //MIN
			        u_xlat5.x = min(u_xlat4.y, u_xlat4.w);
			        //MAX
			        u_xlat17.x = max(u_xlat4.y, u_xlat4.w);
			        //LT
			        u_xlatb5 = u_xlat5.x<(-u_xlat5.x);
			        //GE
			        u_xlatb17 = u_xlat17.x>=(-u_xlat17.x);
			        //AND
			        u_xlatb5 = u_xlatb17 && u_xlatb5;
			        //MOVC
			        u_xlat3.x = (u_xlatb5) ? (-u_xlat3.x) : u_xlat3.x;
			        //DP2
			        u_xlat5.x = dot(u_xlat4.yw, u_xlat4.yw);
			        //SQRT
			        u_xlat5.x = sqrt(u_xlat5.x);
			        //ADD
			        u_xlat3.x = u_xlat3.x + 0.314159274;
			        //MUL
			        u_xlat17.x = u_xlat3.x * 1.5915494;
			        //ROUND_NI
			        u_xlat17.x = floor(u_xlat17.x);
			        //MAD
			        u_xlat3.x = (-u_xlat17.x) * 0.628318548 + u_xlat3.x;
			        //ADD
			        u_xlat3.x = u_xlat3.x + -0.314159274;
			        //SINCOS
			        u_xlat6.x = cos(u_xlat3.x);
			        u_xlat3.x = sin(u_xlat3.x);
			        //MOV
			        u_xlat6.xz = u_xlat6.xx;
			        //MOV
			        u_xlat6.y = u_xlat3.x;
			        //MUL
			        u_xlat5.xyz = u_xlat5.xxx * u_xlat6.xyz;
			        //MAD
			        u_xlat5.xyz = u_xlat5.xyz * float3(2.0, 2.0, 2.0) + float3(-1.0, -0.0, -1.0);
			        //MUL
			        u_xlat5.xyz = u_xlat5.xyz * float3(0.5, 0.5, 3.0);
			        //SINCOS
			        u_xlat3.x = sin(u_xlat5.z);
			        //MAD
			        u_xlat6.y = u_xlat3.x * 0.100000001 + u_xlat4.z;
			        //ADD
			        u_xlat5.w = abs(u_xlat5.y) + 0.600000024;
			        //DP2
			        u_xlat3.x = dot(u_xlat5.xw, u_xlat5.xw);
			        //SQRT
			        u_xlat6.x = sqrt(u_xlat3.x);
			        //ADD
			        u_xlat29.xy = abs(u_xlat6.xy) + float2(-0.699999988, -0.00999999978);
			        //MAX
			        u_xlat3.x = max(u_xlat29.y, u_xlat29.x);
			        //MIN
			        u_xlat3.x = min(u_xlat3.x, 0.0);
			        //MAX
			        u_xlat29.xy = max(u_xlat29.xy, float2(0.0, 0.0));
			        //DP2
			        u_xlat29.x = dot(u_xlat29.xy, u_xlat29.xy);
			        //SQRT
			        u_xlat29.x = sqrt(u_xlat29.x);
			        //ADD
			        u_xlat3.x = u_xlat3.x + u_xlat29.x;
			        //MOV
			        u_xlat6.zw = u_xlat5.xy;
			        //ADD
			        u_xlat5.xyz = u_xlat6.zyw + float3(-0.0, -0.00999999978, -0.0);
			        //ADD
			        u_xlat5.xyz = abs(u_xlat5.xyz) + float3(-0.449999988, -0.0130000003, -0.00100000005);
			        //MAX
			        u_xlat41 = max(u_xlat5.z, u_xlat5.y);
			        //MAX
			        u_xlat41 = max(u_xlat41, u_xlat5.x);
			        //MIN
			        u_xlat41 = min(u_xlat41, 0.0);
			        //MAX
			        u_xlat5.xyz = max(u_xlat5.xyz, float3(0.0, 0.0, 0.0));
			        //DP3
			        u_xlat5.x = dot(u_xlat5.xyz, u_xlat5.xyz);
			        //SQRT
			        u_xlat5.x = sqrt(u_xlat5.x);
			        //ADD
			        u_xlat5.x = u_xlat5.x + u_xlat41;
			        //ADD
			        u_xlat17.x = (-u_xlat3.x) + u_xlat5.x;
			        //MAD
			        u_xlat17.x = u_xlat17.x * 10.0 + 0.5;
			        u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
			        //ADD
			        u_xlat3.x = u_xlat3.x + (-u_xlat5.x);
			        //MAD
			        u_xlat3.x = u_xlat17.x * u_xlat3.x + u_xlat5.x;
			        //MUL
			        u_xlat5.x = u_xlat17.x * 0.0500000007;
			        //ADD
			        u_xlat17.x = (-u_xlat17.x) + 1.0;
			        //MAD
			        u_xlat3.x = (-u_xlat5.x) * u_xlat17.x + u_xlat3.x;
			        //MUL
			        u_xlat5.x = u_xlat4.z * 4.0;
			        //SINCOS
			        u_xlat5.x = sin(u_xlat5.x);
			        //MAD
			        u_xlat16.x = u_xlat5.x * 0.100000001 + u_xlat4.y;
			        //ADD
			        u_xlat5.x = u_xlat16.x + -0.0500000007;
			        //MOV
			        u_xlat5.yw = u_xlat4.wz;
			        //DP2
			        u_xlat16.x = dot(u_xlat5.xy, u_xlat5.xy);
			        //SQRT
			        u_xlat5.z = sqrt(u_xlat16.x);
			        //ADD
			        u_xlat16.xy = abs(u_xlat5.zw) + float2(-0.0399999991, -0.699999988);
			        //MAX
			        u_xlat40 = max(u_xlat16.y, u_xlat16.x);
			        //MIN
			        u_xlat40 = min(u_xlat40, 0.0);
			        //MAX
			        u_xlat16.xy = max(u_xlat16.xy, float2(0.0, 0.0));
			        //DP2
			        u_xlat16.x = dot(u_xlat16.xy, u_xlat16.xy);
			        //SQRT
			        u_xlat16.x = sqrt(u_xlat16.x);
			        //ADD
			        u_xlat16.x = u_xlat16.x + u_xlat40;
			        //ADD
			        u_xlat28.x = (-u_xlat3.x) + u_xlat16.x;
			        //MAD
			        u_xlat28.x = u_xlat28.x * 1.66666663 + 0.5;
			        u_xlat28.x = clamp(u_xlat28.x, 0.0, 1.0);
			        //ADD
			        u_xlat3.x = u_xlat3.x + (-u_xlat16.x);
			        //MAD
			        u_xlat3.x = u_xlat28.x * u_xlat3.x + u_xlat16.x;
			        //MUL
			        u_xlat16.x = u_xlat28.x * 0.300000012;
			        //ADD
			        u_xlat28.x = (-u_xlat28.x) + 1.0;
			        //MAD
			        u_xlat3.x = (-u_xlat16.x) * u_xlat28.x + u_xlat3.x;
			        //MOV
			        u_xlat4.y = u_xlat15.y;
			        u_xlat4.y = clamp(u_xlat4.y, 0.0, 1.0);
			        //MAD
			        u_xlat28.x = u_xlat4.y * -2.0 + 3.0;
			        //MOV
			        u_xlat4.x = u_xlat4.x;
			        u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
			        //MAD
			        u_xlat40 = u_xlat4.x * -2.0 + 3.0;
			        //MUL
			        u_xlat4.xy = u_xlat4.xy * u_xlat4.xy;
			        //MUL
			        u_xlat4.x = u_xlat4.x * u_xlat40;
			        //MUL
			        u_xlat4.x = u_xlat4.x * 3.0;
			        //MAD
			        u_xlat4.x = u_xlat28.x * u_xlat4.y + (-u_xlat4.x);
			        //MAD
			        u_xlat4.x = (-u_xlat4.x) * 0.159999996 + 1.0;
			        //MUL
			        u_xlat16.xyz = u_xlat15.xyz * u_xlat4.xxx;
			        //MUL
			        u_xlat15.x = u_xlat16.y * 2.22222233;
			        u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
			        //MAD
			        u_xlat39 = u_xlat15.x * -2.0 + 3.0;
			        //MAD
			        u_xlat27.x = u_xlat15.y * u_xlat4.x + -0.449999988;
			        //MUL
			        u_xlat15.y = u_xlat27.x * 2.22222233;
			        u_xlat15.y = clamp(u_xlat15.y, 0.0, 1.0);
			        //MAD
			        u_xlat4.x = u_xlat15.y * -2.0 + 3.0;
			        //MUL
			        u_xlat15.xy = u_xlat15.xy * u_xlat15.xy;
			        //MUL
			        u_xlat27.x = u_xlat15.y * u_xlat4.x;
			        //MAD
			        u_xlat15.x = u_xlat39 * u_xlat15.x + (-u_xlat27.x);
			        //MAD
			        u_xlat15.x = (-u_xlat15.x) * 0.0700000003 + 1.0;
			        //MUL
			        u_xlat5.xyz = u_xlat15.xxx * u_xlat16.xzy;
			        //MAD
			        u_xlat15.x = u_xlat16.y * u_xlat15.x + 0.600000024;
			        //MUL
			        u_xlat15.x = u_xlat15.x * 1.25;
			        u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
			        //MAD
			        u_xlat27.x = u_xlat15.x * -2.0 + 3.0;
			        //MUL
			        u_xlat15.x = u_xlat15.x * u_xlat15.x;
			        //MAD
			        u_xlat15.x = (-u_xlat27.x) * u_xlat15.x + 1.0;
			        //MAD
			        u_xlat15.x = u_xlat15.x * 0.200000003 + 1.0;
			        //MUL
			        u_xlat5.xy = u_xlat15.xx * u_xlat5.xy;
			        //MUL
			        u_xlat5.w = u_xlat5.z * 0.800000012;
			        //MUL
			        u_xlat15.xyz = u_xlat5.xzy * float3(0.449999988, 0.359999985, 0.449999988);
			        //DP3
			        u_xlat4.x = dot(u_xlat5.xyw, u_xlat5.xyw);
			        //RSQ
			        u_xlat16.x = rsqrt(u_xlat4.x);
			        //MUL
			        u_xlat6 = u_xlat16.xxxx * u_xlat5.xxwy;
			        //MAD
			        u_xlat28.xy = u_xlat5.xz * float2(0.449999988, 0.359999985) + float2(-0.140000001, -0.140000001);
			        //SAMPLE_L
			        u_xlat7 = tex2Dlod(_NoiseTex, float4(u_xlat28.xy, 0.0,1.5));
			        //SAMPLE_L
			        u_xlat8 = tex2Dlod(_NoiseTex, float4(u_xlat15.xz, 0.0,0.0));
			        //SAMPLE_L
			        u_xlat9 = tex2Dlod(_NoiseTex, float4(u_xlat15.yz, 0.0,1.5));
			        //MUL
			        u_xlat15.x = abs(u_xlat6.z) * u_xlat8.x;
			        //MAD
			        u_xlat15.x = u_xlat7.x * abs(u_xlat6.w) + u_xlat15.x;
			        //MAD
			        u_xlat15.x = u_xlat9.x * abs(u_xlat6.y) + u_xlat15.x;
			        //SQRT
			        u_xlat27.x = sqrt(u_xlat4.x);
			        //ADD
			        u_xlat27.x = u_xlat27.x + -1.0;
			        //MAD
			        u_xlat15.x = (-u_xlat15.x) * 0.100000001 + u_xlat27.x;
			        //MIN
			        u_xlat27.x = min(abs(u_xlat6.y), abs(u_xlat6.z));
			        //MAX
			        u_xlat39 = max(abs(u_xlat6.y), abs(u_xlat6.z));
			        //DIV
			        u_xlat39 = float(1.0) / u_xlat39;
			        //MUL
			        u_xlat27.x = u_xlat39 * u_xlat27.x;
			        //MUL
			        u_xlat39 = u_xlat27.x * u_xlat27.x;
			        //MAD
			        u_xlat4.x = u_xlat39 * 0.0208350997 + -0.0851330012;
			        //MAD
			        u_xlat4.x = u_xlat39 * u_xlat4.x + 0.180141002;
			        //MAD
			        u_xlat4.x = u_xlat39 * u_xlat4.x + -0.330299497;
			        //MAD
			        u_xlat39 = u_xlat39 * u_xlat4.x + 0.999866009;
			        //MUL
			        u_xlat4.x = u_xlat39 * u_xlat27.x;
			        //LT
			        u_xlatb28 = abs(u_xlat6.y)<abs(u_xlat6.z);
			        //MAD
			        u_xlat4.x = u_xlat4.x * -2.0 + 1.57079637;
			        //AND
			        u_xlat4.x = u_xlatb28 ? u_xlat4.x : float(0.0);
			        //MAD
			        u_xlat27.x = u_xlat27.x * u_xlat39 + u_xlat4.x;
			        //LT
			        u_xlatb39 = u_xlat6.y<(-u_xlat6.x);
			        //AND
			        u_xlat39 = u_xlatb39 ? -3.14159274 : float(0.0);
			        //ADD
			        u_xlat27.x = u_xlat39 + u_xlat27.x;
			        //MIN
			        u_xlat39 = min(u_xlat6.y, u_xlat6.z);
			        //MAX
			        u_xlat4.x = max(u_xlat6.y, u_xlat6.z);
			        //LT
			        u_xlatb39 = u_xlat39<(-u_xlat39);
			        //GE
			        u_xlatb4.x = u_xlat4.x>=(-u_xlat4.x);
			        //AND
			        u_xlatb39 = u_xlatb39 && u_xlatb4.x;
			        //MOVC
			        u_xlat27.x = (u_xlatb39) ? (-u_xlat27.x) : u_xlat27.x;
			        //MIN
			        u_xlat6.x = min(u_xlat27.x, 3.14159012);
			        //MAD
			        u_xlat27.x = (-u_xlat6.w) * u_xlat6.w + 1.0;
			        //MUL
			        u_xlat27.x = u_xlat27.x * 899.175598;
			        //LOG
			        u_xlat27.x = log2(u_xlat27.x);
			        //MUL
			        u_xlat27.x = u_xlat27.x * 0.720210016;
			        //ROUND_NI
			        u_xlat27.x = floor(u_xlat27.x);
			        //MAX
			        u_xlat27.x = max(u_xlat27.x, 2.0);
			        //MUL
			        u_xlat27.x = u_xlat27.x * 0.694241941;
			        //EXP
			        u_xlat27.x = exp2(u_xlat27.x);
			        //MUL
			        u_xlat27.xy = u_xlat27.xx * float2(0.44721359, 0.723606825);
			        //ROUND_NE
			        u_xlat27.xy = round(u_xlat27.xy);
			        //ADD
			        u_xlat4.xz = u_xlat27.yx + float2(1.0, 1.0);
			        //MUL
			        u_xlat30.xy = u_xlat4.xz * float2(0.618034005, 0.618034005);
			        //ROUND_NI
			        u_xlat30.xy = floor(u_xlat30.xy);
			        //MAD
			        u_xlat4.xz = u_xlat4.xz * float2(0.618034005, 0.618034005) + (-u_xlat30.xy);
			        //MAD
			        u_xlat4.xz = u_xlat4.xz * float2(6.28318024, 6.28318024) + float2(-3.88321877, -3.88321877);
			        //MUL
			        u_xlat27.xy = u_xlat27.xy * float2(-0.015625, -0.015625);
			        //MUL
			        u_xlat40 = u_xlat27.x * u_xlat4.x;
			        //MAD
			        u_xlat40 = u_xlat4.z * u_xlat27.y + (-u_xlat40);
			        //MUL
			        u_xlat7.xz = u_xlat27.yx * float2(1.0, -1.0);
			        //MUL
			        u_xlat7.yw = u_xlat4.xz * float2(-1.0, 1.0);
			        //DIV
			        u_xlat7 = u_xlat7 / (float4)(u_xlat40);
			        //MAD
			        u_xlat6.y = u_xlat5.y * u_xlat16.x + -0.9921875;
			        //DP2
			        u_xlat4.x = dot(u_xlat7.xy, u_xlat6.xy);
			        //DP2
			        u_xlat4.z = dot(u_xlat7.zw, u_xlat6.xy);
			        //ROUND_NI
			        u_xlat6.xy = floor(u_xlat4.xz);
			        //MOV
			        u_xlat7.x = float(100000.0);
			        //MOV
			        u_xlat7.y = float(0.0);
			        //MOV
			        u_xlat7.z = float(0.0);
			        //MOV
			        u_xlat7.w = float(0.0);
			        //LOOP
			        for(uint u_xlatu_loop_2 = 0u ; u_xlatu_loop_2<4u ; u_xlatu_loop_2++)
			        {
			            //AND
			            u_xlatu28.x = u_xlatu_loop_2 & 1u;
			            //USHR
			            u_xlatu28.y = u_xlatu_loop_2 >> 1u;
			            //UTOF
			            u_xlat8.xy = float2(u_xlatu28.xy);
			            //ADD
			            u_xlat28.xy = u_xlat6.xy + u_xlat8.xy;
			            //DP2
			            u_xlat28.x = dot(u_xlat27.xy, u_xlat28.xy);
			            //ADD
			            u_xlat28.x = u_xlat28.x + 0.9921875;
			            //MAX
			            u_xlat40 = max(u_xlat28.x, -1.0);
			            //MIN
			            u_xlat40 = min(u_xlat40, 1.0);
			            //MAD
			            u_xlat28.x = u_xlat40 * 2.0 + (-u_xlat28.x);
			            //MAD
			            u_xlat28.x = (-u_xlat28.x) * 64.0 + 64.0;
			            //ROUND_NI
			            u_xlat28.x = floor(u_xlat28.x);
			            //MUL
			            u_xlat40 = u_xlat28.x * 0.618034005;
			            //ROUND_NI
			            u_xlat40 = floor(u_xlat40);
			            //MAD
			            u_xlat40 = u_xlat28.x * 0.618034005 + (-u_xlat40);
			            //MUL
			            u_xlat40 = u_xlat40 * 6.28318024;
			            //MAD
			            u_xlat28.x = u_xlat28.x * 2.0 + 1.0;
			            //MAD
			            u_xlat8.w = (-u_xlat28.x) * 0.0078125 + 1.0;
			            //MAD
			            u_xlat28.x = (-u_xlat8.w) * u_xlat8.w + 1.0;
			            //SQRT
			            u_xlat28.x = sqrt(u_xlat28.x);
			            //SINCOS
			            u_xlat9.x = sin(u_xlat40);
			            u_xlat10.x = cos(u_xlat40);
			            //MUL
			            u_xlat8.y = u_xlat28.x * u_xlat10.x;
			            //MUL
			            u_xlat8.z = u_xlat28.x * u_xlat9.x;
			            //MAD
			            u_xlat9.xyz = (-u_xlat5.xwy) * u_xlat16.xxx + u_xlat8.yzw;
			            //DP3
			            u_xlat8.x = dot(u_xlat9.xyz, u_xlat9.xyz);
			            //LT
			            u_xlatb28 = u_xlat8.x<u_xlat7.x;
			            //MOVC
			            u_xlat7 = ((bool)(u_xlatb28)) ? u_xlat8 : u_xlat7;
			        //ENDLOOP
			        }
			        //MAD
			        u_xlat4.xyz = (-u_xlat7.yzw) * float3(1.01999998, 1.01999998, 1.01999998) + u_xlat5.xwy;
			        //DP3
			        u_xlat27.x = dot(u_xlat4.xyz, u_xlat4.xyz);
			        //SQRT
			        u_xlat27.x = sqrt(u_xlat27.x);
			        //ADD
			        u_xlat27.x = u_xlat27.x + -0.0599999987;
			        //ADD
			        u_xlat39 = (-u_xlat27.x) + u_xlat15.x;
			        //MAD
			        u_xlat39 = u_xlat39 * 50.0 + 0.5;
			        u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
			        //ADD
			        u_xlat27.x = (-u_xlat15.x) + u_xlat27.x;
			        //MAD
			        u_xlat27.x = u_xlat39 * u_xlat27.x + u_xlat15.x;
			        //MUL
			        u_xlat4.x = u_xlat39 * 0.00999999978;
			        //ADD
			        u_xlat39 = (-u_xlat39) + 1.0;
			        //MAD
			        u_xlat27.x = (-u_xlat4.x) * u_xlat39 + u_xlat27.x;
			        //LT
			        u_xlatb39 = u_xlat27.x<u_xlat15.x;
			        //MOVC
			        u_xlat15.x = (u_xlatb39) ? u_xlat27.x : u_xlat15.x;
			        //LT
			        u_xlatb27 = u_xlat3.x<u_xlat15.x;
			        //MOVC
			        u_xlat3.x = (u_xlatb27) ? u_xlat3.x : u_xlat15.x;
			        //MUL
			        u_xlat3.x = u_xlat3.x * 0.300000012;
			    //ELSE
			    } else {
			        //MOV
			        u_xlat3.x = 1.0;
			    //ENDIF
			    }
			    //MOV
			    u_xlat4.z = (-_Epsilon);
			    //MOV
			    u_xlat4.x = float(-0.0);
			    //MOV
			    u_xlat4.y = float(-0.0);
			    //ADD
			    u_xlat15.xyz = u_xlat0.xyz + u_xlat4.zyy;
			    //MAD
			    u_xlat17.z = u_xlat15.z * 3.33333325 + (-u_xlat36);
			    //ADD
			    u_xlat15.z = u_xlat17.z + 3.0;
			    //MUL
			    u_xlat15.xyz = u_xlat15.xyz * float3(3.33333325, 3.33333325, 0.0500000007);
			    //SINCOS
			    u_xlat5.x = sin(u_xlat15.z);
			    u_xlat6.x = cos(u_xlat15.z);
			    //MOV
			    u_xlat7.x = (-u_xlat5.x);
			    //MOV
			    u_xlat7.y = u_xlat6.x;
			    //MOV
			    u_xlat7.z = u_xlat5.x;
			    //DP2
			    u_xlat17.x = dot(u_xlat15.xy, u_xlat7.yz);
			    //DP2
			    u_xlat17.y = dot(u_xlat15.xy, u_xlat7.xy);
			    //ADD
			    u_xlat15.xyz = u_xlat17.xyz + float3(3.0, 3.0, 3.0);
			    //MUL
			    u_xlat5.xyz = u_xlat15.xyz * float3(0.166666672, 0.166666672, 0.166666672);
			    //ROUND_NI
			    u_xlat5.xyz = floor(u_xlat5.xyz);
			    //EQ
			    u_xlatb6.xy = ((u_xlat5.xyxx) == (float4(0.0, 0.0, 0.0, 0.0))).xy;
			    //OR
			    u_xlatb40 = u_xlatb6.y || u_xlatb6.x;
			    //IF
			    if(!u_xlatb40){
			        //MAD
			        u_xlat15.xyz = (-u_xlat5.xyz) * float3(6.0, 6.0, 6.0) + u_xlat15.xyz;
			        //ADD
			        u_xlat6.yzw = u_xlat15.xyz + float3(-3.0, -3.0, -3.0);
			        //MAD
			        u_xlat15.xyz = _Time.yyy * float3(1.29999995, 0.800000012, 1.20000005) + u_xlat5.xyz;
			        //SINCOS
			        u_xlat7.x = sin(u_xlat15.x);
			        u_xlat8.x = cos(u_xlat15.x);
			        //MOV
			        u_xlat9.x = (-u_xlat7.x);
			        //MOV
			        u_xlat9.y = u_xlat8.x;
			        //MOV
			        u_xlat9.z = u_xlat7.x;
			        //DP2
			        u_xlat6.x = dot(u_xlat6.yz, u_xlat9.yz);
			        //DP2
			        u_xlat7.x = dot(u_xlat6.yz, u_xlat9.xy);
			        //SINCOS
			        u_xlat8.x = sin(u_xlat15.y);
			        u_xlat9.x = cos(u_xlat15.y);
			        //MOV
			        u_xlat10.x = (-u_xlat8.x);
			        //MOV
			        u_xlat10.y = u_xlat9.x;
			        //MOV
			        u_xlat10.z = u_xlat8.x;
			        //DP2
			        u_xlat8.x = dot(u_xlat6.xw, u_xlat10.yz);
			        //DP2
			        u_xlat7.y = dot(u_xlat6.xw, u_xlat10.xy);
			        //SINCOS
			        u_xlat6.x = sin(u_xlat15.z);
			        u_xlat9.x = cos(u_xlat15.z);
			        //MOV
			        u_xlat10.x = (-u_xlat6.x);
			        //MOV
			        u_xlat10.y = u_xlat9.x;
			        //MOV
			        u_xlat10.z = u_xlat6.x;
			        //DP2
			        u_xlat8.y = dot(u_xlat7.xy, u_xlat10.yz);
			        //DP2
			        u_xlat8.z = dot(u_xlat7.xy, u_xlat10.xy);
			        //ADD
			        u_xlat15.x = u_xlat5.x + _Time.y;
			        //SINCOS
			        u_xlat15.x = sin(u_xlat15.x);
			        //MAD
			        u_xlat15.x = u_xlat15.x * 0.5 + 0.5;
			        //MAD
			        u_xlat15.x = u_xlat15.x * 0.199999988 + 0.800000012;
			        //MUL
			        u_xlat5.xyz = u_xlat15.xxx * u_xlat8.xyz;
			        //MAD
			        u_xlat6 = u_xlat8.yxyz * u_xlat15.xxxx + float4(-1.0, -0.0, -1.32000005, -0.0);
			        //MIN
			        u_xlat15.x = min(abs(u_xlat6.y), abs(u_xlat6.w));
			        //MAX
			        u_xlat27.x = max(abs(u_xlat6.y), abs(u_xlat6.w));
			        //DIV
			        u_xlat27.x = float(1.0) / u_xlat27.x;
			        //MUL
			        u_xlat15.x = u_xlat27.x * u_xlat15.x;
			        //MUL
			        u_xlat27.x = u_xlat15.x * u_xlat15.x;
			        //MAD
			        u_xlat39 = u_xlat27.x * 0.0208350997 + -0.0851330012;
			        //MAD
			        u_xlat39 = u_xlat27.x * u_xlat39 + 0.180141002;
			        //MAD
			        u_xlat39 = u_xlat27.x * u_xlat39 + -0.330299497;
			        //MAD
			        u_xlat27.x = u_xlat27.x * u_xlat39 + 0.999866009;
			        //MUL
			        u_xlat39 = u_xlat27.x * u_xlat15.x;
			        //LT
			        u_xlatb40 = abs(u_xlat6.y)<abs(u_xlat6.w);
			        //MAD
			        u_xlat39 = u_xlat39 * -2.0 + 1.57079637;
			        //AND
			        u_xlat39 = u_xlatb40 ? u_xlat39 : float(0.0);
			        //MAD
			        u_xlat15.x = u_xlat15.x * u_xlat27.x + u_xlat39;
			        //LT
			        u_xlatb27 = u_xlat6.y<(-u_xlat6.y);
			        //AND
			        u_xlat27.x = u_xlatb27 ? -3.14159274 : float(0.0);
			        //ADD
			        u_xlat15.x = u_xlat27.x + u_xlat15.x;
			        //MIN
			        u_xlat27.x = min(u_xlat6.y, u_xlat6.w);
			        //MAX
			        u_xlat39 = max(u_xlat6.y, u_xlat6.w);
			        //LT
			        u_xlatb27 = u_xlat27.x<(-u_xlat27.x);
			        //GE
			        u_xlatb39 = u_xlat39>=(-u_xlat39);
			        //AND
			        u_xlatb27 = u_xlatb39 && u_xlatb27;
			        //MOVC
			        u_xlat15.x = (u_xlatb27) ? (-u_xlat15.x) : u_xlat15.x;
			        //DP2
			        u_xlat27.x = dot(u_xlat6.yw, u_xlat6.yw);
			        //SQRT
			        u_xlat27.x = sqrt(u_xlat27.x);
			        //ADD
			        u_xlat15.x = u_xlat15.x + 0.314159274;
			        //MUL
			        u_xlat39 = u_xlat15.x * 1.5915494;
			        //ROUND_NI
			        u_xlat39 = floor(u_xlat39);
			        //MAD
			        u_xlat15.x = (-u_xlat39) * 0.628318548 + u_xlat15.x;
			        //ADD
			        u_xlat15.x = u_xlat15.x + -0.314159274;
			        //SINCOS
			        u_xlat7.x = sin(u_xlat15.x);
			        u_xlat8.x = cos(u_xlat15.x);
			        //MOV
			        u_xlat8.xz = u_xlat8.xx;
			        //MOV
			        u_xlat8.y = u_xlat7.x;
			        //MUL
			        u_xlat15.xyz = u_xlat27.xxx * u_xlat8.xyz;
			        //MAD
			        u_xlat15.xyz = u_xlat15.xyz * float3(2.0, 2.0, 2.0) + float3(-1.0, -0.0, -1.0);
			        //MUL
			        u_xlat7.xyz = u_xlat15.xyz * float3(0.5, 0.5, 3.0);
			        //SINCOS
			        u_xlat15.x = sin(u_xlat7.z);
			        //MAD
			        u_xlat8.y = u_xlat15.x * 0.100000001 + u_xlat6.z;
			        //ADD
			        u_xlat7.w = abs(u_xlat7.y) + 0.600000024;
			        //DP2
			        u_xlat15.x = dot(u_xlat7.xw, u_xlat7.xw);
			        //SQRT
			        u_xlat8.x = sqrt(u_xlat15.x);
			        //ADD
			        u_xlat15.xy = abs(u_xlat8.xy) + float2(-0.699999988, -0.00999999978);
			        //MAX
			        u_xlat39 = max(u_xlat15.y, u_xlat15.x);
			        //MIN
			        u_xlat39 = min(u_xlat39, 0.0);
			        //MAX
			        u_xlat15.xy = max(u_xlat15.xy, float2(0.0, 0.0));
			        //DP2
			        u_xlat15.x = dot(u_xlat15.xy, u_xlat15.xy);
			        //SQRT
			        u_xlat15.x = sqrt(u_xlat15.x);
			        //ADD
			        u_xlat15.x = u_xlat15.x + u_xlat39;
			        //MOV
			        u_xlat8.zw = u_xlat7.xy;
			        //ADD
			        u_xlat7.xyz = u_xlat8.zyw + float3(-0.0, -0.00999999978, -0.0);
			        //ADD
			        u_xlat7.xyz = abs(u_xlat7.xyz) + float3(-0.449999988, -0.0130000003, -0.00100000005);
			        //MAX
			        u_xlat27.x = max(u_xlat7.z, u_xlat7.y);
			        //MAX
			        u_xlat27.x = max(u_xlat27.x, u_xlat7.x);
			        //MIN
			        u_xlat27.x = min(u_xlat27.x, 0.0);
			        //MAX
			        u_xlat7.xyz = max(u_xlat7.xyz, float3(0.0, 0.0, 0.0));
			        //DP3
			        u_xlat39 = dot(u_xlat7.xyz, u_xlat7.xyz);
			        //SQRT
			        u_xlat39 = sqrt(u_xlat39);
			        //ADD
			        u_xlat27.x = u_xlat39 + u_xlat27.x;
			        //ADD
			        u_xlat39 = (-u_xlat15.x) + u_xlat27.x;
			        //MAD
			        u_xlat39 = u_xlat39 * 10.0 + 0.5;
			        u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
			        //ADD
			        u_xlat15.x = (-u_xlat27.x) + u_xlat15.x;
			        //MAD
			        u_xlat15.x = u_xlat39 * u_xlat15.x + u_xlat27.x;
			        //MUL
			        u_xlat27.x = u_xlat39 * 0.0500000007;
			        //ADD
			        u_xlat39 = (-u_xlat39) + 1.0;
			        //MAD
			        u_xlat15.x = (-u_xlat27.x) * u_xlat39 + u_xlat15.x;
			        //MUL
			        u_xlat27.x = u_xlat6.z * 4.0;
			        //SINCOS
			        u_xlat27.x = sin(u_xlat27.x);
			        //MAD
			        u_xlat27.x = u_xlat27.x * 0.100000001 + u_xlat6.y;
			        //ADD
			        u_xlat7.x = u_xlat27.x + -0.0500000007;
			        //MOV
			        u_xlat7.yw = u_xlat6.wz;
			        //DP2
			        u_xlat27.x = dot(u_xlat7.xy, u_xlat7.xy);
			        //SQRT
			        u_xlat7.z = sqrt(u_xlat27.x);
			        //ADD
			        u_xlat27.xy = abs(u_xlat7.zw) + float2(-0.0399999991, -0.699999988);
			        //MAX
			        u_xlat40 = max(u_xlat27.y, u_xlat27.x);
			        //MIN
			        u_xlat40 = min(u_xlat40, 0.0);
			        //MAX
			        u_xlat27.xy = max(u_xlat27.xy, float2(0.0, 0.0));
			        //DP2
			        u_xlat27.x = dot(u_xlat27.xy, u_xlat27.xy);
			        //SQRT
			        u_xlat27.x = sqrt(u_xlat27.x);
			        //ADD
			        u_xlat27.x = u_xlat27.x + u_xlat40;
			        //ADD
			        u_xlat39 = (-u_xlat15.x) + u_xlat27.x;
			        //MAD
			        u_xlat39 = u_xlat39 * 1.66666663 + 0.5;
			        u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
			        //ADD
			        u_xlat15.x = (-u_xlat27.x) + u_xlat15.x;
			        //MAD
			        u_xlat15.x = u_xlat39 * u_xlat15.x + u_xlat27.x;
			        //MUL
			        u_xlat27.x = u_xlat39 * 0.300000012;
			        //ADD
			        u_xlat39 = (-u_xlat39) + 1.0;
			        //MAD
			        u_xlat15.x = (-u_xlat27.x) * u_xlat39 + u_xlat15.x;
			        //MOV
			        u_xlat27.x = u_xlat5.y;
			        u_xlat27.x = clamp(u_xlat27.x, 0.0, 1.0);
			        //MAD
			        u_xlat39 = u_xlat27.x * -2.0 + 3.0;
			        //MUL
			        u_xlat27.x = u_xlat27.x * u_xlat27.x;
			        //MOV
			        u_xlat6.x = u_xlat6.x;
			        u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
			        //MAD
			        u_xlat40 = u_xlat6.x * -2.0 + 3.0;
			        //MUL
			        u_xlat41 = u_xlat6.x * u_xlat6.x;
			        //MUL
			        u_xlat40 = u_xlat40 * u_xlat41;
			        //MUL
			        u_xlat40 = u_xlat40 * 3.0;
			        //MAD
			        u_xlat27.x = u_xlat39 * u_xlat27.x + (-u_xlat40);
			        //MAD
			        u_xlat27.x = (-u_xlat27.x) * 0.159999996 + 1.0;
			        //MUL
			        u_xlat5.xzw = u_xlat27.xxx * u_xlat5.xyz;
			        //MUL
			        u_xlat27.y = u_xlat5.z * 2.22222233;
			        u_xlat27.y = clamp(u_xlat27.y, 0.0, 1.0);
			        //MAD
			        u_xlat40 = u_xlat27.y * -2.0 + 3.0;
			        //MAD
			        u_xlat27.x = u_xlat5.y * u_xlat27.x + -0.449999988;
			        //MUL
			        u_xlat27.x = u_xlat27.x * 2.22222233;
			        u_xlat27.x = clamp(u_xlat27.x, 0.0, 1.0);
			        //MAD
			        u_xlat17.x = u_xlat27.x * -2.0 + 3.0;
			        //MUL
			        u_xlat27.xy = u_xlat27.xy * u_xlat27.xy;
			        //MUL
			        u_xlat27.x = u_xlat27.x * u_xlat17.x;
			        //MAD
			        u_xlat27.x = u_xlat40 * u_xlat27.y + (-u_xlat27.x);
			        //MAD
			        u_xlat27.x = (-u_xlat27.x) * 0.0700000003 + 1.0;
			        //MUL
			        u_xlat6.xyz = u_xlat27.xxx * u_xlat5.xwz;
			        //MAD
			        u_xlat27.x = u_xlat5.z * u_xlat27.x + 0.600000024;
			        //MUL
			        u_xlat27.x = u_xlat27.x * 1.25;
			        u_xlat27.x = clamp(u_xlat27.x, 0.0, 1.0);
			        //MAD
			        u_xlat39 = u_xlat27.x * -2.0 + 3.0;
			        //MUL
			        u_xlat27.x = u_xlat27.x * u_xlat27.x;
			        //MAD
			        u_xlat27.x = (-u_xlat39) * u_xlat27.x + 1.0;
			        //MAD
			        u_xlat27.x = u_xlat27.x * 0.200000003 + 1.0;
			        //MUL
			        u_xlat6.xy = u_xlat27.xx * u_xlat6.xy;
			        //MUL
			        u_xlat6.w = u_xlat6.z * 0.800000012;
			        //MUL
			        u_xlat5.xyz = u_xlat6.xzy * float3(0.449999988, 0.359999985, 0.449999988);
			        //DP3
			        u_xlat27.x = dot(u_xlat6.xyw, u_xlat6.xyw);
			        //RSQ
			        u_xlat39 = rsqrt(u_xlat27.x);
			        //MUL
			        u_xlat7 = (float4)(u_xlat39) * u_xlat6.xxwy;
			        //MAD
			        u_xlat8.xy = u_xlat6.xz * float2(0.449999988, 0.359999985) + float2(-0.140000001, -0.140000001);
			        //SAMPLE_L
			        u_xlat8 = tex2Dlod(_NoiseTex, float4(u_xlat8.xy, 0.0,1.5));
			        //SAMPLE_L
			        u_xlat9 = tex2Dlod(_NoiseTex, float4(u_xlat5.xz, 0.0,0.0));
			        //SAMPLE_L
			        u_xlat5 = tex2Dlod(_NoiseTex, float4(u_xlat5.yz, 0.0,1.5));
			        //MUL
			        u_xlat40 = abs(u_xlat7.z) * u_xlat9.x;
			        //MAD
			        u_xlat40 = u_xlat8.x * abs(u_xlat7.w) + u_xlat40;
			        //MAD
			        u_xlat40 = u_xlat5.x * abs(u_xlat7.y) + u_xlat40;
			        //SQRT
			        u_xlat27.x = sqrt(u_xlat27.x);
			        //ADD
			        u_xlat27.x = u_xlat27.x + -1.0;
			        //MAD
			        u_xlat27.x = (-u_xlat40) * 0.100000001 + u_xlat27.x;
			        //MIN
			        u_xlat40 = min(abs(u_xlat7.y), abs(u_xlat7.z));
			        //MAX
			        u_xlat5.x = max(abs(u_xlat7.y), abs(u_xlat7.z));
			        //DIV
			        u_xlat5.x = float(1.0) / u_xlat5.x;
			        //MUL
			        u_xlat40 = u_xlat40 * u_xlat5.x;
			        //MUL
			        u_xlat5.x = u_xlat40 * u_xlat40;
			        //MAD
			        u_xlat17.x = u_xlat5.x * 0.0208350997 + -0.0851330012;
			        //MAD
			        u_xlat17.x = u_xlat5.x * u_xlat17.x + 0.180141002;
			        //MAD
			        u_xlat17.x = u_xlat5.x * u_xlat17.x + -0.330299497;
			        //MAD
			        u_xlat5.x = u_xlat5.x * u_xlat17.x + 0.999866009;
			        //MUL
			        u_xlat17.x = u_xlat40 * u_xlat5.x;
			        //LT
			        u_xlatb29 = abs(u_xlat7.y)<abs(u_xlat7.z);
			        //MAD
			        u_xlat17.x = u_xlat17.x * -2.0 + 1.57079637;
			        //AND
			        u_xlat17.x = u_xlatb29 ? u_xlat17.x : float(0.0);
			        //MAD
			        u_xlat40 = u_xlat40 * u_xlat5.x + u_xlat17.x;
			        //LT
			        u_xlatb5 = u_xlat7.y<(-u_xlat7.x);
			        //AND
			        u_xlat5.x = u_xlatb5 ? -3.14159274 : float(0.0);
			        //ADD
			        u_xlat40 = u_xlat40 + u_xlat5.x;
			        //MIN
			        u_xlat5.x = min(u_xlat7.y, u_xlat7.z);
			        //MAX
			        u_xlat17.x = max(u_xlat7.y, u_xlat7.z);
			        //LT
			        u_xlatb5 = u_xlat5.x<(-u_xlat5.x);
			        //GE
			        u_xlatb17 = u_xlat17.x>=(-u_xlat17.x);
			        //AND
			        u_xlatb5 = u_xlatb17 && u_xlatb5;
			        //MOVC
			        u_xlat40 = (u_xlatb5) ? (-u_xlat40) : u_xlat40;
			        //MIN
			        u_xlat5.x = min(u_xlat40, 3.14159012);
			        //MAD
			        u_xlat40 = (-u_xlat7.w) * u_xlat7.w + 1.0;
			        //MUL
			        u_xlat40 = u_xlat40 * 899.175598;
			        //LOG
			        u_xlat40 = log2(u_xlat40);
			        //MUL
			        u_xlat40 = u_xlat40 * 0.720210016;
			        //ROUND_NI
			        u_xlat40 = floor(u_xlat40);
			        //MAX
			        u_xlat40 = max(u_xlat40, 2.0);
			        //MUL
			        u_xlat40 = u_xlat40 * 0.694241941;
			        //EXP
			        u_xlat40 = exp2(u_xlat40);
			        //MUL
			        u_xlat29.xy = (float2)(u_xlat40) * float2(0.44721359, 0.723606825);
			        //ROUND_NE
			        u_xlat29.xy = round(u_xlat29.xy);
			        //ADD
			        u_xlat7.xy = u_xlat29.yx + float2(1.0, 1.0);
			        //MUL
			        u_xlat31.xy = u_xlat7.xy * float2(0.618034005, 0.618034005);
			        //ROUND_NI
			        u_xlat31.xy = floor(u_xlat31.xy);
			        //MAD
			        u_xlat7.xy = u_xlat7.xy * float2(0.618034005, 0.618034005) + (-u_xlat31.xy);
			        //MAD
			        u_xlat7.xy = u_xlat7.xy * float2(6.28318024, 6.28318024) + float2(-3.88321877, -3.88321877);
			        //MUL
			        u_xlat29.xy = u_xlat29.xy * float2(-0.015625, -0.015625);
			        //MUL
			        u_xlat40 = u_xlat29.x * u_xlat7.x;
			        //MAD
			        u_xlat40 = u_xlat7.y * u_xlat29.y + (-u_xlat40);
			        //MUL
			        u_xlat8.xz = u_xlat29.yx * float2(1.0, -1.0);
			        //MUL
			        u_xlat8.yw = u_xlat7.xy * float2(-1.0, 1.0);
			        //DIV
			        u_xlat7 = u_xlat8 / (float4)(u_xlat40);
			        //MAD
			        u_xlat5.y = u_xlat6.y * u_xlat39 + -0.9921875;
			        //DP2
			        u_xlat40 = dot(u_xlat7.xy, u_xlat5.xy);
			        //DP2
			        u_xlat5.x = dot(u_xlat7.zw, u_xlat5.xy);
			        //ROUND_NI
			        u_xlat7.x = floor(u_xlat40);
			        //ROUND_NI
			        u_xlat7.y = floor(u_xlat5.x);
			        //MOV
			        u_xlat8.x = float(100000.0);
			        //MOV
			        u_xlat8.y = float(0.0);
			        //MOV
			        u_xlat8.z = float(0.0);
			        //MOV
			        u_xlat8.w = float(0.0);
			        //LOOP
			        for(uint u_xlatu_loop_3 = 0u ; u_xlatu_loop_3<4u ; u_xlatu_loop_3++)
			        {
			            //AND
			            u_xlatu5.x = u_xlatu_loop_3 & 1u;
			            //USHR
			            u_xlatu5.y = u_xlatu_loop_3 >> 1u;
			            //UTOF
			            u_xlat9.xy = float2(u_xlatu5.xy);
			            //ADD
			            u_xlat5.xy = u_xlat7.xy + u_xlat9.xy;
			            //DP2
			            u_xlat5.x = dot(u_xlat29.xy, u_xlat5.xy);
			            //ADD
			            u_xlat5.x = u_xlat5.x + 0.9921875;
			            //MAX
			            u_xlat17.x = max(u_xlat5.x, -1.0);
			            //MIN
			            u_xlat17.x = min(u_xlat17.x, 1.0);
			            //MAD
			            u_xlat5.x = u_xlat17.x * 2.0 + (-u_xlat5.x);
			            //MAD
			            u_xlat5.x = (-u_xlat5.x) * 64.0 + 64.0;
			            //ROUND_NI
			            u_xlat5.x = floor(u_xlat5.x);
			            //MUL
			            u_xlat17.x = u_xlat5.x * 0.618034005;
			            //ROUND_NI
			            u_xlat17.x = floor(u_xlat17.x);
			            //MAD
			            u_xlat17.x = u_xlat5.x * 0.618034005 + (-u_xlat17.x);
			            //MUL
			            u_xlat17.x = u_xlat17.x * 6.28318024;
			            //MAD
			            u_xlat5.x = u_xlat5.x * 2.0 + 1.0;
			            //MAD
			            u_xlat9.w = (-u_xlat5.x) * 0.0078125 + 1.0;
			            //MAD
			            u_xlat5.x = (-u_xlat9.w) * u_xlat9.w + 1.0;
			            //SQRT
			            u_xlat5.x = sqrt(u_xlat5.x);
			            //SINCOS
			            u_xlat10.x = sin(u_xlat17.x);
			            u_xlat11.x = cos(u_xlat17.x);
			            //MUL
			            u_xlat9.y = u_xlat5.x * u_xlat11.x;
			            //MUL
			            u_xlat9.z = u_xlat5.x * u_xlat10.x;
			            //MAD
			            u_xlat10.xyz = (-u_xlat6.xwy) * (float3)(u_xlat39) + u_xlat9.yzw;
			            //DP3
			            u_xlat9.x = dot(u_xlat10.xyz, u_xlat10.xyz);
			            //LT
			            u_xlatb5 = u_xlat9.x<u_xlat8.x;
			            //MOVC
			            u_xlat8 = ((bool)(u_xlatb5)) ? u_xlat9 : u_xlat8;
			        //ENDLOOP
			        }
			        //MAD
			        u_xlat5.xyz = (-u_xlat8.yzw) * float3(1.01999998, 1.01999998, 1.01999998) + u_xlat6.xwy;
			        //DP3
			        u_xlat39 = dot(u_xlat5.xyz, u_xlat5.xyz);
			        //SQRT
			        u_xlat39 = sqrt(u_xlat39);
			        //ADD
			        u_xlat39 = u_xlat39 + -0.0599999987;
			        //ADD
			        u_xlat40 = (-u_xlat39) + u_xlat27.x;
			        //MAD
			        u_xlat40 = u_xlat40 * 50.0 + 0.5;
			        u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
			        //ADD
			        u_xlat39 = (-u_xlat27.x) + u_xlat39;
			        //MAD
			        u_xlat39 = u_xlat40 * u_xlat39 + u_xlat27.x;
			        //MUL
			        u_xlat5.x = u_xlat40 * 0.00999999978;
			        //ADD
			        u_xlat40 = (-u_xlat40) + 1.0;
			        //MAD
			        u_xlat39 = (-u_xlat5.x) * u_xlat40 + u_xlat39;
			        //LT
			        u_xlatb40 = u_xlat39<u_xlat27.x;
			        //MOVC
			        u_xlat27.x = (u_xlatb40) ? u_xlat39 : u_xlat27.x;
			        //LT
			        u_xlatb39 = u_xlat15.x<u_xlat27.x;
			        //MOVC
			        u_xlat15.x = (u_xlatb39) ? u_xlat15.x : u_xlat27.x;
			        //MUL
			        u_xlat5.x = u_xlat15.x * 0.300000012;
			    //ELSE
			    } else {
			        //MOV
			        u_xlat5.x = 1.0;
			    //ENDIF
			    }
			    //ADD
			    u_xlat15.xyz = u_xlat0.xyz + u_xlat4.yzy;
			    //MAD
			    u_xlat18.z = u_xlat15.z * 3.33333325 + (-u_xlat36);
			    //ADD
			    u_xlat15.z = u_xlat18.z + 3.0;
			    //MUL
			    u_xlat15.xyz = u_xlat15.xyz * float3(3.33333325, 3.33333325, 0.0500000007);
			    //SINCOS
			    u_xlat6.x = sin(u_xlat15.z);
			    u_xlat7.x = cos(u_xlat15.z);
			    //MOV
			    u_xlat8.x = (-u_xlat6.x);
			    //MOV
			    u_xlat8.y = u_xlat7.x;
			    //MOV
			    u_xlat8.z = u_xlat6.x;
			    //DP2
			    u_xlat18.x = dot(u_xlat15.xy, u_xlat8.yz);
			    //DP2
			    u_xlat18.y = dot(u_xlat15.xy, u_xlat8.xy);
			    //ADD
			    u_xlat15.xyz = u_xlat18.xyz + float3(3.0, 3.0, 3.0);
			    //MUL
			    u_xlat6.xyz = u_xlat15.xyz * float3(0.166666672, 0.166666672, 0.166666672);
			    //ROUND_NI
			    u_xlat6.xyz = floor(u_xlat6.xyz);
			    //EQ
			    u_xlatb7.xy = ((u_xlat6.xyxx) == (float4(0.0, 0.0, 0.0, 0.0))).xy;
			    //OR
			    u_xlatb40 = u_xlatb7.y || u_xlatb7.x;
			    //IF
			    if(!u_xlatb40){
			        //MAD
			        u_xlat15.xyz = (-u_xlat6.xyz) * float3(6.0, 6.0, 6.0) + u_xlat15.xyz;
			        //ADD
			        u_xlat7.yzw = u_xlat15.xyz + float3(-3.0, -3.0, -3.0);
			        //MAD
			        u_xlat15.xyz = _Time.yyy * float3(1.29999995, 0.800000012, 1.20000005) + u_xlat6.xyz;
			        //SINCOS
			        u_xlat8.x = sin(u_xlat15.x);
			        u_xlat9.x = cos(u_xlat15.x);
			        //MOV
			        u_xlat10.x = (-u_xlat8.x);
			        //MOV
			        u_xlat10.y = u_xlat9.x;
			        //MOV
			        u_xlat10.z = u_xlat8.x;
			        //DP2
			        u_xlat7.x = dot(u_xlat7.yz, u_xlat10.yz);
			        //DP2
			        u_xlat8.x = dot(u_xlat7.yz, u_xlat10.xy);
			        //SINCOS
			        u_xlat9.x = sin(u_xlat15.y);
			        u_xlat10.x = cos(u_xlat15.y);
			        //MOV
			        u_xlat11.x = (-u_xlat9.x);
			        //MOV
			        u_xlat11.y = u_xlat10.x;
			        //MOV
			        u_xlat11.z = u_xlat9.x;
			        //DP2
			        u_xlat9.x = dot(u_xlat7.xw, u_xlat11.yz);
			        //DP2
			        u_xlat8.y = dot(u_xlat7.xw, u_xlat11.xy);
			        //SINCOS
			        u_xlat7.x = sin(u_xlat15.z);
			        u_xlat10.x = cos(u_xlat15.z);
			        //MOV
			        u_xlat11.x = (-u_xlat7.x);
			        //MOV
			        u_xlat11.y = u_xlat10.x;
			        //MOV
			        u_xlat11.z = u_xlat7.x;
			        //DP2
			        u_xlat9.y = dot(u_xlat8.xy, u_xlat11.yz);
			        //DP2
			        u_xlat9.z = dot(u_xlat8.xy, u_xlat11.xy);
			        //ADD
			        u_xlat15.x = u_xlat6.x + _Time.y;
			        //SINCOS
			        u_xlat15.x = sin(u_xlat15.x);
			        //MAD
			        u_xlat15.x = u_xlat15.x * 0.5 + 0.5;
			        //MAD
			        u_xlat15.x = u_xlat15.x * 0.199999988 + 0.800000012;
			        //MUL
			        u_xlat6.xyz = u_xlat15.xxx * u_xlat9.xyz;
			        //MAD
			        u_xlat7 = u_xlat9.yxyz * u_xlat15.xxxx + float4(-1.0, -0.0, -1.32000005, -0.0);
			        //MIN
			        u_xlat15.x = min(abs(u_xlat7.y), abs(u_xlat7.w));
			        //MAX
			        u_xlat27.x = max(abs(u_xlat7.y), abs(u_xlat7.w));
			        //DIV
			        u_xlat27.x = float(1.0) / u_xlat27.x;
			        //MUL
			        u_xlat15.x = u_xlat27.x * u_xlat15.x;
			        //MUL
			        u_xlat27.x = u_xlat15.x * u_xlat15.x;
			        //MAD
			        u_xlat39 = u_xlat27.x * 0.0208350997 + -0.0851330012;
			        //MAD
			        u_xlat39 = u_xlat27.x * u_xlat39 + 0.180141002;
			        //MAD
			        u_xlat39 = u_xlat27.x * u_xlat39 + -0.330299497;
			        //MAD
			        u_xlat27.x = u_xlat27.x * u_xlat39 + 0.999866009;
			        //MUL
			        u_xlat39 = u_xlat27.x * u_xlat15.x;
			        //LT
			        u_xlatb40 = abs(u_xlat7.y)<abs(u_xlat7.w);
			        //MAD
			        u_xlat39 = u_xlat39 * -2.0 + 1.57079637;
			        //AND
			        u_xlat39 = u_xlatb40 ? u_xlat39 : float(0.0);
			        //MAD
			        u_xlat15.x = u_xlat15.x * u_xlat27.x + u_xlat39;
			        //LT
			        u_xlatb27 = u_xlat7.y<(-u_xlat7.y);
			        //AND
			        u_xlat27.x = u_xlatb27 ? -3.14159274 : float(0.0);
			        //ADD
			        u_xlat15.x = u_xlat27.x + u_xlat15.x;
			        //MIN
			        u_xlat27.x = min(u_xlat7.y, u_xlat7.w);
			        //MAX
			        u_xlat39 = max(u_xlat7.y, u_xlat7.w);
			        //LT
			        u_xlatb27 = u_xlat27.x<(-u_xlat27.x);
			        //GE
			        u_xlatb39 = u_xlat39>=(-u_xlat39);
			        //AND
			        u_xlatb27 = u_xlatb39 && u_xlatb27;
			        //MOVC
			        u_xlat15.x = (u_xlatb27) ? (-u_xlat15.x) : u_xlat15.x;
			        //DP2
			        u_xlat27.x = dot(u_xlat7.yw, u_xlat7.yw);
			        //SQRT
			        u_xlat27.x = sqrt(u_xlat27.x);
			        //ADD
			        u_xlat15.x = u_xlat15.x + 0.314159274;
			        //MUL
			        u_xlat39 = u_xlat15.x * 1.5915494;
			        //ROUND_NI
			        u_xlat39 = floor(u_xlat39);
			        //MAD
			        u_xlat15.x = (-u_xlat39) * 0.628318548 + u_xlat15.x;
			        //ADD
			        u_xlat15.x = u_xlat15.x + -0.314159274;
			        //SINCOS
			        u_xlat8.x = sin(u_xlat15.x);
			        u_xlat9.x = cos(u_xlat15.x);
			        //MOV
			        u_xlat9.xz = u_xlat9.xx;
			        //MOV
			        u_xlat9.y = u_xlat8.x;
			        //MUL
			        u_xlat15.xyz = u_xlat27.xxx * u_xlat9.xyz;
			        //MAD
			        u_xlat15.xyz = u_xlat15.xyz * float3(2.0, 2.0, 2.0) + float3(-1.0, -0.0, -1.0);
			        //MUL
			        u_xlat8.xyz = u_xlat15.xyz * float3(0.5, 0.5, 3.0);
			        //SINCOS
			        u_xlat15.x = sin(u_xlat8.z);
			        //MAD
			        u_xlat9.y = u_xlat15.x * 0.100000001 + u_xlat7.z;
			        //ADD
			        u_xlat8.w = abs(u_xlat8.y) + 0.600000024;
			        //DP2
			        u_xlat15.x = dot(u_xlat8.xw, u_xlat8.xw);
			        //SQRT
			        u_xlat9.x = sqrt(u_xlat15.x);
			        //ADD
			        u_xlat15.xy = abs(u_xlat9.xy) + float2(-0.699999988, -0.00999999978);
			        //MAX
			        u_xlat39 = max(u_xlat15.y, u_xlat15.x);
			        //MIN
			        u_xlat39 = min(u_xlat39, 0.0);
			        //MAX
			        u_xlat15.xy = max(u_xlat15.xy, float2(0.0, 0.0));
			        //DP2
			        u_xlat15.x = dot(u_xlat15.xy, u_xlat15.xy);
			        //SQRT
			        u_xlat15.x = sqrt(u_xlat15.x);
			        //ADD
			        u_xlat15.x = u_xlat15.x + u_xlat39;
			        //MOV
			        u_xlat9.zw = u_xlat8.xy;
			        //ADD
			        u_xlat8.xyz = u_xlat9.zyw + float3(-0.0, -0.00999999978, -0.0);
			        //ADD
			        u_xlat8.xyz = abs(u_xlat8.xyz) + float3(-0.449999988, -0.0130000003, -0.00100000005);
			        //MAX
			        u_xlat27.x = max(u_xlat8.z, u_xlat8.y);
			        //MAX
			        u_xlat27.x = max(u_xlat27.x, u_xlat8.x);
			        //MIN
			        u_xlat27.x = min(u_xlat27.x, 0.0);
			        //MAX
			        u_xlat8.xyz = max(u_xlat8.xyz, float3(0.0, 0.0, 0.0));
			        //DP3
			        u_xlat39 = dot(u_xlat8.xyz, u_xlat8.xyz);
			        //SQRT
			        u_xlat39 = sqrt(u_xlat39);
			        //ADD
			        u_xlat27.x = u_xlat39 + u_xlat27.x;
			        //ADD
			        u_xlat39 = (-u_xlat15.x) + u_xlat27.x;
			        //MAD
			        u_xlat39 = u_xlat39 * 10.0 + 0.5;
			        u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
			        //ADD
			        u_xlat15.x = (-u_xlat27.x) + u_xlat15.x;
			        //MAD
			        u_xlat15.x = u_xlat39 * u_xlat15.x + u_xlat27.x;
			        //MUL
			        u_xlat27.x = u_xlat39 * 0.0500000007;
			        //ADD
			        u_xlat39 = (-u_xlat39) + 1.0;
			        //MAD
			        u_xlat15.x = (-u_xlat27.x) * u_xlat39 + u_xlat15.x;
			        //MUL
			        u_xlat27.x = u_xlat7.z * 4.0;
			        //SINCOS
			        u_xlat27.x = sin(u_xlat27.x);
			        //MAD
			        u_xlat27.x = u_xlat27.x * 0.100000001 + u_xlat7.y;
			        //ADD
			        u_xlat8.x = u_xlat27.x + -0.0500000007;
			        //MOV
			        u_xlat8.yw = u_xlat7.wz;
			        //DP2
			        u_xlat27.x = dot(u_xlat8.xy, u_xlat8.xy);
			        //SQRT
			        u_xlat8.z = sqrt(u_xlat27.x);
			        //ADD
			        u_xlat27.xy = abs(u_xlat8.zw) + float2(-0.0399999991, -0.699999988);
			        //MAX
			        u_xlat40 = max(u_xlat27.y, u_xlat27.x);
			        //MIN
			        u_xlat40 = min(u_xlat40, 0.0);
			        //MAX
			        u_xlat27.xy = max(u_xlat27.xy, float2(0.0, 0.0));
			        //DP2
			        u_xlat27.x = dot(u_xlat27.xy, u_xlat27.xy);
			        //SQRT
			        u_xlat27.x = sqrt(u_xlat27.x);
			        //ADD
			        u_xlat27.x = u_xlat27.x + u_xlat40;
			        //ADD
			        u_xlat39 = (-u_xlat15.x) + u_xlat27.x;
			        //MAD
			        u_xlat39 = u_xlat39 * 1.66666663 + 0.5;
			        u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
			        //ADD
			        u_xlat15.x = (-u_xlat27.x) + u_xlat15.x;
			        //MAD
			        u_xlat15.x = u_xlat39 * u_xlat15.x + u_xlat27.x;
			        //MUL
			        u_xlat27.x = u_xlat39 * 0.300000012;
			        //ADD
			        u_xlat39 = (-u_xlat39) + 1.0;
			        //MAD
			        u_xlat15.x = (-u_xlat27.x) * u_xlat39 + u_xlat15.x;
			        //MOV
			        u_xlat27.x = u_xlat6.y;
			        u_xlat27.x = clamp(u_xlat27.x, 0.0, 1.0);
			        //MAD
			        u_xlat39 = u_xlat27.x * -2.0 + 3.0;
			        //MUL
			        u_xlat27.x = u_xlat27.x * u_xlat27.x;
			        //MOV
			        u_xlat7.x = u_xlat7.x;
			        u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
			        //MAD
			        u_xlat40 = u_xlat7.x * -2.0 + 3.0;
			        //MUL
			        u_xlat41 = u_xlat7.x * u_xlat7.x;
			        //MUL
			        u_xlat40 = u_xlat40 * u_xlat41;
			        //MUL
			        u_xlat40 = u_xlat40 * 3.0;
			        //MAD
			        u_xlat27.x = u_xlat39 * u_xlat27.x + (-u_xlat40);
			        //MAD
			        u_xlat27.x = (-u_xlat27.x) * 0.159999996 + 1.0;
			        //MUL
			        u_xlat6.xzw = u_xlat27.xxx * u_xlat6.xyz;
			        //MUL
			        u_xlat27.y = u_xlat6.z * 2.22222233;
			        u_xlat27.y = clamp(u_xlat27.y, 0.0, 1.0);
			        //MAD
			        u_xlat40 = u_xlat27.y * -2.0 + 3.0;
			        //MAD
			        u_xlat27.x = u_xlat6.y * u_xlat27.x + -0.449999988;
			        //MUL
			        u_xlat27.x = u_xlat27.x * 2.22222233;
			        u_xlat27.x = clamp(u_xlat27.x, 0.0, 1.0);
			        //MAD
			        u_xlat41 = u_xlat27.x * -2.0 + 3.0;
			        //MUL
			        u_xlat27.xy = u_xlat27.xy * u_xlat27.xy;
			        //MUL
			        u_xlat27.x = u_xlat27.x * u_xlat41;
			        //MAD
			        u_xlat27.x = u_xlat40 * u_xlat27.y + (-u_xlat27.x);
			        //MAD
			        u_xlat27.x = (-u_xlat27.x) * 0.0700000003 + 1.0;
			        //MUL
			        u_xlat7.xyz = u_xlat27.xxx * u_xlat6.xwz;
			        //MAD
			        u_xlat27.x = u_xlat6.z * u_xlat27.x + 0.600000024;
			        //MUL
			        u_xlat27.x = u_xlat27.x * 1.25;
			        u_xlat27.x = clamp(u_xlat27.x, 0.0, 1.0);
			        //MAD
			        u_xlat39 = u_xlat27.x * -2.0 + 3.0;
			        //MUL
			        u_xlat27.x = u_xlat27.x * u_xlat27.x;
			        //MAD
			        u_xlat27.x = (-u_xlat39) * u_xlat27.x + 1.0;
			        //MAD
			        u_xlat27.x = u_xlat27.x * 0.200000003 + 1.0;
			        //MUL
			        u_xlat7.xy = u_xlat27.xx * u_xlat7.xy;
			        //MUL
			        u_xlat7.w = u_xlat7.z * 0.800000012;
			        //MUL
			        u_xlat6.xyz = u_xlat7.xzy * float3(0.449999988, 0.359999985, 0.449999988);
			        //DP3
			        u_xlat27.x = dot(u_xlat7.xyw, u_xlat7.xyw);
			        //RSQ
			        u_xlat39 = rsqrt(u_xlat27.x);
			        //MUL
			        u_xlat8 = (float4)(u_xlat39) * u_xlat7.xxwy;
			        //MAD
			        u_xlat9.xy = u_xlat7.xz * float2(0.449999988, 0.359999985) + float2(-0.140000001, -0.140000001);
			        //SAMPLE_L
			        u_xlat9 = tex2Dlod(_NoiseTex, float4(u_xlat9.xy, 0.0,1.5));
			        //SAMPLE_L
			        u_xlat10 = tex2Dlod(_NoiseTex, float4(u_xlat6.xz, 0.0,0.0));
			        //SAMPLE_L
			        u_xlat6 = tex2Dlod(_NoiseTex, float4(u_xlat6.yz, 0.0,1.5));
			        //MUL
			        u_xlat40 = abs(u_xlat8.z) * u_xlat10.x;
			        //MAD
			        u_xlat40 = u_xlat9.x * abs(u_xlat8.w) + u_xlat40;
			        //MAD
			        u_xlat40 = u_xlat6.x * abs(u_xlat8.y) + u_xlat40;
			        //SQRT
			        u_xlat27.x = sqrt(u_xlat27.x);
			        //ADD
			        u_xlat27.x = u_xlat27.x + -1.0;
			        //MAD
			        u_xlat27.x = (-u_xlat40) * 0.100000001 + u_xlat27.x;
			        //MIN
			        u_xlat40 = min(abs(u_xlat8.y), abs(u_xlat8.z));
			        //MAX
			        u_xlat41 = max(abs(u_xlat8.y), abs(u_xlat8.z));
			        //DIV
			        u_xlat41 = float(1.0) / u_xlat41;
			        //MUL
			        u_xlat40 = u_xlat40 * u_xlat41;
			        //MUL
			        u_xlat41 = u_xlat40 * u_xlat40;
			        //MAD
			        u_xlat6.x = u_xlat41 * 0.0208350997 + -0.0851330012;
			        //MAD
			        u_xlat6.x = u_xlat41 * u_xlat6.x + 0.180141002;
			        //MAD
			        u_xlat6.x = u_xlat41 * u_xlat6.x + -0.330299497;
			        //MAD
			        u_xlat41 = u_xlat41 * u_xlat6.x + 0.999866009;
			        //MUL
			        u_xlat6.x = u_xlat40 * u_xlat41;
			        //LT
			        u_xlatb18 = abs(u_xlat8.y)<abs(u_xlat8.z);
			        //MAD
			        u_xlat6.x = u_xlat6.x * -2.0 + 1.57079637;
			        //AND
			        u_xlat6.x = u_xlatb18 ? u_xlat6.x : float(0.0);
			        //MAD
			        u_xlat40 = u_xlat40 * u_xlat41 + u_xlat6.x;
			        //LT
			        u_xlatb41 = u_xlat8.y<(-u_xlat8.x);
			        //AND
			        u_xlat41 = u_xlatb41 ? -3.14159274 : float(0.0);
			        //ADD
			        u_xlat40 = u_xlat40 + u_xlat41;
			        //MIN
			        u_xlat41 = min(u_xlat8.y, u_xlat8.z);
			        //MAX
			        u_xlat6.x = max(u_xlat8.y, u_xlat8.z);
			        //LT
			        u_xlatb41 = u_xlat41<(-u_xlat41);
			        //GE
			        u_xlatb6.x = u_xlat6.x>=(-u_xlat6.x);
			        //AND
			        u_xlatb41 = u_xlatb41 && u_xlatb6.x;
			        //MOVC
			        u_xlat40 = (u_xlatb41) ? (-u_xlat40) : u_xlat40;
			        //MIN
			        u_xlat6.x = min(u_xlat40, 3.14159012);
			        //MAD
			        u_xlat40 = (-u_xlat8.w) * u_xlat8.w + 1.0;
			        //MUL
			        u_xlat40 = u_xlat40 * 899.175598;
			        //LOG
			        u_xlat40 = log2(u_xlat40);
			        //MUL
			        u_xlat40 = u_xlat40 * 0.720210016;
			        //ROUND_NI
			        u_xlat40 = floor(u_xlat40);
			        //MAX
			        u_xlat40 = max(u_xlat40, 2.0);
			        //MUL
			        u_xlat40 = u_xlat40 * 0.694241941;
			        //EXP
			        u_xlat40 = exp2(u_xlat40);
			        //MUL
			        u_xlat30.xy = (float2)(u_xlat40) * float2(0.44721359, 0.723606825);
			        //ROUND_NE
			        u_xlat30.xy = round(u_xlat30.xy);
			        //ADD
			        u_xlat8.xy = u_xlat30.yx + float2(1.0, 1.0);
			        //MUL
			        u_xlat32.xy = u_xlat8.xy * float2(0.618034005, 0.618034005);
			        //ROUND_NI
			        u_xlat32.xy = floor(u_xlat32.xy);
			        //MAD
			        u_xlat8.xy = u_xlat8.xy * float2(0.618034005, 0.618034005) + (-u_xlat32.xy);
			        //MAD
			        u_xlat8.xy = u_xlat8.xy * float2(6.28318024, 6.28318024) + float2(-3.88321877, -3.88321877);
			        //MUL
			        u_xlat30.xy = u_xlat30.xy * float2(-0.015625, -0.015625);
			        //MUL
			        u_xlat40 = u_xlat30.x * u_xlat8.x;
			        //MAD
			        u_xlat40 = u_xlat8.y * u_xlat30.y + (-u_xlat40);
			        //MUL
			        u_xlat9.xz = u_xlat30.yx * float2(1.0, -1.0);
			        //MUL
			        u_xlat9.yw = u_xlat8.xy * float2(-1.0, 1.0);
			        //DIV
			        u_xlat8 = u_xlat9 / (float4)(u_xlat40);
			        //MAD
			        u_xlat6.y = u_xlat7.y * u_xlat39 + -0.9921875;
			        //DP2
			        u_xlat40 = dot(u_xlat8.xy, u_xlat6.xy);
			        //DP2
			        u_xlat41 = dot(u_xlat8.zw, u_xlat6.xy);
			        //ROUND_NI
			        u_xlat6.x = floor(u_xlat40);
			        //ROUND_NI
			        u_xlat6.y = floor(u_xlat41);
			        //MOV
			        u_xlat8.x = float(100000.0);
			        //MOV
			        u_xlat8.y = float(0.0);
			        //MOV
			        u_xlat8.z = float(0.0);
			        //MOV
			        u_xlat8.w = float(0.0);
			        //LOOP
			        for(uint u_xlatu_loop_4 = 0u ; u_xlatu_loop_4<4u ; u_xlatu_loop_4++)
			        {
			            //AND
			            u_xlatu41 = u_xlatu_loop_4 & 1u;
			            //USHR
			            u_xlatu31 = u_xlatu_loop_4 >> 1u;
			            //UTOF
			            u_xlat9.x = float(u_xlatu41);
			            //UTOF
			            u_xlat9.y = float(u_xlatu31);
			            //ADD
			            u_xlat9.xy = u_xlat6.xy + u_xlat9.xy;
			            //DP2
			            u_xlat41 = dot(u_xlat30.xy, u_xlat9.xy);
			            //ADD
			            u_xlat41 = u_xlat41 + 0.9921875;
			            //MAX
			            u_xlat31.x = max(u_xlat41, -1.0);
			            //MIN
			            u_xlat31.x = min(u_xlat31.x, 1.0);
			            //MAD
			            u_xlat41 = u_xlat31.x * 2.0 + (-u_xlat41);
			            //MAD
			            u_xlat41 = (-u_xlat41) * 64.0 + 64.0;
			            //ROUND_NI
			            u_xlat41 = floor(u_xlat41);
			            //MUL
			            u_xlat31.x = u_xlat41 * 0.618034005;
			            //ROUND_NI
			            u_xlat31.x = floor(u_xlat31.x);
			            //MAD
			            u_xlat31.x = u_xlat41 * 0.618034005 + (-u_xlat31.x);
			            //MUL
			            u_xlat31.x = u_xlat31.x * 6.28318024;
			            //MAD
			            u_xlat41 = u_xlat41 * 2.0 + 1.0;
			            //MAD
			            u_xlat9.w = (-u_xlat41) * 0.0078125 + 1.0;
			            //MAD
			            u_xlat41 = (-u_xlat9.w) * u_xlat9.w + 1.0;
			            //SQRT
			            u_xlat41 = sqrt(u_xlat41);
			            //SINCOS
			            u_xlat10.x = sin(u_xlat31.x);
			            u_xlat11.x = cos(u_xlat31.x);
			            //MUL
			            u_xlat9.y = u_xlat41 * u_xlat11.x;
			            //MUL
			            u_xlat9.z = u_xlat41 * u_xlat10.x;
			            //MAD
			            u_xlat10.xyz = (-u_xlat7.xwy) * (float3)(u_xlat39) + u_xlat9.yzw;
			            //DP3
			            u_xlat9.x = dot(u_xlat10.xyz, u_xlat10.xyz);
			            //LT
			            u_xlatb41 = u_xlat9.x<u_xlat8.x;
			            //MOVC
			            u_xlat8 = ((bool)(u_xlatb41)) ? u_xlat9 : u_xlat8;
			        //ENDLOOP
			        }
			        //MAD
			        u_xlat6.xyz = (-u_xlat8.yzw) * float3(1.01999998, 1.01999998, 1.01999998) + u_xlat7.xwy;
			        //DP3
			        u_xlat39 = dot(u_xlat6.xyz, u_xlat6.xyz);
			        //SQRT
			        u_xlat39 = sqrt(u_xlat39);
			        //ADD
			        u_xlat39 = u_xlat39 + -0.0599999987;
			        //ADD
			        u_xlat40 = (-u_xlat39) + u_xlat27.x;
			        //MAD
			        u_xlat40 = u_xlat40 * 50.0 + 0.5;
			        u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
			        //ADD
			        u_xlat39 = (-u_xlat27.x) + u_xlat39;
			        //MAD
			        u_xlat39 = u_xlat40 * u_xlat39 + u_xlat27.x;
			        //MUL
			        u_xlat41 = u_xlat40 * 0.00999999978;
			        //ADD
			        u_xlat40 = (-u_xlat40) + 1.0;
			        //MAD
			        u_xlat39 = (-u_xlat41) * u_xlat40 + u_xlat39;
			        //LT
			        u_xlatb40 = u_xlat39<u_xlat27.x;
			        //MOVC
			        u_xlat27.x = (u_xlatb40) ? u_xlat39 : u_xlat27.x;
			        //LT
			        u_xlatb39 = u_xlat15.x<u_xlat27.x;
			        //MOVC
			        u_xlat15.x = (u_xlatb39) ? u_xlat15.x : u_xlat27.x;
			        //MUL
			        u_xlat5.y = u_xlat15.x * 0.300000012;
			    //ELSE
			    } else {
			        //MOV
			        u_xlat5.y = 1.0;
			    //ENDIF
			    }
			    //ADD
			    u_xlat15.xyz = u_xlat0.xyz + u_xlat4.xyz;
			    //MUL
			    u_xlat15.xy = u_xlat15.xy * float2(3.33333325, 3.33333325);
			    //MAD
			    u_xlat16.z = u_xlat15.z * 3.33333325 + (-u_xlat36);
			    //ADD
			    u_xlat36 = u_xlat16.z + 3.0;
			    //MUL
			    u_xlat36 = u_xlat36 * 0.0500000007;
			    //SINCOS
			    u_xlat4.x = sin(u_xlat36);
			    u_xlat6.x = cos(u_xlat36);
			    //MOV
			    u_xlat7.x = (-u_xlat4.x);
			    //MOV
			    u_xlat7.y = u_xlat6.x;
			    //MOV
			    u_xlat7.z = u_xlat4.x;
			    //DP2
			    u_xlat16.x = dot(u_xlat15.xy, u_xlat7.yz);
			    //DP2
			    u_xlat16.y = dot(u_xlat15.xy, u_xlat7.xy);
			    //ADD
			    u_xlat15.xyz = u_xlat16.xyz + float3(3.0, 3.0, 3.0);
			    //MUL
			    u_xlat4.xyz = u_xlat15.xyz * float3(0.166666672, 0.166666672, 0.166666672);
			    //ROUND_NI
			    u_xlat4.xyz = floor(u_xlat4.xyz);
			    //EQ
			    u_xlatb6.xy = ((u_xlat4.xyxx) == (float4(0.0, 0.0, 0.0, 0.0))).xy;
			    //OR
			    u_xlatb36 = u_xlatb6.y || u_xlatb6.x;
			    //IF
			    if(!u_xlatb36){
			        //MAD
			        u_xlat15.xyz = (-u_xlat4.xyz) * float3(6.0, 6.0, 6.0) + u_xlat15.xyz;
			        //ADD
			        u_xlat6.yzw = u_xlat15.xyz + float3(-3.0, -3.0, -3.0);
			        //MAD
			        u_xlat15.xyz = _Time.yyy * float3(1.29999995, 0.800000012, 1.20000005) + u_xlat4.xyz;
			        //SINCOS
			        u_xlat7.x = sin(u_xlat15.x);
			        u_xlat8.x = cos(u_xlat15.x);
			        //MOV
			        u_xlat9.x = (-u_xlat7.x);
			        //MOV
			        u_xlat9.y = u_xlat8.x;
			        //MOV
			        u_xlat9.z = u_xlat7.x;
			        //DP2
			        u_xlat6.x = dot(u_xlat6.yz, u_xlat9.yz);
			        //DP2
			        u_xlat7.x = dot(u_xlat6.yz, u_xlat9.xy);
			        //SINCOS
			        u_xlat8.x = sin(u_xlat15.y);
			        u_xlat9.x = cos(u_xlat15.y);
			        //MOV
			        u_xlat10.x = (-u_xlat8.x);
			        //MOV
			        u_xlat10.y = u_xlat9.x;
			        //MOV
			        u_xlat10.z = u_xlat8.x;
			        //DP2
			        u_xlat8.x = dot(u_xlat6.xw, u_xlat10.yz);
			        //DP2
			        u_xlat7.y = dot(u_xlat6.xw, u_xlat10.xy);
			        //SINCOS
			        u_xlat6.x = sin(u_xlat15.z);
			        u_xlat9.x = cos(u_xlat15.z);
			        //MOV
			        u_xlat10.x = (-u_xlat6.x);
			        //MOV
			        u_xlat10.y = u_xlat9.x;
			        //MOV
			        u_xlat10.z = u_xlat6.x;
			        //DP2
			        u_xlat8.y = dot(u_xlat7.xy, u_xlat10.yz);
			        //DP2
			        u_xlat8.z = dot(u_xlat7.xy, u_xlat10.xy);
			        //ADD
			        u_xlat36 = u_xlat4.x + _Time.y;
			        //SINCOS
			        u_xlat36 = sin(u_xlat36);
			        //MAD
			        u_xlat36 = u_xlat36 * 0.5 + 0.5;
			        //MAD
			        u_xlat36 = u_xlat36 * 0.199999988 + 0.800000012;
			        //MUL
			        u_xlat15.xyz = (float3)(u_xlat36) * u_xlat8.xyz;
			        //MAD
			        u_xlat4 = u_xlat8.yxyz * (float4)(u_xlat36) + float4(-1.0, -0.0, -1.32000005, -0.0);
			        //MIN
			        u_xlat36 = min(abs(u_xlat4.y), abs(u_xlat4.w));
			        //MAX
			        u_xlat41 = max(abs(u_xlat4.y), abs(u_xlat4.w));
			        //DIV
			        u_xlat41 = float(1.0) / u_xlat41;
			        //MUL
			        u_xlat36 = u_xlat36 * u_xlat41;
			        //MUL
			        u_xlat41 = u_xlat36 * u_xlat36;
			        //MAD
			        u_xlat6.x = u_xlat41 * 0.0208350997 + -0.0851330012;
			        //MAD
			        u_xlat6.x = u_xlat41 * u_xlat6.x + 0.180141002;
			        //MAD
			        u_xlat6.x = u_xlat41 * u_xlat6.x + -0.330299497;
			        //MAD
			        u_xlat41 = u_xlat41 * u_xlat6.x + 0.999866009;
			        //MUL
			        u_xlat6.x = u_xlat36 * u_xlat41;
			        //LT
			        u_xlatb18 = abs(u_xlat4.y)<abs(u_xlat4.w);
			        //MAD
			        u_xlat6.x = u_xlat6.x * -2.0 + 1.57079637;
			        //AND
			        u_xlat6.x = u_xlatb18 ? u_xlat6.x : float(0.0);
			        //MAD
			        u_xlat36 = u_xlat36 * u_xlat41 + u_xlat6.x;
			        //LT
			        u_xlatb41 = u_xlat4.y<(-u_xlat4.y);
			        //AND
			        u_xlat41 = u_xlatb41 ? -3.14159274 : float(0.0);
			        //ADD
			        u_xlat36 = u_xlat36 + u_xlat41;
			        //MIN
			        u_xlat41 = min(u_xlat4.y, u_xlat4.w);
			        //MAX
			        u_xlat6.x = max(u_xlat4.y, u_xlat4.w);
			        //LT
			        u_xlatb41 = u_xlat41<(-u_xlat41);
			        //GE
			        u_xlatb6.x = u_xlat6.x>=(-u_xlat6.x);
			        //AND
			        u_xlatb41 = u_xlatb41 && u_xlatb6.x;
			        //MOVC
			        u_xlat36 = (u_xlatb41) ? (-u_xlat36) : u_xlat36;
			        //DP2
			        u_xlat41 = dot(u_xlat4.yw, u_xlat4.yw);
			        //SQRT
			        u_xlat41 = sqrt(u_xlat41);
			        //ADD
			        u_xlat36 = u_xlat36 + 0.314159274;
			        //MUL
			        u_xlat6.x = u_xlat36 * 1.5915494;
			        //ROUND_NI
			        u_xlat6.x = floor(u_xlat6.x);
			        //MAD
			        u_xlat36 = (-u_xlat6.x) * 0.628318548 + u_xlat36;
			        //ADD
			        u_xlat36 = u_xlat36 + -0.314159274;
			        //SINCOS
			        u_xlat6.x = sin(u_xlat36);
			        u_xlat7.x = cos(u_xlat36);
			        //MOV
			        u_xlat7.xz = u_xlat7.xx;
			        //MOV
			        u_xlat7.y = u_xlat6.x;
			        //MUL
			        u_xlat6.xyz = (float3)(u_xlat41) * u_xlat7.xyz;
			        //MAD
			        u_xlat6.xyz = u_xlat6.xyz * float3(2.0, 2.0, 2.0) + float3(-1.0, -0.0, -1.0);
			        //MUL
			        u_xlat6.xyz = u_xlat6.xyz * float3(0.5, 0.5, 3.0);
			        //SINCOS
			        u_xlat36 = sin(u_xlat6.z);
			        //MAD
			        u_xlat7.y = u_xlat36 * 0.100000001 + u_xlat4.z;
			        //ADD
			        u_xlat6.w = abs(u_xlat6.y) + 0.600000024;
			        //DP2
			        u_xlat36 = dot(u_xlat6.xw, u_xlat6.xw);
			        //SQRT
			        u_xlat7.x = sqrt(u_xlat36);
			        //ADD
			        u_xlat30.xy = abs(u_xlat7.xy) + float2(-0.699999988, -0.00999999978);
			        //MAX
			        u_xlat36 = max(u_xlat30.y, u_xlat30.x);
			        //MIN
			        u_xlat36 = min(u_xlat36, 0.0);
			        //MAX
			        u_xlat30.xy = max(u_xlat30.xy, float2(0.0, 0.0));
			        //DP2
			        u_xlat41 = dot(u_xlat30.xy, u_xlat30.xy);
			        //SQRT
			        u_xlat41 = sqrt(u_xlat41);
			        //ADD
			        u_xlat36 = u_xlat36 + u_xlat41;
			        //MOV
			        u_xlat7.zw = u_xlat6.xy;
			        //ADD
			        u_xlat6.xyz = u_xlat7.zyw + float3(-0.0, -0.00999999978, -0.0);
			        //ADD
			        u_xlat6.xyz = abs(u_xlat6.xyz) + float3(-0.449999988, -0.0130000003, -0.00100000005);
			        //MAX
			        u_xlat41 = max(u_xlat6.z, u_xlat6.y);
			        //MAX
			        u_xlat41 = max(u_xlat41, u_xlat6.x);
			        //MIN
			        u_xlat41 = min(u_xlat41, 0.0);
			        //MAX
			        u_xlat6.xyz = max(u_xlat6.xyz, float3(0.0, 0.0, 0.0));
			        //DP3
			        u_xlat6.x = dot(u_xlat6.xyz, u_xlat6.xyz);
			        //SQRT
			        u_xlat6.x = sqrt(u_xlat6.x);
			        //ADD
			        u_xlat41 = u_xlat41 + u_xlat6.x;
			        //ADD
			        u_xlat6.x = (-u_xlat36) + u_xlat41;
			        //MAD
			        u_xlat6.x = u_xlat6.x * 10.0 + 0.5;
			        u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
			        //ADD
			        u_xlat36 = u_xlat36 + (-u_xlat41);
			        //MAD
			        u_xlat36 = u_xlat6.x * u_xlat36 + u_xlat41;
			        //MUL
			        u_xlat41 = u_xlat6.x * 0.0500000007;
			        //ADD
			        u_xlat6.x = (-u_xlat6.x) + 1.0;
			        //MAD
			        u_xlat36 = (-u_xlat41) * u_xlat6.x + u_xlat36;
			        //MUL
			        u_xlat41 = u_xlat4.z * 4.0;
			        //SINCOS
			        u_xlat41 = sin(u_xlat41);
			        //MAD
			        u_xlat16.x = u_xlat41 * 0.100000001 + u_xlat4.y;
			        //ADD
			        u_xlat6.x = u_xlat16.x + -0.0500000007;
			        //MOV
			        u_xlat6.yw = u_xlat4.wz;
			        //DP2
			        u_xlat16.x = dot(u_xlat6.xy, u_xlat6.xy);
			        //SQRT
			        u_xlat6.z = sqrt(u_xlat16.x);
			        //ADD
			        u_xlat16.xy = abs(u_xlat6.zw) + float2(-0.0399999991, -0.699999988);
			        //MAX
			        u_xlat40 = max(u_xlat16.y, u_xlat16.x);
			        //MIN
			        u_xlat40 = min(u_xlat40, 0.0);
			        //MAX
			        u_xlat16.xy = max(u_xlat16.xy, float2(0.0, 0.0));
			        //DP2
			        u_xlat16.x = dot(u_xlat16.xy, u_xlat16.xy);
			        //SQRT
			        u_xlat16.x = sqrt(u_xlat16.x);
			        //ADD
			        u_xlat16.x = u_xlat16.x + u_xlat40;
			        //ADD
			        u_xlat28.x = (-u_xlat36) + u_xlat16.x;
			        //MAD
			        u_xlat28.x = u_xlat28.x * 1.66666663 + 0.5;
			        u_xlat28.x = clamp(u_xlat28.x, 0.0, 1.0);
			        //ADD
			        u_xlat36 = u_xlat36 + (-u_xlat16.x);
			        //MAD
			        u_xlat36 = u_xlat28.x * u_xlat36 + u_xlat16.x;
			        //MUL
			        u_xlat16.x = u_xlat28.x * 0.300000012;
			        //ADD
			        u_xlat28.x = (-u_xlat28.x) + 1.0;
			        //MAD
			        u_xlat36 = (-u_xlat16.x) * u_xlat28.x + u_xlat36;
			        //MOV
			        u_xlat4.y = u_xlat15.y;
			        u_xlat4.y = clamp(u_xlat4.y, 0.0, 1.0);
			        //MAD
			        u_xlat28.x = u_xlat4.y * -2.0 + 3.0;
			        //MOV
			        u_xlat4.x = u_xlat4.x;
			        u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
			        //MAD
			        u_xlat40 = u_xlat4.x * -2.0 + 3.0;
			        //MUL
			        u_xlat4.xy = u_xlat4.xy * u_xlat4.xy;
			        //MUL
			        u_xlat4.x = u_xlat4.x * u_xlat40;
			        //MUL
			        u_xlat4.x = u_xlat4.x * 3.0;
			        //MAD
			        u_xlat4.x = u_xlat28.x * u_xlat4.y + (-u_xlat4.x);
			        //MAD
			        u_xlat4.x = (-u_xlat4.x) * 0.159999996 + 1.0;
			        //MUL
			        u_xlat16.xyz = u_xlat15.xyz * u_xlat4.xxx;
			        //MUL
			        u_xlat15.x = u_xlat16.y * 2.22222233;
			        u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
			        //MAD
			        u_xlat39 = u_xlat15.x * -2.0 + 3.0;
			        //MAD
			        u_xlat27.x = u_xlat15.y * u_xlat4.x + -0.449999988;
			        //MUL
			        u_xlat15.y = u_xlat27.x * 2.22222233;
			        u_xlat15.y = clamp(u_xlat15.y, 0.0, 1.0);
			        //MAD
			        u_xlat4.x = u_xlat15.y * -2.0 + 3.0;
			        //MUL
			        u_xlat15.xy = u_xlat15.xy * u_xlat15.xy;
			        //MUL
			        u_xlat27.x = u_xlat15.y * u_xlat4.x;
			        //MAD
			        u_xlat15.x = u_xlat39 * u_xlat15.x + (-u_xlat27.x);
			        //MAD
			        u_xlat15.x = (-u_xlat15.x) * 0.0700000003 + 1.0;
			        //MUL
			        u_xlat6.xyz = u_xlat15.xxx * u_xlat16.xzy;
			        //MAD
			        u_xlat15.x = u_xlat16.y * u_xlat15.x + 0.600000024;
			        //MUL
			        u_xlat15.x = u_xlat15.x * 1.25;
			        u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
			        //MAD
			        u_xlat27.x = u_xlat15.x * -2.0 + 3.0;
			        //MUL
			        u_xlat15.x = u_xlat15.x * u_xlat15.x;
			        //MAD
			        u_xlat15.x = (-u_xlat27.x) * u_xlat15.x + 1.0;
			        //MAD
			        u_xlat15.x = u_xlat15.x * 0.200000003 + 1.0;
			        //MUL
			        u_xlat6.xy = u_xlat15.xx * u_xlat6.xy;
			        //MUL
			        u_xlat6.w = u_xlat6.z * 0.800000012;
			        //MUL
			        u_xlat15.xyz = u_xlat6.xzy * float3(0.449999988, 0.359999985, 0.449999988);
			        //DP3
			        u_xlat4.x = dot(u_xlat6.xyw, u_xlat6.xyw);
			        //RSQ
			        u_xlat16.x = rsqrt(u_xlat4.x);
			        //MUL
			        u_xlat7 = u_xlat16.xxxx * u_xlat6.xxwy;
			        //MAD
			        u_xlat28.xy = u_xlat6.xz * float2(0.449999988, 0.359999985) + float2(-0.140000001, -0.140000001);
			        //SAMPLE_L
			        u_xlat8 = tex2Dlod(_NoiseTex, float4(u_xlat28.xy, 0.0,1.5));
			        //SAMPLE_L
			        u_xlat9 = tex2Dlod(_NoiseTex, float4(u_xlat15.xz, 0.0,0.0));
			        //SAMPLE_L
			        u_xlat10 = tex2Dlod(_NoiseTex, float4(u_xlat15.yz, 0.0,1.5));
			        //MUL
			        u_xlat15.x = abs(u_xlat7.z) * u_xlat9.x;
			        //MAD
			        u_xlat15.x = u_xlat8.x * abs(u_xlat7.w) + u_xlat15.x;
			        //MAD
			        u_xlat15.x = u_xlat10.x * abs(u_xlat7.y) + u_xlat15.x;
			        //SQRT
			        u_xlat27.x = sqrt(u_xlat4.x);
			        //ADD
			        u_xlat27.x = u_xlat27.x + -1.0;
			        //MAD
			        u_xlat15.x = (-u_xlat15.x) * 0.100000001 + u_xlat27.x;
			        //MIN
			        u_xlat27.x = min(abs(u_xlat7.y), abs(u_xlat7.z));
			        //MAX
			        u_xlat39 = max(abs(u_xlat7.y), abs(u_xlat7.z));
			        //DIV
			        u_xlat39 = float(1.0) / u_xlat39;
			        //MUL
			        u_xlat27.x = u_xlat39 * u_xlat27.x;
			        //MUL
			        u_xlat39 = u_xlat27.x * u_xlat27.x;
			        //MAD
			        u_xlat4.x = u_xlat39 * 0.0208350997 + -0.0851330012;
			        //MAD
			        u_xlat4.x = u_xlat39 * u_xlat4.x + 0.180141002;
			        //MAD
			        u_xlat4.x = u_xlat39 * u_xlat4.x + -0.330299497;
			        //MAD
			        u_xlat39 = u_xlat39 * u_xlat4.x + 0.999866009;
			        //MUL
			        u_xlat4.x = u_xlat39 * u_xlat27.x;
			        //LT
			        u_xlatb28 = abs(u_xlat7.y)<abs(u_xlat7.z);
			        //MAD
			        u_xlat4.x = u_xlat4.x * -2.0 + 1.57079637;
			        //AND
			        u_xlat4.x = u_xlatb28 ? u_xlat4.x : float(0.0);
			        //MAD
			        u_xlat27.x = u_xlat27.x * u_xlat39 + u_xlat4.x;
			        //LT
			        u_xlatb39 = u_xlat7.y<(-u_xlat7.x);
			        //AND
			        u_xlat39 = u_xlatb39 ? -3.14159274 : float(0.0);
			        //ADD
			        u_xlat27.x = u_xlat39 + u_xlat27.x;
			        //MIN
			        u_xlat39 = min(u_xlat7.y, u_xlat7.z);
			        //MAX
			        u_xlat4.x = max(u_xlat7.y, u_xlat7.z);
			        //LT
			        u_xlatb39 = u_xlat39<(-u_xlat39);
			        //GE
			        u_xlatb4.x = u_xlat4.x>=(-u_xlat4.x);
			        //AND
			        u_xlatb39 = u_xlatb39 && u_xlatb4.x;
			        //MOVC
			        u_xlat27.x = (u_xlatb39) ? (-u_xlat27.x) : u_xlat27.x;
			        //MIN
			        u_xlat7.x = min(u_xlat27.x, 3.14159012);
			        //MAD
			        u_xlat27.x = (-u_xlat7.w) * u_xlat7.w + 1.0;
			        //MUL
			        u_xlat27.x = u_xlat27.x * 899.175598;
			        //LOG
			        u_xlat27.x = log2(u_xlat27.x);
			        //MUL
			        u_xlat27.x = u_xlat27.x * 0.720210016;
			        //ROUND_NI
			        u_xlat27.x = floor(u_xlat27.x);
			        //MAX
			        u_xlat27.x = max(u_xlat27.x, 2.0);
			        //MUL
			        u_xlat27.x = u_xlat27.x * 0.694241941;
			        //EXP
			        u_xlat27.x = exp2(u_xlat27.x);
			        //MUL
			        u_xlat27.xy = u_xlat27.xx * float2(0.44721359, 0.723606825);
			        //ROUND_NE
			        u_xlat27.xy = round(u_xlat27.xy);
			        //ADD
			        u_xlat4.xz = u_xlat27.yx + float2(1.0, 1.0);
			        //MUL
			        u_xlat31.xy = u_xlat4.xz * float2(0.618034005, 0.618034005);
			        //ROUND_NI
			        u_xlat31.xy = floor(u_xlat31.xy);
			        //MAD
			        u_xlat4.xz = u_xlat4.xz * float2(0.618034005, 0.618034005) + (-u_xlat31.xy);
			        //MAD
			        u_xlat4.xz = u_xlat4.xz * float2(6.28318024, 6.28318024) + float2(-3.88321877, -3.88321877);
			        //MUL
			        u_xlat27.xy = u_xlat27.xy * float2(-0.015625, -0.015625);
			        //MUL
			        u_xlat40 = u_xlat27.x * u_xlat4.x;
			        //MAD
			        u_xlat40 = u_xlat4.z * u_xlat27.y + (-u_xlat40);
			        //MUL
			        u_xlat8.xz = u_xlat27.yx * float2(1.0, -1.0);
			        //MUL
			        u_xlat8.yw = u_xlat4.xz * float2(-1.0, 1.0);
			        //DIV
			        u_xlat8 = u_xlat8 / (float4)(u_xlat40);
			        //MAD
			        u_xlat7.y = u_xlat6.y * u_xlat16.x + -0.9921875;
			        //DP2
			        u_xlat4.x = dot(u_xlat8.xy, u_xlat7.xy);
			        //DP2
			        u_xlat4.z = dot(u_xlat8.zw, u_xlat7.xy);
			        //ROUND_NI
			        u_xlat7.xy = floor(u_xlat4.xz);
			        //MOV
			        u_xlat8.x = float(100000.0);
			        //MOV
			        u_xlat8.y = float(0.0);
			        //MOV
			        u_xlat8.z = float(0.0);
			        //MOV
			        u_xlat8.w = float(0.0);
			        //LOOP
			        for(uint u_xlatu_loop_5 = 0u ; u_xlatu_loop_5<4u ; u_xlatu_loop_5++)
			        {
			            //AND
			            u_xlatu28.x = u_xlatu_loop_5 & 1u;
			            //USHR
			            u_xlatu28.y = u_xlatu_loop_5 >> 1u;
			            //UTOF
			            u_xlat9.xy = float2(u_xlatu28.xy);
			            //ADD
			            u_xlat28.xy = u_xlat7.xy + u_xlat9.xy;
			            //DP2
			            u_xlat28.x = dot(u_xlat27.xy, u_xlat28.xy);
			            //ADD
			            u_xlat28.x = u_xlat28.x + 0.9921875;
			            //MAX
			            u_xlat40 = max(u_xlat28.x, -1.0);
			            //MIN
			            u_xlat40 = min(u_xlat40, 1.0);
			            //MAD
			            u_xlat28.x = u_xlat40 * 2.0 + (-u_xlat28.x);
			            //MAD
			            u_xlat28.x = (-u_xlat28.x) * 64.0 + 64.0;
			            //ROUND_NI
			            u_xlat28.x = floor(u_xlat28.x);
			            //MUL
			            u_xlat40 = u_xlat28.x * 0.618034005;
			            //ROUND_NI
			            u_xlat40 = floor(u_xlat40);
			            //MAD
			            u_xlat40 = u_xlat28.x * 0.618034005 + (-u_xlat40);
			            //MUL
			            u_xlat40 = u_xlat40 * 6.28318024;
			            //MAD
			            u_xlat28.x = u_xlat28.x * 2.0 + 1.0;
			            //MAD
			            u_xlat9.w = (-u_xlat28.x) * 0.0078125 + 1.0;
			            //MAD
			            u_xlat28.x = (-u_xlat9.w) * u_xlat9.w + 1.0;
			            //SQRT
			            u_xlat28.x = sqrt(u_xlat28.x);
			            //SINCOS
			            u_xlat10.x = sin(u_xlat40);
			            u_xlat11.x = cos(u_xlat40);
			            //MUL
			            u_xlat9.y = u_xlat28.x * u_xlat11.x;
			            //MUL
			            u_xlat9.z = u_xlat28.x * u_xlat10.x;
			            //MAD
			            u_xlat10.xyz = (-u_xlat6.xwy) * u_xlat16.xxx + u_xlat9.yzw;
			            //DP3
			            u_xlat9.x = dot(u_xlat10.xyz, u_xlat10.xyz);
			            //LT
			            u_xlatb28 = u_xlat9.x<u_xlat8.x;
			            //MOVC
			            u_xlat8 = ((bool)(u_xlatb28)) ? u_xlat9 : u_xlat8;
			        //ENDLOOP
			        }
			        //MAD
			        u_xlat4.xyz = (-u_xlat8.yzw) * float3(1.01999998, 1.01999998, 1.01999998) + u_xlat6.xwy;
			        //DP3
			        u_xlat27.x = dot(u_xlat4.xyz, u_xlat4.xyz);
			        //SQRT
			        u_xlat27.x = sqrt(u_xlat27.x);
			        //ADD
			        u_xlat27.x = u_xlat27.x + -0.0599999987;
			        //ADD
			        u_xlat39 = (-u_xlat27.x) + u_xlat15.x;
			        //MAD
			        u_xlat39 = u_xlat39 * 50.0 + 0.5;
			        u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
			        //ADD
			        u_xlat27.x = (-u_xlat15.x) + u_xlat27.x;
			        //MAD
			        u_xlat27.x = u_xlat39 * u_xlat27.x + u_xlat15.x;
			        //MUL
			        u_xlat4.x = u_xlat39 * 0.00999999978;
			        //ADD
			        u_xlat39 = (-u_xlat39) + 1.0;
			        //MAD
			        u_xlat27.x = (-u_xlat4.x) * u_xlat39 + u_xlat27.x;
			        //LT
			        u_xlatb39 = u_xlat27.x<u_xlat15.x;
			        //MOVC
			        u_xlat15.x = (u_xlatb39) ? u_xlat27.x : u_xlat15.x;
			        //LT
			        u_xlatb27 = u_xlat36<u_xlat15.x;
			        //MOVC
			        u_xlat36 = (u_xlatb27) ? u_xlat36 : u_xlat15.x;
			        //MUL
			        u_xlat5.z = u_xlat36 * 0.300000012;
			    //ELSE
			    } else {
			        //MOV
			        u_xlat5.z = 1.0;
			    //ENDIF
			    }
			    //ADD
			    u_xlat3.xyz = u_xlat3.xxx + (-u_xlat5.xyz);
			    //MUL
			    u_xlat4 = u_xlat3.yyyy * unity_ObjectToWorld._m01_m11_m21_m31;
			    //MAD
			    u_xlat4 = unity_ObjectToWorld._m00_m10_m20_m30 * u_xlat3.xxxx + u_xlat4;
			    //MAD
			    u_xlat3 = unity_ObjectToWorld._m02_m12_m22_m32 * u_xlat3.zzzz + u_xlat4;
			    //DP4
			    u_xlat36 = dot(u_xlat3, u_xlat3);
			    //RSQ
			    u_xlat36 = rsqrt(u_xlat36);
			    //MUL
			    u_xlat3.xyz = (float3)(u_xlat36) * u_xlat3.xyz;
			    //MUL
			    u_xlat4.xyz = u_xlat0.yyy * unity_ObjectToWorld._m01_m11_m21_m31.xyz;
			    //MAD
			    u_xlat0.xyw = unity_ObjectToWorld._m00_m10_m20_m30.xyz * u_xlat0.xxx + u_xlat4.xyz;
			    //MAD
			    u_xlat0.xyz = unity_ObjectToWorld._m02_m12_m22_m32.xyz * u_xlat0.zzz + u_xlat0.xyw;
			    //ADD
			    u_xlat0.xyz = u_xlat0.xyz + unity_ObjectToWorld._m03_m13_m23_m33.xyz;
			    //ADD
			    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
			    //DP3
			    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
			    //RSQ
			    u_xlat36 = rsqrt(u_xlat36);
			    //MUL
			    u_xlat0.xyz = (float3)(u_xlat36) * u_xlat0.xyz;
			    //DP3
			    u_xlat0.x = dot(u_xlat0.xyz, u_xlat3.xyz);
			    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
			    //ADD
			    u_xlat0.x = (-u_xlat0.x) + 1.0;
			    //LOG
			    u_xlat0.x = log2(u_xlat0.x);
			    //MUL
			    u_xlat0.x = u_xlat0.x * 1.5;
			    //EXP
			    u_xlat0.x = exp2(u_xlat0.x);
			    //IF
			    if(!u_xlatb38){
			        //MAD
			        u_xlat12.xyz = (-u_xlat2.xyz) * float3(6.0, 6.0, 6.0) + u_xlat13.xyz;
			        //ADD
			        u_xlat3.yzw = u_xlat12.xyz + float3(-3.0, -3.0, -3.0);
			        //MAD
			        u_xlat12.xyz = _Time.yyy * float3(1.29999995, 0.800000012, 1.20000005) + u_xlat2.xyz;
			        //SINCOS
			        u_xlat4.x = sin(u_xlat12.x);
			        u_xlat5.x = cos(u_xlat12.x);
			        //MOV
			        u_xlat6.x = (-u_xlat4.x);
			        //MOV
			        u_xlat6.y = u_xlat5.x;
			        //MOV
			        u_xlat6.z = u_xlat4.x;
			        //DP2
			        u_xlat3.x = dot(u_xlat3.yz, u_xlat6.yz);
			        //DP2
			        u_xlat4.x = dot(u_xlat3.yz, u_xlat6.xy);
			        //SINCOS
			        u_xlat5.x = sin(u_xlat12.y);
			        u_xlat6.x = cos(u_xlat12.y);
			        //MOV
			        u_xlat7.x = (-u_xlat5.x);
			        //MOV
			        u_xlat7.y = u_xlat6.x;
			        //MOV
			        u_xlat7.z = u_xlat5.x;
			        //DP2
			        u_xlat5.x = dot(u_xlat3.xw, u_xlat7.yz);
			        //DP2
			        u_xlat4.y = dot(u_xlat3.xw, u_xlat7.xy);
			        //SINCOS
			        u_xlat3.x = sin(u_xlat12.z);
			        u_xlat6.x = cos(u_xlat12.z);
			        //MOV
			        u_xlat7.x = (-u_xlat3.x);
			        //MOV
			        u_xlat7.y = u_xlat6.x;
			        //MOV
			        u_xlat7.z = u_xlat3.x;
			        //DP2
			        u_xlat5.y = dot(u_xlat4.xy, u_xlat7.yz);
			        //DP2
			        u_xlat5.z = dot(u_xlat4.xy, u_xlat7.xy);
			        //ADD
			        u_xlat12.x = u_xlat2.x + _Time.y;
			        //SINCOS
			        u_xlat12.x = sin(u_xlat12.x);
			        //MAD
			        u_xlat12.x = u_xlat12.x * 0.5 + 0.5;
			        //MAD
			        u_xlat12.x = u_xlat12.x * 0.199999988 + 0.800000012;
			        //MUL
			        u_xlat13.xyz = u_xlat12.xxx * u_xlat5.xyz;
			        //MAD
			        u_xlat2 = u_xlat5.yxyz * u_xlat12.xxxx + float4(-1.0, -0.0, -1.32000005, -0.0);
			        //MIN
			        u_xlat12.x = min(abs(u_xlat2.y), abs(u_xlat2.w));
			        //MAX
			        u_xlat24.x = max(abs(u_xlat2.y), abs(u_xlat2.w));
			        //DIV
			        u_xlat24.x = float(1.0) / u_xlat24.x;
			        //MUL
			        u_xlat12.x = u_xlat24.x * u_xlat12.x;
			        //MUL
			        u_xlat24.x = u_xlat12.x * u_xlat12.x;
			        //MAD
			        u_xlat36 = u_xlat24.x * 0.0208350997 + -0.0851330012;
			        //MAD
			        u_xlat36 = u_xlat24.x * u_xlat36 + 0.180141002;
			        //MAD
			        u_xlat36 = u_xlat24.x * u_xlat36 + -0.330299497;
			        //MAD
			        u_xlat24.x = u_xlat24.x * u_xlat36 + 0.999866009;
			        //MUL
			        u_xlat36 = u_xlat24.x * u_xlat12.x;
			        //LT
			        u_xlatb3.x = abs(u_xlat2.y)<abs(u_xlat2.w);
			        //MAD
			        u_xlat36 = u_xlat36 * -2.0 + 1.57079637;
			        //AND
			        u_xlat36 = u_xlatb3.x ? u_xlat36 : float(0.0);
			        //MAD
			        u_xlat12.x = u_xlat12.x * u_xlat24.x + u_xlat36;
			        //LT
			        u_xlatb24 = u_xlat2.y<(-u_xlat2.y);
			        //AND
			        u_xlat24.x = u_xlatb24 ? -3.14159274 : float(0.0);
			        //ADD
			        u_xlat12.x = u_xlat24.x + u_xlat12.x;
			        //MIN
			        u_xlat24.x = min(u_xlat2.y, u_xlat2.w);
			        //MAX
			        u_xlat36 = max(u_xlat2.y, u_xlat2.w);
			        //LT
			        u_xlatb24 = u_xlat24.x<(-u_xlat24.x);
			        //GE
			        u_xlatb36 = u_xlat36>=(-u_xlat36);
			        //AND
			        u_xlatb24 = u_xlatb36 && u_xlatb24;
			        //MOVC
			        u_xlat12.x = (u_xlatb24) ? (-u_xlat12.x) : u_xlat12.x;
			        //DP2
			        u_xlat24.x = dot(u_xlat2.yw, u_xlat2.yw);
			        //SQRT
			        u_xlat24.x = sqrt(u_xlat24.x);
			        //ADD
			        u_xlat12.x = u_xlat12.x + 0.314159274;
			        //MUL
			        u_xlat36 = u_xlat12.x * 1.5915494;
			        //ROUND_NI
			        u_xlat36 = floor(u_xlat36);
			        //MAD
			        u_xlat12.x = (-u_xlat36) * 0.628318548 + u_xlat12.x;
			        //ADD
			        u_xlat12.x = u_xlat12.x + -0.314159274;
			        //SINCOS
			        u_xlat3.x = sin(u_xlat12.x);
			        u_xlat4.x = cos(u_xlat12.x);
			        //MOV
			        u_xlat4.xz = u_xlat4.xx;
			        //MOV
			        u_xlat4.y = u_xlat3.x;
			        //MUL
			        u_xlat12.xyz = u_xlat24.xxx * u_xlat4.xyz;
			        //MAD
			        u_xlat12.xyz = u_xlat12.xyz * float3(2.0, 2.0, 2.0) + float3(-1.0, -0.0, -1.0);
			        //MUL
			        u_xlat3.xyz = u_xlat12.xyz * float3(0.5, 0.5, 3.0);
			        //SINCOS
			        u_xlat12.x = sin(u_xlat3.z);
			        //MAD
			        u_xlat4.y = u_xlat12.x * 0.100000001 + u_xlat2.z;
			        //ADD
			        u_xlat3.w = abs(u_xlat3.y) + 0.600000024;
			        //DP2
			        u_xlat12.x = dot(u_xlat3.xw, u_xlat3.xw);
			        //SQRT
			        u_xlat4.x = sqrt(u_xlat12.x);
			        //ADD
			        u_xlat12.xy = abs(u_xlat4.xy) + float2(-0.699999988, -0.00999999978);
			        //MAX
			        u_xlat36 = max(u_xlat12.y, u_xlat12.x);
			        //MIN
			        u_xlat36 = min(u_xlat36, 0.0);
			        //MAX
			        u_xlat12.xy = max(u_xlat12.xy, float2(0.0, 0.0));
			        //DP2
			        u_xlat12.x = dot(u_xlat12.xy, u_xlat12.xy);
			        //SQRT
			        u_xlat12.x = sqrt(u_xlat12.x);
			        //ADD
			        u_xlat12.x = u_xlat12.x + u_xlat36;
			        //MOV
			        u_xlat4.zw = u_xlat3.xy;
			        //ADD
			        u_xlat3.xyz = u_xlat4.zyw + float3(-0.0, -0.00999999978, -0.0);
			        //ADD
			        u_xlat3.xyz = abs(u_xlat3.xyz) + float3(-0.449999988, -0.0130000003, -0.00100000005);
			        //MAX
			        u_xlat24.x = max(u_xlat3.z, u_xlat3.y);
			        //MAX
			        u_xlat24.x = max(u_xlat24.x, u_xlat3.x);
			        //MIN
			        u_xlat24.x = min(u_xlat24.x, 0.0);
			        //MAX
			        u_xlat3.xyz = max(u_xlat3.xyz, float3(0.0, 0.0, 0.0));
			        //DP3
			        u_xlat36 = dot(u_xlat3.xyz, u_xlat3.xyz);
			        //SQRT
			        u_xlat36 = sqrt(u_xlat36);
			        //ADD
			        u_xlat24.x = u_xlat36 + u_xlat24.x;
			        //ADD
			        u_xlat36 = (-u_xlat12.x) + u_xlat24.x;
			        //MAD
			        u_xlat36 = u_xlat36 * 10.0 + 0.5;
			        u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
			        //ADD
			        u_xlat12.x = (-u_xlat24.x) + u_xlat12.x;
			        //MAD
			        u_xlat12.x = u_xlat36 * u_xlat12.x + u_xlat24.x;
			        //MUL
			        u_xlat24.x = u_xlat36 * 0.0500000007;
			        //ADD
			        u_xlat36 = (-u_xlat36) + 1.0;
			        //MAD
			        u_xlat12.x = (-u_xlat24.x) * u_xlat36 + u_xlat12.x;
			        //MUL
			        u_xlat24.x = u_xlat2.z * 4.0;
			        //SINCOS
			        u_xlat24.x = sin(u_xlat24.x);
			        //MAD
			        u_xlat24.x = u_xlat24.x * 0.100000001 + u_xlat2.y;
			        //ADD
			        u_xlat3.x = u_xlat24.x + -0.0500000007;
			        //MOV
			        u_xlat3.yw = u_xlat2.wz;
			        //DP2
			        u_xlat24.x = dot(u_xlat3.xy, u_xlat3.xy);
			        //SQRT
			        u_xlat3.z = sqrt(u_xlat24.x);
			        //ADD
			        u_xlat24.xy = abs(u_xlat3.zw) + float2(-0.0399999991, -0.699999988);
			        //MAX
			        u_xlat14.x = max(u_xlat24.y, u_xlat24.x);
			        //MIN
			        u_xlat14.x = min(u_xlat14.x, 0.0);
			        //MAX
			        u_xlat24.xy = max(u_xlat24.xy, float2(0.0, 0.0));
			        //DP2
			        u_xlat24.x = dot(u_xlat24.xy, u_xlat24.xy);
			        //SQRT
			        u_xlat24.x = sqrt(u_xlat24.x);
			        //ADD
			        u_xlat24.x = u_xlat24.x + u_xlat14.x;
			        //ADD
			        u_xlat36 = (-u_xlat12.x) + u_xlat24.x;
			        //MAD
			        u_xlat36 = u_xlat36 * 1.66666663 + 0.5;
			        u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
			        //ADD
			        u_xlat12.x = (-u_xlat24.x) + u_xlat12.x;
			        //MAD
			        u_xlat12.x = u_xlat36 * u_xlat12.x + u_xlat24.x;
			        //MUL
			        u_xlat24.x = u_xlat36 * 0.300000012;
			        //ADD
			        u_xlat36 = (-u_xlat36) + 1.0;
			        //MAD
			        u_xlat12.x = (-u_xlat24.x) * u_xlat36 + u_xlat12.x;
			        //MOV
			        u_xlat24.x = u_xlat13.y;
			        u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
			        //MAD
			        u_xlat36 = u_xlat24.x * -2.0 + 3.0;
			        //MUL
			        u_xlat24.x = u_xlat24.x * u_xlat24.x;
			        //MOV
			        u_xlat2.x = u_xlat2.x;
			        u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
			        //MAD
			        u_xlat14.x = u_xlat2.x * -2.0 + 3.0;
			        //MUL
			        u_xlat2.x = u_xlat2.x * u_xlat2.x;
			        //MUL
			        u_xlat2.x = u_xlat2.x * u_xlat14.x;
			        //MUL
			        u_xlat2.x = u_xlat2.x * 3.0;
			        //MAD
			        u_xlat24.x = u_xlat36 * u_xlat24.x + (-u_xlat2.x);
			        //MAD
			        u_xlat24.x = (-u_xlat24.x) * 0.159999996 + 1.0;
			        //MUL
			        u_xlat2.xyz = u_xlat24.xxx * u_xlat13.xyz;
			        //MUL
			        u_xlat24.y = u_xlat2.y * 2.22222233;
			        u_xlat24.y = clamp(u_xlat24.y, 0.0, 1.0);
			        //MAD
			        u_xlat13.x = u_xlat24.y * -2.0 + 3.0;
			        //MAD
			        u_xlat24.x = u_xlat13.y * u_xlat24.x + -0.449999988;
			        //MUL
			        u_xlat24.x = u_xlat24.x * 2.22222233;
			        u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
			        //MAD
			        u_xlat25 = u_xlat24.x * -2.0 + 3.0;
			        //MUL
			        u_xlat24.xy = u_xlat24.xy * u_xlat24.xy;
			        //MUL
			        u_xlat24.x = u_xlat24.x * u_xlat25;
			        //MAD
			        u_xlat24.x = u_xlat13.x * u_xlat24.y + (-u_xlat24.x);
			        //MAD
			        u_xlat24.x = (-u_xlat24.x) * 0.0700000003 + 1.0;
			        //MUL
			        u_xlat3.xyz = u_xlat24.xxx * u_xlat2.xzy;
			        //MAD
			        u_xlat24.x = u_xlat2.y * u_xlat24.x + 0.600000024;
			        //MUL
			        u_xlat24.x = u_xlat24.x * 1.25;
			        u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
			        //MAD
			        u_xlat36 = u_xlat24.x * -2.0 + 3.0;
			        //MUL
			        u_xlat24.x = u_xlat24.x * u_xlat24.x;
			        //MAD
			        u_xlat24.x = (-u_xlat36) * u_xlat24.x + 1.0;
			        //MAD
			        u_xlat24.x = u_xlat24.x * 0.200000003 + 1.0;
			        //MUL
			        u_xlat3.xy = u_xlat24.xx * u_xlat3.xy;
			        //MUL
			        u_xlat3.w = u_xlat3.z * 0.800000012;
			        //MUL
			        u_xlat13.xyz = u_xlat3.xzy * float3(0.449999988, 0.359999985, 0.449999988);
			        //DP3
			        u_xlat24.x = dot(u_xlat3.xyw, u_xlat3.xyw);
			        //RSQ
			        u_xlat36 = rsqrt(u_xlat24.x);
			        //MUL
			        u_xlat2 = (float4)(u_xlat36) * u_xlat3.xxwy;
			        //MAD
			        u_xlat4.xy = u_xlat3.xz * float2(0.449999988, 0.359999985) + float2(-0.140000001, -0.140000001);
			        //SAMPLE_L
			        u_xlat4 = tex2Dlod(_NoiseTex, float4(u_xlat4.xy, 0.0,1.5));
			        //SAMPLE_L
			        u_xlat5 = tex2Dlod(_NoiseTex, float4(u_xlat13.xz, 0.0,0.0));
			        //SAMPLE_L
			        u_xlat6 = tex2Dlod(_NoiseTex, float4(u_xlat13.yz, 0.0,1.5));
			        //MUL
			        u_xlat13.x = abs(u_xlat2.z) * u_xlat5.x;
			        //MAD
			        u_xlat13.x = u_xlat4.x * abs(u_xlat2.w) + u_xlat13.x;
			        //MAD
			        u_xlat13.x = u_xlat6.x * abs(u_xlat2.y) + u_xlat13.x;
			        //SQRT
			        u_xlat24.x = sqrt(u_xlat24.x);
			        //ADD
			        u_xlat24.x = u_xlat24.x + -1.0;
			        //MAD
			        u_xlat28.y = (-u_xlat13.x) * 0.100000001 + u_xlat24.x;
			        //MIN
			        u_xlat24.x = min(abs(u_xlat2.y), abs(u_xlat2.z));
			        //MAX
			        u_xlat13.x = max(abs(u_xlat2.y), abs(u_xlat2.z));
			        //DIV
			        u_xlat13.x = float(1.0) / u_xlat13.x;
			        //MUL
			        u_xlat24.x = u_xlat24.x * u_xlat13.x;
			        //MUL
			        u_xlat13.x = u_xlat24.x * u_xlat24.x;
			        //MAD
			        u_xlat25 = u_xlat13.x * 0.0208350997 + -0.0851330012;
			        //MAD
			        u_xlat25 = u_xlat13.x * u_xlat25 + 0.180141002;
			        //MAD
			        u_xlat25 = u_xlat13.x * u_xlat25 + -0.330299497;
			        //MAD
			        u_xlat13.x = u_xlat13.x * u_xlat25 + 0.999866009;
			        //MUL
			        u_xlat25 = u_xlat24.x * u_xlat13.x;
			        //LT
			        u_xlatb37 = abs(u_xlat2.y)<abs(u_xlat2.z);
			        //MAD
			        u_xlat25 = u_xlat25 * -2.0 + 1.57079637;
			        //AND
			        u_xlat25 = u_xlatb37 ? u_xlat25 : float(0.0);
			        //MAD
			        u_xlat24.x = u_xlat24.x * u_xlat13.x + u_xlat25;
			        //LT
			        u_xlatb13 = u_xlat2.y<(-u_xlat2.x);
			        //AND
			        u_xlat13.x = u_xlatb13 ? -3.14159274 : float(0.0);
			        //ADD
			        u_xlat24.x = u_xlat24.x + u_xlat13.x;
			        //MIN
			        u_xlat13.x = min(u_xlat2.y, u_xlat2.z);
			        //MAX
			        u_xlat25 = max(u_xlat2.y, u_xlat2.z);
			        //LT
			        u_xlatb13 = u_xlat13.x<(-u_xlat13.x);
			        //GE
			        u_xlatb25 = u_xlat25>=(-u_xlat25);
			        //AND
			        u_xlatb13 = u_xlatb25 && u_xlatb13;
			        //MOVC
			        u_xlat24.x = (u_xlatb13) ? (-u_xlat24.x) : u_xlat24.x;
			        //MIN
			        u_xlat2.x = min(u_xlat24.x, 3.14159012);
			        //MAD
			        u_xlat24.x = (-u_xlat2.w) * u_xlat2.w + 1.0;
			        //MUL
			        u_xlat24.x = u_xlat24.x * 899.175598;
			        //LOG
			        u_xlat24.x = log2(u_xlat24.x);
			        //MUL
			        u_xlat24.x = u_xlat24.x * 0.720210016;
			        //ROUND_NI
			        u_xlat24.x = floor(u_xlat24.x);
			        //MAX
			        u_xlat24.x = max(u_xlat24.x, 2.0);
			        //MUL
			        u_xlat24.x = u_xlat24.x * 0.694241941;
			        //EXP
			        u_xlat24.x = exp2(u_xlat24.x);
			        //MUL
			        u_xlat13.xy = u_xlat24.xx * float2(0.44721359, 0.723606825);
			        //ROUND_NE
			        u_xlat13.xy = round(u_xlat13.xy);
			        //ADD
			        u_xlat26.xy = u_xlat13.yx + float2(1.0, 1.0);
			        //MUL
			        u_xlat5.xy = u_xlat26.xy * float2(0.618034005, 0.618034005);
			        //ROUND_NI
			        u_xlat5.xy = floor(u_xlat5.xy);
			        //MAD
			        u_xlat26.xy = u_xlat26.xy * float2(0.618034005, 0.618034005) + (-u_xlat5.xy);
			        //MAD
			        u_xlat26.xy = u_xlat26.xy * float2(6.28318024, 6.28318024) + float2(-3.88321877, -3.88321877);
			        //MUL
			        u_xlat13.xy = u_xlat13.xy * float2(-0.015625, -0.015625);
			        //MUL
			        u_xlat24.x = u_xlat13.x * u_xlat26.x;
			        //MAD
			        u_xlat24.x = u_xlat26.y * u_xlat13.y + (-u_xlat24.x);
			        //MUL
			        u_xlat5.xz = u_xlat13.yx * float2(1.0, -1.0);
			        //MUL
			        u_xlat5.yw = u_xlat26.xy * float2(-1.0, 1.0);
			        //DIV
			        u_xlat5 = u_xlat5 / u_xlat24.xxxx;
			        //MAD
			        u_xlat2.y = u_xlat3.y * u_xlat36 + -0.9921875;
			        //DP2
			        u_xlat24.x = dot(u_xlat5.xy, u_xlat2.xy);
			        //DP2
			        u_xlat37 = dot(u_xlat5.zw, u_xlat2.xy);
			        //ROUND_NI
			        u_xlat2.x = floor(u_xlat24.x);
			        //ROUND_NI
			        u_xlat2.y = floor(u_xlat37);
			        //MOV
			        u_xlat5.x = float(100000.0);
			        //MOV
			        u_xlat5.y = float(0.0);
			        //MOV
			        u_xlat5.z = float(0.0);
			        //MOV
			        u_xlat5.w = float(0.0);
			        //LOOP
			        for(uint u_xlatu_loop_6 = 0u ; u_xlatu_loop_6<4u ; u_xlatu_loop_6++)
			        {
			            //AND
			            u_xlatu37 = u_xlatu_loop_6 & 1u;
			            //USHR
			            u_xlatu26 = u_xlatu_loop_6 >> 1u;
			            //UTOF
			            u_xlat6.x = float(u_xlatu37);
			            //UTOF
			            u_xlat6.y = float(u_xlatu26);
			            //ADD
			            u_xlat26.xy = u_xlat2.xy + u_xlat6.xy;
			            //DP2
			            u_xlat37 = dot(u_xlat13.xy, u_xlat26.xy);
			            //ADD
			            u_xlat37 = u_xlat37 + 0.9921875;
			            //MAX
			            u_xlat26.x = max(u_xlat37, -1.0);
			            //MIN
			            u_xlat26.x = min(u_xlat26.x, 1.0);
			            //MAD
			            u_xlat37 = u_xlat26.x * 2.0 + (-u_xlat37);
			            //MAD
			            u_xlat37 = (-u_xlat37) * 64.0 + 64.0;
			            //ROUND_NI
			            u_xlat37 = floor(u_xlat37);
			            //MUL
			            u_xlat26.x = u_xlat37 * 0.618034005;
			            //ROUND_NI
			            u_xlat26.x = floor(u_xlat26.x);
			            //MAD
			            u_xlat26.x = u_xlat37 * 0.618034005 + (-u_xlat26.x);
			            //MUL
			            u_xlat26.x = u_xlat26.x * 6.28318024;
			            //MAD
			            u_xlat37 = u_xlat37 * 2.0 + 1.0;
			            //MAD
			            u_xlat6.w = (-u_xlat37) * 0.0078125 + 1.0;
			            //MAD
			            u_xlat37 = (-u_xlat6.w) * u_xlat6.w + 1.0;
			            //SQRT
			            u_xlat37 = sqrt(u_xlat37);
			            //SINCOS
			            u_xlat7.x = sin(u_xlat26.x);
			            u_xlat8.x = cos(u_xlat26.x);
			            //MUL
			            u_xlat6.y = u_xlat37 * u_xlat8.x;
			            //MUL
			            u_xlat6.z = u_xlat37 * u_xlat7.x;
			            //MAD
			            u_xlat7.xyz = (-u_xlat3.xwy) * (float3)(u_xlat36) + u_xlat6.yzw;
			            //DP3
			            u_xlat6.x = dot(u_xlat7.xyz, u_xlat7.xyz);
			            //LT
			            u_xlatb37 = u_xlat6.x<u_xlat5.x;
			            //MOVC
			            u_xlat5 = ((bool)(u_xlatb37)) ? u_xlat6 : u_xlat5;
			        //ENDLOOP
			        }
			        //MAD
			        u_xlat13.xyz = (-u_xlat5.yzw) * float3(1.01999998, 1.01999998, 1.01999998) + u_xlat3.xwy;
			        //DP3
			        u_xlat24.x = dot(u_xlat13.xyz, u_xlat13.xyz);
			        //SQRT
			        u_xlat24.x = sqrt(u_xlat24.x);
			        //ADD
			        u_xlat24.x = u_xlat24.x + -0.0599999987;
			        //ADD
			        u_xlat36 = (-u_xlat24.x) + u_xlat28.y;
			        //MAD
			        u_xlat36 = u_xlat36 * 50.0 + 0.5;
			        u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
			        //ADD
			        u_xlat24.x = (-u_xlat28.y) + u_xlat24.x;
			        //MAD
			        u_xlat24.x = u_xlat36 * u_xlat24.x + u_xlat28.y;
			        //MUL
			        u_xlat13.x = u_xlat36 * 0.00999999978;
			        //ADD
			        u_xlat36 = (-u_xlat36) + 1.0;
			        //MAD
			        u_xlat4.y = (-u_xlat13.x) * u_xlat36 + u_xlat24.x;
			        //LT
			        u_xlatb24 = u_xlat4.y<u_xlat28.y;
			        //MOV
			        u_xlat4.x = float(1.0);
			        //MOV
			        u_xlat28.x = float(0.0);
			        //MOVC
			        u_xlat24.xy = ((bool)(u_xlatb24)) ? u_xlat4.xy : u_xlat28.xy;
			        //LT
			        u_xlatb12 = u_xlat12.x<u_xlat24.y;
			        //MOVC
			        u_xlat12.x = (u_xlatb12) ? 2.0 : u_xlat24.x;
			    //ELSE
			    } else {
			        //MOV
			        u_xlat12.x = 0.0;
			    //ENDIF
			    }
			    //LT
			    u_xlatb24 = u_xlat12.x<1.0;
			    //LT
			    u_xlatb12 = 1.10000002<u_xlat12.x;
			    //MOVC
			    u_xlat13.xyz = ((bool)(u_xlatb24)) ? float3(0.328000009, 0.0219999999, 0.0108000003) : float3(0.0500000007, 0.150000006, 0.0);
			    //OR
			    u_xlatb12 = u_xlatb12 || u_xlatb24;
			    //MOVC
			    u_xlat12.xyz = ((bool)(u_xlatb12)) ? u_xlat13.xyz : float3(0.00999999978, 0.00999999978, 0.00999999978);
			    //MUL
			    u_xlat12.xyz = u_xlat1.xxx * u_xlat12.xyz;
			    //ADD
			    u_xlat0.x = u_xlat0.x + 1.0;
			    //MUL
			    fragmentOut.SV_Target0.xyz = u_xlat0.xxx * u_xlat12.xyz;
			    //MOV
			    fragmentOut.SV_Target0.w = 1.0;
			    //RET
			    return fragmentOut;
			}
			#endif
			#if (UNITY_SINGLE_PASS_STEREO) && !(STEREO_INSTANCING_ON)
			#pragma target 4.0
					
			
			#ifndef _Iterations_DEFINED
			#define _Iterations_DEFINED
			uniform float _Iterations;
			#endif
			#ifndef _MaxDist_DEFINED
			#define _MaxDist_DEFINED
			uniform float _MaxDist;
			#endif
			#ifndef _Epsilon_DEFINED
			#define _Epsilon_DEFINED
			uniform float _Epsilon;
			#endif
			#ifndef _NoiseTex_DEFINED
			#define _NoiseTex_DEFINED
			uniform sampler2D _NoiseTex;
			#endif
			struct FragmentIn
			{
			    float3 vs_TEXCOORD1 : TEXCOORD1;
			    float3 vs_TEXCOORD2 : TEXCOORD2;
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
			FragmentOut frag(FRAGMENT_INPUT fragmentIn, uint gl_FrontFacing : SV_IsFrontFace0)
			{
			    FragmentOut fragmentOut = (FragmentOut)0;
			    UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(fragmentIn);
			    //--- Start Early Main ---
			    float4 u_xlat0;
			    float3 u_xlat1;
			    float4 u_xlat2;
			    int u_xlati2;
			    float4 u_xlat3;
			    uint u_xlatu3;
			    bool2 u_xlatb3;
			    float4 u_xlat4;
			    uint u_xlatu4;
			    bool2 u_xlatb4;
			    float4 u_xlat5;
			    uint2 u_xlatu5;
			    bool u_xlatb5;
			    float4 u_xlat6;
			    bool2 u_xlatb6;
			    float4 u_xlat7;
			    bool2 u_xlatb7;
			    float4 u_xlat8;
			    float4 u_xlat9;
			    float4 u_xlat10;
			    float3 u_xlat11;
			    float3 u_xlat12;
			    bool u_xlatb12;
			    float3 u_xlat13;
			    bool u_xlatb13;
			    float3 u_xlat14;
			    bool u_xlatb14;
			    float3 u_xlat15;
			    uint u_xlatu15;
			    bool u_xlatb15;
			    float3 u_xlat16;
			    float3 u_xlat17;
			    bool u_xlatb17;
			    float3 u_xlat18;
			    bool u_xlatb18;
			    float2 u_xlat24;
			    uint u_xlatu24;
			    bool u_xlatb24;
			    float u_xlat25;
			    bool u_xlatb25;
			    float2 u_xlat26;
			    uint u_xlatu26;
			    bool u_xlatb26;
			    float2 u_xlat27;
			    bool u_xlatb27;
			    float2 u_xlat28;
			    uint2 u_xlatu28;
			    bool u_xlatb28;
			    float2 u_xlat29;
			    bool u_xlatb29;
			    float2 u_xlat30;
			    float2 u_xlat31;
			    uint u_xlatu31;
			    float2 u_xlat32;
			    float u_xlat36;
			    int u_xlati36;
			    bool u_xlatb36;
			    float u_xlat37;
			    uint u_xlatu37;
			    bool u_xlatb37;
			    float u_xlat38;
			    bool u_xlatb38;
			    float u_xlat39;
			    bool u_xlatb39;
			    float u_xlat40;
			    uint u_xlatu40;
			    bool u_xlatb40;
			    float u_xlat41;
			    uint u_xlatu41;
			    bool u_xlatb41;
			    //--- End Early Main ---
			    //ADD
			    u_xlat0.xyz = (-fragmentIn.vs_TEXCOORD1.xyz) + fragmentIn.vs_TEXCOORD2.xyz;
			    //DP3
			    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
			    //RSQ
			    u_xlat36 = rsqrt(u_xlat36);
			    //MUL
			    u_xlat0.xyz = (float3)(u_xlat36) * u_xlat0.xyz;
			    //MOVC
			    u_xlat1.xyz = (gl_FrontFacing != uint(0)) ? fragmentIn.vs_TEXCOORD2.xyz : fragmentIn.vs_TEXCOORD1.xyz;
			    //MUL
			    u_xlat36 = _Time.y * 10.0;
			    //MOV
			    u_xlat37 = 0.0;
			    //MOV
			    u_xlati2 = 0;
			    //LOOP
			    while(true){
			        //ITOF
			        u_xlat14.x = float(u_xlati2);
			        //GE
			        u_xlatb14 = u_xlat14.x>=_Iterations;
			        //BREAKC
			        if(u_xlatb14){break;}
			        //MAD
			        u_xlat14.xyz = u_xlat0.xyz * (float3)(u_xlat37) + u_xlat1.xyz;
			        //MAD
			        u_xlat15.z = u_xlat14.z * 3.33333325 + (-u_xlat36);
			        //ADD
			        u_xlat14.z = u_xlat15.z + 3.0;
			        //MUL
			        u_xlat14.xyz = u_xlat14.xyz * float3(3.33333325, 3.33333325, 0.0500000007);
			        //SINCOS
			        u_xlat3.x = sin(u_xlat14.z);
			        u_xlat4.x = cos(u_xlat14.z);
			        //MOV
			        u_xlat5.x = (-u_xlat3.x);
			        //MOV
			        u_xlat5.y = u_xlat4.x;
			        //MOV
			        u_xlat5.z = u_xlat3.x;
			        //DP2
			        u_xlat15.x = dot(u_xlat14.xy, u_xlat5.yz);
			        //DP2
			        u_xlat15.y = dot(u_xlat14.xy, u_xlat5.xy);
			        //ADD
			        u_xlat14.xyz = u_xlat15.xyz + float3(3.0, 3.0, 3.0);
			        //MUL
			        u_xlat3.xyz = u_xlat14.xyz * float3(0.166666672, 0.166666672, 0.166666672);
			        //ROUND_NI
			        u_xlat3.xyz = floor(u_xlat3.xyz);
			        //EQ
			        u_xlatb4.xy = ((u_xlat3.xyxx) == (float4(0.0, 0.0, 0.0, 0.0))).xy;
			        //OR
			        u_xlatb39 = u_xlatb4.y || u_xlatb4.x;
			        //IF
			        if(!u_xlatb39){
			            //MAD
			            u_xlat14.xyz = (-u_xlat3.xyz) * float3(6.0, 6.0, 6.0) + u_xlat14.xyz;
			            //ADD
			            u_xlat4.yzw = u_xlat14.xyz + float3(-3.0, -3.0, -3.0);
			            //MAD
			            u_xlat14.xyz = _Time.yyy * float3(1.29999995, 0.800000012, 1.20000005) + u_xlat3.xyz;
			            //SINCOS
			            u_xlat5.x = sin(u_xlat14.x);
			            u_xlat6.x = cos(u_xlat14.x);
			            //MOV
			            u_xlat7.x = (-u_xlat5.x);
			            //MOV
			            u_xlat7.y = u_xlat6.x;
			            //MOV
			            u_xlat7.z = u_xlat5.x;
			            //DP2
			            u_xlat4.x = dot(u_xlat4.yz, u_xlat7.yz);
			            //DP2
			            u_xlat5.x = dot(u_xlat4.yz, u_xlat7.xy);
			            //SINCOS
			            u_xlat6.x = sin(u_xlat14.y);
			            u_xlat7.x = cos(u_xlat14.y);
			            //MOV
			            u_xlat8.x = (-u_xlat6.x);
			            //MOV
			            u_xlat8.y = u_xlat7.x;
			            //MOV
			            u_xlat8.z = u_xlat6.x;
			            //DP2
			            u_xlat6.x = dot(u_xlat4.xw, u_xlat8.yz);
			            //DP2
			            u_xlat5.y = dot(u_xlat4.xw, u_xlat8.xy);
			            //SINCOS
			            u_xlat4.x = sin(u_xlat14.z);
			            u_xlat7.x = cos(u_xlat14.z);
			            //MOV
			            u_xlat8.x = (-u_xlat4.x);
			            //MOV
			            u_xlat8.y = u_xlat7.x;
			            //MOV
			            u_xlat8.z = u_xlat4.x;
			            //DP2
			            u_xlat6.y = dot(u_xlat5.xy, u_xlat8.yz);
			            //DP2
			            u_xlat6.z = dot(u_xlat5.xy, u_xlat8.xy);
			            //ADD
			            u_xlat14.x = u_xlat3.x + _Time.y;
			            //SINCOS
			            u_xlat14.x = sin(u_xlat14.x);
			            //MAD
			            u_xlat14.x = u_xlat14.x * 0.5 + 0.5;
			            //MAD
			            u_xlat14.x = u_xlat14.x * 0.199999988 + 0.800000012;
			            //MUL
			            u_xlat3.xyz = u_xlat14.xxx * u_xlat6.xyz;
			            //MAD
			            u_xlat4 = u_xlat6.yxyz * u_xlat14.xxxx + float4(-1.0, -0.0, -1.32000005, -0.0);
			            //MIN
			            u_xlat14.x = min(abs(u_xlat4.y), abs(u_xlat4.w));
			            //MAX
			            u_xlat26.x = max(abs(u_xlat4.y), abs(u_xlat4.w));
			            //DIV
			            u_xlat26.x = float(1.0) / u_xlat26.x;
			            //MUL
			            u_xlat14.x = u_xlat26.x * u_xlat14.x;
			            //MUL
			            u_xlat26.x = u_xlat14.x * u_xlat14.x;
			            //MAD
			            u_xlat38 = u_xlat26.x * 0.0208350997 + -0.0851330012;
			            //MAD
			            u_xlat38 = u_xlat26.x * u_xlat38 + 0.180141002;
			            //MAD
			            u_xlat38 = u_xlat26.x * u_xlat38 + -0.330299497;
			            //MAD
			            u_xlat26.x = u_xlat26.x * u_xlat38 + 0.999866009;
			            //MUL
			            u_xlat38 = u_xlat26.x * u_xlat14.x;
			            //LT
			            u_xlatb39 = abs(u_xlat4.y)<abs(u_xlat4.w);
			            //MAD
			            u_xlat38 = u_xlat38 * -2.0 + 1.57079637;
			            //AND
			            u_xlat38 = u_xlatb39 ? u_xlat38 : float(0.0);
			            //MAD
			            u_xlat14.x = u_xlat14.x * u_xlat26.x + u_xlat38;
			            //LT
			            u_xlatb26 = u_xlat4.y<(-u_xlat4.y);
			            //AND
			            u_xlat26.x = u_xlatb26 ? -3.14159274 : float(0.0);
			            //ADD
			            u_xlat14.x = u_xlat26.x + u_xlat14.x;
			            //MIN
			            u_xlat26.x = min(u_xlat4.y, u_xlat4.w);
			            //MAX
			            u_xlat38 = max(u_xlat4.y, u_xlat4.w);
			            //LT
			            u_xlatb26 = u_xlat26.x<(-u_xlat26.x);
			            //GE
			            u_xlatb38 = u_xlat38>=(-u_xlat38);
			            //AND
			            u_xlatb26 = u_xlatb38 && u_xlatb26;
			            //MOVC
			            u_xlat14.x = (u_xlatb26) ? (-u_xlat14.x) : u_xlat14.x;
			            //DP2
			            u_xlat26.x = dot(u_xlat4.yw, u_xlat4.yw);
			            //SQRT
			            u_xlat26.x = sqrt(u_xlat26.x);
			            //ADD
			            u_xlat14.x = u_xlat14.x + 0.314159274;
			            //MUL
			            u_xlat38 = u_xlat14.x * 1.5915494;
			            //ROUND_NI
			            u_xlat38 = floor(u_xlat38);
			            //MAD
			            u_xlat14.x = (-u_xlat38) * 0.628318548 + u_xlat14.x;
			            //ADD
			            u_xlat14.x = u_xlat14.x + -0.314159274;
			            //SINCOS
			            u_xlat5.x = sin(u_xlat14.x);
			            u_xlat6.x = cos(u_xlat14.x);
			            //MOV
			            u_xlat6.xz = u_xlat6.xx;
			            //MOV
			            u_xlat6.y = u_xlat5.x;
			            //MUL
			            u_xlat14.xyz = u_xlat26.xxx * u_xlat6.xyz;
			            //MAD
			            u_xlat14.xyz = u_xlat14.xyz * float3(2.0, 2.0, 2.0) + float3(-1.0, -0.0, -1.0);
			            //MUL
			            u_xlat5.xyz = u_xlat14.xyz * float3(0.5, 0.5, 3.0);
			            //SINCOS
			            u_xlat14.x = sin(u_xlat5.z);
			            //MAD
			            u_xlat6.y = u_xlat14.x * 0.100000001 + u_xlat4.z;
			            //ADD
			            u_xlat5.w = abs(u_xlat5.y) + 0.600000024;
			            //DP2
			            u_xlat14.x = dot(u_xlat5.xw, u_xlat5.xw);
			            //SQRT
			            u_xlat6.x = sqrt(u_xlat14.x);
			            //ADD
			            u_xlat14.xy = abs(u_xlat6.xy) + float2(-0.699999988, -0.00999999978);
			            //MAX
			            u_xlat38 = max(u_xlat14.y, u_xlat14.x);
			            //MIN
			            u_xlat38 = min(u_xlat38, 0.0);
			            //MAX
			            u_xlat14.xy = max(u_xlat14.xy, float2(0.0, 0.0));
			            //DP2
			            u_xlat14.x = dot(u_xlat14.xy, u_xlat14.xy);
			            //SQRT
			            u_xlat14.x = sqrt(u_xlat14.x);
			            //ADD
			            u_xlat14.x = u_xlat14.x + u_xlat38;
			            //MOV
			            u_xlat6.zw = u_xlat5.xy;
			            //ADD
			            u_xlat5.xyz = u_xlat6.zyw + float3(-0.0, -0.00999999978, -0.0);
			            //ADD
			            u_xlat5.xyz = abs(u_xlat5.xyz) + float3(-0.449999988, -0.0130000003, -0.00100000005);
			            //MAX
			            u_xlat26.x = max(u_xlat5.z, u_xlat5.y);
			            //MAX
			            u_xlat26.x = max(u_xlat26.x, u_xlat5.x);
			            //MIN
			            u_xlat26.x = min(u_xlat26.x, 0.0);
			            //MAX
			            u_xlat5.xyz = max(u_xlat5.xyz, float3(0.0, 0.0, 0.0));
			            //DP3
			            u_xlat38 = dot(u_xlat5.xyz, u_xlat5.xyz);
			            //SQRT
			            u_xlat38 = sqrt(u_xlat38);
			            //ADD
			            u_xlat26.x = u_xlat38 + u_xlat26.x;
			            //ADD
			            u_xlat38 = (-u_xlat14.x) + u_xlat26.x;
			            //MAD
			            u_xlat38 = u_xlat38 * 10.0 + 0.5;
			            u_xlat38 = clamp(u_xlat38, 0.0, 1.0);
			            //ADD
			            u_xlat14.x = (-u_xlat26.x) + u_xlat14.x;
			            //MAD
			            u_xlat14.x = u_xlat38 * u_xlat14.x + u_xlat26.x;
			            //MUL
			            u_xlat26.x = u_xlat38 * 0.0500000007;
			            //ADD
			            u_xlat38 = (-u_xlat38) + 1.0;
			            //MAD
			            u_xlat14.x = (-u_xlat26.x) * u_xlat38 + u_xlat14.x;
			            //MUL
			            u_xlat26.x = u_xlat4.z * 4.0;
			            //SINCOS
			            u_xlat26.x = sin(u_xlat26.x);
			            //MAD
			            u_xlat26.x = u_xlat26.x * 0.100000001 + u_xlat4.y;
			            //ADD
			            u_xlat5.x = u_xlat26.x + -0.0500000007;
			            //MOV
			            u_xlat5.yw = u_xlat4.wz;
			            //DP2
			            u_xlat26.x = dot(u_xlat5.xy, u_xlat5.xy);
			            //SQRT
			            u_xlat5.z = sqrt(u_xlat26.x);
			            //ADD
			            u_xlat26.xy = abs(u_xlat5.zw) + float2(-0.0399999991, -0.699999988);
			            //MAX
			            u_xlat39 = max(u_xlat26.y, u_xlat26.x);
			            //MIN
			            u_xlat39 = min(u_xlat39, 0.0);
			            //MAX
			            u_xlat26.xy = max(u_xlat26.xy, float2(0.0, 0.0));
			            //DP2
			            u_xlat26.x = dot(u_xlat26.xy, u_xlat26.xy);
			            //SQRT
			            u_xlat26.x = sqrt(u_xlat26.x);
			            //ADD
			            u_xlat26.x = u_xlat26.x + u_xlat39;
			            //ADD
			            u_xlat38 = (-u_xlat14.x) + u_xlat26.x;
			            //MAD
			            u_xlat38 = u_xlat38 * 1.66666663 + 0.5;
			            u_xlat38 = clamp(u_xlat38, 0.0, 1.0);
			            //ADD
			            u_xlat14.x = (-u_xlat26.x) + u_xlat14.x;
			            //MAD
			            u_xlat14.x = u_xlat38 * u_xlat14.x + u_xlat26.x;
			            //MUL
			            u_xlat26.x = u_xlat38 * 0.300000012;
			            //ADD
			            u_xlat38 = (-u_xlat38) + 1.0;
			            //MAD
			            u_xlat14.x = (-u_xlat26.x) * u_xlat38 + u_xlat14.x;
			            //MOV
			            u_xlat26.x = u_xlat3.y;
			            u_xlat26.x = clamp(u_xlat26.x, 0.0, 1.0);
			            //MAD
			            u_xlat38 = u_xlat26.x * -2.0 + 3.0;
			            //MUL
			            u_xlat26.x = u_xlat26.x * u_xlat26.x;
			            //MOV
			            u_xlat4.x = u_xlat4.x;
			            u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
			            //MAD
			            u_xlat39 = u_xlat4.x * -2.0 + 3.0;
			            //MUL
			            u_xlat4.x = u_xlat4.x * u_xlat4.x;
			            //MUL
			            u_xlat39 = u_xlat39 * u_xlat4.x;
			            //MUL
			            u_xlat39 = u_xlat39 * 3.0;
			            //MAD
			            u_xlat26.x = u_xlat38 * u_xlat26.x + (-u_xlat39);
			            //MAD
			            u_xlat26.x = (-u_xlat26.x) * 0.159999996 + 1.0;
			            //MUL
			            u_xlat3.xzw = u_xlat26.xxx * u_xlat3.xyz;
			            //MUL
			            u_xlat26.y = u_xlat3.z * 2.22222233;
			            u_xlat26.y = clamp(u_xlat26.y, 0.0, 1.0);
			            //MAD
			            u_xlat4.x = u_xlat26.y * -2.0 + 3.0;
			            //MAD
			            u_xlat26.x = u_xlat3.y * u_xlat26.x + -0.449999988;
			            //MUL
			            u_xlat26.x = u_xlat26.x * 2.22222233;
			            u_xlat26.x = clamp(u_xlat26.x, 0.0, 1.0);
			            //MAD
			            u_xlat15.x = u_xlat26.x * -2.0 + 3.0;
			            //MUL
			            u_xlat26.xy = u_xlat26.xy * u_xlat26.xy;
			            //MUL
			            u_xlat26.x = u_xlat26.x * u_xlat15.x;
			            //MAD
			            u_xlat26.x = u_xlat4.x * u_xlat26.y + (-u_xlat26.x);
			            //MAD
			            u_xlat26.x = (-u_xlat26.x) * 0.0700000003 + 1.0;
			            //MUL
			            u_xlat4.xyz = u_xlat26.xxx * u_xlat3.xwz;
			            //MAD
			            u_xlat26.x = u_xlat3.z * u_xlat26.x + 0.600000024;
			            //MUL
			            u_xlat26.x = u_xlat26.x * 1.25;
			            u_xlat26.x = clamp(u_xlat26.x, 0.0, 1.0);
			            //MAD
			            u_xlat38 = u_xlat26.x * -2.0 + 3.0;
			            //MUL
			            u_xlat26.x = u_xlat26.x * u_xlat26.x;
			            //MAD
			            u_xlat26.x = (-u_xlat38) * u_xlat26.x + 1.0;
			            //MAD
			            u_xlat26.x = u_xlat26.x * 0.200000003 + 1.0;
			            //MUL
			            u_xlat4.xy = u_xlat26.xx * u_xlat4.xy;
			            //MUL
			            u_xlat4.w = u_xlat4.z * 0.800000012;
			            //MUL
			            u_xlat3.xyz = u_xlat4.xzy * float3(0.449999988, 0.359999985, 0.449999988);
			            //DP3
			            u_xlat26.x = dot(u_xlat4.xyw, u_xlat4.xyw);
			            //RSQ
			            u_xlat38 = rsqrt(u_xlat26.x);
			            //MUL
			            u_xlat5 = (float4)(u_xlat38) * u_xlat4.xxwy;
			            //MAD
			            u_xlat6.xy = u_xlat4.xz * float2(0.449999988, 0.359999985) + float2(-0.140000001, -0.140000001);
			            //SAMPLE_L
			            u_xlat6 = tex2Dlod(_NoiseTex, float4(u_xlat6.xy, 0.0,1.5));
			            //SAMPLE_L
			            u_xlat7 = tex2Dlod(_NoiseTex, float4(u_xlat3.xz, 0.0,0.0));
			            //SAMPLE_L
			            u_xlat3 = tex2Dlod(_NoiseTex, float4(u_xlat3.yz, 0.0,1.5));
			            //MUL
			            u_xlat15.x = abs(u_xlat5.z) * u_xlat7.x;
			            //MAD
			            u_xlat15.x = u_xlat6.x * abs(u_xlat5.w) + u_xlat15.x;
			            //MAD
			            u_xlat3.x = u_xlat3.x * abs(u_xlat5.y) + u_xlat15.x;
			            //SQRT
			            u_xlat26.x = sqrt(u_xlat26.x);
			            //ADD
			            u_xlat26.x = u_xlat26.x + -1.0;
			            //MAD
			            u_xlat26.x = (-u_xlat3.x) * 0.100000001 + u_xlat26.x;
			            //MIN
			            u_xlat3.x = min(abs(u_xlat5.y), abs(u_xlat5.z));
			            //MAX
			            u_xlat15.x = max(abs(u_xlat5.y), abs(u_xlat5.z));
			            //DIV
			            u_xlat15.x = float(1.0) / u_xlat15.x;
			            //MUL
			            u_xlat3.x = u_xlat15.x * u_xlat3.x;
			            //MUL
			            u_xlat15.x = u_xlat3.x * u_xlat3.x;
			            //MAD
			            u_xlat27.x = u_xlat15.x * 0.0208350997 + -0.0851330012;
			            //MAD
			            u_xlat27.x = u_xlat15.x * u_xlat27.x + 0.180141002;
			            //MAD
			            u_xlat27.x = u_xlat15.x * u_xlat27.x + -0.330299497;
			            //MAD
			            u_xlat15.x = u_xlat15.x * u_xlat27.x + 0.999866009;
			            //MUL
			            u_xlat27.x = u_xlat15.x * u_xlat3.x;
			            //LT
			            u_xlatb39 = abs(u_xlat5.y)<abs(u_xlat5.z);
			            //MAD
			            u_xlat27.x = u_xlat27.x * -2.0 + 1.57079637;
			            //AND
			            u_xlat27.x = u_xlatb39 ? u_xlat27.x : float(0.0);
			            //MAD
			            u_xlat3.x = u_xlat3.x * u_xlat15.x + u_xlat27.x;
			            //LT
			            u_xlatb15 = u_xlat5.y<(-u_xlat5.x);
			            //AND
			            u_xlat15.x = u_xlatb15 ? -3.14159274 : float(0.0);
			            //ADD
			            u_xlat3.x = u_xlat15.x + u_xlat3.x;
			            //MIN
			            u_xlat15.x = min(u_xlat5.y, u_xlat5.z);
			            //MAX
			            u_xlat27.x = max(u_xlat5.y, u_xlat5.z);
			            //LT
			            u_xlatb15 = u_xlat15.x<(-u_xlat15.x);
			            //GE
			            u_xlatb27 = u_xlat27.x>=(-u_xlat27.x);
			            //AND
			            u_xlatb15 = u_xlatb27 && u_xlatb15;
			            //MOVC
			            u_xlat3.x = (u_xlatb15) ? (-u_xlat3.x) : u_xlat3.x;
			            //MIN
			            u_xlat3.x = min(u_xlat3.x, 3.14159012);
			            //MAD
			            u_xlat27.x = (-u_xlat5.w) * u_xlat5.w + 1.0;
			            //MUL
			            u_xlat27.x = u_xlat27.x * 899.175598;
			            //LOG
			            u_xlat27.x = log2(u_xlat27.x);
			            //MUL
			            u_xlat27.x = u_xlat27.x * 0.720210016;
			            //ROUND_NI
			            u_xlat27.x = floor(u_xlat27.x);
			            //MAX
			            u_xlat27.x = max(u_xlat27.x, 2.0);
			            //MUL
			            u_xlat27.x = u_xlat27.x * 0.694241941;
			            //EXP
			            u_xlat27.x = exp2(u_xlat27.x);
			            //MUL
			            u_xlat27.xy = u_xlat27.xx * float2(0.44721359, 0.723606825);
			            //ROUND_NE
			            u_xlat27.xy = round(u_xlat27.xy);
			            //ADD
			            u_xlat5.xy = u_xlat27.yx + float2(1.0, 1.0);
			            //MUL
			            u_xlat29.xy = u_xlat5.xy * float2(0.618034005, 0.618034005);
			            //ROUND_NI
			            u_xlat29.xy = floor(u_xlat29.xy);
			            //MAD
			            u_xlat5.xy = u_xlat5.xy * float2(0.618034005, 0.618034005) + (-u_xlat29.xy);
			            //MAD
			            u_xlat5.xy = u_xlat5.xy * float2(6.28318024, 6.28318024) + float2(-3.88321877, -3.88321877);
			            //MUL
			            u_xlat27.xy = u_xlat27.xy * float2(-0.015625, -0.015625);
			            //MUL
			            u_xlat28.x = u_xlat27.x * u_xlat5.x;
			            //MAD
			            u_xlat28.x = u_xlat5.y * u_xlat27.y + (-u_xlat28.x);
			            //MUL
			            u_xlat6.xz = u_xlat27.yx * float2(1.0, -1.0);
			            //MUL
			            u_xlat6.yw = u_xlat5.xy * float2(-1.0, 1.0);
			            //DIV
			            u_xlat5 = u_xlat6 / u_xlat28.xxxx;
			            //MAD
			            u_xlat3.y = u_xlat4.y * u_xlat38 + -0.9921875;
			            //DP2
			            u_xlat28.x = dot(u_xlat5.xy, u_xlat3.xy);
			            //DP2
			            u_xlat3.x = dot(u_xlat5.zw, u_xlat3.xy);
			            //ROUND_NI
			            u_xlat5.x = floor(u_xlat28.x);
			            //ROUND_NI
			            u_xlat5.y = floor(u_xlat3.x);
			            //MOV
			            u_xlat6.x = float(100000.0);
			            //MOV
			            u_xlat6.y = float(0.0);
			            //MOV
			            u_xlat6.z = float(0.0);
			            //MOV
			            u_xlat6.w = float(0.0);
			            //LOOP
			            for(uint u_xlatu_loop_1 = 0u ; u_xlatu_loop_1<4u ; u_xlatu_loop_1++)
			            {
			                //AND
			                u_xlatu15 = u_xlatu_loop_1 & 1u;
			                //USHR
			                u_xlatu28.x = u_xlatu_loop_1 >> 1u;
			                //UTOF
			                u_xlat7.x = float(u_xlatu15);
			                //UTOF
			                u_xlat7.y = float(u_xlatu28.x);
			                //ADD
			                u_xlat29.xy = u_xlat5.xy + u_xlat7.xy;
			                //DP2
			                u_xlat15.x = dot(u_xlat27.xy, u_xlat29.xy);
			                //ADD
			                u_xlat15.x = u_xlat15.x + 0.9921875;
			                //MAX
			                u_xlat28.x = max(u_xlat15.x, -1.0);
			                //MIN
			                u_xlat28.x = min(u_xlat28.x, 1.0);
			                //MAD
			                u_xlat15.x = u_xlat28.x * 2.0 + (-u_xlat15.x);
			                //MAD
			                u_xlat15.x = (-u_xlat15.x) * 64.0 + 64.0;
			                //ROUND_NI
			                u_xlat15.x = floor(u_xlat15.x);
			                //MUL
			                u_xlat28.x = u_xlat15.x * 0.618034005;
			                //ROUND_NI
			                u_xlat28.x = floor(u_xlat28.x);
			                //MAD
			                u_xlat28.x = u_xlat15.x * 0.618034005 + (-u_xlat28.x);
			                //MUL
			                u_xlat28.x = u_xlat28.x * 6.28318024;
			                //MAD
			                u_xlat15.x = u_xlat15.x * 2.0 + 1.0;
			                //MAD
			                u_xlat7.w = (-u_xlat15.x) * 0.0078125 + 1.0;
			                //MAD
			                u_xlat15.x = (-u_xlat7.w) * u_xlat7.w + 1.0;
			                //SQRT
			                u_xlat15.x = sqrt(u_xlat15.x);
			                //SINCOS
			                u_xlat8.x = sin(u_xlat28.x);
			                u_xlat9.x = cos(u_xlat28.x);
			                //MUL
			                u_xlat7.y = u_xlat15.x * u_xlat9.x;
			                //MUL
			                u_xlat7.z = u_xlat15.x * u_xlat8.x;
			                //MAD
			                u_xlat8.xyz = (-u_xlat4.xwy) * (float3)(u_xlat38) + u_xlat7.yzw;
			                //DP3
			                u_xlat7.x = dot(u_xlat8.xyz, u_xlat8.xyz);
			                //LT
			                u_xlatb15 = u_xlat7.x<u_xlat6.x;
			                //MOVC
			                u_xlat6 = ((bool)(u_xlatb15)) ? u_xlat7 : u_xlat6;
			            //ENDLOOP
			            }
			            //MAD
			            u_xlat3.xyz = (-u_xlat6.yzw) * float3(1.01999998, 1.01999998, 1.01999998) + u_xlat4.xwy;
			            //DP3
			            u_xlat38 = dot(u_xlat3.xyz, u_xlat3.xyz);
			            //SQRT
			            u_xlat38 = sqrt(u_xlat38);
			            //ADD
			            u_xlat38 = u_xlat38 + -0.0599999987;
			            //ADD
			            u_xlat3.x = (-u_xlat38) + u_xlat26.x;
			            //MAD
			            u_xlat3.x = u_xlat3.x * 50.0 + 0.5;
			            u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
			            //ADD
			            u_xlat38 = (-u_xlat26.x) + u_xlat38;
			            //MAD
			            u_xlat38 = u_xlat3.x * u_xlat38 + u_xlat26.x;
			            //MUL
			            u_xlat15.x = u_xlat3.x * 0.00999999978;
			            //ADD
			            u_xlat3.x = (-u_xlat3.x) + 1.0;
			            //MAD
			            u_xlat38 = (-u_xlat15.x) * u_xlat3.x + u_xlat38;
			            //LT
			            u_xlatb3.x = u_xlat38<u_xlat26.x;
			            //MOVC
			            u_xlat26.x = (u_xlatb3.x) ? u_xlat38 : u_xlat26.x;
			            //LT
			            u_xlatb38 = u_xlat14.x<u_xlat26.x;
			            //MOVC
			            u_xlat14.x = (u_xlatb38) ? u_xlat14.x : u_xlat26.x;
			            //MUL
			            u_xlat14.x = u_xlat14.x * 0.300000012;
			        //ELSE
			        } else {
			            //MOV
			            u_xlat14.x = 1.0;
			        //ENDIF
			        }
			        //ADD
			        u_xlat26.x = u_xlat37 + u_xlat14.x;
			        //LT
			        u_xlatb38 = _MaxDist<u_xlat26.x;
			        //MAD
			        u_xlat3.x = u_xlat26.x * 0.25 + 1.0;
			        //MUL
			        u_xlat3.x = u_xlat3.x * 0.00200000009;
			        //LT
			        u_xlatb14 = abs(u_xlat14.x)<u_xlat3.x;
			        //OR
			        u_xlatb14 = u_xlatb14 || u_xlatb38;
			        //IF
			        if(u_xlatb14){
			            //MOV
			            u_xlat37 = u_xlat26.x;
			            //BREAK
			            break;
			        //ENDIF
			        }
			        //IADD
			        u_xlati2 = u_xlati2 + 1;
			        //MOV
			        u_xlat37 = u_xlat26.x;
			    //ENDLOOP
			    }
			    //ITOF
			    u_xlat2.x = float(u_xlati2);
			    //MAD
			    u_xlat0.xyz = (float3)(u_xlat37) * u_xlat0.xyz + u_xlat1.xyz;
			    //DIV
			    u_xlat1.x = u_xlat2.x / _Iterations;
			    //LOG
			    u_xlat1.x = log2(u_xlat1.x);
			    //MUL
			    u_xlat1.x = u_xlat1.x * 0.75;
			    //EXP
			    u_xlat1.x = exp2(u_xlat1.x);
			    //ADD
			    u_xlat1.x = (-u_xlat1.x) + 1.0;
			    //MUL
			    u_xlat13.xy = u_xlat0.xy * float2(3.33333325, 3.33333325);
			    //MAD
			    u_xlat14.z = u_xlat0.z * 3.33333325 + (-u_xlat36);
			    //ADD
			    u_xlat37 = u_xlat14.z + 3.0;
			    //MUL
			    u_xlat37 = u_xlat37 * 0.0500000007;
			    //SINCOS
			    u_xlat2.x = sin(u_xlat37);
			    u_xlat3.x = cos(u_xlat37);
			    //MOV
			    u_xlat4.x = (-u_xlat2.x);
			    //MOV
			    u_xlat4.y = u_xlat3.x;
			    //MOV
			    u_xlat4.z = u_xlat2.x;
			    //DP2
			    u_xlat14.x = dot(u_xlat13.xy, u_xlat4.yz);
			    //DP2
			    u_xlat14.y = dot(u_xlat13.xy, u_xlat4.xy);
			    //ADD
			    u_xlat13.xyz = u_xlat14.xyz + float3(3.0, 3.0, 3.0);
			    //MUL
			    u_xlat2.xyz = u_xlat13.xyz * float3(0.166666672, 0.166666672, 0.166666672);
			    //ROUND_NI
			    u_xlat2.xyz = floor(u_xlat2.xyz);
			    //EQ
			    u_xlatb3.xy = ((u_xlat2.xyxx) == (float4(0.0, 0.0, 0.0, 0.0))).xy;
			    //OR
			    u_xlatb38 = u_xlatb3.y || u_xlatb3.x;
			    //IF
			    if(!u_xlatb38){
			        //MAD
			        u_xlat3.xyz = (-u_xlat2.xyz) * float3(6.0, 6.0, 6.0) + u_xlat13.xyz;
			        //ADD
			        u_xlat3.yzw = u_xlat3.xyz + float3(-3.0, -3.0, -3.0);
			        //MAD
			        u_xlat4.xyz = _Time.yyy * float3(1.29999995, 0.800000012, 1.20000005) + u_xlat2.xyz;
			        //SINCOS
			        u_xlat5.x = cos(u_xlat4.x);
			        u_xlat4.x = sin(u_xlat4.x);
			        //MOV
			        u_xlat6.x = (-u_xlat4.x);
			        //MOV
			        u_xlat6.y = u_xlat5.x;
			        //MOV
			        u_xlat6.z = u_xlat4.x;
			        //DP2
			        u_xlat3.x = dot(u_xlat3.yz, u_xlat6.yz);
			        //DP2
			        u_xlat5.x = dot(u_xlat3.yz, u_xlat6.xy);
			        //SINCOS
			        u_xlat6.x = cos(u_xlat4.y);
			        u_xlat4.x = sin(u_xlat4.y);
			        //MOV
			        u_xlat7.x = (-u_xlat4.x);
			        //MOV
			        u_xlat7.y = u_xlat6.x;
			        //MOV
			        u_xlat7.z = u_xlat4.x;
			        //DP2
			        u_xlat6.x = dot(u_xlat3.xw, u_xlat7.yz);
			        //DP2
			        u_xlat5.y = dot(u_xlat3.xw, u_xlat7.xy);
			        //SINCOS
			        u_xlat3.x = sin(u_xlat4.z);
			        u_xlat4.x = cos(u_xlat4.z);
			        //MOV
			        u_xlat7.x = (-u_xlat3.x);
			        //MOV
			        u_xlat7.y = u_xlat4.x;
			        //MOV
			        u_xlat7.z = u_xlat3.x;
			        //DP2
			        u_xlat6.y = dot(u_xlat5.xy, u_xlat7.yz);
			        //DP2
			        u_xlat6.z = dot(u_xlat5.xy, u_xlat7.xy);
			        //ADD
			        u_xlat3.x = u_xlat2.x + _Time.y;
			        //SINCOS
			        u_xlat3.x = sin(u_xlat3.x);
			        //MAD
			        u_xlat3.x = u_xlat3.x * 0.5 + 0.5;
			        //MAD
			        u_xlat3.x = u_xlat3.x * 0.199999988 + 0.800000012;
			        //MUL
			        u_xlat15.xyz = u_xlat3.xxx * u_xlat6.xyz;
			        //MAD
			        u_xlat4 = u_xlat6.yxyz * u_xlat3.xxxx + float4(-1.0, -0.0, -1.32000005, -0.0);
			        //MIN
			        u_xlat3.x = min(abs(u_xlat4.y), abs(u_xlat4.w));
			        //MAX
			        u_xlat5.x = max(abs(u_xlat4.y), abs(u_xlat4.w));
			        //DIV
			        u_xlat5.x = float(1.0) / u_xlat5.x;
			        //MUL
			        u_xlat3.x = u_xlat3.x * u_xlat5.x;
			        //MUL
			        u_xlat5.x = u_xlat3.x * u_xlat3.x;
			        //MAD
			        u_xlat17.x = u_xlat5.x * 0.0208350997 + -0.0851330012;
			        //MAD
			        u_xlat17.x = u_xlat5.x * u_xlat17.x + 0.180141002;
			        //MAD
			        u_xlat17.x = u_xlat5.x * u_xlat17.x + -0.330299497;
			        //MAD
			        u_xlat5.x = u_xlat5.x * u_xlat17.x + 0.999866009;
			        //MUL
			        u_xlat17.x = u_xlat3.x * u_xlat5.x;
			        //LT
			        u_xlatb29 = abs(u_xlat4.y)<abs(u_xlat4.w);
			        //MAD
			        u_xlat17.x = u_xlat17.x * -2.0 + 1.57079637;
			        //AND
			        u_xlat17.x = u_xlatb29 ? u_xlat17.x : float(0.0);
			        //MAD
			        u_xlat3.x = u_xlat3.x * u_xlat5.x + u_xlat17.x;
			        //LT
			        u_xlatb5 = u_xlat4.y<(-u_xlat4.y);
			        //AND
			        u_xlat5.x = u_xlatb5 ? -3.14159274 : float(0.0);
			        //ADD
			        u_xlat3.x = u_xlat3.x + u_xlat5.x;
			        //MIN
			        u_xlat5.x = min(u_xlat4.y, u_xlat4.w);
			        //MAX
			        u_xlat17.x = max(u_xlat4.y, u_xlat4.w);
			        //LT
			        u_xlatb5 = u_xlat5.x<(-u_xlat5.x);
			        //GE
			        u_xlatb17 = u_xlat17.x>=(-u_xlat17.x);
			        //AND
			        u_xlatb5 = u_xlatb17 && u_xlatb5;
			        //MOVC
			        u_xlat3.x = (u_xlatb5) ? (-u_xlat3.x) : u_xlat3.x;
			        //DP2
			        u_xlat5.x = dot(u_xlat4.yw, u_xlat4.yw);
			        //SQRT
			        u_xlat5.x = sqrt(u_xlat5.x);
			        //ADD
			        u_xlat3.x = u_xlat3.x + 0.314159274;
			        //MUL
			        u_xlat17.x = u_xlat3.x * 1.5915494;
			        //ROUND_NI
			        u_xlat17.x = floor(u_xlat17.x);
			        //MAD
			        u_xlat3.x = (-u_xlat17.x) * 0.628318548 + u_xlat3.x;
			        //ADD
			        u_xlat3.x = u_xlat3.x + -0.314159274;
			        //SINCOS
			        u_xlat6.x = cos(u_xlat3.x);
			        u_xlat3.x = sin(u_xlat3.x);
			        //MOV
			        u_xlat6.xz = u_xlat6.xx;
			        //MOV
			        u_xlat6.y = u_xlat3.x;
			        //MUL
			        u_xlat5.xyz = u_xlat5.xxx * u_xlat6.xyz;
			        //MAD
			        u_xlat5.xyz = u_xlat5.xyz * float3(2.0, 2.0, 2.0) + float3(-1.0, -0.0, -1.0);
			        //MUL
			        u_xlat5.xyz = u_xlat5.xyz * float3(0.5, 0.5, 3.0);
			        //SINCOS
			        u_xlat3.x = sin(u_xlat5.z);
			        //MAD
			        u_xlat6.y = u_xlat3.x * 0.100000001 + u_xlat4.z;
			        //ADD
			        u_xlat5.w = abs(u_xlat5.y) + 0.600000024;
			        //DP2
			        u_xlat3.x = dot(u_xlat5.xw, u_xlat5.xw);
			        //SQRT
			        u_xlat6.x = sqrt(u_xlat3.x);
			        //ADD
			        u_xlat29.xy = abs(u_xlat6.xy) + float2(-0.699999988, -0.00999999978);
			        //MAX
			        u_xlat3.x = max(u_xlat29.y, u_xlat29.x);
			        //MIN
			        u_xlat3.x = min(u_xlat3.x, 0.0);
			        //MAX
			        u_xlat29.xy = max(u_xlat29.xy, float2(0.0, 0.0));
			        //DP2
			        u_xlat29.x = dot(u_xlat29.xy, u_xlat29.xy);
			        //SQRT
			        u_xlat29.x = sqrt(u_xlat29.x);
			        //ADD
			        u_xlat3.x = u_xlat3.x + u_xlat29.x;
			        //MOV
			        u_xlat6.zw = u_xlat5.xy;
			        //ADD
			        u_xlat5.xyz = u_xlat6.zyw + float3(-0.0, -0.00999999978, -0.0);
			        //ADD
			        u_xlat5.xyz = abs(u_xlat5.xyz) + float3(-0.449999988, -0.0130000003, -0.00100000005);
			        //MAX
			        u_xlat41 = max(u_xlat5.z, u_xlat5.y);
			        //MAX
			        u_xlat41 = max(u_xlat41, u_xlat5.x);
			        //MIN
			        u_xlat41 = min(u_xlat41, 0.0);
			        //MAX
			        u_xlat5.xyz = max(u_xlat5.xyz, float3(0.0, 0.0, 0.0));
			        //DP3
			        u_xlat5.x = dot(u_xlat5.xyz, u_xlat5.xyz);
			        //SQRT
			        u_xlat5.x = sqrt(u_xlat5.x);
			        //ADD
			        u_xlat5.x = u_xlat5.x + u_xlat41;
			        //ADD
			        u_xlat17.x = (-u_xlat3.x) + u_xlat5.x;
			        //MAD
			        u_xlat17.x = u_xlat17.x * 10.0 + 0.5;
			        u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
			        //ADD
			        u_xlat3.x = u_xlat3.x + (-u_xlat5.x);
			        //MAD
			        u_xlat3.x = u_xlat17.x * u_xlat3.x + u_xlat5.x;
			        //MUL
			        u_xlat5.x = u_xlat17.x * 0.0500000007;
			        //ADD
			        u_xlat17.x = (-u_xlat17.x) + 1.0;
			        //MAD
			        u_xlat3.x = (-u_xlat5.x) * u_xlat17.x + u_xlat3.x;
			        //MUL
			        u_xlat5.x = u_xlat4.z * 4.0;
			        //SINCOS
			        u_xlat5.x = sin(u_xlat5.x);
			        //MAD
			        u_xlat16.x = u_xlat5.x * 0.100000001 + u_xlat4.y;
			        //ADD
			        u_xlat5.x = u_xlat16.x + -0.0500000007;
			        //MOV
			        u_xlat5.yw = u_xlat4.wz;
			        //DP2
			        u_xlat16.x = dot(u_xlat5.xy, u_xlat5.xy);
			        //SQRT
			        u_xlat5.z = sqrt(u_xlat16.x);
			        //ADD
			        u_xlat16.xy = abs(u_xlat5.zw) + float2(-0.0399999991, -0.699999988);
			        //MAX
			        u_xlat40 = max(u_xlat16.y, u_xlat16.x);
			        //MIN
			        u_xlat40 = min(u_xlat40, 0.0);
			        //MAX
			        u_xlat16.xy = max(u_xlat16.xy, float2(0.0, 0.0));
			        //DP2
			        u_xlat16.x = dot(u_xlat16.xy, u_xlat16.xy);
			        //SQRT
			        u_xlat16.x = sqrt(u_xlat16.x);
			        //ADD
			        u_xlat16.x = u_xlat16.x + u_xlat40;
			        //ADD
			        u_xlat28.x = (-u_xlat3.x) + u_xlat16.x;
			        //MAD
			        u_xlat28.x = u_xlat28.x * 1.66666663 + 0.5;
			        u_xlat28.x = clamp(u_xlat28.x, 0.0, 1.0);
			        //ADD
			        u_xlat3.x = u_xlat3.x + (-u_xlat16.x);
			        //MAD
			        u_xlat3.x = u_xlat28.x * u_xlat3.x + u_xlat16.x;
			        //MUL
			        u_xlat16.x = u_xlat28.x * 0.300000012;
			        //ADD
			        u_xlat28.x = (-u_xlat28.x) + 1.0;
			        //MAD
			        u_xlat3.x = (-u_xlat16.x) * u_xlat28.x + u_xlat3.x;
			        //MOV
			        u_xlat4.y = u_xlat15.y;
			        u_xlat4.y = clamp(u_xlat4.y, 0.0, 1.0);
			        //MAD
			        u_xlat28.x = u_xlat4.y * -2.0 + 3.0;
			        //MOV
			        u_xlat4.x = u_xlat4.x;
			        u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
			        //MAD
			        u_xlat40 = u_xlat4.x * -2.0 + 3.0;
			        //MUL
			        u_xlat4.xy = u_xlat4.xy * u_xlat4.xy;
			        //MUL
			        u_xlat4.x = u_xlat4.x * u_xlat40;
			        //MUL
			        u_xlat4.x = u_xlat4.x * 3.0;
			        //MAD
			        u_xlat4.x = u_xlat28.x * u_xlat4.y + (-u_xlat4.x);
			        //MAD
			        u_xlat4.x = (-u_xlat4.x) * 0.159999996 + 1.0;
			        //MUL
			        u_xlat16.xyz = u_xlat15.xyz * u_xlat4.xxx;
			        //MUL
			        u_xlat15.x = u_xlat16.y * 2.22222233;
			        u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
			        //MAD
			        u_xlat39 = u_xlat15.x * -2.0 + 3.0;
			        //MAD
			        u_xlat27.x = u_xlat15.y * u_xlat4.x + -0.449999988;
			        //MUL
			        u_xlat15.y = u_xlat27.x * 2.22222233;
			        u_xlat15.y = clamp(u_xlat15.y, 0.0, 1.0);
			        //MAD
			        u_xlat4.x = u_xlat15.y * -2.0 + 3.0;
			        //MUL
			        u_xlat15.xy = u_xlat15.xy * u_xlat15.xy;
			        //MUL
			        u_xlat27.x = u_xlat15.y * u_xlat4.x;
			        //MAD
			        u_xlat15.x = u_xlat39 * u_xlat15.x + (-u_xlat27.x);
			        //MAD
			        u_xlat15.x = (-u_xlat15.x) * 0.0700000003 + 1.0;
			        //MUL
			        u_xlat5.xyz = u_xlat15.xxx * u_xlat16.xzy;
			        //MAD
			        u_xlat15.x = u_xlat16.y * u_xlat15.x + 0.600000024;
			        //MUL
			        u_xlat15.x = u_xlat15.x * 1.25;
			        u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
			        //MAD
			        u_xlat27.x = u_xlat15.x * -2.0 + 3.0;
			        //MUL
			        u_xlat15.x = u_xlat15.x * u_xlat15.x;
			        //MAD
			        u_xlat15.x = (-u_xlat27.x) * u_xlat15.x + 1.0;
			        //MAD
			        u_xlat15.x = u_xlat15.x * 0.200000003 + 1.0;
			        //MUL
			        u_xlat5.xy = u_xlat15.xx * u_xlat5.xy;
			        //MUL
			        u_xlat5.w = u_xlat5.z * 0.800000012;
			        //MUL
			        u_xlat15.xyz = u_xlat5.xzy * float3(0.449999988, 0.359999985, 0.449999988);
			        //DP3
			        u_xlat4.x = dot(u_xlat5.xyw, u_xlat5.xyw);
			        //RSQ
			        u_xlat16.x = rsqrt(u_xlat4.x);
			        //MUL
			        u_xlat6 = u_xlat16.xxxx * u_xlat5.xxwy;
			        //MAD
			        u_xlat28.xy = u_xlat5.xz * float2(0.449999988, 0.359999985) + float2(-0.140000001, -0.140000001);
			        //SAMPLE_L
			        u_xlat7 = tex2Dlod(_NoiseTex, float4(u_xlat28.xy, 0.0,1.5));
			        //SAMPLE_L
			        u_xlat8 = tex2Dlod(_NoiseTex, float4(u_xlat15.xz, 0.0,0.0));
			        //SAMPLE_L
			        u_xlat9 = tex2Dlod(_NoiseTex, float4(u_xlat15.yz, 0.0,1.5));
			        //MUL
			        u_xlat15.x = abs(u_xlat6.z) * u_xlat8.x;
			        //MAD
			        u_xlat15.x = u_xlat7.x * abs(u_xlat6.w) + u_xlat15.x;
			        //MAD
			        u_xlat15.x = u_xlat9.x * abs(u_xlat6.y) + u_xlat15.x;
			        //SQRT
			        u_xlat27.x = sqrt(u_xlat4.x);
			        //ADD
			        u_xlat27.x = u_xlat27.x + -1.0;
			        //MAD
			        u_xlat15.x = (-u_xlat15.x) * 0.100000001 + u_xlat27.x;
			        //MIN
			        u_xlat27.x = min(abs(u_xlat6.y), abs(u_xlat6.z));
			        //MAX
			        u_xlat39 = max(abs(u_xlat6.y), abs(u_xlat6.z));
			        //DIV
			        u_xlat39 = float(1.0) / u_xlat39;
			        //MUL
			        u_xlat27.x = u_xlat39 * u_xlat27.x;
			        //MUL
			        u_xlat39 = u_xlat27.x * u_xlat27.x;
			        //MAD
			        u_xlat4.x = u_xlat39 * 0.0208350997 + -0.0851330012;
			        //MAD
			        u_xlat4.x = u_xlat39 * u_xlat4.x + 0.180141002;
			        //MAD
			        u_xlat4.x = u_xlat39 * u_xlat4.x + -0.330299497;
			        //MAD
			        u_xlat39 = u_xlat39 * u_xlat4.x + 0.999866009;
			        //MUL
			        u_xlat4.x = u_xlat39 * u_xlat27.x;
			        //LT
			        u_xlatb28 = abs(u_xlat6.y)<abs(u_xlat6.z);
			        //MAD
			        u_xlat4.x = u_xlat4.x * -2.0 + 1.57079637;
			        //AND
			        u_xlat4.x = u_xlatb28 ? u_xlat4.x : float(0.0);
			        //MAD
			        u_xlat27.x = u_xlat27.x * u_xlat39 + u_xlat4.x;
			        //LT
			        u_xlatb39 = u_xlat6.y<(-u_xlat6.x);
			        //AND
			        u_xlat39 = u_xlatb39 ? -3.14159274 : float(0.0);
			        //ADD
			        u_xlat27.x = u_xlat39 + u_xlat27.x;
			        //MIN
			        u_xlat39 = min(u_xlat6.y, u_xlat6.z);
			        //MAX
			        u_xlat4.x = max(u_xlat6.y, u_xlat6.z);
			        //LT
			        u_xlatb39 = u_xlat39<(-u_xlat39);
			        //GE
			        u_xlatb4.x = u_xlat4.x>=(-u_xlat4.x);
			        //AND
			        u_xlatb39 = u_xlatb39 && u_xlatb4.x;
			        //MOVC
			        u_xlat27.x = (u_xlatb39) ? (-u_xlat27.x) : u_xlat27.x;
			        //MIN
			        u_xlat6.x = min(u_xlat27.x, 3.14159012);
			        //MAD
			        u_xlat27.x = (-u_xlat6.w) * u_xlat6.w + 1.0;
			        //MUL
			        u_xlat27.x = u_xlat27.x * 899.175598;
			        //LOG
			        u_xlat27.x = log2(u_xlat27.x);
			        //MUL
			        u_xlat27.x = u_xlat27.x * 0.720210016;
			        //ROUND_NI
			        u_xlat27.x = floor(u_xlat27.x);
			        //MAX
			        u_xlat27.x = max(u_xlat27.x, 2.0);
			        //MUL
			        u_xlat27.x = u_xlat27.x * 0.694241941;
			        //EXP
			        u_xlat27.x = exp2(u_xlat27.x);
			        //MUL
			        u_xlat27.xy = u_xlat27.xx * float2(0.44721359, 0.723606825);
			        //ROUND_NE
			        u_xlat27.xy = round(u_xlat27.xy);
			        //ADD
			        u_xlat4.xz = u_xlat27.yx + float2(1.0, 1.0);
			        //MUL
			        u_xlat30.xy = u_xlat4.xz * float2(0.618034005, 0.618034005);
			        //ROUND_NI
			        u_xlat30.xy = floor(u_xlat30.xy);
			        //MAD
			        u_xlat4.xz = u_xlat4.xz * float2(0.618034005, 0.618034005) + (-u_xlat30.xy);
			        //MAD
			        u_xlat4.xz = u_xlat4.xz * float2(6.28318024, 6.28318024) + float2(-3.88321877, -3.88321877);
			        //MUL
			        u_xlat27.xy = u_xlat27.xy * float2(-0.015625, -0.015625);
			        //MUL
			        u_xlat40 = u_xlat27.x * u_xlat4.x;
			        //MAD
			        u_xlat40 = u_xlat4.z * u_xlat27.y + (-u_xlat40);
			        //MUL
			        u_xlat7.xz = u_xlat27.yx * float2(1.0, -1.0);
			        //MUL
			        u_xlat7.yw = u_xlat4.xz * float2(-1.0, 1.0);
			        //DIV
			        u_xlat7 = u_xlat7 / (float4)(u_xlat40);
			        //MAD
			        u_xlat6.y = u_xlat5.y * u_xlat16.x + -0.9921875;
			        //DP2
			        u_xlat4.x = dot(u_xlat7.xy, u_xlat6.xy);
			        //DP2
			        u_xlat4.z = dot(u_xlat7.zw, u_xlat6.xy);
			        //ROUND_NI
			        u_xlat6.xy = floor(u_xlat4.xz);
			        //MOV
			        u_xlat7.x = float(100000.0);
			        //MOV
			        u_xlat7.y = float(0.0);
			        //MOV
			        u_xlat7.z = float(0.0);
			        //MOV
			        u_xlat7.w = float(0.0);
			        //LOOP
			        for(uint u_xlatu_loop_2 = 0u ; u_xlatu_loop_2<4u ; u_xlatu_loop_2++)
			        {
			            //AND
			            u_xlatu28.x = u_xlatu_loop_2 & 1u;
			            //USHR
			            u_xlatu28.y = u_xlatu_loop_2 >> 1u;
			            //UTOF
			            u_xlat8.xy = float2(u_xlatu28.xy);
			            //ADD
			            u_xlat28.xy = u_xlat6.xy + u_xlat8.xy;
			            //DP2
			            u_xlat28.x = dot(u_xlat27.xy, u_xlat28.xy);
			            //ADD
			            u_xlat28.x = u_xlat28.x + 0.9921875;
			            //MAX
			            u_xlat40 = max(u_xlat28.x, -1.0);
			            //MIN
			            u_xlat40 = min(u_xlat40, 1.0);
			            //MAD
			            u_xlat28.x = u_xlat40 * 2.0 + (-u_xlat28.x);
			            //MAD
			            u_xlat28.x = (-u_xlat28.x) * 64.0 + 64.0;
			            //ROUND_NI
			            u_xlat28.x = floor(u_xlat28.x);
			            //MUL
			            u_xlat40 = u_xlat28.x * 0.618034005;
			            //ROUND_NI
			            u_xlat40 = floor(u_xlat40);
			            //MAD
			            u_xlat40 = u_xlat28.x * 0.618034005 + (-u_xlat40);
			            //MUL
			            u_xlat40 = u_xlat40 * 6.28318024;
			            //MAD
			            u_xlat28.x = u_xlat28.x * 2.0 + 1.0;
			            //MAD
			            u_xlat8.w = (-u_xlat28.x) * 0.0078125 + 1.0;
			            //MAD
			            u_xlat28.x = (-u_xlat8.w) * u_xlat8.w + 1.0;
			            //SQRT
			            u_xlat28.x = sqrt(u_xlat28.x);
			            //SINCOS
			            u_xlat9.x = sin(u_xlat40);
			            u_xlat10.x = cos(u_xlat40);
			            //MUL
			            u_xlat8.y = u_xlat28.x * u_xlat10.x;
			            //MUL
			            u_xlat8.z = u_xlat28.x * u_xlat9.x;
			            //MAD
			            u_xlat9.xyz = (-u_xlat5.xwy) * u_xlat16.xxx + u_xlat8.yzw;
			            //DP3
			            u_xlat8.x = dot(u_xlat9.xyz, u_xlat9.xyz);
			            //LT
			            u_xlatb28 = u_xlat8.x<u_xlat7.x;
			            //MOVC
			            u_xlat7 = ((bool)(u_xlatb28)) ? u_xlat8 : u_xlat7;
			        //ENDLOOP
			        }
			        //MAD
			        u_xlat4.xyz = (-u_xlat7.yzw) * float3(1.01999998, 1.01999998, 1.01999998) + u_xlat5.xwy;
			        //DP3
			        u_xlat27.x = dot(u_xlat4.xyz, u_xlat4.xyz);
			        //SQRT
			        u_xlat27.x = sqrt(u_xlat27.x);
			        //ADD
			        u_xlat27.x = u_xlat27.x + -0.0599999987;
			        //ADD
			        u_xlat39 = (-u_xlat27.x) + u_xlat15.x;
			        //MAD
			        u_xlat39 = u_xlat39 * 50.0 + 0.5;
			        u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
			        //ADD
			        u_xlat27.x = (-u_xlat15.x) + u_xlat27.x;
			        //MAD
			        u_xlat27.x = u_xlat39 * u_xlat27.x + u_xlat15.x;
			        //MUL
			        u_xlat4.x = u_xlat39 * 0.00999999978;
			        //ADD
			        u_xlat39 = (-u_xlat39) + 1.0;
			        //MAD
			        u_xlat27.x = (-u_xlat4.x) * u_xlat39 + u_xlat27.x;
			        //LT
			        u_xlatb39 = u_xlat27.x<u_xlat15.x;
			        //MOVC
			        u_xlat15.x = (u_xlatb39) ? u_xlat27.x : u_xlat15.x;
			        //LT
			        u_xlatb27 = u_xlat3.x<u_xlat15.x;
			        //MOVC
			        u_xlat3.x = (u_xlatb27) ? u_xlat3.x : u_xlat15.x;
			        //MUL
			        u_xlat3.x = u_xlat3.x * 0.300000012;
			    //ELSE
			    } else {
			        //MOV
			        u_xlat3.x = 1.0;
			    //ENDIF
			    }
			    //MOV
			    u_xlat4.z = (-_Epsilon);
			    //MOV
			    u_xlat4.x = float(-0.0);
			    //MOV
			    u_xlat4.y = float(-0.0);
			    //ADD
			    u_xlat15.xyz = u_xlat0.xyz + u_xlat4.zyy;
			    //MAD
			    u_xlat17.z = u_xlat15.z * 3.33333325 + (-u_xlat36);
			    //ADD
			    u_xlat15.z = u_xlat17.z + 3.0;
			    //MUL
			    u_xlat15.xyz = u_xlat15.xyz * float3(3.33333325, 3.33333325, 0.0500000007);
			    //SINCOS
			    u_xlat5.x = sin(u_xlat15.z);
			    u_xlat6.x = cos(u_xlat15.z);
			    //MOV
			    u_xlat7.x = (-u_xlat5.x);
			    //MOV
			    u_xlat7.y = u_xlat6.x;
			    //MOV
			    u_xlat7.z = u_xlat5.x;
			    //DP2
			    u_xlat17.x = dot(u_xlat15.xy, u_xlat7.yz);
			    //DP2
			    u_xlat17.y = dot(u_xlat15.xy, u_xlat7.xy);
			    //ADD
			    u_xlat15.xyz = u_xlat17.xyz + float3(3.0, 3.0, 3.0);
			    //MUL
			    u_xlat5.xyz = u_xlat15.xyz * float3(0.166666672, 0.166666672, 0.166666672);
			    //ROUND_NI
			    u_xlat5.xyz = floor(u_xlat5.xyz);
			    //EQ
			    u_xlatb6.xy = ((u_xlat5.xyxx) == (float4(0.0, 0.0, 0.0, 0.0))).xy;
			    //OR
			    u_xlatb40 = u_xlatb6.y || u_xlatb6.x;
			    //IF
			    if(!u_xlatb40){
			        //MAD
			        u_xlat15.xyz = (-u_xlat5.xyz) * float3(6.0, 6.0, 6.0) + u_xlat15.xyz;
			        //ADD
			        u_xlat6.yzw = u_xlat15.xyz + float3(-3.0, -3.0, -3.0);
			        //MAD
			        u_xlat15.xyz = _Time.yyy * float3(1.29999995, 0.800000012, 1.20000005) + u_xlat5.xyz;
			        //SINCOS
			        u_xlat7.x = sin(u_xlat15.x);
			        u_xlat8.x = cos(u_xlat15.x);
			        //MOV
			        u_xlat9.x = (-u_xlat7.x);
			        //MOV
			        u_xlat9.y = u_xlat8.x;
			        //MOV
			        u_xlat9.z = u_xlat7.x;
			        //DP2
			        u_xlat6.x = dot(u_xlat6.yz, u_xlat9.yz);
			        //DP2
			        u_xlat7.x = dot(u_xlat6.yz, u_xlat9.xy);
			        //SINCOS
			        u_xlat8.x = sin(u_xlat15.y);
			        u_xlat9.x = cos(u_xlat15.y);
			        //MOV
			        u_xlat10.x = (-u_xlat8.x);
			        //MOV
			        u_xlat10.y = u_xlat9.x;
			        //MOV
			        u_xlat10.z = u_xlat8.x;
			        //DP2
			        u_xlat8.x = dot(u_xlat6.xw, u_xlat10.yz);
			        //DP2
			        u_xlat7.y = dot(u_xlat6.xw, u_xlat10.xy);
			        //SINCOS
			        u_xlat6.x = sin(u_xlat15.z);
			        u_xlat9.x = cos(u_xlat15.z);
			        //MOV
			        u_xlat10.x = (-u_xlat6.x);
			        //MOV
			        u_xlat10.y = u_xlat9.x;
			        //MOV
			        u_xlat10.z = u_xlat6.x;
			        //DP2
			        u_xlat8.y = dot(u_xlat7.xy, u_xlat10.yz);
			        //DP2
			        u_xlat8.z = dot(u_xlat7.xy, u_xlat10.xy);
			        //ADD
			        u_xlat15.x = u_xlat5.x + _Time.y;
			        //SINCOS
			        u_xlat15.x = sin(u_xlat15.x);
			        //MAD
			        u_xlat15.x = u_xlat15.x * 0.5 + 0.5;
			        //MAD
			        u_xlat15.x = u_xlat15.x * 0.199999988 + 0.800000012;
			        //MUL
			        u_xlat5.xyz = u_xlat15.xxx * u_xlat8.xyz;
			        //MAD
			        u_xlat6 = u_xlat8.yxyz * u_xlat15.xxxx + float4(-1.0, -0.0, -1.32000005, -0.0);
			        //MIN
			        u_xlat15.x = min(abs(u_xlat6.y), abs(u_xlat6.w));
			        //MAX
			        u_xlat27.x = max(abs(u_xlat6.y), abs(u_xlat6.w));
			        //DIV
			        u_xlat27.x = float(1.0) / u_xlat27.x;
			        //MUL
			        u_xlat15.x = u_xlat27.x * u_xlat15.x;
			        //MUL
			        u_xlat27.x = u_xlat15.x * u_xlat15.x;
			        //MAD
			        u_xlat39 = u_xlat27.x * 0.0208350997 + -0.0851330012;
			        //MAD
			        u_xlat39 = u_xlat27.x * u_xlat39 + 0.180141002;
			        //MAD
			        u_xlat39 = u_xlat27.x * u_xlat39 + -0.330299497;
			        //MAD
			        u_xlat27.x = u_xlat27.x * u_xlat39 + 0.999866009;
			        //MUL
			        u_xlat39 = u_xlat27.x * u_xlat15.x;
			        //LT
			        u_xlatb40 = abs(u_xlat6.y)<abs(u_xlat6.w);
			        //MAD
			        u_xlat39 = u_xlat39 * -2.0 + 1.57079637;
			        //AND
			        u_xlat39 = u_xlatb40 ? u_xlat39 : float(0.0);
			        //MAD
			        u_xlat15.x = u_xlat15.x * u_xlat27.x + u_xlat39;
			        //LT
			        u_xlatb27 = u_xlat6.y<(-u_xlat6.y);
			        //AND
			        u_xlat27.x = u_xlatb27 ? -3.14159274 : float(0.0);
			        //ADD
			        u_xlat15.x = u_xlat27.x + u_xlat15.x;
			        //MIN
			        u_xlat27.x = min(u_xlat6.y, u_xlat6.w);
			        //MAX
			        u_xlat39 = max(u_xlat6.y, u_xlat6.w);
			        //LT
			        u_xlatb27 = u_xlat27.x<(-u_xlat27.x);
			        //GE
			        u_xlatb39 = u_xlat39>=(-u_xlat39);
			        //AND
			        u_xlatb27 = u_xlatb39 && u_xlatb27;
			        //MOVC
			        u_xlat15.x = (u_xlatb27) ? (-u_xlat15.x) : u_xlat15.x;
			        //DP2
			        u_xlat27.x = dot(u_xlat6.yw, u_xlat6.yw);
			        //SQRT
			        u_xlat27.x = sqrt(u_xlat27.x);
			        //ADD
			        u_xlat15.x = u_xlat15.x + 0.314159274;
			        //MUL
			        u_xlat39 = u_xlat15.x * 1.5915494;
			        //ROUND_NI
			        u_xlat39 = floor(u_xlat39);
			        //MAD
			        u_xlat15.x = (-u_xlat39) * 0.628318548 + u_xlat15.x;
			        //ADD
			        u_xlat15.x = u_xlat15.x + -0.314159274;
			        //SINCOS
			        u_xlat7.x = sin(u_xlat15.x);
			        u_xlat8.x = cos(u_xlat15.x);
			        //MOV
			        u_xlat8.xz = u_xlat8.xx;
			        //MOV
			        u_xlat8.y = u_xlat7.x;
			        //MUL
			        u_xlat15.xyz = u_xlat27.xxx * u_xlat8.xyz;
			        //MAD
			        u_xlat15.xyz = u_xlat15.xyz * float3(2.0, 2.0, 2.0) + float3(-1.0, -0.0, -1.0);
			        //MUL
			        u_xlat7.xyz = u_xlat15.xyz * float3(0.5, 0.5, 3.0);
			        //SINCOS
			        u_xlat15.x = sin(u_xlat7.z);
			        //MAD
			        u_xlat8.y = u_xlat15.x * 0.100000001 + u_xlat6.z;
			        //ADD
			        u_xlat7.w = abs(u_xlat7.y) + 0.600000024;
			        //DP2
			        u_xlat15.x = dot(u_xlat7.xw, u_xlat7.xw);
			        //SQRT
			        u_xlat8.x = sqrt(u_xlat15.x);
			        //ADD
			        u_xlat15.xy = abs(u_xlat8.xy) + float2(-0.699999988, -0.00999999978);
			        //MAX
			        u_xlat39 = max(u_xlat15.y, u_xlat15.x);
			        //MIN
			        u_xlat39 = min(u_xlat39, 0.0);
			        //MAX
			        u_xlat15.xy = max(u_xlat15.xy, float2(0.0, 0.0));
			        //DP2
			        u_xlat15.x = dot(u_xlat15.xy, u_xlat15.xy);
			        //SQRT
			        u_xlat15.x = sqrt(u_xlat15.x);
			        //ADD
			        u_xlat15.x = u_xlat15.x + u_xlat39;
			        //MOV
			        u_xlat8.zw = u_xlat7.xy;
			        //ADD
			        u_xlat7.xyz = u_xlat8.zyw + float3(-0.0, -0.00999999978, -0.0);
			        //ADD
			        u_xlat7.xyz = abs(u_xlat7.xyz) + float3(-0.449999988, -0.0130000003, -0.00100000005);
			        //MAX
			        u_xlat27.x = max(u_xlat7.z, u_xlat7.y);
			        //MAX
			        u_xlat27.x = max(u_xlat27.x, u_xlat7.x);
			        //MIN
			        u_xlat27.x = min(u_xlat27.x, 0.0);
			        //MAX
			        u_xlat7.xyz = max(u_xlat7.xyz, float3(0.0, 0.0, 0.0));
			        //DP3
			        u_xlat39 = dot(u_xlat7.xyz, u_xlat7.xyz);
			        //SQRT
			        u_xlat39 = sqrt(u_xlat39);
			        //ADD
			        u_xlat27.x = u_xlat39 + u_xlat27.x;
			        //ADD
			        u_xlat39 = (-u_xlat15.x) + u_xlat27.x;
			        //MAD
			        u_xlat39 = u_xlat39 * 10.0 + 0.5;
			        u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
			        //ADD
			        u_xlat15.x = (-u_xlat27.x) + u_xlat15.x;
			        //MAD
			        u_xlat15.x = u_xlat39 * u_xlat15.x + u_xlat27.x;
			        //MUL
			        u_xlat27.x = u_xlat39 * 0.0500000007;
			        //ADD
			        u_xlat39 = (-u_xlat39) + 1.0;
			        //MAD
			        u_xlat15.x = (-u_xlat27.x) * u_xlat39 + u_xlat15.x;
			        //MUL
			        u_xlat27.x = u_xlat6.z * 4.0;
			        //SINCOS
			        u_xlat27.x = sin(u_xlat27.x);
			        //MAD
			        u_xlat27.x = u_xlat27.x * 0.100000001 + u_xlat6.y;
			        //ADD
			        u_xlat7.x = u_xlat27.x + -0.0500000007;
			        //MOV
			        u_xlat7.yw = u_xlat6.wz;
			        //DP2
			        u_xlat27.x = dot(u_xlat7.xy, u_xlat7.xy);
			        //SQRT
			        u_xlat7.z = sqrt(u_xlat27.x);
			        //ADD
			        u_xlat27.xy = abs(u_xlat7.zw) + float2(-0.0399999991, -0.699999988);
			        //MAX
			        u_xlat40 = max(u_xlat27.y, u_xlat27.x);
			        //MIN
			        u_xlat40 = min(u_xlat40, 0.0);
			        //MAX
			        u_xlat27.xy = max(u_xlat27.xy, float2(0.0, 0.0));
			        //DP2
			        u_xlat27.x = dot(u_xlat27.xy, u_xlat27.xy);
			        //SQRT
			        u_xlat27.x = sqrt(u_xlat27.x);
			        //ADD
			        u_xlat27.x = u_xlat27.x + u_xlat40;
			        //ADD
			        u_xlat39 = (-u_xlat15.x) + u_xlat27.x;
			        //MAD
			        u_xlat39 = u_xlat39 * 1.66666663 + 0.5;
			        u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
			        //ADD
			        u_xlat15.x = (-u_xlat27.x) + u_xlat15.x;
			        //MAD
			        u_xlat15.x = u_xlat39 * u_xlat15.x + u_xlat27.x;
			        //MUL
			        u_xlat27.x = u_xlat39 * 0.300000012;
			        //ADD
			        u_xlat39 = (-u_xlat39) + 1.0;
			        //MAD
			        u_xlat15.x = (-u_xlat27.x) * u_xlat39 + u_xlat15.x;
			        //MOV
			        u_xlat27.x = u_xlat5.y;
			        u_xlat27.x = clamp(u_xlat27.x, 0.0, 1.0);
			        //MAD
			        u_xlat39 = u_xlat27.x * -2.0 + 3.0;
			        //MUL
			        u_xlat27.x = u_xlat27.x * u_xlat27.x;
			        //MOV
			        u_xlat6.x = u_xlat6.x;
			        u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
			        //MAD
			        u_xlat40 = u_xlat6.x * -2.0 + 3.0;
			        //MUL
			        u_xlat41 = u_xlat6.x * u_xlat6.x;
			        //MUL
			        u_xlat40 = u_xlat40 * u_xlat41;
			        //MUL
			        u_xlat40 = u_xlat40 * 3.0;
			        //MAD
			        u_xlat27.x = u_xlat39 * u_xlat27.x + (-u_xlat40);
			        //MAD
			        u_xlat27.x = (-u_xlat27.x) * 0.159999996 + 1.0;
			        //MUL
			        u_xlat5.xzw = u_xlat27.xxx * u_xlat5.xyz;
			        //MUL
			        u_xlat27.y = u_xlat5.z * 2.22222233;
			        u_xlat27.y = clamp(u_xlat27.y, 0.0, 1.0);
			        //MAD
			        u_xlat40 = u_xlat27.y * -2.0 + 3.0;
			        //MAD
			        u_xlat27.x = u_xlat5.y * u_xlat27.x + -0.449999988;
			        //MUL
			        u_xlat27.x = u_xlat27.x * 2.22222233;
			        u_xlat27.x = clamp(u_xlat27.x, 0.0, 1.0);
			        //MAD
			        u_xlat17.x = u_xlat27.x * -2.0 + 3.0;
			        //MUL
			        u_xlat27.xy = u_xlat27.xy * u_xlat27.xy;
			        //MUL
			        u_xlat27.x = u_xlat27.x * u_xlat17.x;
			        //MAD
			        u_xlat27.x = u_xlat40 * u_xlat27.y + (-u_xlat27.x);
			        //MAD
			        u_xlat27.x = (-u_xlat27.x) * 0.0700000003 + 1.0;
			        //MUL
			        u_xlat6.xyz = u_xlat27.xxx * u_xlat5.xwz;
			        //MAD
			        u_xlat27.x = u_xlat5.z * u_xlat27.x + 0.600000024;
			        //MUL
			        u_xlat27.x = u_xlat27.x * 1.25;
			        u_xlat27.x = clamp(u_xlat27.x, 0.0, 1.0);
			        //MAD
			        u_xlat39 = u_xlat27.x * -2.0 + 3.0;
			        //MUL
			        u_xlat27.x = u_xlat27.x * u_xlat27.x;
			        //MAD
			        u_xlat27.x = (-u_xlat39) * u_xlat27.x + 1.0;
			        //MAD
			        u_xlat27.x = u_xlat27.x * 0.200000003 + 1.0;
			        //MUL
			        u_xlat6.xy = u_xlat27.xx * u_xlat6.xy;
			        //MUL
			        u_xlat6.w = u_xlat6.z * 0.800000012;
			        //MUL
			        u_xlat5.xyz = u_xlat6.xzy * float3(0.449999988, 0.359999985, 0.449999988);
			        //DP3
			        u_xlat27.x = dot(u_xlat6.xyw, u_xlat6.xyw);
			        //RSQ
			        u_xlat39 = rsqrt(u_xlat27.x);
			        //MUL
			        u_xlat7 = (float4)(u_xlat39) * u_xlat6.xxwy;
			        //MAD
			        u_xlat8.xy = u_xlat6.xz * float2(0.449999988, 0.359999985) + float2(-0.140000001, -0.140000001);
			        //SAMPLE_L
			        u_xlat8 = tex2Dlod(_NoiseTex, float4(u_xlat8.xy, 0.0,1.5));
			        //SAMPLE_L
			        u_xlat9 = tex2Dlod(_NoiseTex, float4(u_xlat5.xz, 0.0,0.0));
			        //SAMPLE_L
			        u_xlat5 = tex2Dlod(_NoiseTex, float4(u_xlat5.yz, 0.0,1.5));
			        //MUL
			        u_xlat40 = abs(u_xlat7.z) * u_xlat9.x;
			        //MAD
			        u_xlat40 = u_xlat8.x * abs(u_xlat7.w) + u_xlat40;
			        //MAD
			        u_xlat40 = u_xlat5.x * abs(u_xlat7.y) + u_xlat40;
			        //SQRT
			        u_xlat27.x = sqrt(u_xlat27.x);
			        //ADD
			        u_xlat27.x = u_xlat27.x + -1.0;
			        //MAD
			        u_xlat27.x = (-u_xlat40) * 0.100000001 + u_xlat27.x;
			        //MIN
			        u_xlat40 = min(abs(u_xlat7.y), abs(u_xlat7.z));
			        //MAX
			        u_xlat5.x = max(abs(u_xlat7.y), abs(u_xlat7.z));
			        //DIV
			        u_xlat5.x = float(1.0) / u_xlat5.x;
			        //MUL
			        u_xlat40 = u_xlat40 * u_xlat5.x;
			        //MUL
			        u_xlat5.x = u_xlat40 * u_xlat40;
			        //MAD
			        u_xlat17.x = u_xlat5.x * 0.0208350997 + -0.0851330012;
			        //MAD
			        u_xlat17.x = u_xlat5.x * u_xlat17.x + 0.180141002;
			        //MAD
			        u_xlat17.x = u_xlat5.x * u_xlat17.x + -0.330299497;
			        //MAD
			        u_xlat5.x = u_xlat5.x * u_xlat17.x + 0.999866009;
			        //MUL
			        u_xlat17.x = u_xlat40 * u_xlat5.x;
			        //LT
			        u_xlatb29 = abs(u_xlat7.y)<abs(u_xlat7.z);
			        //MAD
			        u_xlat17.x = u_xlat17.x * -2.0 + 1.57079637;
			        //AND
			        u_xlat17.x = u_xlatb29 ? u_xlat17.x : float(0.0);
			        //MAD
			        u_xlat40 = u_xlat40 * u_xlat5.x + u_xlat17.x;
			        //LT
			        u_xlatb5 = u_xlat7.y<(-u_xlat7.x);
			        //AND
			        u_xlat5.x = u_xlatb5 ? -3.14159274 : float(0.0);
			        //ADD
			        u_xlat40 = u_xlat40 + u_xlat5.x;
			        //MIN
			        u_xlat5.x = min(u_xlat7.y, u_xlat7.z);
			        //MAX
			        u_xlat17.x = max(u_xlat7.y, u_xlat7.z);
			        //LT
			        u_xlatb5 = u_xlat5.x<(-u_xlat5.x);
			        //GE
			        u_xlatb17 = u_xlat17.x>=(-u_xlat17.x);
			        //AND
			        u_xlatb5 = u_xlatb17 && u_xlatb5;
			        //MOVC
			        u_xlat40 = (u_xlatb5) ? (-u_xlat40) : u_xlat40;
			        //MIN
			        u_xlat5.x = min(u_xlat40, 3.14159012);
			        //MAD
			        u_xlat40 = (-u_xlat7.w) * u_xlat7.w + 1.0;
			        //MUL
			        u_xlat40 = u_xlat40 * 899.175598;
			        //LOG
			        u_xlat40 = log2(u_xlat40);
			        //MUL
			        u_xlat40 = u_xlat40 * 0.720210016;
			        //ROUND_NI
			        u_xlat40 = floor(u_xlat40);
			        //MAX
			        u_xlat40 = max(u_xlat40, 2.0);
			        //MUL
			        u_xlat40 = u_xlat40 * 0.694241941;
			        //EXP
			        u_xlat40 = exp2(u_xlat40);
			        //MUL
			        u_xlat29.xy = (float2)(u_xlat40) * float2(0.44721359, 0.723606825);
			        //ROUND_NE
			        u_xlat29.xy = round(u_xlat29.xy);
			        //ADD
			        u_xlat7.xy = u_xlat29.yx + float2(1.0, 1.0);
			        //MUL
			        u_xlat31.xy = u_xlat7.xy * float2(0.618034005, 0.618034005);
			        //ROUND_NI
			        u_xlat31.xy = floor(u_xlat31.xy);
			        //MAD
			        u_xlat7.xy = u_xlat7.xy * float2(0.618034005, 0.618034005) + (-u_xlat31.xy);
			        //MAD
			        u_xlat7.xy = u_xlat7.xy * float2(6.28318024, 6.28318024) + float2(-3.88321877, -3.88321877);
			        //MUL
			        u_xlat29.xy = u_xlat29.xy * float2(-0.015625, -0.015625);
			        //MUL
			        u_xlat40 = u_xlat29.x * u_xlat7.x;
			        //MAD
			        u_xlat40 = u_xlat7.y * u_xlat29.y + (-u_xlat40);
			        //MUL
			        u_xlat8.xz = u_xlat29.yx * float2(1.0, -1.0);
			        //MUL
			        u_xlat8.yw = u_xlat7.xy * float2(-1.0, 1.0);
			        //DIV
			        u_xlat7 = u_xlat8 / (float4)(u_xlat40);
			        //MAD
			        u_xlat5.y = u_xlat6.y * u_xlat39 + -0.9921875;
			        //DP2
			        u_xlat40 = dot(u_xlat7.xy, u_xlat5.xy);
			        //DP2
			        u_xlat5.x = dot(u_xlat7.zw, u_xlat5.xy);
			        //ROUND_NI
			        u_xlat7.x = floor(u_xlat40);
			        //ROUND_NI
			        u_xlat7.y = floor(u_xlat5.x);
			        //MOV
			        u_xlat8.x = float(100000.0);
			        //MOV
			        u_xlat8.y = float(0.0);
			        //MOV
			        u_xlat8.z = float(0.0);
			        //MOV
			        u_xlat8.w = float(0.0);
			        //LOOP
			        for(uint u_xlatu_loop_3 = 0u ; u_xlatu_loop_3<4u ; u_xlatu_loop_3++)
			        {
			            //AND
			            u_xlatu5.x = u_xlatu_loop_3 & 1u;
			            //USHR
			            u_xlatu5.y = u_xlatu_loop_3 >> 1u;
			            //UTOF
			            u_xlat9.xy = float2(u_xlatu5.xy);
			            //ADD
			            u_xlat5.xy = u_xlat7.xy + u_xlat9.xy;
			            //DP2
			            u_xlat5.x = dot(u_xlat29.xy, u_xlat5.xy);
			            //ADD
			            u_xlat5.x = u_xlat5.x + 0.9921875;
			            //MAX
			            u_xlat17.x = max(u_xlat5.x, -1.0);
			            //MIN
			            u_xlat17.x = min(u_xlat17.x, 1.0);
			            //MAD
			            u_xlat5.x = u_xlat17.x * 2.0 + (-u_xlat5.x);
			            //MAD
			            u_xlat5.x = (-u_xlat5.x) * 64.0 + 64.0;
			            //ROUND_NI
			            u_xlat5.x = floor(u_xlat5.x);
			            //MUL
			            u_xlat17.x = u_xlat5.x * 0.618034005;
			            //ROUND_NI
			            u_xlat17.x = floor(u_xlat17.x);
			            //MAD
			            u_xlat17.x = u_xlat5.x * 0.618034005 + (-u_xlat17.x);
			            //MUL
			            u_xlat17.x = u_xlat17.x * 6.28318024;
			            //MAD
			            u_xlat5.x = u_xlat5.x * 2.0 + 1.0;
			            //MAD
			            u_xlat9.w = (-u_xlat5.x) * 0.0078125 + 1.0;
			            //MAD
			            u_xlat5.x = (-u_xlat9.w) * u_xlat9.w + 1.0;
			            //SQRT
			            u_xlat5.x = sqrt(u_xlat5.x);
			            //SINCOS
			            u_xlat10.x = sin(u_xlat17.x);
			            u_xlat11.x = cos(u_xlat17.x);
			            //MUL
			            u_xlat9.y = u_xlat5.x * u_xlat11.x;
			            //MUL
			            u_xlat9.z = u_xlat5.x * u_xlat10.x;
			            //MAD
			            u_xlat10.xyz = (-u_xlat6.xwy) * (float3)(u_xlat39) + u_xlat9.yzw;
			            //DP3
			            u_xlat9.x = dot(u_xlat10.xyz, u_xlat10.xyz);
			            //LT
			            u_xlatb5 = u_xlat9.x<u_xlat8.x;
			            //MOVC
			            u_xlat8 = ((bool)(u_xlatb5)) ? u_xlat9 : u_xlat8;
			        //ENDLOOP
			        }
			        //MAD
			        u_xlat5.xyz = (-u_xlat8.yzw) * float3(1.01999998, 1.01999998, 1.01999998) + u_xlat6.xwy;
			        //DP3
			        u_xlat39 = dot(u_xlat5.xyz, u_xlat5.xyz);
			        //SQRT
			        u_xlat39 = sqrt(u_xlat39);
			        //ADD
			        u_xlat39 = u_xlat39 + -0.0599999987;
			        //ADD
			        u_xlat40 = (-u_xlat39) + u_xlat27.x;
			        //MAD
			        u_xlat40 = u_xlat40 * 50.0 + 0.5;
			        u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
			        //ADD
			        u_xlat39 = (-u_xlat27.x) + u_xlat39;
			        //MAD
			        u_xlat39 = u_xlat40 * u_xlat39 + u_xlat27.x;
			        //MUL
			        u_xlat5.x = u_xlat40 * 0.00999999978;
			        //ADD
			        u_xlat40 = (-u_xlat40) + 1.0;
			        //MAD
			        u_xlat39 = (-u_xlat5.x) * u_xlat40 + u_xlat39;
			        //LT
			        u_xlatb40 = u_xlat39<u_xlat27.x;
			        //MOVC
			        u_xlat27.x = (u_xlatb40) ? u_xlat39 : u_xlat27.x;
			        //LT
			        u_xlatb39 = u_xlat15.x<u_xlat27.x;
			        //MOVC
			        u_xlat15.x = (u_xlatb39) ? u_xlat15.x : u_xlat27.x;
			        //MUL
			        u_xlat5.x = u_xlat15.x * 0.300000012;
			    //ELSE
			    } else {
			        //MOV
			        u_xlat5.x = 1.0;
			    //ENDIF
			    }
			    //ADD
			    u_xlat15.xyz = u_xlat0.xyz + u_xlat4.yzy;
			    //MAD
			    u_xlat18.z = u_xlat15.z * 3.33333325 + (-u_xlat36);
			    //ADD
			    u_xlat15.z = u_xlat18.z + 3.0;
			    //MUL
			    u_xlat15.xyz = u_xlat15.xyz * float3(3.33333325, 3.33333325, 0.0500000007);
			    //SINCOS
			    u_xlat6.x = sin(u_xlat15.z);
			    u_xlat7.x = cos(u_xlat15.z);
			    //MOV
			    u_xlat8.x = (-u_xlat6.x);
			    //MOV
			    u_xlat8.y = u_xlat7.x;
			    //MOV
			    u_xlat8.z = u_xlat6.x;
			    //DP2
			    u_xlat18.x = dot(u_xlat15.xy, u_xlat8.yz);
			    //DP2
			    u_xlat18.y = dot(u_xlat15.xy, u_xlat8.xy);
			    //ADD
			    u_xlat15.xyz = u_xlat18.xyz + float3(3.0, 3.0, 3.0);
			    //MUL
			    u_xlat6.xyz = u_xlat15.xyz * float3(0.166666672, 0.166666672, 0.166666672);
			    //ROUND_NI
			    u_xlat6.xyz = floor(u_xlat6.xyz);
			    //EQ
			    u_xlatb7.xy = ((u_xlat6.xyxx) == (float4(0.0, 0.0, 0.0, 0.0))).xy;
			    //OR
			    u_xlatb40 = u_xlatb7.y || u_xlatb7.x;
			    //IF
			    if(!u_xlatb40){
			        //MAD
			        u_xlat15.xyz = (-u_xlat6.xyz) * float3(6.0, 6.0, 6.0) + u_xlat15.xyz;
			        //ADD
			        u_xlat7.yzw = u_xlat15.xyz + float3(-3.0, -3.0, -3.0);
			        //MAD
			        u_xlat15.xyz = _Time.yyy * float3(1.29999995, 0.800000012, 1.20000005) + u_xlat6.xyz;
			        //SINCOS
			        u_xlat8.x = sin(u_xlat15.x);
			        u_xlat9.x = cos(u_xlat15.x);
			        //MOV
			        u_xlat10.x = (-u_xlat8.x);
			        //MOV
			        u_xlat10.y = u_xlat9.x;
			        //MOV
			        u_xlat10.z = u_xlat8.x;
			        //DP2
			        u_xlat7.x = dot(u_xlat7.yz, u_xlat10.yz);
			        //DP2
			        u_xlat8.x = dot(u_xlat7.yz, u_xlat10.xy);
			        //SINCOS
			        u_xlat9.x = sin(u_xlat15.y);
			        u_xlat10.x = cos(u_xlat15.y);
			        //MOV
			        u_xlat11.x = (-u_xlat9.x);
			        //MOV
			        u_xlat11.y = u_xlat10.x;
			        //MOV
			        u_xlat11.z = u_xlat9.x;
			        //DP2
			        u_xlat9.x = dot(u_xlat7.xw, u_xlat11.yz);
			        //DP2
			        u_xlat8.y = dot(u_xlat7.xw, u_xlat11.xy);
			        //SINCOS
			        u_xlat7.x = sin(u_xlat15.z);
			        u_xlat10.x = cos(u_xlat15.z);
			        //MOV
			        u_xlat11.x = (-u_xlat7.x);
			        //MOV
			        u_xlat11.y = u_xlat10.x;
			        //MOV
			        u_xlat11.z = u_xlat7.x;
			        //DP2
			        u_xlat9.y = dot(u_xlat8.xy, u_xlat11.yz);
			        //DP2
			        u_xlat9.z = dot(u_xlat8.xy, u_xlat11.xy);
			        //ADD
			        u_xlat15.x = u_xlat6.x + _Time.y;
			        //SINCOS
			        u_xlat15.x = sin(u_xlat15.x);
			        //MAD
			        u_xlat15.x = u_xlat15.x * 0.5 + 0.5;
			        //MAD
			        u_xlat15.x = u_xlat15.x * 0.199999988 + 0.800000012;
			        //MUL
			        u_xlat6.xyz = u_xlat15.xxx * u_xlat9.xyz;
			        //MAD
			        u_xlat7 = u_xlat9.yxyz * u_xlat15.xxxx + float4(-1.0, -0.0, -1.32000005, -0.0);
			        //MIN
			        u_xlat15.x = min(abs(u_xlat7.y), abs(u_xlat7.w));
			        //MAX
			        u_xlat27.x = max(abs(u_xlat7.y), abs(u_xlat7.w));
			        //DIV
			        u_xlat27.x = float(1.0) / u_xlat27.x;
			        //MUL
			        u_xlat15.x = u_xlat27.x * u_xlat15.x;
			        //MUL
			        u_xlat27.x = u_xlat15.x * u_xlat15.x;
			        //MAD
			        u_xlat39 = u_xlat27.x * 0.0208350997 + -0.0851330012;
			        //MAD
			        u_xlat39 = u_xlat27.x * u_xlat39 + 0.180141002;
			        //MAD
			        u_xlat39 = u_xlat27.x * u_xlat39 + -0.330299497;
			        //MAD
			        u_xlat27.x = u_xlat27.x * u_xlat39 + 0.999866009;
			        //MUL
			        u_xlat39 = u_xlat27.x * u_xlat15.x;
			        //LT
			        u_xlatb40 = abs(u_xlat7.y)<abs(u_xlat7.w);
			        //MAD
			        u_xlat39 = u_xlat39 * -2.0 + 1.57079637;
			        //AND
			        u_xlat39 = u_xlatb40 ? u_xlat39 : float(0.0);
			        //MAD
			        u_xlat15.x = u_xlat15.x * u_xlat27.x + u_xlat39;
			        //LT
			        u_xlatb27 = u_xlat7.y<(-u_xlat7.y);
			        //AND
			        u_xlat27.x = u_xlatb27 ? -3.14159274 : float(0.0);
			        //ADD
			        u_xlat15.x = u_xlat27.x + u_xlat15.x;
			        //MIN
			        u_xlat27.x = min(u_xlat7.y, u_xlat7.w);
			        //MAX
			        u_xlat39 = max(u_xlat7.y, u_xlat7.w);
			        //LT
			        u_xlatb27 = u_xlat27.x<(-u_xlat27.x);
			        //GE
			        u_xlatb39 = u_xlat39>=(-u_xlat39);
			        //AND
			        u_xlatb27 = u_xlatb39 && u_xlatb27;
			        //MOVC
			        u_xlat15.x = (u_xlatb27) ? (-u_xlat15.x) : u_xlat15.x;
			        //DP2
			        u_xlat27.x = dot(u_xlat7.yw, u_xlat7.yw);
			        //SQRT
			        u_xlat27.x = sqrt(u_xlat27.x);
			        //ADD
			        u_xlat15.x = u_xlat15.x + 0.314159274;
			        //MUL
			        u_xlat39 = u_xlat15.x * 1.5915494;
			        //ROUND_NI
			        u_xlat39 = floor(u_xlat39);
			        //MAD
			        u_xlat15.x = (-u_xlat39) * 0.628318548 + u_xlat15.x;
			        //ADD
			        u_xlat15.x = u_xlat15.x + -0.314159274;
			        //SINCOS
			        u_xlat8.x = sin(u_xlat15.x);
			        u_xlat9.x = cos(u_xlat15.x);
			        //MOV
			        u_xlat9.xz = u_xlat9.xx;
			        //MOV
			        u_xlat9.y = u_xlat8.x;
			        //MUL
			        u_xlat15.xyz = u_xlat27.xxx * u_xlat9.xyz;
			        //MAD
			        u_xlat15.xyz = u_xlat15.xyz * float3(2.0, 2.0, 2.0) + float3(-1.0, -0.0, -1.0);
			        //MUL
			        u_xlat8.xyz = u_xlat15.xyz * float3(0.5, 0.5, 3.0);
			        //SINCOS
			        u_xlat15.x = sin(u_xlat8.z);
			        //MAD
			        u_xlat9.y = u_xlat15.x * 0.100000001 + u_xlat7.z;
			        //ADD
			        u_xlat8.w = abs(u_xlat8.y) + 0.600000024;
			        //DP2
			        u_xlat15.x = dot(u_xlat8.xw, u_xlat8.xw);
			        //SQRT
			        u_xlat9.x = sqrt(u_xlat15.x);
			        //ADD
			        u_xlat15.xy = abs(u_xlat9.xy) + float2(-0.699999988, -0.00999999978);
			        //MAX
			        u_xlat39 = max(u_xlat15.y, u_xlat15.x);
			        //MIN
			        u_xlat39 = min(u_xlat39, 0.0);
			        //MAX
			        u_xlat15.xy = max(u_xlat15.xy, float2(0.0, 0.0));
			        //DP2
			        u_xlat15.x = dot(u_xlat15.xy, u_xlat15.xy);
			        //SQRT
			        u_xlat15.x = sqrt(u_xlat15.x);
			        //ADD
			        u_xlat15.x = u_xlat15.x + u_xlat39;
			        //MOV
			        u_xlat9.zw = u_xlat8.xy;
			        //ADD
			        u_xlat8.xyz = u_xlat9.zyw + float3(-0.0, -0.00999999978, -0.0);
			        //ADD
			        u_xlat8.xyz = abs(u_xlat8.xyz) + float3(-0.449999988, -0.0130000003, -0.00100000005);
			        //MAX
			        u_xlat27.x = max(u_xlat8.z, u_xlat8.y);
			        //MAX
			        u_xlat27.x = max(u_xlat27.x, u_xlat8.x);
			        //MIN
			        u_xlat27.x = min(u_xlat27.x, 0.0);
			        //MAX
			        u_xlat8.xyz = max(u_xlat8.xyz, float3(0.0, 0.0, 0.0));
			        //DP3
			        u_xlat39 = dot(u_xlat8.xyz, u_xlat8.xyz);
			        //SQRT
			        u_xlat39 = sqrt(u_xlat39);
			        //ADD
			        u_xlat27.x = u_xlat39 + u_xlat27.x;
			        //ADD
			        u_xlat39 = (-u_xlat15.x) + u_xlat27.x;
			        //MAD
			        u_xlat39 = u_xlat39 * 10.0 + 0.5;
			        u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
			        //ADD
			        u_xlat15.x = (-u_xlat27.x) + u_xlat15.x;
			        //MAD
			        u_xlat15.x = u_xlat39 * u_xlat15.x + u_xlat27.x;
			        //MUL
			        u_xlat27.x = u_xlat39 * 0.0500000007;
			        //ADD
			        u_xlat39 = (-u_xlat39) + 1.0;
			        //MAD
			        u_xlat15.x = (-u_xlat27.x) * u_xlat39 + u_xlat15.x;
			        //MUL
			        u_xlat27.x = u_xlat7.z * 4.0;
			        //SINCOS
			        u_xlat27.x = sin(u_xlat27.x);
			        //MAD
			        u_xlat27.x = u_xlat27.x * 0.100000001 + u_xlat7.y;
			        //ADD
			        u_xlat8.x = u_xlat27.x + -0.0500000007;
			        //MOV
			        u_xlat8.yw = u_xlat7.wz;
			        //DP2
			        u_xlat27.x = dot(u_xlat8.xy, u_xlat8.xy);
			        //SQRT
			        u_xlat8.z = sqrt(u_xlat27.x);
			        //ADD
			        u_xlat27.xy = abs(u_xlat8.zw) + float2(-0.0399999991, -0.699999988);
			        //MAX
			        u_xlat40 = max(u_xlat27.y, u_xlat27.x);
			        //MIN
			        u_xlat40 = min(u_xlat40, 0.0);
			        //MAX
			        u_xlat27.xy = max(u_xlat27.xy, float2(0.0, 0.0));
			        //DP2
			        u_xlat27.x = dot(u_xlat27.xy, u_xlat27.xy);
			        //SQRT
			        u_xlat27.x = sqrt(u_xlat27.x);
			        //ADD
			        u_xlat27.x = u_xlat27.x + u_xlat40;
			        //ADD
			        u_xlat39 = (-u_xlat15.x) + u_xlat27.x;
			        //MAD
			        u_xlat39 = u_xlat39 * 1.66666663 + 0.5;
			        u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
			        //ADD
			        u_xlat15.x = (-u_xlat27.x) + u_xlat15.x;
			        //MAD
			        u_xlat15.x = u_xlat39 * u_xlat15.x + u_xlat27.x;
			        //MUL
			        u_xlat27.x = u_xlat39 * 0.300000012;
			        //ADD
			        u_xlat39 = (-u_xlat39) + 1.0;
			        //MAD
			        u_xlat15.x = (-u_xlat27.x) * u_xlat39 + u_xlat15.x;
			        //MOV
			        u_xlat27.x = u_xlat6.y;
			        u_xlat27.x = clamp(u_xlat27.x, 0.0, 1.0);
			        //MAD
			        u_xlat39 = u_xlat27.x * -2.0 + 3.0;
			        //MUL
			        u_xlat27.x = u_xlat27.x * u_xlat27.x;
			        //MOV
			        u_xlat7.x = u_xlat7.x;
			        u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
			        //MAD
			        u_xlat40 = u_xlat7.x * -2.0 + 3.0;
			        //MUL
			        u_xlat41 = u_xlat7.x * u_xlat7.x;
			        //MUL
			        u_xlat40 = u_xlat40 * u_xlat41;
			        //MUL
			        u_xlat40 = u_xlat40 * 3.0;
			        //MAD
			        u_xlat27.x = u_xlat39 * u_xlat27.x + (-u_xlat40);
			        //MAD
			        u_xlat27.x = (-u_xlat27.x) * 0.159999996 + 1.0;
			        //MUL
			        u_xlat6.xzw = u_xlat27.xxx * u_xlat6.xyz;
			        //MUL
			        u_xlat27.y = u_xlat6.z * 2.22222233;
			        u_xlat27.y = clamp(u_xlat27.y, 0.0, 1.0);
			        //MAD
			        u_xlat40 = u_xlat27.y * -2.0 + 3.0;
			        //MAD
			        u_xlat27.x = u_xlat6.y * u_xlat27.x + -0.449999988;
			        //MUL
			        u_xlat27.x = u_xlat27.x * 2.22222233;
			        u_xlat27.x = clamp(u_xlat27.x, 0.0, 1.0);
			        //MAD
			        u_xlat41 = u_xlat27.x * -2.0 + 3.0;
			        //MUL
			        u_xlat27.xy = u_xlat27.xy * u_xlat27.xy;
			        //MUL
			        u_xlat27.x = u_xlat27.x * u_xlat41;
			        //MAD
			        u_xlat27.x = u_xlat40 * u_xlat27.y + (-u_xlat27.x);
			        //MAD
			        u_xlat27.x = (-u_xlat27.x) * 0.0700000003 + 1.0;
			        //MUL
			        u_xlat7.xyz = u_xlat27.xxx * u_xlat6.xwz;
			        //MAD
			        u_xlat27.x = u_xlat6.z * u_xlat27.x + 0.600000024;
			        //MUL
			        u_xlat27.x = u_xlat27.x * 1.25;
			        u_xlat27.x = clamp(u_xlat27.x, 0.0, 1.0);
			        //MAD
			        u_xlat39 = u_xlat27.x * -2.0 + 3.0;
			        //MUL
			        u_xlat27.x = u_xlat27.x * u_xlat27.x;
			        //MAD
			        u_xlat27.x = (-u_xlat39) * u_xlat27.x + 1.0;
			        //MAD
			        u_xlat27.x = u_xlat27.x * 0.200000003 + 1.0;
			        //MUL
			        u_xlat7.xy = u_xlat27.xx * u_xlat7.xy;
			        //MUL
			        u_xlat7.w = u_xlat7.z * 0.800000012;
			        //MUL
			        u_xlat6.xyz = u_xlat7.xzy * float3(0.449999988, 0.359999985, 0.449999988);
			        //DP3
			        u_xlat27.x = dot(u_xlat7.xyw, u_xlat7.xyw);
			        //RSQ
			        u_xlat39 = rsqrt(u_xlat27.x);
			        //MUL
			        u_xlat8 = (float4)(u_xlat39) * u_xlat7.xxwy;
			        //MAD
			        u_xlat9.xy = u_xlat7.xz * float2(0.449999988, 0.359999985) + float2(-0.140000001, -0.140000001);
			        //SAMPLE_L
			        u_xlat9 = tex2Dlod(_NoiseTex, float4(u_xlat9.xy, 0.0,1.5));
			        //SAMPLE_L
			        u_xlat10 = tex2Dlod(_NoiseTex, float4(u_xlat6.xz, 0.0,0.0));
			        //SAMPLE_L
			        u_xlat6 = tex2Dlod(_NoiseTex, float4(u_xlat6.yz, 0.0,1.5));
			        //MUL
			        u_xlat40 = abs(u_xlat8.z) * u_xlat10.x;
			        //MAD
			        u_xlat40 = u_xlat9.x * abs(u_xlat8.w) + u_xlat40;
			        //MAD
			        u_xlat40 = u_xlat6.x * abs(u_xlat8.y) + u_xlat40;
			        //SQRT
			        u_xlat27.x = sqrt(u_xlat27.x);
			        //ADD
			        u_xlat27.x = u_xlat27.x + -1.0;
			        //MAD
			        u_xlat27.x = (-u_xlat40) * 0.100000001 + u_xlat27.x;
			        //MIN
			        u_xlat40 = min(abs(u_xlat8.y), abs(u_xlat8.z));
			        //MAX
			        u_xlat41 = max(abs(u_xlat8.y), abs(u_xlat8.z));
			        //DIV
			        u_xlat41 = float(1.0) / u_xlat41;
			        //MUL
			        u_xlat40 = u_xlat40 * u_xlat41;
			        //MUL
			        u_xlat41 = u_xlat40 * u_xlat40;
			        //MAD
			        u_xlat6.x = u_xlat41 * 0.0208350997 + -0.0851330012;
			        //MAD
			        u_xlat6.x = u_xlat41 * u_xlat6.x + 0.180141002;
			        //MAD
			        u_xlat6.x = u_xlat41 * u_xlat6.x + -0.330299497;
			        //MAD
			        u_xlat41 = u_xlat41 * u_xlat6.x + 0.999866009;
			        //MUL
			        u_xlat6.x = u_xlat40 * u_xlat41;
			        //LT
			        u_xlatb18 = abs(u_xlat8.y)<abs(u_xlat8.z);
			        //MAD
			        u_xlat6.x = u_xlat6.x * -2.0 + 1.57079637;
			        //AND
			        u_xlat6.x = u_xlatb18 ? u_xlat6.x : float(0.0);
			        //MAD
			        u_xlat40 = u_xlat40 * u_xlat41 + u_xlat6.x;
			        //LT
			        u_xlatb41 = u_xlat8.y<(-u_xlat8.x);
			        //AND
			        u_xlat41 = u_xlatb41 ? -3.14159274 : float(0.0);
			        //ADD
			        u_xlat40 = u_xlat40 + u_xlat41;
			        //MIN
			        u_xlat41 = min(u_xlat8.y, u_xlat8.z);
			        //MAX
			        u_xlat6.x = max(u_xlat8.y, u_xlat8.z);
			        //LT
			        u_xlatb41 = u_xlat41<(-u_xlat41);
			        //GE
			        u_xlatb6.x = u_xlat6.x>=(-u_xlat6.x);
			        //AND
			        u_xlatb41 = u_xlatb41 && u_xlatb6.x;
			        //MOVC
			        u_xlat40 = (u_xlatb41) ? (-u_xlat40) : u_xlat40;
			        //MIN
			        u_xlat6.x = min(u_xlat40, 3.14159012);
			        //MAD
			        u_xlat40 = (-u_xlat8.w) * u_xlat8.w + 1.0;
			        //MUL
			        u_xlat40 = u_xlat40 * 899.175598;
			        //LOG
			        u_xlat40 = log2(u_xlat40);
			        //MUL
			        u_xlat40 = u_xlat40 * 0.720210016;
			        //ROUND_NI
			        u_xlat40 = floor(u_xlat40);
			        //MAX
			        u_xlat40 = max(u_xlat40, 2.0);
			        //MUL
			        u_xlat40 = u_xlat40 * 0.694241941;
			        //EXP
			        u_xlat40 = exp2(u_xlat40);
			        //MUL
			        u_xlat30.xy = (float2)(u_xlat40) * float2(0.44721359, 0.723606825);
			        //ROUND_NE
			        u_xlat30.xy = round(u_xlat30.xy);
			        //ADD
			        u_xlat8.xy = u_xlat30.yx + float2(1.0, 1.0);
			        //MUL
			        u_xlat32.xy = u_xlat8.xy * float2(0.618034005, 0.618034005);
			        //ROUND_NI
			        u_xlat32.xy = floor(u_xlat32.xy);
			        //MAD
			        u_xlat8.xy = u_xlat8.xy * float2(0.618034005, 0.618034005) + (-u_xlat32.xy);
			        //MAD
			        u_xlat8.xy = u_xlat8.xy * float2(6.28318024, 6.28318024) + float2(-3.88321877, -3.88321877);
			        //MUL
			        u_xlat30.xy = u_xlat30.xy * float2(-0.015625, -0.015625);
			        //MUL
			        u_xlat40 = u_xlat30.x * u_xlat8.x;
			        //MAD
			        u_xlat40 = u_xlat8.y * u_xlat30.y + (-u_xlat40);
			        //MUL
			        u_xlat9.xz = u_xlat30.yx * float2(1.0, -1.0);
			        //MUL
			        u_xlat9.yw = u_xlat8.xy * float2(-1.0, 1.0);
			        //DIV
			        u_xlat8 = u_xlat9 / (float4)(u_xlat40);
			        //MAD
			        u_xlat6.y = u_xlat7.y * u_xlat39 + -0.9921875;
			        //DP2
			        u_xlat40 = dot(u_xlat8.xy, u_xlat6.xy);
			        //DP2
			        u_xlat41 = dot(u_xlat8.zw, u_xlat6.xy);
			        //ROUND_NI
			        u_xlat6.x = floor(u_xlat40);
			        //ROUND_NI
			        u_xlat6.y = floor(u_xlat41);
			        //MOV
			        u_xlat8.x = float(100000.0);
			        //MOV
			        u_xlat8.y = float(0.0);
			        //MOV
			        u_xlat8.z = float(0.0);
			        //MOV
			        u_xlat8.w = float(0.0);
			        //LOOP
			        for(uint u_xlatu_loop_4 = 0u ; u_xlatu_loop_4<4u ; u_xlatu_loop_4++)
			        {
			            //AND
			            u_xlatu41 = u_xlatu_loop_4 & 1u;
			            //USHR
			            u_xlatu31 = u_xlatu_loop_4 >> 1u;
			            //UTOF
			            u_xlat9.x = float(u_xlatu41);
			            //UTOF
			            u_xlat9.y = float(u_xlatu31);
			            //ADD
			            u_xlat9.xy = u_xlat6.xy + u_xlat9.xy;
			            //DP2
			            u_xlat41 = dot(u_xlat30.xy, u_xlat9.xy);
			            //ADD
			            u_xlat41 = u_xlat41 + 0.9921875;
			            //MAX
			            u_xlat31.x = max(u_xlat41, -1.0);
			            //MIN
			            u_xlat31.x = min(u_xlat31.x, 1.0);
			            //MAD
			            u_xlat41 = u_xlat31.x * 2.0 + (-u_xlat41);
			            //MAD
			            u_xlat41 = (-u_xlat41) * 64.0 + 64.0;
			            //ROUND_NI
			            u_xlat41 = floor(u_xlat41);
			            //MUL
			            u_xlat31.x = u_xlat41 * 0.618034005;
			            //ROUND_NI
			            u_xlat31.x = floor(u_xlat31.x);
			            //MAD
			            u_xlat31.x = u_xlat41 * 0.618034005 + (-u_xlat31.x);
			            //MUL
			            u_xlat31.x = u_xlat31.x * 6.28318024;
			            //MAD
			            u_xlat41 = u_xlat41 * 2.0 + 1.0;
			            //MAD
			            u_xlat9.w = (-u_xlat41) * 0.0078125 + 1.0;
			            //MAD
			            u_xlat41 = (-u_xlat9.w) * u_xlat9.w + 1.0;
			            //SQRT
			            u_xlat41 = sqrt(u_xlat41);
			            //SINCOS
			            u_xlat10.x = sin(u_xlat31.x);
			            u_xlat11.x = cos(u_xlat31.x);
			            //MUL
			            u_xlat9.y = u_xlat41 * u_xlat11.x;
			            //MUL
			            u_xlat9.z = u_xlat41 * u_xlat10.x;
			            //MAD
			            u_xlat10.xyz = (-u_xlat7.xwy) * (float3)(u_xlat39) + u_xlat9.yzw;
			            //DP3
			            u_xlat9.x = dot(u_xlat10.xyz, u_xlat10.xyz);
			            //LT
			            u_xlatb41 = u_xlat9.x<u_xlat8.x;
			            //MOVC
			            u_xlat8 = ((bool)(u_xlatb41)) ? u_xlat9 : u_xlat8;
			        //ENDLOOP
			        }
			        //MAD
			        u_xlat6.xyz = (-u_xlat8.yzw) * float3(1.01999998, 1.01999998, 1.01999998) + u_xlat7.xwy;
			        //DP3
			        u_xlat39 = dot(u_xlat6.xyz, u_xlat6.xyz);
			        //SQRT
			        u_xlat39 = sqrt(u_xlat39);
			        //ADD
			        u_xlat39 = u_xlat39 + -0.0599999987;
			        //ADD
			        u_xlat40 = (-u_xlat39) + u_xlat27.x;
			        //MAD
			        u_xlat40 = u_xlat40 * 50.0 + 0.5;
			        u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
			        //ADD
			        u_xlat39 = (-u_xlat27.x) + u_xlat39;
			        //MAD
			        u_xlat39 = u_xlat40 * u_xlat39 + u_xlat27.x;
			        //MUL
			        u_xlat41 = u_xlat40 * 0.00999999978;
			        //ADD
			        u_xlat40 = (-u_xlat40) + 1.0;
			        //MAD
			        u_xlat39 = (-u_xlat41) * u_xlat40 + u_xlat39;
			        //LT
			        u_xlatb40 = u_xlat39<u_xlat27.x;
			        //MOVC
			        u_xlat27.x = (u_xlatb40) ? u_xlat39 : u_xlat27.x;
			        //LT
			        u_xlatb39 = u_xlat15.x<u_xlat27.x;
			        //MOVC
			        u_xlat15.x = (u_xlatb39) ? u_xlat15.x : u_xlat27.x;
			        //MUL
			        u_xlat5.y = u_xlat15.x * 0.300000012;
			    //ELSE
			    } else {
			        //MOV
			        u_xlat5.y = 1.0;
			    //ENDIF
			    }
			    //ADD
			    u_xlat15.xyz = u_xlat0.xyz + u_xlat4.xyz;
			    //MUL
			    u_xlat15.xy = u_xlat15.xy * float2(3.33333325, 3.33333325);
			    //MAD
			    u_xlat16.z = u_xlat15.z * 3.33333325 + (-u_xlat36);
			    //ADD
			    u_xlat36 = u_xlat16.z + 3.0;
			    //MUL
			    u_xlat36 = u_xlat36 * 0.0500000007;
			    //SINCOS
			    u_xlat4.x = sin(u_xlat36);
			    u_xlat6.x = cos(u_xlat36);
			    //MOV
			    u_xlat7.x = (-u_xlat4.x);
			    //MOV
			    u_xlat7.y = u_xlat6.x;
			    //MOV
			    u_xlat7.z = u_xlat4.x;
			    //DP2
			    u_xlat16.x = dot(u_xlat15.xy, u_xlat7.yz);
			    //DP2
			    u_xlat16.y = dot(u_xlat15.xy, u_xlat7.xy);
			    //ADD
			    u_xlat15.xyz = u_xlat16.xyz + float3(3.0, 3.0, 3.0);
			    //MUL
			    u_xlat4.xyz = u_xlat15.xyz * float3(0.166666672, 0.166666672, 0.166666672);
			    //ROUND_NI
			    u_xlat4.xyz = floor(u_xlat4.xyz);
			    //EQ
			    u_xlatb6.xy = ((u_xlat4.xyxx) == (float4(0.0, 0.0, 0.0, 0.0))).xy;
			    //OR
			    u_xlatb36 = u_xlatb6.y || u_xlatb6.x;
			    //IF
			    if(!u_xlatb36){
			        //MAD
			        u_xlat15.xyz = (-u_xlat4.xyz) * float3(6.0, 6.0, 6.0) + u_xlat15.xyz;
			        //ADD
			        u_xlat6.yzw = u_xlat15.xyz + float3(-3.0, -3.0, -3.0);
			        //MAD
			        u_xlat15.xyz = _Time.yyy * float3(1.29999995, 0.800000012, 1.20000005) + u_xlat4.xyz;
			        //SINCOS
			        u_xlat7.x = sin(u_xlat15.x);
			        u_xlat8.x = cos(u_xlat15.x);
			        //MOV
			        u_xlat9.x = (-u_xlat7.x);
			        //MOV
			        u_xlat9.y = u_xlat8.x;
			        //MOV
			        u_xlat9.z = u_xlat7.x;
			        //DP2
			        u_xlat6.x = dot(u_xlat6.yz, u_xlat9.yz);
			        //DP2
			        u_xlat7.x = dot(u_xlat6.yz, u_xlat9.xy);
			        //SINCOS
			        u_xlat8.x = sin(u_xlat15.y);
			        u_xlat9.x = cos(u_xlat15.y);
			        //MOV
			        u_xlat10.x = (-u_xlat8.x);
			        //MOV
			        u_xlat10.y = u_xlat9.x;
			        //MOV
			        u_xlat10.z = u_xlat8.x;
			        //DP2
			        u_xlat8.x = dot(u_xlat6.xw, u_xlat10.yz);
			        //DP2
			        u_xlat7.y = dot(u_xlat6.xw, u_xlat10.xy);
			        //SINCOS
			        u_xlat6.x = sin(u_xlat15.z);
			        u_xlat9.x = cos(u_xlat15.z);
			        //MOV
			        u_xlat10.x = (-u_xlat6.x);
			        //MOV
			        u_xlat10.y = u_xlat9.x;
			        //MOV
			        u_xlat10.z = u_xlat6.x;
			        //DP2
			        u_xlat8.y = dot(u_xlat7.xy, u_xlat10.yz);
			        //DP2
			        u_xlat8.z = dot(u_xlat7.xy, u_xlat10.xy);
			        //ADD
			        u_xlat36 = u_xlat4.x + _Time.y;
			        //SINCOS
			        u_xlat36 = sin(u_xlat36);
			        //MAD
			        u_xlat36 = u_xlat36 * 0.5 + 0.5;
			        //MAD
			        u_xlat36 = u_xlat36 * 0.199999988 + 0.800000012;
			        //MUL
			        u_xlat15.xyz = (float3)(u_xlat36) * u_xlat8.xyz;
			        //MAD
			        u_xlat4 = u_xlat8.yxyz * (float4)(u_xlat36) + float4(-1.0, -0.0, -1.32000005, -0.0);
			        //MIN
			        u_xlat36 = min(abs(u_xlat4.y), abs(u_xlat4.w));
			        //MAX
			        u_xlat41 = max(abs(u_xlat4.y), abs(u_xlat4.w));
			        //DIV
			        u_xlat41 = float(1.0) / u_xlat41;
			        //MUL
			        u_xlat36 = u_xlat36 * u_xlat41;
			        //MUL
			        u_xlat41 = u_xlat36 * u_xlat36;
			        //MAD
			        u_xlat6.x = u_xlat41 * 0.0208350997 + -0.0851330012;
			        //MAD
			        u_xlat6.x = u_xlat41 * u_xlat6.x + 0.180141002;
			        //MAD
			        u_xlat6.x = u_xlat41 * u_xlat6.x + -0.330299497;
			        //MAD
			        u_xlat41 = u_xlat41 * u_xlat6.x + 0.999866009;
			        //MUL
			        u_xlat6.x = u_xlat36 * u_xlat41;
			        //LT
			        u_xlatb18 = abs(u_xlat4.y)<abs(u_xlat4.w);
			        //MAD
			        u_xlat6.x = u_xlat6.x * -2.0 + 1.57079637;
			        //AND
			        u_xlat6.x = u_xlatb18 ? u_xlat6.x : float(0.0);
			        //MAD
			        u_xlat36 = u_xlat36 * u_xlat41 + u_xlat6.x;
			        //LT
			        u_xlatb41 = u_xlat4.y<(-u_xlat4.y);
			        //AND
			        u_xlat41 = u_xlatb41 ? -3.14159274 : float(0.0);
			        //ADD
			        u_xlat36 = u_xlat36 + u_xlat41;
			        //MIN
			        u_xlat41 = min(u_xlat4.y, u_xlat4.w);
			        //MAX
			        u_xlat6.x = max(u_xlat4.y, u_xlat4.w);
			        //LT
			        u_xlatb41 = u_xlat41<(-u_xlat41);
			        //GE
			        u_xlatb6.x = u_xlat6.x>=(-u_xlat6.x);
			        //AND
			        u_xlatb41 = u_xlatb41 && u_xlatb6.x;
			        //MOVC
			        u_xlat36 = (u_xlatb41) ? (-u_xlat36) : u_xlat36;
			        //DP2
			        u_xlat41 = dot(u_xlat4.yw, u_xlat4.yw);
			        //SQRT
			        u_xlat41 = sqrt(u_xlat41);
			        //ADD
			        u_xlat36 = u_xlat36 + 0.314159274;
			        //MUL
			        u_xlat6.x = u_xlat36 * 1.5915494;
			        //ROUND_NI
			        u_xlat6.x = floor(u_xlat6.x);
			        //MAD
			        u_xlat36 = (-u_xlat6.x) * 0.628318548 + u_xlat36;
			        //ADD
			        u_xlat36 = u_xlat36 + -0.314159274;
			        //SINCOS
			        u_xlat6.x = sin(u_xlat36);
			        u_xlat7.x = cos(u_xlat36);
			        //MOV
			        u_xlat7.xz = u_xlat7.xx;
			        //MOV
			        u_xlat7.y = u_xlat6.x;
			        //MUL
			        u_xlat6.xyz = (float3)(u_xlat41) * u_xlat7.xyz;
			        //MAD
			        u_xlat6.xyz = u_xlat6.xyz * float3(2.0, 2.0, 2.0) + float3(-1.0, -0.0, -1.0);
			        //MUL
			        u_xlat6.xyz = u_xlat6.xyz * float3(0.5, 0.5, 3.0);
			        //SINCOS
			        u_xlat36 = sin(u_xlat6.z);
			        //MAD
			        u_xlat7.y = u_xlat36 * 0.100000001 + u_xlat4.z;
			        //ADD
			        u_xlat6.w = abs(u_xlat6.y) + 0.600000024;
			        //DP2
			        u_xlat36 = dot(u_xlat6.xw, u_xlat6.xw);
			        //SQRT
			        u_xlat7.x = sqrt(u_xlat36);
			        //ADD
			        u_xlat30.xy = abs(u_xlat7.xy) + float2(-0.699999988, -0.00999999978);
			        //MAX
			        u_xlat36 = max(u_xlat30.y, u_xlat30.x);
			        //MIN
			        u_xlat36 = min(u_xlat36, 0.0);
			        //MAX
			        u_xlat30.xy = max(u_xlat30.xy, float2(0.0, 0.0));
			        //DP2
			        u_xlat41 = dot(u_xlat30.xy, u_xlat30.xy);
			        //SQRT
			        u_xlat41 = sqrt(u_xlat41);
			        //ADD
			        u_xlat36 = u_xlat36 + u_xlat41;
			        //MOV
			        u_xlat7.zw = u_xlat6.xy;
			        //ADD
			        u_xlat6.xyz = u_xlat7.zyw + float3(-0.0, -0.00999999978, -0.0);
			        //ADD
			        u_xlat6.xyz = abs(u_xlat6.xyz) + float3(-0.449999988, -0.0130000003, -0.00100000005);
			        //MAX
			        u_xlat41 = max(u_xlat6.z, u_xlat6.y);
			        //MAX
			        u_xlat41 = max(u_xlat41, u_xlat6.x);
			        //MIN
			        u_xlat41 = min(u_xlat41, 0.0);
			        //MAX
			        u_xlat6.xyz = max(u_xlat6.xyz, float3(0.0, 0.0, 0.0));
			        //DP3
			        u_xlat6.x = dot(u_xlat6.xyz, u_xlat6.xyz);
			        //SQRT
			        u_xlat6.x = sqrt(u_xlat6.x);
			        //ADD
			        u_xlat41 = u_xlat41 + u_xlat6.x;
			        //ADD
			        u_xlat6.x = (-u_xlat36) + u_xlat41;
			        //MAD
			        u_xlat6.x = u_xlat6.x * 10.0 + 0.5;
			        u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
			        //ADD
			        u_xlat36 = u_xlat36 + (-u_xlat41);
			        //MAD
			        u_xlat36 = u_xlat6.x * u_xlat36 + u_xlat41;
			        //MUL
			        u_xlat41 = u_xlat6.x * 0.0500000007;
			        //ADD
			        u_xlat6.x = (-u_xlat6.x) + 1.0;
			        //MAD
			        u_xlat36 = (-u_xlat41) * u_xlat6.x + u_xlat36;
			        //MUL
			        u_xlat41 = u_xlat4.z * 4.0;
			        //SINCOS
			        u_xlat41 = sin(u_xlat41);
			        //MAD
			        u_xlat16.x = u_xlat41 * 0.100000001 + u_xlat4.y;
			        //ADD
			        u_xlat6.x = u_xlat16.x + -0.0500000007;
			        //MOV
			        u_xlat6.yw = u_xlat4.wz;
			        //DP2
			        u_xlat16.x = dot(u_xlat6.xy, u_xlat6.xy);
			        //SQRT
			        u_xlat6.z = sqrt(u_xlat16.x);
			        //ADD
			        u_xlat16.xy = abs(u_xlat6.zw) + float2(-0.0399999991, -0.699999988);
			        //MAX
			        u_xlat40 = max(u_xlat16.y, u_xlat16.x);
			        //MIN
			        u_xlat40 = min(u_xlat40, 0.0);
			        //MAX
			        u_xlat16.xy = max(u_xlat16.xy, float2(0.0, 0.0));
			        //DP2
			        u_xlat16.x = dot(u_xlat16.xy, u_xlat16.xy);
			        //SQRT
			        u_xlat16.x = sqrt(u_xlat16.x);
			        //ADD
			        u_xlat16.x = u_xlat16.x + u_xlat40;
			        //ADD
			        u_xlat28.x = (-u_xlat36) + u_xlat16.x;
			        //MAD
			        u_xlat28.x = u_xlat28.x * 1.66666663 + 0.5;
			        u_xlat28.x = clamp(u_xlat28.x, 0.0, 1.0);
			        //ADD
			        u_xlat36 = u_xlat36 + (-u_xlat16.x);
			        //MAD
			        u_xlat36 = u_xlat28.x * u_xlat36 + u_xlat16.x;
			        //MUL
			        u_xlat16.x = u_xlat28.x * 0.300000012;
			        //ADD
			        u_xlat28.x = (-u_xlat28.x) + 1.0;
			        //MAD
			        u_xlat36 = (-u_xlat16.x) * u_xlat28.x + u_xlat36;
			        //MOV
			        u_xlat4.y = u_xlat15.y;
			        u_xlat4.y = clamp(u_xlat4.y, 0.0, 1.0);
			        //MAD
			        u_xlat28.x = u_xlat4.y * -2.0 + 3.0;
			        //MOV
			        u_xlat4.x = u_xlat4.x;
			        u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
			        //MAD
			        u_xlat40 = u_xlat4.x * -2.0 + 3.0;
			        //MUL
			        u_xlat4.xy = u_xlat4.xy * u_xlat4.xy;
			        //MUL
			        u_xlat4.x = u_xlat4.x * u_xlat40;
			        //MUL
			        u_xlat4.x = u_xlat4.x * 3.0;
			        //MAD
			        u_xlat4.x = u_xlat28.x * u_xlat4.y + (-u_xlat4.x);
			        //MAD
			        u_xlat4.x = (-u_xlat4.x) * 0.159999996 + 1.0;
			        //MUL
			        u_xlat16.xyz = u_xlat15.xyz * u_xlat4.xxx;
			        //MUL
			        u_xlat15.x = u_xlat16.y * 2.22222233;
			        u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
			        //MAD
			        u_xlat39 = u_xlat15.x * -2.0 + 3.0;
			        //MAD
			        u_xlat27.x = u_xlat15.y * u_xlat4.x + -0.449999988;
			        //MUL
			        u_xlat15.y = u_xlat27.x * 2.22222233;
			        u_xlat15.y = clamp(u_xlat15.y, 0.0, 1.0);
			        //MAD
			        u_xlat4.x = u_xlat15.y * -2.0 + 3.0;
			        //MUL
			        u_xlat15.xy = u_xlat15.xy * u_xlat15.xy;
			        //MUL
			        u_xlat27.x = u_xlat15.y * u_xlat4.x;
			        //MAD
			        u_xlat15.x = u_xlat39 * u_xlat15.x + (-u_xlat27.x);
			        //MAD
			        u_xlat15.x = (-u_xlat15.x) * 0.0700000003 + 1.0;
			        //MUL
			        u_xlat6.xyz = u_xlat15.xxx * u_xlat16.xzy;
			        //MAD
			        u_xlat15.x = u_xlat16.y * u_xlat15.x + 0.600000024;
			        //MUL
			        u_xlat15.x = u_xlat15.x * 1.25;
			        u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
			        //MAD
			        u_xlat27.x = u_xlat15.x * -2.0 + 3.0;
			        //MUL
			        u_xlat15.x = u_xlat15.x * u_xlat15.x;
			        //MAD
			        u_xlat15.x = (-u_xlat27.x) * u_xlat15.x + 1.0;
			        //MAD
			        u_xlat15.x = u_xlat15.x * 0.200000003 + 1.0;
			        //MUL
			        u_xlat6.xy = u_xlat15.xx * u_xlat6.xy;
			        //MUL
			        u_xlat6.w = u_xlat6.z * 0.800000012;
			        //MUL
			        u_xlat15.xyz = u_xlat6.xzy * float3(0.449999988, 0.359999985, 0.449999988);
			        //DP3
			        u_xlat4.x = dot(u_xlat6.xyw, u_xlat6.xyw);
			        //RSQ
			        u_xlat16.x = rsqrt(u_xlat4.x);
			        //MUL
			        u_xlat7 = u_xlat16.xxxx * u_xlat6.xxwy;
			        //MAD
			        u_xlat28.xy = u_xlat6.xz * float2(0.449999988, 0.359999985) + float2(-0.140000001, -0.140000001);
			        //SAMPLE_L
			        u_xlat8 = tex2Dlod(_NoiseTex, float4(u_xlat28.xy, 0.0,1.5));
			        //SAMPLE_L
			        u_xlat9 = tex2Dlod(_NoiseTex, float4(u_xlat15.xz, 0.0,0.0));
			        //SAMPLE_L
			        u_xlat10 = tex2Dlod(_NoiseTex, float4(u_xlat15.yz, 0.0,1.5));
			        //MUL
			        u_xlat15.x = abs(u_xlat7.z) * u_xlat9.x;
			        //MAD
			        u_xlat15.x = u_xlat8.x * abs(u_xlat7.w) + u_xlat15.x;
			        //MAD
			        u_xlat15.x = u_xlat10.x * abs(u_xlat7.y) + u_xlat15.x;
			        //SQRT
			        u_xlat27.x = sqrt(u_xlat4.x);
			        //ADD
			        u_xlat27.x = u_xlat27.x + -1.0;
			        //MAD
			        u_xlat15.x = (-u_xlat15.x) * 0.100000001 + u_xlat27.x;
			        //MIN
			        u_xlat27.x = min(abs(u_xlat7.y), abs(u_xlat7.z));
			        //MAX
			        u_xlat39 = max(abs(u_xlat7.y), abs(u_xlat7.z));
			        //DIV
			        u_xlat39 = float(1.0) / u_xlat39;
			        //MUL
			        u_xlat27.x = u_xlat39 * u_xlat27.x;
			        //MUL
			        u_xlat39 = u_xlat27.x * u_xlat27.x;
			        //MAD
			        u_xlat4.x = u_xlat39 * 0.0208350997 + -0.0851330012;
			        //MAD
			        u_xlat4.x = u_xlat39 * u_xlat4.x + 0.180141002;
			        //MAD
			        u_xlat4.x = u_xlat39 * u_xlat4.x + -0.330299497;
			        //MAD
			        u_xlat39 = u_xlat39 * u_xlat4.x + 0.999866009;
			        //MUL
			        u_xlat4.x = u_xlat39 * u_xlat27.x;
			        //LT
			        u_xlatb28 = abs(u_xlat7.y)<abs(u_xlat7.z);
			        //MAD
			        u_xlat4.x = u_xlat4.x * -2.0 + 1.57079637;
			        //AND
			        u_xlat4.x = u_xlatb28 ? u_xlat4.x : float(0.0);
			        //MAD
			        u_xlat27.x = u_xlat27.x * u_xlat39 + u_xlat4.x;
			        //LT
			        u_xlatb39 = u_xlat7.y<(-u_xlat7.x);
			        //AND
			        u_xlat39 = u_xlatb39 ? -3.14159274 : float(0.0);
			        //ADD
			        u_xlat27.x = u_xlat39 + u_xlat27.x;
			        //MIN
			        u_xlat39 = min(u_xlat7.y, u_xlat7.z);
			        //MAX
			        u_xlat4.x = max(u_xlat7.y, u_xlat7.z);
			        //LT
			        u_xlatb39 = u_xlat39<(-u_xlat39);
			        //GE
			        u_xlatb4.x = u_xlat4.x>=(-u_xlat4.x);
			        //AND
			        u_xlatb39 = u_xlatb39 && u_xlatb4.x;
			        //MOVC
			        u_xlat27.x = (u_xlatb39) ? (-u_xlat27.x) : u_xlat27.x;
			        //MIN
			        u_xlat7.x = min(u_xlat27.x, 3.14159012);
			        //MAD
			        u_xlat27.x = (-u_xlat7.w) * u_xlat7.w + 1.0;
			        //MUL
			        u_xlat27.x = u_xlat27.x * 899.175598;
			        //LOG
			        u_xlat27.x = log2(u_xlat27.x);
			        //MUL
			        u_xlat27.x = u_xlat27.x * 0.720210016;
			        //ROUND_NI
			        u_xlat27.x = floor(u_xlat27.x);
			        //MAX
			        u_xlat27.x = max(u_xlat27.x, 2.0);
			        //MUL
			        u_xlat27.x = u_xlat27.x * 0.694241941;
			        //EXP
			        u_xlat27.x = exp2(u_xlat27.x);
			        //MUL
			        u_xlat27.xy = u_xlat27.xx * float2(0.44721359, 0.723606825);
			        //ROUND_NE
			        u_xlat27.xy = round(u_xlat27.xy);
			        //ADD
			        u_xlat4.xz = u_xlat27.yx + float2(1.0, 1.0);
			        //MUL
			        u_xlat31.xy = u_xlat4.xz * float2(0.618034005, 0.618034005);
			        //ROUND_NI
			        u_xlat31.xy = floor(u_xlat31.xy);
			        //MAD
			        u_xlat4.xz = u_xlat4.xz * float2(0.618034005, 0.618034005) + (-u_xlat31.xy);
			        //MAD
			        u_xlat4.xz = u_xlat4.xz * float2(6.28318024, 6.28318024) + float2(-3.88321877, -3.88321877);
			        //MUL
			        u_xlat27.xy = u_xlat27.xy * float2(-0.015625, -0.015625);
			        //MUL
			        u_xlat40 = u_xlat27.x * u_xlat4.x;
			        //MAD
			        u_xlat40 = u_xlat4.z * u_xlat27.y + (-u_xlat40);
			        //MUL
			        u_xlat8.xz = u_xlat27.yx * float2(1.0, -1.0);
			        //MUL
			        u_xlat8.yw = u_xlat4.xz * float2(-1.0, 1.0);
			        //DIV
			        u_xlat8 = u_xlat8 / (float4)(u_xlat40);
			        //MAD
			        u_xlat7.y = u_xlat6.y * u_xlat16.x + -0.9921875;
			        //DP2
			        u_xlat4.x = dot(u_xlat8.xy, u_xlat7.xy);
			        //DP2
			        u_xlat4.z = dot(u_xlat8.zw, u_xlat7.xy);
			        //ROUND_NI
			        u_xlat7.xy = floor(u_xlat4.xz);
			        //MOV
			        u_xlat8.x = float(100000.0);
			        //MOV
			        u_xlat8.y = float(0.0);
			        //MOV
			        u_xlat8.z = float(0.0);
			        //MOV
			        u_xlat8.w = float(0.0);
			        //LOOP
			        for(uint u_xlatu_loop_5 = 0u ; u_xlatu_loop_5<4u ; u_xlatu_loop_5++)
			        {
			            //AND
			            u_xlatu28.x = u_xlatu_loop_5 & 1u;
			            //USHR
			            u_xlatu28.y = u_xlatu_loop_5 >> 1u;
			            //UTOF
			            u_xlat9.xy = float2(u_xlatu28.xy);
			            //ADD
			            u_xlat28.xy = u_xlat7.xy + u_xlat9.xy;
			            //DP2
			            u_xlat28.x = dot(u_xlat27.xy, u_xlat28.xy);
			            //ADD
			            u_xlat28.x = u_xlat28.x + 0.9921875;
			            //MAX
			            u_xlat40 = max(u_xlat28.x, -1.0);
			            //MIN
			            u_xlat40 = min(u_xlat40, 1.0);
			            //MAD
			            u_xlat28.x = u_xlat40 * 2.0 + (-u_xlat28.x);
			            //MAD
			            u_xlat28.x = (-u_xlat28.x) * 64.0 + 64.0;
			            //ROUND_NI
			            u_xlat28.x = floor(u_xlat28.x);
			            //MUL
			            u_xlat40 = u_xlat28.x * 0.618034005;
			            //ROUND_NI
			            u_xlat40 = floor(u_xlat40);
			            //MAD
			            u_xlat40 = u_xlat28.x * 0.618034005 + (-u_xlat40);
			            //MUL
			            u_xlat40 = u_xlat40 * 6.28318024;
			            //MAD
			            u_xlat28.x = u_xlat28.x * 2.0 + 1.0;
			            //MAD
			            u_xlat9.w = (-u_xlat28.x) * 0.0078125 + 1.0;
			            //MAD
			            u_xlat28.x = (-u_xlat9.w) * u_xlat9.w + 1.0;
			            //SQRT
			            u_xlat28.x = sqrt(u_xlat28.x);
			            //SINCOS
			            u_xlat10.x = sin(u_xlat40);
			            u_xlat11.x = cos(u_xlat40);
			            //MUL
			            u_xlat9.y = u_xlat28.x * u_xlat11.x;
			            //MUL
			            u_xlat9.z = u_xlat28.x * u_xlat10.x;
			            //MAD
			            u_xlat10.xyz = (-u_xlat6.xwy) * u_xlat16.xxx + u_xlat9.yzw;
			            //DP3
			            u_xlat9.x = dot(u_xlat10.xyz, u_xlat10.xyz);
			            //LT
			            u_xlatb28 = u_xlat9.x<u_xlat8.x;
			            //MOVC
			            u_xlat8 = ((bool)(u_xlatb28)) ? u_xlat9 : u_xlat8;
			        //ENDLOOP
			        }
			        //MAD
			        u_xlat4.xyz = (-u_xlat8.yzw) * float3(1.01999998, 1.01999998, 1.01999998) + u_xlat6.xwy;
			        //DP3
			        u_xlat27.x = dot(u_xlat4.xyz, u_xlat4.xyz);
			        //SQRT
			        u_xlat27.x = sqrt(u_xlat27.x);
			        //ADD
			        u_xlat27.x = u_xlat27.x + -0.0599999987;
			        //ADD
			        u_xlat39 = (-u_xlat27.x) + u_xlat15.x;
			        //MAD
			        u_xlat39 = u_xlat39 * 50.0 + 0.5;
			        u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
			        //ADD
			        u_xlat27.x = (-u_xlat15.x) + u_xlat27.x;
			        //MAD
			        u_xlat27.x = u_xlat39 * u_xlat27.x + u_xlat15.x;
			        //MUL
			        u_xlat4.x = u_xlat39 * 0.00999999978;
			        //ADD
			        u_xlat39 = (-u_xlat39) + 1.0;
			        //MAD
			        u_xlat27.x = (-u_xlat4.x) * u_xlat39 + u_xlat27.x;
			        //LT
			        u_xlatb39 = u_xlat27.x<u_xlat15.x;
			        //MOVC
			        u_xlat15.x = (u_xlatb39) ? u_xlat27.x : u_xlat15.x;
			        //LT
			        u_xlatb27 = u_xlat36<u_xlat15.x;
			        //MOVC
			        u_xlat36 = (u_xlatb27) ? u_xlat36 : u_xlat15.x;
			        //MUL
			        u_xlat5.z = u_xlat36 * 0.300000012;
			    //ELSE
			    } else {
			        //MOV
			        u_xlat5.z = 1.0;
			    //ENDIF
			    }
			    //ADD
			    u_xlat3.xyz = u_xlat3.xxx + (-u_xlat5.xyz);
			    //MUL
			    u_xlat4 = u_xlat3.yyyy * unity_ObjectToWorld._m01_m11_m21_m31;
			    //MAD
			    u_xlat4 = unity_ObjectToWorld._m00_m10_m20_m30 * u_xlat3.xxxx + u_xlat4;
			    //MAD
			    u_xlat3 = unity_ObjectToWorld._m02_m12_m22_m32 * u_xlat3.zzzz + u_xlat4;
			    //DP4
			    u_xlat36 = dot(u_xlat3, u_xlat3);
			    //RSQ
			    u_xlat36 = rsqrt(u_xlat36);
			    //MUL
			    u_xlat3.xyz = (float3)(u_xlat36) * u_xlat3.xyz;
			    //MUL
			    u_xlat4.xyz = u_xlat0.yyy * unity_ObjectToWorld._m01_m11_m21_m31.xyz;
			    //MAD
			    u_xlat0.xyw = unity_ObjectToWorld._m00_m10_m20_m30.xyz * u_xlat0.xxx + u_xlat4.xyz;
			    //MAD
			    u_xlat0.xyz = unity_ObjectToWorld._m02_m12_m22_m32.xyz * u_xlat0.zzz + u_xlat0.xyw;
			    //ADD
			    u_xlat0.xyz = u_xlat0.xyz + unity_ObjectToWorld._m03_m13_m23_m33.xyz;
			    //MOV
			    u_xlati36 = unity_StereoEyeIndex;
			    //ADD
			    u_xlat0.xyz = (-u_xlat0.xyz) + unity_StereoWorldSpaceCameraPos[u_xlati36].xyz;
			    //DP3
			    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
			    //RSQ
			    u_xlat36 = rsqrt(u_xlat36);
			    //MUL
			    u_xlat0.xyz = (float3)(u_xlat36) * u_xlat0.xyz;
			    //DP3
			    u_xlat0.x = dot(u_xlat0.xyz, u_xlat3.xyz);
			    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
			    //ADD
			    u_xlat0.x = (-u_xlat0.x) + 1.0;
			    //LOG
			    u_xlat0.x = log2(u_xlat0.x);
			    //MUL
			    u_xlat0.x = u_xlat0.x * 1.5;
			    //EXP
			    u_xlat0.x = exp2(u_xlat0.x);
			    //IF
			    if(!u_xlatb38){
			        //MAD
			        u_xlat12.xyz = (-u_xlat2.xyz) * float3(6.0, 6.0, 6.0) + u_xlat13.xyz;
			        //ADD
			        u_xlat3.yzw = u_xlat12.xyz + float3(-3.0, -3.0, -3.0);
			        //MAD
			        u_xlat12.xyz = _Time.yyy * float3(1.29999995, 0.800000012, 1.20000005) + u_xlat2.xyz;
			        //SINCOS
			        u_xlat4.x = sin(u_xlat12.x);
			        u_xlat5.x = cos(u_xlat12.x);
			        //MOV
			        u_xlat6.x = (-u_xlat4.x);
			        //MOV
			        u_xlat6.y = u_xlat5.x;
			        //MOV
			        u_xlat6.z = u_xlat4.x;
			        //DP2
			        u_xlat3.x = dot(u_xlat3.yz, u_xlat6.yz);
			        //DP2
			        u_xlat4.x = dot(u_xlat3.yz, u_xlat6.xy);
			        //SINCOS
			        u_xlat5.x = sin(u_xlat12.y);
			        u_xlat6.x = cos(u_xlat12.y);
			        //MOV
			        u_xlat7.x = (-u_xlat5.x);
			        //MOV
			        u_xlat7.y = u_xlat6.x;
			        //MOV
			        u_xlat7.z = u_xlat5.x;
			        //DP2
			        u_xlat5.x = dot(u_xlat3.xw, u_xlat7.yz);
			        //DP2
			        u_xlat4.y = dot(u_xlat3.xw, u_xlat7.xy);
			        //SINCOS
			        u_xlat3.x = sin(u_xlat12.z);
			        u_xlat6.x = cos(u_xlat12.z);
			        //MOV
			        u_xlat7.x = (-u_xlat3.x);
			        //MOV
			        u_xlat7.y = u_xlat6.x;
			        //MOV
			        u_xlat7.z = u_xlat3.x;
			        //DP2
			        u_xlat5.y = dot(u_xlat4.xy, u_xlat7.yz);
			        //DP2
			        u_xlat5.z = dot(u_xlat4.xy, u_xlat7.xy);
			        //ADD
			        u_xlat12.x = u_xlat2.x + _Time.y;
			        //SINCOS
			        u_xlat12.x = sin(u_xlat12.x);
			        //MAD
			        u_xlat12.x = u_xlat12.x * 0.5 + 0.5;
			        //MAD
			        u_xlat12.x = u_xlat12.x * 0.199999988 + 0.800000012;
			        //MUL
			        u_xlat13.xyz = u_xlat12.xxx * u_xlat5.xyz;
			        //MAD
			        u_xlat2 = u_xlat5.yxyz * u_xlat12.xxxx + float4(-1.0, -0.0, -1.32000005, -0.0);
			        //MIN
			        u_xlat12.x = min(abs(u_xlat2.y), abs(u_xlat2.w));
			        //MAX
			        u_xlat24.x = max(abs(u_xlat2.y), abs(u_xlat2.w));
			        //DIV
			        u_xlat24.x = float(1.0) / u_xlat24.x;
			        //MUL
			        u_xlat12.x = u_xlat24.x * u_xlat12.x;
			        //MUL
			        u_xlat24.x = u_xlat12.x * u_xlat12.x;
			        //MAD
			        u_xlat36 = u_xlat24.x * 0.0208350997 + -0.0851330012;
			        //MAD
			        u_xlat36 = u_xlat24.x * u_xlat36 + 0.180141002;
			        //MAD
			        u_xlat36 = u_xlat24.x * u_xlat36 + -0.330299497;
			        //MAD
			        u_xlat24.x = u_xlat24.x * u_xlat36 + 0.999866009;
			        //MUL
			        u_xlat36 = u_xlat24.x * u_xlat12.x;
			        //LT
			        u_xlatb3.x = abs(u_xlat2.y)<abs(u_xlat2.w);
			        //MAD
			        u_xlat36 = u_xlat36 * -2.0 + 1.57079637;
			        //AND
			        u_xlat36 = u_xlatb3.x ? u_xlat36 : float(0.0);
			        //MAD
			        u_xlat12.x = u_xlat12.x * u_xlat24.x + u_xlat36;
			        //LT
			        u_xlatb24 = u_xlat2.y<(-u_xlat2.y);
			        //AND
			        u_xlat24.x = u_xlatb24 ? -3.14159274 : float(0.0);
			        //ADD
			        u_xlat12.x = u_xlat24.x + u_xlat12.x;
			        //MIN
			        u_xlat24.x = min(u_xlat2.y, u_xlat2.w);
			        //MAX
			        u_xlat36 = max(u_xlat2.y, u_xlat2.w);
			        //LT
			        u_xlatb24 = u_xlat24.x<(-u_xlat24.x);
			        //GE
			        u_xlatb36 = u_xlat36>=(-u_xlat36);
			        //AND
			        u_xlatb24 = u_xlatb36 && u_xlatb24;
			        //MOVC
			        u_xlat12.x = (u_xlatb24) ? (-u_xlat12.x) : u_xlat12.x;
			        //DP2
			        u_xlat24.x = dot(u_xlat2.yw, u_xlat2.yw);
			        //SQRT
			        u_xlat24.x = sqrt(u_xlat24.x);
			        //ADD
			        u_xlat12.x = u_xlat12.x + 0.314159274;
			        //MUL
			        u_xlat36 = u_xlat12.x * 1.5915494;
			        //ROUND_NI
			        u_xlat36 = floor(u_xlat36);
			        //MAD
			        u_xlat12.x = (-u_xlat36) * 0.628318548 + u_xlat12.x;
			        //ADD
			        u_xlat12.x = u_xlat12.x + -0.314159274;
			        //SINCOS
			        u_xlat3.x = sin(u_xlat12.x);
			        u_xlat4.x = cos(u_xlat12.x);
			        //MOV
			        u_xlat4.xz = u_xlat4.xx;
			        //MOV
			        u_xlat4.y = u_xlat3.x;
			        //MUL
			        u_xlat12.xyz = u_xlat24.xxx * u_xlat4.xyz;
			        //MAD
			        u_xlat12.xyz = u_xlat12.xyz * float3(2.0, 2.0, 2.0) + float3(-1.0, -0.0, -1.0);
			        //MUL
			        u_xlat3.xyz = u_xlat12.xyz * float3(0.5, 0.5, 3.0);
			        //SINCOS
			        u_xlat12.x = sin(u_xlat3.z);
			        //MAD
			        u_xlat4.y = u_xlat12.x * 0.100000001 + u_xlat2.z;
			        //ADD
			        u_xlat3.w = abs(u_xlat3.y) + 0.600000024;
			        //DP2
			        u_xlat12.x = dot(u_xlat3.xw, u_xlat3.xw);
			        //SQRT
			        u_xlat4.x = sqrt(u_xlat12.x);
			        //ADD
			        u_xlat12.xy = abs(u_xlat4.xy) + float2(-0.699999988, -0.00999999978);
			        //MAX
			        u_xlat36 = max(u_xlat12.y, u_xlat12.x);
			        //MIN
			        u_xlat36 = min(u_xlat36, 0.0);
			        //MAX
			        u_xlat12.xy = max(u_xlat12.xy, float2(0.0, 0.0));
			        //DP2
			        u_xlat12.x = dot(u_xlat12.xy, u_xlat12.xy);
			        //SQRT
			        u_xlat12.x = sqrt(u_xlat12.x);
			        //ADD
			        u_xlat12.x = u_xlat12.x + u_xlat36;
			        //MOV
			        u_xlat4.zw = u_xlat3.xy;
			        //ADD
			        u_xlat3.xyz = u_xlat4.zyw + float3(-0.0, -0.00999999978, -0.0);
			        //ADD
			        u_xlat3.xyz = abs(u_xlat3.xyz) + float3(-0.449999988, -0.0130000003, -0.00100000005);
			        //MAX
			        u_xlat24.x = max(u_xlat3.z, u_xlat3.y);
			        //MAX
			        u_xlat24.x = max(u_xlat24.x, u_xlat3.x);
			        //MIN
			        u_xlat24.x = min(u_xlat24.x, 0.0);
			        //MAX
			        u_xlat3.xyz = max(u_xlat3.xyz, float3(0.0, 0.0, 0.0));
			        //DP3
			        u_xlat36 = dot(u_xlat3.xyz, u_xlat3.xyz);
			        //SQRT
			        u_xlat36 = sqrt(u_xlat36);
			        //ADD
			        u_xlat24.x = u_xlat36 + u_xlat24.x;
			        //ADD
			        u_xlat36 = (-u_xlat12.x) + u_xlat24.x;
			        //MAD
			        u_xlat36 = u_xlat36 * 10.0 + 0.5;
			        u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
			        //ADD
			        u_xlat12.x = (-u_xlat24.x) + u_xlat12.x;
			        //MAD
			        u_xlat12.x = u_xlat36 * u_xlat12.x + u_xlat24.x;
			        //MUL
			        u_xlat24.x = u_xlat36 * 0.0500000007;
			        //ADD
			        u_xlat36 = (-u_xlat36) + 1.0;
			        //MAD
			        u_xlat12.x = (-u_xlat24.x) * u_xlat36 + u_xlat12.x;
			        //MUL
			        u_xlat24.x = u_xlat2.z * 4.0;
			        //SINCOS
			        u_xlat24.x = sin(u_xlat24.x);
			        //MAD
			        u_xlat24.x = u_xlat24.x * 0.100000001 + u_xlat2.y;
			        //ADD
			        u_xlat3.x = u_xlat24.x + -0.0500000007;
			        //MOV
			        u_xlat3.yw = u_xlat2.wz;
			        //DP2
			        u_xlat24.x = dot(u_xlat3.xy, u_xlat3.xy);
			        //SQRT
			        u_xlat3.z = sqrt(u_xlat24.x);
			        //ADD
			        u_xlat24.xy = abs(u_xlat3.zw) + float2(-0.0399999991, -0.699999988);
			        //MAX
			        u_xlat14.x = max(u_xlat24.y, u_xlat24.x);
			        //MIN
			        u_xlat14.x = min(u_xlat14.x, 0.0);
			        //MAX
			        u_xlat24.xy = max(u_xlat24.xy, float2(0.0, 0.0));
			        //DP2
			        u_xlat24.x = dot(u_xlat24.xy, u_xlat24.xy);
			        //SQRT
			        u_xlat24.x = sqrt(u_xlat24.x);
			        //ADD
			        u_xlat24.x = u_xlat24.x + u_xlat14.x;
			        //ADD
			        u_xlat36 = (-u_xlat12.x) + u_xlat24.x;
			        //MAD
			        u_xlat36 = u_xlat36 * 1.66666663 + 0.5;
			        u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
			        //ADD
			        u_xlat12.x = (-u_xlat24.x) + u_xlat12.x;
			        //MAD
			        u_xlat12.x = u_xlat36 * u_xlat12.x + u_xlat24.x;
			        //MUL
			        u_xlat24.x = u_xlat36 * 0.300000012;
			        //ADD
			        u_xlat36 = (-u_xlat36) + 1.0;
			        //MAD
			        u_xlat12.x = (-u_xlat24.x) * u_xlat36 + u_xlat12.x;
			        //MOV
			        u_xlat24.x = u_xlat13.y;
			        u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
			        //MAD
			        u_xlat36 = u_xlat24.x * -2.0 + 3.0;
			        //MUL
			        u_xlat24.x = u_xlat24.x * u_xlat24.x;
			        //MOV
			        u_xlat2.x = u_xlat2.x;
			        u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
			        //MAD
			        u_xlat14.x = u_xlat2.x * -2.0 + 3.0;
			        //MUL
			        u_xlat2.x = u_xlat2.x * u_xlat2.x;
			        //MUL
			        u_xlat2.x = u_xlat2.x * u_xlat14.x;
			        //MUL
			        u_xlat2.x = u_xlat2.x * 3.0;
			        //MAD
			        u_xlat24.x = u_xlat36 * u_xlat24.x + (-u_xlat2.x);
			        //MAD
			        u_xlat24.x = (-u_xlat24.x) * 0.159999996 + 1.0;
			        //MUL
			        u_xlat2.xyz = u_xlat24.xxx * u_xlat13.xyz;
			        //MUL
			        u_xlat24.y = u_xlat2.y * 2.22222233;
			        u_xlat24.y = clamp(u_xlat24.y, 0.0, 1.0);
			        //MAD
			        u_xlat13.x = u_xlat24.y * -2.0 + 3.0;
			        //MAD
			        u_xlat24.x = u_xlat13.y * u_xlat24.x + -0.449999988;
			        //MUL
			        u_xlat24.x = u_xlat24.x * 2.22222233;
			        u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
			        //MAD
			        u_xlat25 = u_xlat24.x * -2.0 + 3.0;
			        //MUL
			        u_xlat24.xy = u_xlat24.xy * u_xlat24.xy;
			        //MUL
			        u_xlat24.x = u_xlat24.x * u_xlat25;
			        //MAD
			        u_xlat24.x = u_xlat13.x * u_xlat24.y + (-u_xlat24.x);
			        //MAD
			        u_xlat24.x = (-u_xlat24.x) * 0.0700000003 + 1.0;
			        //MUL
			        u_xlat3.xyz = u_xlat24.xxx * u_xlat2.xzy;
			        //MAD
			        u_xlat24.x = u_xlat2.y * u_xlat24.x + 0.600000024;
			        //MUL
			        u_xlat24.x = u_xlat24.x * 1.25;
			        u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
			        //MAD
			        u_xlat36 = u_xlat24.x * -2.0 + 3.0;
			        //MUL
			        u_xlat24.x = u_xlat24.x * u_xlat24.x;
			        //MAD
			        u_xlat24.x = (-u_xlat36) * u_xlat24.x + 1.0;
			        //MAD
			        u_xlat24.x = u_xlat24.x * 0.200000003 + 1.0;
			        //MUL
			        u_xlat3.xy = u_xlat24.xx * u_xlat3.xy;
			        //MUL
			        u_xlat3.w = u_xlat3.z * 0.800000012;
			        //MUL
			        u_xlat13.xyz = u_xlat3.xzy * float3(0.449999988, 0.359999985, 0.449999988);
			        //DP3
			        u_xlat24.x = dot(u_xlat3.xyw, u_xlat3.xyw);
			        //RSQ
			        u_xlat36 = rsqrt(u_xlat24.x);
			        //MUL
			        u_xlat2 = (float4)(u_xlat36) * u_xlat3.xxwy;
			        //MAD
			        u_xlat4.xy = u_xlat3.xz * float2(0.449999988, 0.359999985) + float2(-0.140000001, -0.140000001);
			        //SAMPLE_L
			        u_xlat4 = tex2Dlod(_NoiseTex, float4(u_xlat4.xy, 0.0,1.5));
			        //SAMPLE_L
			        u_xlat5 = tex2Dlod(_NoiseTex, float4(u_xlat13.xz, 0.0,0.0));
			        //SAMPLE_L
			        u_xlat6 = tex2Dlod(_NoiseTex, float4(u_xlat13.yz, 0.0,1.5));
			        //MUL
			        u_xlat13.x = abs(u_xlat2.z) * u_xlat5.x;
			        //MAD
			        u_xlat13.x = u_xlat4.x * abs(u_xlat2.w) + u_xlat13.x;
			        //MAD
			        u_xlat13.x = u_xlat6.x * abs(u_xlat2.y) + u_xlat13.x;
			        //SQRT
			        u_xlat24.x = sqrt(u_xlat24.x);
			        //ADD
			        u_xlat24.x = u_xlat24.x + -1.0;
			        //MAD
			        u_xlat28.y = (-u_xlat13.x) * 0.100000001 + u_xlat24.x;
			        //MIN
			        u_xlat24.x = min(abs(u_xlat2.y), abs(u_xlat2.z));
			        //MAX
			        u_xlat13.x = max(abs(u_xlat2.y), abs(u_xlat2.z));
			        //DIV
			        u_xlat13.x = float(1.0) / u_xlat13.x;
			        //MUL
			        u_xlat24.x = u_xlat24.x * u_xlat13.x;
			        //MUL
			        u_xlat13.x = u_xlat24.x * u_xlat24.x;
			        //MAD
			        u_xlat25 = u_xlat13.x * 0.0208350997 + -0.0851330012;
			        //MAD
			        u_xlat25 = u_xlat13.x * u_xlat25 + 0.180141002;
			        //MAD
			        u_xlat25 = u_xlat13.x * u_xlat25 + -0.330299497;
			        //MAD
			        u_xlat13.x = u_xlat13.x * u_xlat25 + 0.999866009;
			        //MUL
			        u_xlat25 = u_xlat24.x * u_xlat13.x;
			        //LT
			        u_xlatb37 = abs(u_xlat2.y)<abs(u_xlat2.z);
			        //MAD
			        u_xlat25 = u_xlat25 * -2.0 + 1.57079637;
			        //AND
			        u_xlat25 = u_xlatb37 ? u_xlat25 : float(0.0);
			        //MAD
			        u_xlat24.x = u_xlat24.x * u_xlat13.x + u_xlat25;
			        //LT
			        u_xlatb13 = u_xlat2.y<(-u_xlat2.x);
			        //AND
			        u_xlat13.x = u_xlatb13 ? -3.14159274 : float(0.0);
			        //ADD
			        u_xlat24.x = u_xlat24.x + u_xlat13.x;
			        //MIN
			        u_xlat13.x = min(u_xlat2.y, u_xlat2.z);
			        //MAX
			        u_xlat25 = max(u_xlat2.y, u_xlat2.z);
			        //LT
			        u_xlatb13 = u_xlat13.x<(-u_xlat13.x);
			        //GE
			        u_xlatb25 = u_xlat25>=(-u_xlat25);
			        //AND
			        u_xlatb13 = u_xlatb25 && u_xlatb13;
			        //MOVC
			        u_xlat24.x = (u_xlatb13) ? (-u_xlat24.x) : u_xlat24.x;
			        //MIN
			        u_xlat2.x = min(u_xlat24.x, 3.14159012);
			        //MAD
			        u_xlat24.x = (-u_xlat2.w) * u_xlat2.w + 1.0;
			        //MUL
			        u_xlat24.x = u_xlat24.x * 899.175598;
			        //LOG
			        u_xlat24.x = log2(u_xlat24.x);
			        //MUL
			        u_xlat24.x = u_xlat24.x * 0.720210016;
			        //ROUND_NI
			        u_xlat24.x = floor(u_xlat24.x);
			        //MAX
			        u_xlat24.x = max(u_xlat24.x, 2.0);
			        //MUL
			        u_xlat24.x = u_xlat24.x * 0.694241941;
			        //EXP
			        u_xlat24.x = exp2(u_xlat24.x);
			        //MUL
			        u_xlat13.xy = u_xlat24.xx * float2(0.44721359, 0.723606825);
			        //ROUND_NE
			        u_xlat13.xy = round(u_xlat13.xy);
			        //ADD
			        u_xlat26.xy = u_xlat13.yx + float2(1.0, 1.0);
			        //MUL
			        u_xlat5.xy = u_xlat26.xy * float2(0.618034005, 0.618034005);
			        //ROUND_NI
			        u_xlat5.xy = floor(u_xlat5.xy);
			        //MAD
			        u_xlat26.xy = u_xlat26.xy * float2(0.618034005, 0.618034005) + (-u_xlat5.xy);
			        //MAD
			        u_xlat26.xy = u_xlat26.xy * float2(6.28318024, 6.28318024) + float2(-3.88321877, -3.88321877);
			        //MUL
			        u_xlat13.xy = u_xlat13.xy * float2(-0.015625, -0.015625);
			        //MUL
			        u_xlat24.x = u_xlat13.x * u_xlat26.x;
			        //MAD
			        u_xlat24.x = u_xlat26.y * u_xlat13.y + (-u_xlat24.x);
			        //MUL
			        u_xlat5.xz = u_xlat13.yx * float2(1.0, -1.0);
			        //MUL
			        u_xlat5.yw = u_xlat26.xy * float2(-1.0, 1.0);
			        //DIV
			        u_xlat5 = u_xlat5 / u_xlat24.xxxx;
			        //MAD
			        u_xlat2.y = u_xlat3.y * u_xlat36 + -0.9921875;
			        //DP2
			        u_xlat24.x = dot(u_xlat5.xy, u_xlat2.xy);
			        //DP2
			        u_xlat37 = dot(u_xlat5.zw, u_xlat2.xy);
			        //ROUND_NI
			        u_xlat2.x = floor(u_xlat24.x);
			        //ROUND_NI
			        u_xlat2.y = floor(u_xlat37);
			        //MOV
			        u_xlat5.x = float(100000.0);
			        //MOV
			        u_xlat5.y = float(0.0);
			        //MOV
			        u_xlat5.z = float(0.0);
			        //MOV
			        u_xlat5.w = float(0.0);
			        //LOOP
			        for(uint u_xlatu_loop_6 = 0u ; u_xlatu_loop_6<4u ; u_xlatu_loop_6++)
			        {
			            //AND
			            u_xlatu37 = u_xlatu_loop_6 & 1u;
			            //USHR
			            u_xlatu26 = u_xlatu_loop_6 >> 1u;
			            //UTOF
			            u_xlat6.x = float(u_xlatu37);
			            //UTOF
			            u_xlat6.y = float(u_xlatu26);
			            //ADD
			            u_xlat26.xy = u_xlat2.xy + u_xlat6.xy;
			            //DP2
			            u_xlat37 = dot(u_xlat13.xy, u_xlat26.xy);
			            //ADD
			            u_xlat37 = u_xlat37 + 0.9921875;
			            //MAX
			            u_xlat26.x = max(u_xlat37, -1.0);
			            //MIN
			            u_xlat26.x = min(u_xlat26.x, 1.0);
			            //MAD
			            u_xlat37 = u_xlat26.x * 2.0 + (-u_xlat37);
			            //MAD
			            u_xlat37 = (-u_xlat37) * 64.0 + 64.0;
			            //ROUND_NI
			            u_xlat37 = floor(u_xlat37);
			            //MUL
			            u_xlat26.x = u_xlat37 * 0.618034005;
			            //ROUND_NI
			            u_xlat26.x = floor(u_xlat26.x);
			            //MAD
			            u_xlat26.x = u_xlat37 * 0.618034005 + (-u_xlat26.x);
			            //MUL
			            u_xlat26.x = u_xlat26.x * 6.28318024;
			            //MAD
			            u_xlat37 = u_xlat37 * 2.0 + 1.0;
			            //MAD
			            u_xlat6.w = (-u_xlat37) * 0.0078125 + 1.0;
			            //MAD
			            u_xlat37 = (-u_xlat6.w) * u_xlat6.w + 1.0;
			            //SQRT
			            u_xlat37 = sqrt(u_xlat37);
			            //SINCOS
			            u_xlat7.x = sin(u_xlat26.x);
			            u_xlat8.x = cos(u_xlat26.x);
			            //MUL
			            u_xlat6.y = u_xlat37 * u_xlat8.x;
			            //MUL
			            u_xlat6.z = u_xlat37 * u_xlat7.x;
			            //MAD
			            u_xlat7.xyz = (-u_xlat3.xwy) * (float3)(u_xlat36) + u_xlat6.yzw;
			            //DP3
			            u_xlat6.x = dot(u_xlat7.xyz, u_xlat7.xyz);
			            //LT
			            u_xlatb37 = u_xlat6.x<u_xlat5.x;
			            //MOVC
			            u_xlat5 = ((bool)(u_xlatb37)) ? u_xlat6 : u_xlat5;
			        //ENDLOOP
			        }
			        //MAD
			        u_xlat13.xyz = (-u_xlat5.yzw) * float3(1.01999998, 1.01999998, 1.01999998) + u_xlat3.xwy;
			        //DP3
			        u_xlat24.x = dot(u_xlat13.xyz, u_xlat13.xyz);
			        //SQRT
			        u_xlat24.x = sqrt(u_xlat24.x);
			        //ADD
			        u_xlat24.x = u_xlat24.x + -0.0599999987;
			        //ADD
			        u_xlat36 = (-u_xlat24.x) + u_xlat28.y;
			        //MAD
			        u_xlat36 = u_xlat36 * 50.0 + 0.5;
			        u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
			        //ADD
			        u_xlat24.x = (-u_xlat28.y) + u_xlat24.x;
			        //MAD
			        u_xlat24.x = u_xlat36 * u_xlat24.x + u_xlat28.y;
			        //MUL
			        u_xlat13.x = u_xlat36 * 0.00999999978;
			        //ADD
			        u_xlat36 = (-u_xlat36) + 1.0;
			        //MAD
			        u_xlat4.y = (-u_xlat13.x) * u_xlat36 + u_xlat24.x;
			        //LT
			        u_xlatb24 = u_xlat4.y<u_xlat28.y;
			        //MOV
			        u_xlat4.x = float(1.0);
			        //MOV
			        u_xlat28.x = float(0.0);
			        //MOVC
			        u_xlat24.xy = ((bool)(u_xlatb24)) ? u_xlat4.xy : u_xlat28.xy;
			        //LT
			        u_xlatb12 = u_xlat12.x<u_xlat24.y;
			        //MOVC
			        u_xlat12.x = (u_xlatb12) ? 2.0 : u_xlat24.x;
			    //ELSE
			    } else {
			        //MOV
			        u_xlat12.x = 0.0;
			    //ENDIF
			    }
			    //LT
			    u_xlatb24 = u_xlat12.x<1.0;
			    //LT
			    u_xlatb12 = 1.10000002<u_xlat12.x;
			    //MOVC
			    u_xlat13.xyz = ((bool)(u_xlatb24)) ? float3(0.328000009, 0.0219999999, 0.0108000003) : float3(0.0500000007, 0.150000006, 0.0);
			    //OR
			    u_xlatb12 = u_xlatb12 || u_xlatb24;
			    //MOVC
			    u_xlat12.xyz = ((bool)(u_xlatb12)) ? u_xlat13.xyz : float3(0.00999999978, 0.00999999978, 0.00999999978);
			    //MUL
			    u_xlat12.xyz = u_xlat1.xxx * u_xlat12.xyz;
			    //ADD
			    u_xlat0.x = u_xlat0.x + 1.0;
			    //MUL
			    fragmentOut.SV_Target0.xyz = u_xlat0.xxx * u_xlat12.xyz;
			    //MOV
			    fragmentOut.SV_Target0.w = 1.0;
			    //RET
			    return fragmentOut;
			}
			#endif
			#if (STEREO_INSTANCING_ON) && !(UNITY_SINGLE_PASS_STEREO)
			#pragma target 4.0
					
			
			#ifndef _Iterations_DEFINED
			#define _Iterations_DEFINED
			uniform float _Iterations;
			#endif
			#ifndef _MaxDist_DEFINED
			#define _MaxDist_DEFINED
			uniform float _MaxDist;
			#endif
			#ifndef _Epsilon_DEFINED
			#define _Epsilon_DEFINED
			uniform float _Epsilon;
			#endif
			#ifndef _NoiseTex_DEFINED
			#define _NoiseTex_DEFINED
			uniform sampler2D _NoiseTex;
			#endif
			struct FragmentIn
			{
			    float3 vs_TEXCOORD1 : TEXCOORD1;
			    float3 vs_TEXCOORD2 : TEXCOORD2;
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
			FragmentOut frag(FRAGMENT_INPUT fragmentIn, uint gl_FrontFacing : SV_IsFrontFace0)
			{
			    FragmentOut fragmentOut = (FragmentOut)0;
			    UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(fragmentIn);
			    //--- Start Early Main ---
			    float4 u_xlat0;
			    float3 u_xlat1;
			    float4 u_xlat2;
			    int u_xlati2;
			    float4 u_xlat3;
			    uint u_xlatu3;
			    bool2 u_xlatb3;
			    float4 u_xlat4;
			    uint u_xlatu4;
			    bool2 u_xlatb4;
			    float4 u_xlat5;
			    uint2 u_xlatu5;
			    bool u_xlatb5;
			    float4 u_xlat6;
			    bool2 u_xlatb6;
			    float4 u_xlat7;
			    bool2 u_xlatb7;
			    float4 u_xlat8;
			    float4 u_xlat9;
			    float4 u_xlat10;
			    float3 u_xlat11;
			    float3 u_xlat12;
			    bool u_xlatb12;
			    float3 u_xlat13;
			    bool u_xlatb13;
			    float3 u_xlat14;
			    bool u_xlatb14;
			    float3 u_xlat15;
			    uint u_xlatu15;
			    bool u_xlatb15;
			    float3 u_xlat16;
			    float3 u_xlat17;
			    bool u_xlatb17;
			    float3 u_xlat18;
			    bool u_xlatb18;
			    float2 u_xlat24;
			    uint u_xlatu24;
			    bool u_xlatb24;
			    float u_xlat25;
			    bool u_xlatb25;
			    float2 u_xlat26;
			    uint u_xlatu26;
			    bool u_xlatb26;
			    float2 u_xlat27;
			    bool u_xlatb27;
			    float2 u_xlat28;
			    uint2 u_xlatu28;
			    bool u_xlatb28;
			    float2 u_xlat29;
			    bool u_xlatb29;
			    float2 u_xlat30;
			    float2 u_xlat31;
			    uint u_xlatu31;
			    float2 u_xlat32;
			    float u_xlat36;
			    bool u_xlatb36;
			    float u_xlat37;
			    uint u_xlatu37;
			    bool u_xlatb37;
			    float u_xlat38;
			    bool u_xlatb38;
			    float u_xlat39;
			    bool u_xlatb39;
			    float u_xlat40;
			    uint u_xlatu40;
			    bool u_xlatb40;
			    float u_xlat41;
			    uint u_xlatu41;
			    bool u_xlatb41;
			    //--- End Early Main ---
			    //ADD
			    u_xlat0.xyz = (-fragmentIn.vs_TEXCOORD1.xyz) + fragmentIn.vs_TEXCOORD2.xyz;
			    //DP3
			    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
			    //RSQ
			    u_xlat36 = rsqrt(u_xlat36);
			    //MUL
			    u_xlat0.xyz = (float3)(u_xlat36) * u_xlat0.xyz;
			    //MOVC
			    u_xlat1.xyz = (gl_FrontFacing != uint(0)) ? fragmentIn.vs_TEXCOORD2.xyz : fragmentIn.vs_TEXCOORD1.xyz;
			    //MUL
			    u_xlat36 = _Time.y * 10.0;
			    //MOV
			    u_xlat37 = 0.0;
			    //MOV
			    u_xlati2 = 0;
			    //LOOP
			    while(true){
			        //ITOF
			        u_xlat14.x = float(u_xlati2);
			        //GE
			        u_xlatb14 = u_xlat14.x>=_Iterations;
			        //BREAKC
			        if(u_xlatb14){break;}
			        //MAD
			        u_xlat14.xyz = u_xlat0.xyz * (float3)(u_xlat37) + u_xlat1.xyz;
			        //MAD
			        u_xlat15.z = u_xlat14.z * 3.33333325 + (-u_xlat36);
			        //ADD
			        u_xlat14.z = u_xlat15.z + 3.0;
			        //MUL
			        u_xlat14.xyz = u_xlat14.xyz * float3(3.33333325, 3.33333325, 0.0500000007);
			        //SINCOS
			        u_xlat3.x = sin(u_xlat14.z);
			        u_xlat4.x = cos(u_xlat14.z);
			        //MOV
			        u_xlat5.x = (-u_xlat3.x);
			        //MOV
			        u_xlat5.y = u_xlat4.x;
			        //MOV
			        u_xlat5.z = u_xlat3.x;
			        //DP2
			        u_xlat15.x = dot(u_xlat14.xy, u_xlat5.yz);
			        //DP2
			        u_xlat15.y = dot(u_xlat14.xy, u_xlat5.xy);
			        //ADD
			        u_xlat14.xyz = u_xlat15.xyz + float3(3.0, 3.0, 3.0);
			        //MUL
			        u_xlat3.xyz = u_xlat14.xyz * float3(0.166666672, 0.166666672, 0.166666672);
			        //ROUND_NI
			        u_xlat3.xyz = floor(u_xlat3.xyz);
			        //EQ
			        u_xlatb4.xy = ((u_xlat3.xyxx) == (float4(0.0, 0.0, 0.0, 0.0))).xy;
			        //OR
			        u_xlatb39 = u_xlatb4.y || u_xlatb4.x;
			        //IF
			        if(!u_xlatb39){
			            //MAD
			            u_xlat14.xyz = (-u_xlat3.xyz) * float3(6.0, 6.0, 6.0) + u_xlat14.xyz;
			            //ADD
			            u_xlat4.yzw = u_xlat14.xyz + float3(-3.0, -3.0, -3.0);
			            //MAD
			            u_xlat14.xyz = _Time.yyy * float3(1.29999995, 0.800000012, 1.20000005) + u_xlat3.xyz;
			            //SINCOS
			            u_xlat5.x = sin(u_xlat14.x);
			            u_xlat6.x = cos(u_xlat14.x);
			            //MOV
			            u_xlat7.x = (-u_xlat5.x);
			            //MOV
			            u_xlat7.y = u_xlat6.x;
			            //MOV
			            u_xlat7.z = u_xlat5.x;
			            //DP2
			            u_xlat4.x = dot(u_xlat4.yz, u_xlat7.yz);
			            //DP2
			            u_xlat5.x = dot(u_xlat4.yz, u_xlat7.xy);
			            //SINCOS
			            u_xlat6.x = sin(u_xlat14.y);
			            u_xlat7.x = cos(u_xlat14.y);
			            //MOV
			            u_xlat8.x = (-u_xlat6.x);
			            //MOV
			            u_xlat8.y = u_xlat7.x;
			            //MOV
			            u_xlat8.z = u_xlat6.x;
			            //DP2
			            u_xlat6.x = dot(u_xlat4.xw, u_xlat8.yz);
			            //DP2
			            u_xlat5.y = dot(u_xlat4.xw, u_xlat8.xy);
			            //SINCOS
			            u_xlat4.x = sin(u_xlat14.z);
			            u_xlat7.x = cos(u_xlat14.z);
			            //MOV
			            u_xlat8.x = (-u_xlat4.x);
			            //MOV
			            u_xlat8.y = u_xlat7.x;
			            //MOV
			            u_xlat8.z = u_xlat4.x;
			            //DP2
			            u_xlat6.y = dot(u_xlat5.xy, u_xlat8.yz);
			            //DP2
			            u_xlat6.z = dot(u_xlat5.xy, u_xlat8.xy);
			            //ADD
			            u_xlat14.x = u_xlat3.x + _Time.y;
			            //SINCOS
			            u_xlat14.x = sin(u_xlat14.x);
			            //MAD
			            u_xlat14.x = u_xlat14.x * 0.5 + 0.5;
			            //MAD
			            u_xlat14.x = u_xlat14.x * 0.199999988 + 0.800000012;
			            //MUL
			            u_xlat3.xyz = u_xlat14.xxx * u_xlat6.xyz;
			            //MAD
			            u_xlat4 = u_xlat6.yxyz * u_xlat14.xxxx + float4(-1.0, -0.0, -1.32000005, -0.0);
			            //MIN
			            u_xlat14.x = min(abs(u_xlat4.y), abs(u_xlat4.w));
			            //MAX
			            u_xlat26.x = max(abs(u_xlat4.y), abs(u_xlat4.w));
			            //DIV
			            u_xlat26.x = float(1.0) / u_xlat26.x;
			            //MUL
			            u_xlat14.x = u_xlat26.x * u_xlat14.x;
			            //MUL
			            u_xlat26.x = u_xlat14.x * u_xlat14.x;
			            //MAD
			            u_xlat38 = u_xlat26.x * 0.0208350997 + -0.0851330012;
			            //MAD
			            u_xlat38 = u_xlat26.x * u_xlat38 + 0.180141002;
			            //MAD
			            u_xlat38 = u_xlat26.x * u_xlat38 + -0.330299497;
			            //MAD
			            u_xlat26.x = u_xlat26.x * u_xlat38 + 0.999866009;
			            //MUL
			            u_xlat38 = u_xlat26.x * u_xlat14.x;
			            //LT
			            u_xlatb39 = abs(u_xlat4.y)<abs(u_xlat4.w);
			            //MAD
			            u_xlat38 = u_xlat38 * -2.0 + 1.57079637;
			            //AND
			            u_xlat38 = u_xlatb39 ? u_xlat38 : float(0.0);
			            //MAD
			            u_xlat14.x = u_xlat14.x * u_xlat26.x + u_xlat38;
			            //LT
			            u_xlatb26 = u_xlat4.y<(-u_xlat4.y);
			            //AND
			            u_xlat26.x = u_xlatb26 ? -3.14159274 : float(0.0);
			            //ADD
			            u_xlat14.x = u_xlat26.x + u_xlat14.x;
			            //MIN
			            u_xlat26.x = min(u_xlat4.y, u_xlat4.w);
			            //MAX
			            u_xlat38 = max(u_xlat4.y, u_xlat4.w);
			            //LT
			            u_xlatb26 = u_xlat26.x<(-u_xlat26.x);
			            //GE
			            u_xlatb38 = u_xlat38>=(-u_xlat38);
			            //AND
			            u_xlatb26 = u_xlatb38 && u_xlatb26;
			            //MOVC
			            u_xlat14.x = (u_xlatb26) ? (-u_xlat14.x) : u_xlat14.x;
			            //DP2
			            u_xlat26.x = dot(u_xlat4.yw, u_xlat4.yw);
			            //SQRT
			            u_xlat26.x = sqrt(u_xlat26.x);
			            //ADD
			            u_xlat14.x = u_xlat14.x + 0.314159274;
			            //MUL
			            u_xlat38 = u_xlat14.x * 1.5915494;
			            //ROUND_NI
			            u_xlat38 = floor(u_xlat38);
			            //MAD
			            u_xlat14.x = (-u_xlat38) * 0.628318548 + u_xlat14.x;
			            //ADD
			            u_xlat14.x = u_xlat14.x + -0.314159274;
			            //SINCOS
			            u_xlat5.x = sin(u_xlat14.x);
			            u_xlat6.x = cos(u_xlat14.x);
			            //MOV
			            u_xlat6.xz = u_xlat6.xx;
			            //MOV
			            u_xlat6.y = u_xlat5.x;
			            //MUL
			            u_xlat14.xyz = u_xlat26.xxx * u_xlat6.xyz;
			            //MAD
			            u_xlat14.xyz = u_xlat14.xyz * float3(2.0, 2.0, 2.0) + float3(-1.0, -0.0, -1.0);
			            //MUL
			            u_xlat5.xyz = u_xlat14.xyz * float3(0.5, 0.5, 3.0);
			            //SINCOS
			            u_xlat14.x = sin(u_xlat5.z);
			            //MAD
			            u_xlat6.y = u_xlat14.x * 0.100000001 + u_xlat4.z;
			            //ADD
			            u_xlat5.w = abs(u_xlat5.y) + 0.600000024;
			            //DP2
			            u_xlat14.x = dot(u_xlat5.xw, u_xlat5.xw);
			            //SQRT
			            u_xlat6.x = sqrt(u_xlat14.x);
			            //ADD
			            u_xlat14.xy = abs(u_xlat6.xy) + float2(-0.699999988, -0.00999999978);
			            //MAX
			            u_xlat38 = max(u_xlat14.y, u_xlat14.x);
			            //MIN
			            u_xlat38 = min(u_xlat38, 0.0);
			            //MAX
			            u_xlat14.xy = max(u_xlat14.xy, float2(0.0, 0.0));
			            //DP2
			            u_xlat14.x = dot(u_xlat14.xy, u_xlat14.xy);
			            //SQRT
			            u_xlat14.x = sqrt(u_xlat14.x);
			            //ADD
			            u_xlat14.x = u_xlat14.x + u_xlat38;
			            //MOV
			            u_xlat6.zw = u_xlat5.xy;
			            //ADD
			            u_xlat5.xyz = u_xlat6.zyw + float3(-0.0, -0.00999999978, -0.0);
			            //ADD
			            u_xlat5.xyz = abs(u_xlat5.xyz) + float3(-0.449999988, -0.0130000003, -0.00100000005);
			            //MAX
			            u_xlat26.x = max(u_xlat5.z, u_xlat5.y);
			            //MAX
			            u_xlat26.x = max(u_xlat26.x, u_xlat5.x);
			            //MIN
			            u_xlat26.x = min(u_xlat26.x, 0.0);
			            //MAX
			            u_xlat5.xyz = max(u_xlat5.xyz, float3(0.0, 0.0, 0.0));
			            //DP3
			            u_xlat38 = dot(u_xlat5.xyz, u_xlat5.xyz);
			            //SQRT
			            u_xlat38 = sqrt(u_xlat38);
			            //ADD
			            u_xlat26.x = u_xlat38 + u_xlat26.x;
			            //ADD
			            u_xlat38 = (-u_xlat14.x) + u_xlat26.x;
			            //MAD
			            u_xlat38 = u_xlat38 * 10.0 + 0.5;
			            u_xlat38 = clamp(u_xlat38, 0.0, 1.0);
			            //ADD
			            u_xlat14.x = (-u_xlat26.x) + u_xlat14.x;
			            //MAD
			            u_xlat14.x = u_xlat38 * u_xlat14.x + u_xlat26.x;
			            //MUL
			            u_xlat26.x = u_xlat38 * 0.0500000007;
			            //ADD
			            u_xlat38 = (-u_xlat38) + 1.0;
			            //MAD
			            u_xlat14.x = (-u_xlat26.x) * u_xlat38 + u_xlat14.x;
			            //MUL
			            u_xlat26.x = u_xlat4.z * 4.0;
			            //SINCOS
			            u_xlat26.x = sin(u_xlat26.x);
			            //MAD
			            u_xlat26.x = u_xlat26.x * 0.100000001 + u_xlat4.y;
			            //ADD
			            u_xlat5.x = u_xlat26.x + -0.0500000007;
			            //MOV
			            u_xlat5.yw = u_xlat4.wz;
			            //DP2
			            u_xlat26.x = dot(u_xlat5.xy, u_xlat5.xy);
			            //SQRT
			            u_xlat5.z = sqrt(u_xlat26.x);
			            //ADD
			            u_xlat26.xy = abs(u_xlat5.zw) + float2(-0.0399999991, -0.699999988);
			            //MAX
			            u_xlat39 = max(u_xlat26.y, u_xlat26.x);
			            //MIN
			            u_xlat39 = min(u_xlat39, 0.0);
			            //MAX
			            u_xlat26.xy = max(u_xlat26.xy, float2(0.0, 0.0));
			            //DP2
			            u_xlat26.x = dot(u_xlat26.xy, u_xlat26.xy);
			            //SQRT
			            u_xlat26.x = sqrt(u_xlat26.x);
			            //ADD
			            u_xlat26.x = u_xlat26.x + u_xlat39;
			            //ADD
			            u_xlat38 = (-u_xlat14.x) + u_xlat26.x;
			            //MAD
			            u_xlat38 = u_xlat38 * 1.66666663 + 0.5;
			            u_xlat38 = clamp(u_xlat38, 0.0, 1.0);
			            //ADD
			            u_xlat14.x = (-u_xlat26.x) + u_xlat14.x;
			            //MAD
			            u_xlat14.x = u_xlat38 * u_xlat14.x + u_xlat26.x;
			            //MUL
			            u_xlat26.x = u_xlat38 * 0.300000012;
			            //ADD
			            u_xlat38 = (-u_xlat38) + 1.0;
			            //MAD
			            u_xlat14.x = (-u_xlat26.x) * u_xlat38 + u_xlat14.x;
			            //MOV
			            u_xlat26.x = u_xlat3.y;
			            u_xlat26.x = clamp(u_xlat26.x, 0.0, 1.0);
			            //MAD
			            u_xlat38 = u_xlat26.x * -2.0 + 3.0;
			            //MUL
			            u_xlat26.x = u_xlat26.x * u_xlat26.x;
			            //MOV
			            u_xlat4.x = u_xlat4.x;
			            u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
			            //MAD
			            u_xlat39 = u_xlat4.x * -2.0 + 3.0;
			            //MUL
			            u_xlat4.x = u_xlat4.x * u_xlat4.x;
			            //MUL
			            u_xlat39 = u_xlat39 * u_xlat4.x;
			            //MUL
			            u_xlat39 = u_xlat39 * 3.0;
			            //MAD
			            u_xlat26.x = u_xlat38 * u_xlat26.x + (-u_xlat39);
			            //MAD
			            u_xlat26.x = (-u_xlat26.x) * 0.159999996 + 1.0;
			            //MUL
			            u_xlat3.xzw = u_xlat26.xxx * u_xlat3.xyz;
			            //MUL
			            u_xlat26.y = u_xlat3.z * 2.22222233;
			            u_xlat26.y = clamp(u_xlat26.y, 0.0, 1.0);
			            //MAD
			            u_xlat4.x = u_xlat26.y * -2.0 + 3.0;
			            //MAD
			            u_xlat26.x = u_xlat3.y * u_xlat26.x + -0.449999988;
			            //MUL
			            u_xlat26.x = u_xlat26.x * 2.22222233;
			            u_xlat26.x = clamp(u_xlat26.x, 0.0, 1.0);
			            //MAD
			            u_xlat15.x = u_xlat26.x * -2.0 + 3.0;
			            //MUL
			            u_xlat26.xy = u_xlat26.xy * u_xlat26.xy;
			            //MUL
			            u_xlat26.x = u_xlat26.x * u_xlat15.x;
			            //MAD
			            u_xlat26.x = u_xlat4.x * u_xlat26.y + (-u_xlat26.x);
			            //MAD
			            u_xlat26.x = (-u_xlat26.x) * 0.0700000003 + 1.0;
			            //MUL
			            u_xlat4.xyz = u_xlat26.xxx * u_xlat3.xwz;
			            //MAD
			            u_xlat26.x = u_xlat3.z * u_xlat26.x + 0.600000024;
			            //MUL
			            u_xlat26.x = u_xlat26.x * 1.25;
			            u_xlat26.x = clamp(u_xlat26.x, 0.0, 1.0);
			            //MAD
			            u_xlat38 = u_xlat26.x * -2.0 + 3.0;
			            //MUL
			            u_xlat26.x = u_xlat26.x * u_xlat26.x;
			            //MAD
			            u_xlat26.x = (-u_xlat38) * u_xlat26.x + 1.0;
			            //MAD
			            u_xlat26.x = u_xlat26.x * 0.200000003 + 1.0;
			            //MUL
			            u_xlat4.xy = u_xlat26.xx * u_xlat4.xy;
			            //MUL
			            u_xlat4.w = u_xlat4.z * 0.800000012;
			            //MUL
			            u_xlat3.xyz = u_xlat4.xzy * float3(0.449999988, 0.359999985, 0.449999988);
			            //DP3
			            u_xlat26.x = dot(u_xlat4.xyw, u_xlat4.xyw);
			            //RSQ
			            u_xlat38 = rsqrt(u_xlat26.x);
			            //MUL
			            u_xlat5 = (float4)(u_xlat38) * u_xlat4.xxwy;
			            //MAD
			            u_xlat6.xy = u_xlat4.xz * float2(0.449999988, 0.359999985) + float2(-0.140000001, -0.140000001);
			            //SAMPLE_L
			            u_xlat6 = tex2Dlod(_NoiseTex, float4(u_xlat6.xy, 0.0,1.5));
			            //SAMPLE_L
			            u_xlat7 = tex2Dlod(_NoiseTex, float4(u_xlat3.xz, 0.0,0.0));
			            //SAMPLE_L
			            u_xlat3 = tex2Dlod(_NoiseTex, float4(u_xlat3.yz, 0.0,1.5));
			            //MUL
			            u_xlat15.x = abs(u_xlat5.z) * u_xlat7.x;
			            //MAD
			            u_xlat15.x = u_xlat6.x * abs(u_xlat5.w) + u_xlat15.x;
			            //MAD
			            u_xlat3.x = u_xlat3.x * abs(u_xlat5.y) + u_xlat15.x;
			            //SQRT
			            u_xlat26.x = sqrt(u_xlat26.x);
			            //ADD
			            u_xlat26.x = u_xlat26.x + -1.0;
			            //MAD
			            u_xlat26.x = (-u_xlat3.x) * 0.100000001 + u_xlat26.x;
			            //MIN
			            u_xlat3.x = min(abs(u_xlat5.y), abs(u_xlat5.z));
			            //MAX
			            u_xlat15.x = max(abs(u_xlat5.y), abs(u_xlat5.z));
			            //DIV
			            u_xlat15.x = float(1.0) / u_xlat15.x;
			            //MUL
			            u_xlat3.x = u_xlat15.x * u_xlat3.x;
			            //MUL
			            u_xlat15.x = u_xlat3.x * u_xlat3.x;
			            //MAD
			            u_xlat27.x = u_xlat15.x * 0.0208350997 + -0.0851330012;
			            //MAD
			            u_xlat27.x = u_xlat15.x * u_xlat27.x + 0.180141002;
			            //MAD
			            u_xlat27.x = u_xlat15.x * u_xlat27.x + -0.330299497;
			            //MAD
			            u_xlat15.x = u_xlat15.x * u_xlat27.x + 0.999866009;
			            //MUL
			            u_xlat27.x = u_xlat15.x * u_xlat3.x;
			            //LT
			            u_xlatb39 = abs(u_xlat5.y)<abs(u_xlat5.z);
			            //MAD
			            u_xlat27.x = u_xlat27.x * -2.0 + 1.57079637;
			            //AND
			            u_xlat27.x = u_xlatb39 ? u_xlat27.x : float(0.0);
			            //MAD
			            u_xlat3.x = u_xlat3.x * u_xlat15.x + u_xlat27.x;
			            //LT
			            u_xlatb15 = u_xlat5.y<(-u_xlat5.x);
			            //AND
			            u_xlat15.x = u_xlatb15 ? -3.14159274 : float(0.0);
			            //ADD
			            u_xlat3.x = u_xlat15.x + u_xlat3.x;
			            //MIN
			            u_xlat15.x = min(u_xlat5.y, u_xlat5.z);
			            //MAX
			            u_xlat27.x = max(u_xlat5.y, u_xlat5.z);
			            //LT
			            u_xlatb15 = u_xlat15.x<(-u_xlat15.x);
			            //GE
			            u_xlatb27 = u_xlat27.x>=(-u_xlat27.x);
			            //AND
			            u_xlatb15 = u_xlatb27 && u_xlatb15;
			            //MOVC
			            u_xlat3.x = (u_xlatb15) ? (-u_xlat3.x) : u_xlat3.x;
			            //MIN
			            u_xlat3.x = min(u_xlat3.x, 3.14159012);
			            //MAD
			            u_xlat27.x = (-u_xlat5.w) * u_xlat5.w + 1.0;
			            //MUL
			            u_xlat27.x = u_xlat27.x * 899.175598;
			            //LOG
			            u_xlat27.x = log2(u_xlat27.x);
			            //MUL
			            u_xlat27.x = u_xlat27.x * 0.720210016;
			            //ROUND_NI
			            u_xlat27.x = floor(u_xlat27.x);
			            //MAX
			            u_xlat27.x = max(u_xlat27.x, 2.0);
			            //MUL
			            u_xlat27.x = u_xlat27.x * 0.694241941;
			            //EXP
			            u_xlat27.x = exp2(u_xlat27.x);
			            //MUL
			            u_xlat27.xy = u_xlat27.xx * float2(0.44721359, 0.723606825);
			            //ROUND_NE
			            u_xlat27.xy = round(u_xlat27.xy);
			            //ADD
			            u_xlat5.xy = u_xlat27.yx + float2(1.0, 1.0);
			            //MUL
			            u_xlat29.xy = u_xlat5.xy * float2(0.618034005, 0.618034005);
			            //ROUND_NI
			            u_xlat29.xy = floor(u_xlat29.xy);
			            //MAD
			            u_xlat5.xy = u_xlat5.xy * float2(0.618034005, 0.618034005) + (-u_xlat29.xy);
			            //MAD
			            u_xlat5.xy = u_xlat5.xy * float2(6.28318024, 6.28318024) + float2(-3.88321877, -3.88321877);
			            //MUL
			            u_xlat27.xy = u_xlat27.xy * float2(-0.015625, -0.015625);
			            //MUL
			            u_xlat28.x = u_xlat27.x * u_xlat5.x;
			            //MAD
			            u_xlat28.x = u_xlat5.y * u_xlat27.y + (-u_xlat28.x);
			            //MUL
			            u_xlat6.xz = u_xlat27.yx * float2(1.0, -1.0);
			            //MUL
			            u_xlat6.yw = u_xlat5.xy * float2(-1.0, 1.0);
			            //DIV
			            u_xlat5 = u_xlat6 / u_xlat28.xxxx;
			            //MAD
			            u_xlat3.y = u_xlat4.y * u_xlat38 + -0.9921875;
			            //DP2
			            u_xlat28.x = dot(u_xlat5.xy, u_xlat3.xy);
			            //DP2
			            u_xlat3.x = dot(u_xlat5.zw, u_xlat3.xy);
			            //ROUND_NI
			            u_xlat5.x = floor(u_xlat28.x);
			            //ROUND_NI
			            u_xlat5.y = floor(u_xlat3.x);
			            //MOV
			            u_xlat6.x = float(100000.0);
			            //MOV
			            u_xlat6.y = float(0.0);
			            //MOV
			            u_xlat6.z = float(0.0);
			            //MOV
			            u_xlat6.w = float(0.0);
			            //LOOP
			            for(uint u_xlatu_loop_1 = 0u ; u_xlatu_loop_1<4u ; u_xlatu_loop_1++)
			            {
			                //AND
			                u_xlatu15 = u_xlatu_loop_1 & 1u;
			                //USHR
			                u_xlatu28.x = u_xlatu_loop_1 >> 1u;
			                //UTOF
			                u_xlat7.x = float(u_xlatu15);
			                //UTOF
			                u_xlat7.y = float(u_xlatu28.x);
			                //ADD
			                u_xlat29.xy = u_xlat5.xy + u_xlat7.xy;
			                //DP2
			                u_xlat15.x = dot(u_xlat27.xy, u_xlat29.xy);
			                //ADD
			                u_xlat15.x = u_xlat15.x + 0.9921875;
			                //MAX
			                u_xlat28.x = max(u_xlat15.x, -1.0);
			                //MIN
			                u_xlat28.x = min(u_xlat28.x, 1.0);
			                //MAD
			                u_xlat15.x = u_xlat28.x * 2.0 + (-u_xlat15.x);
			                //MAD
			                u_xlat15.x = (-u_xlat15.x) * 64.0 + 64.0;
			                //ROUND_NI
			                u_xlat15.x = floor(u_xlat15.x);
			                //MUL
			                u_xlat28.x = u_xlat15.x * 0.618034005;
			                //ROUND_NI
			                u_xlat28.x = floor(u_xlat28.x);
			                //MAD
			                u_xlat28.x = u_xlat15.x * 0.618034005 + (-u_xlat28.x);
			                //MUL
			                u_xlat28.x = u_xlat28.x * 6.28318024;
			                //MAD
			                u_xlat15.x = u_xlat15.x * 2.0 + 1.0;
			                //MAD
			                u_xlat7.w = (-u_xlat15.x) * 0.0078125 + 1.0;
			                //MAD
			                u_xlat15.x = (-u_xlat7.w) * u_xlat7.w + 1.0;
			                //SQRT
			                u_xlat15.x = sqrt(u_xlat15.x);
			                //SINCOS
			                u_xlat8.x = sin(u_xlat28.x);
			                u_xlat9.x = cos(u_xlat28.x);
			                //MUL
			                u_xlat7.y = u_xlat15.x * u_xlat9.x;
			                //MUL
			                u_xlat7.z = u_xlat15.x * u_xlat8.x;
			                //MAD
			                u_xlat8.xyz = (-u_xlat4.xwy) * (float3)(u_xlat38) + u_xlat7.yzw;
			                //DP3
			                u_xlat7.x = dot(u_xlat8.xyz, u_xlat8.xyz);
			                //LT
			                u_xlatb15 = u_xlat7.x<u_xlat6.x;
			                //MOVC
			                u_xlat6 = ((bool)(u_xlatb15)) ? u_xlat7 : u_xlat6;
			            //ENDLOOP
			            }
			            //MAD
			            u_xlat3.xyz = (-u_xlat6.yzw) * float3(1.01999998, 1.01999998, 1.01999998) + u_xlat4.xwy;
			            //DP3
			            u_xlat38 = dot(u_xlat3.xyz, u_xlat3.xyz);
			            //SQRT
			            u_xlat38 = sqrt(u_xlat38);
			            //ADD
			            u_xlat38 = u_xlat38 + -0.0599999987;
			            //ADD
			            u_xlat3.x = (-u_xlat38) + u_xlat26.x;
			            //MAD
			            u_xlat3.x = u_xlat3.x * 50.0 + 0.5;
			            u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
			            //ADD
			            u_xlat38 = (-u_xlat26.x) + u_xlat38;
			            //MAD
			            u_xlat38 = u_xlat3.x * u_xlat38 + u_xlat26.x;
			            //MUL
			            u_xlat15.x = u_xlat3.x * 0.00999999978;
			            //ADD
			            u_xlat3.x = (-u_xlat3.x) + 1.0;
			            //MAD
			            u_xlat38 = (-u_xlat15.x) * u_xlat3.x + u_xlat38;
			            //LT
			            u_xlatb3.x = u_xlat38<u_xlat26.x;
			            //MOVC
			            u_xlat26.x = (u_xlatb3.x) ? u_xlat38 : u_xlat26.x;
			            //LT
			            u_xlatb38 = u_xlat14.x<u_xlat26.x;
			            //MOVC
			            u_xlat14.x = (u_xlatb38) ? u_xlat14.x : u_xlat26.x;
			            //MUL
			            u_xlat14.x = u_xlat14.x * 0.300000012;
			        //ELSE
			        } else {
			            //MOV
			            u_xlat14.x = 1.0;
			        //ENDIF
			        }
			        //ADD
			        u_xlat26.x = u_xlat37 + u_xlat14.x;
			        //LT
			        u_xlatb38 = _MaxDist<u_xlat26.x;
			        //MAD
			        u_xlat3.x = u_xlat26.x * 0.25 + 1.0;
			        //MUL
			        u_xlat3.x = u_xlat3.x * 0.00200000009;
			        //LT
			        u_xlatb14 = abs(u_xlat14.x)<u_xlat3.x;
			        //OR
			        u_xlatb14 = u_xlatb14 || u_xlatb38;
			        //IF
			        if(u_xlatb14){
			            //MOV
			            u_xlat37 = u_xlat26.x;
			            //BREAK
			            break;
			        //ENDIF
			        }
			        //IADD
			        u_xlati2 = u_xlati2 + 1;
			        //MOV
			        u_xlat37 = u_xlat26.x;
			    //ENDLOOP
			    }
			    //ITOF
			    u_xlat2.x = float(u_xlati2);
			    //MAD
			    u_xlat0.xyz = (float3)(u_xlat37) * u_xlat0.xyz + u_xlat1.xyz;
			    //DIV
			    u_xlat1.x = u_xlat2.x / _Iterations;
			    //LOG
			    u_xlat1.x = log2(u_xlat1.x);
			    //MUL
			    u_xlat1.x = u_xlat1.x * 0.75;
			    //EXP
			    u_xlat1.x = exp2(u_xlat1.x);
			    //ADD
			    u_xlat1.x = (-u_xlat1.x) + 1.0;
			    //MUL
			    u_xlat13.xy = u_xlat0.xy * float2(3.33333325, 3.33333325);
			    //MAD
			    u_xlat14.z = u_xlat0.z * 3.33333325 + (-u_xlat36);
			    //ADD
			    u_xlat37 = u_xlat14.z + 3.0;
			    //MUL
			    u_xlat37 = u_xlat37 * 0.0500000007;
			    //SINCOS
			    u_xlat2.x = sin(u_xlat37);
			    u_xlat3.x = cos(u_xlat37);
			    //MOV
			    u_xlat4.x = (-u_xlat2.x);
			    //MOV
			    u_xlat4.y = u_xlat3.x;
			    //MOV
			    u_xlat4.z = u_xlat2.x;
			    //DP2
			    u_xlat14.x = dot(u_xlat13.xy, u_xlat4.yz);
			    //DP2
			    u_xlat14.y = dot(u_xlat13.xy, u_xlat4.xy);
			    //ADD
			    u_xlat13.xyz = u_xlat14.xyz + float3(3.0, 3.0, 3.0);
			    //MUL
			    u_xlat2.xyz = u_xlat13.xyz * float3(0.166666672, 0.166666672, 0.166666672);
			    //ROUND_NI
			    u_xlat2.xyz = floor(u_xlat2.xyz);
			    //EQ
			    u_xlatb3.xy = ((u_xlat2.xyxx) == (float4(0.0, 0.0, 0.0, 0.0))).xy;
			    //OR
			    u_xlatb38 = u_xlatb3.y || u_xlatb3.x;
			    //IF
			    if(!u_xlatb38){
			        //MAD
			        u_xlat3.xyz = (-u_xlat2.xyz) * float3(6.0, 6.0, 6.0) + u_xlat13.xyz;
			        //ADD
			        u_xlat3.yzw = u_xlat3.xyz + float3(-3.0, -3.0, -3.0);
			        //MAD
			        u_xlat4.xyz = _Time.yyy * float3(1.29999995, 0.800000012, 1.20000005) + u_xlat2.xyz;
			        //SINCOS
			        u_xlat5.x = cos(u_xlat4.x);
			        u_xlat4.x = sin(u_xlat4.x);
			        //MOV
			        u_xlat6.x = (-u_xlat4.x);
			        //MOV
			        u_xlat6.y = u_xlat5.x;
			        //MOV
			        u_xlat6.z = u_xlat4.x;
			        //DP2
			        u_xlat3.x = dot(u_xlat3.yz, u_xlat6.yz);
			        //DP2
			        u_xlat5.x = dot(u_xlat3.yz, u_xlat6.xy);
			        //SINCOS
			        u_xlat6.x = cos(u_xlat4.y);
			        u_xlat4.x = sin(u_xlat4.y);
			        //MOV
			        u_xlat7.x = (-u_xlat4.x);
			        //MOV
			        u_xlat7.y = u_xlat6.x;
			        //MOV
			        u_xlat7.z = u_xlat4.x;
			        //DP2
			        u_xlat6.x = dot(u_xlat3.xw, u_xlat7.yz);
			        //DP2
			        u_xlat5.y = dot(u_xlat3.xw, u_xlat7.xy);
			        //SINCOS
			        u_xlat3.x = sin(u_xlat4.z);
			        u_xlat4.x = cos(u_xlat4.z);
			        //MOV
			        u_xlat7.x = (-u_xlat3.x);
			        //MOV
			        u_xlat7.y = u_xlat4.x;
			        //MOV
			        u_xlat7.z = u_xlat3.x;
			        //DP2
			        u_xlat6.y = dot(u_xlat5.xy, u_xlat7.yz);
			        //DP2
			        u_xlat6.z = dot(u_xlat5.xy, u_xlat7.xy);
			        //ADD
			        u_xlat3.x = u_xlat2.x + _Time.y;
			        //SINCOS
			        u_xlat3.x = sin(u_xlat3.x);
			        //MAD
			        u_xlat3.x = u_xlat3.x * 0.5 + 0.5;
			        //MAD
			        u_xlat3.x = u_xlat3.x * 0.199999988 + 0.800000012;
			        //MUL
			        u_xlat15.xyz = u_xlat3.xxx * u_xlat6.xyz;
			        //MAD
			        u_xlat4 = u_xlat6.yxyz * u_xlat3.xxxx + float4(-1.0, -0.0, -1.32000005, -0.0);
			        //MIN
			        u_xlat3.x = min(abs(u_xlat4.y), abs(u_xlat4.w));
			        //MAX
			        u_xlat5.x = max(abs(u_xlat4.y), abs(u_xlat4.w));
			        //DIV
			        u_xlat5.x = float(1.0) / u_xlat5.x;
			        //MUL
			        u_xlat3.x = u_xlat3.x * u_xlat5.x;
			        //MUL
			        u_xlat5.x = u_xlat3.x * u_xlat3.x;
			        //MAD
			        u_xlat17.x = u_xlat5.x * 0.0208350997 + -0.0851330012;
			        //MAD
			        u_xlat17.x = u_xlat5.x * u_xlat17.x + 0.180141002;
			        //MAD
			        u_xlat17.x = u_xlat5.x * u_xlat17.x + -0.330299497;
			        //MAD
			        u_xlat5.x = u_xlat5.x * u_xlat17.x + 0.999866009;
			        //MUL
			        u_xlat17.x = u_xlat3.x * u_xlat5.x;
			        //LT
			        u_xlatb29 = abs(u_xlat4.y)<abs(u_xlat4.w);
			        //MAD
			        u_xlat17.x = u_xlat17.x * -2.0 + 1.57079637;
			        //AND
			        u_xlat17.x = u_xlatb29 ? u_xlat17.x : float(0.0);
			        //MAD
			        u_xlat3.x = u_xlat3.x * u_xlat5.x + u_xlat17.x;
			        //LT
			        u_xlatb5 = u_xlat4.y<(-u_xlat4.y);
			        //AND
			        u_xlat5.x = u_xlatb5 ? -3.14159274 : float(0.0);
			        //ADD
			        u_xlat3.x = u_xlat3.x + u_xlat5.x;
			        //MIN
			        u_xlat5.x = min(u_xlat4.y, u_xlat4.w);
			        //MAX
			        u_xlat17.x = max(u_xlat4.y, u_xlat4.w);
			        //LT
			        u_xlatb5 = u_xlat5.x<(-u_xlat5.x);
			        //GE
			        u_xlatb17 = u_xlat17.x>=(-u_xlat17.x);
			        //AND
			        u_xlatb5 = u_xlatb17 && u_xlatb5;
			        //MOVC
			        u_xlat3.x = (u_xlatb5) ? (-u_xlat3.x) : u_xlat3.x;
			        //DP2
			        u_xlat5.x = dot(u_xlat4.yw, u_xlat4.yw);
			        //SQRT
			        u_xlat5.x = sqrt(u_xlat5.x);
			        //ADD
			        u_xlat3.x = u_xlat3.x + 0.314159274;
			        //MUL
			        u_xlat17.x = u_xlat3.x * 1.5915494;
			        //ROUND_NI
			        u_xlat17.x = floor(u_xlat17.x);
			        //MAD
			        u_xlat3.x = (-u_xlat17.x) * 0.628318548 + u_xlat3.x;
			        //ADD
			        u_xlat3.x = u_xlat3.x + -0.314159274;
			        //SINCOS
			        u_xlat6.x = cos(u_xlat3.x);
			        u_xlat3.x = sin(u_xlat3.x);
			        //MOV
			        u_xlat6.xz = u_xlat6.xx;
			        //MOV
			        u_xlat6.y = u_xlat3.x;
			        //MUL
			        u_xlat5.xyz = u_xlat5.xxx * u_xlat6.xyz;
			        //MAD
			        u_xlat5.xyz = u_xlat5.xyz * float3(2.0, 2.0, 2.0) + float3(-1.0, -0.0, -1.0);
			        //MUL
			        u_xlat5.xyz = u_xlat5.xyz * float3(0.5, 0.5, 3.0);
			        //SINCOS
			        u_xlat3.x = sin(u_xlat5.z);
			        //MAD
			        u_xlat6.y = u_xlat3.x * 0.100000001 + u_xlat4.z;
			        //ADD
			        u_xlat5.w = abs(u_xlat5.y) + 0.600000024;
			        //DP2
			        u_xlat3.x = dot(u_xlat5.xw, u_xlat5.xw);
			        //SQRT
			        u_xlat6.x = sqrt(u_xlat3.x);
			        //ADD
			        u_xlat29.xy = abs(u_xlat6.xy) + float2(-0.699999988, -0.00999999978);
			        //MAX
			        u_xlat3.x = max(u_xlat29.y, u_xlat29.x);
			        //MIN
			        u_xlat3.x = min(u_xlat3.x, 0.0);
			        //MAX
			        u_xlat29.xy = max(u_xlat29.xy, float2(0.0, 0.0));
			        //DP2
			        u_xlat29.x = dot(u_xlat29.xy, u_xlat29.xy);
			        //SQRT
			        u_xlat29.x = sqrt(u_xlat29.x);
			        //ADD
			        u_xlat3.x = u_xlat3.x + u_xlat29.x;
			        //MOV
			        u_xlat6.zw = u_xlat5.xy;
			        //ADD
			        u_xlat5.xyz = u_xlat6.zyw + float3(-0.0, -0.00999999978, -0.0);
			        //ADD
			        u_xlat5.xyz = abs(u_xlat5.xyz) + float3(-0.449999988, -0.0130000003, -0.00100000005);
			        //MAX
			        u_xlat41 = max(u_xlat5.z, u_xlat5.y);
			        //MAX
			        u_xlat41 = max(u_xlat41, u_xlat5.x);
			        //MIN
			        u_xlat41 = min(u_xlat41, 0.0);
			        //MAX
			        u_xlat5.xyz = max(u_xlat5.xyz, float3(0.0, 0.0, 0.0));
			        //DP3
			        u_xlat5.x = dot(u_xlat5.xyz, u_xlat5.xyz);
			        //SQRT
			        u_xlat5.x = sqrt(u_xlat5.x);
			        //ADD
			        u_xlat5.x = u_xlat5.x + u_xlat41;
			        //ADD
			        u_xlat17.x = (-u_xlat3.x) + u_xlat5.x;
			        //MAD
			        u_xlat17.x = u_xlat17.x * 10.0 + 0.5;
			        u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
			        //ADD
			        u_xlat3.x = u_xlat3.x + (-u_xlat5.x);
			        //MAD
			        u_xlat3.x = u_xlat17.x * u_xlat3.x + u_xlat5.x;
			        //MUL
			        u_xlat5.x = u_xlat17.x * 0.0500000007;
			        //ADD
			        u_xlat17.x = (-u_xlat17.x) + 1.0;
			        //MAD
			        u_xlat3.x = (-u_xlat5.x) * u_xlat17.x + u_xlat3.x;
			        //MUL
			        u_xlat5.x = u_xlat4.z * 4.0;
			        //SINCOS
			        u_xlat5.x = sin(u_xlat5.x);
			        //MAD
			        u_xlat16.x = u_xlat5.x * 0.100000001 + u_xlat4.y;
			        //ADD
			        u_xlat5.x = u_xlat16.x + -0.0500000007;
			        //MOV
			        u_xlat5.yw = u_xlat4.wz;
			        //DP2
			        u_xlat16.x = dot(u_xlat5.xy, u_xlat5.xy);
			        //SQRT
			        u_xlat5.z = sqrt(u_xlat16.x);
			        //ADD
			        u_xlat16.xy = abs(u_xlat5.zw) + float2(-0.0399999991, -0.699999988);
			        //MAX
			        u_xlat40 = max(u_xlat16.y, u_xlat16.x);
			        //MIN
			        u_xlat40 = min(u_xlat40, 0.0);
			        //MAX
			        u_xlat16.xy = max(u_xlat16.xy, float2(0.0, 0.0));
			        //DP2
			        u_xlat16.x = dot(u_xlat16.xy, u_xlat16.xy);
			        //SQRT
			        u_xlat16.x = sqrt(u_xlat16.x);
			        //ADD
			        u_xlat16.x = u_xlat16.x + u_xlat40;
			        //ADD
			        u_xlat28.x = (-u_xlat3.x) + u_xlat16.x;
			        //MAD
			        u_xlat28.x = u_xlat28.x * 1.66666663 + 0.5;
			        u_xlat28.x = clamp(u_xlat28.x, 0.0, 1.0);
			        //ADD
			        u_xlat3.x = u_xlat3.x + (-u_xlat16.x);
			        //MAD
			        u_xlat3.x = u_xlat28.x * u_xlat3.x + u_xlat16.x;
			        //MUL
			        u_xlat16.x = u_xlat28.x * 0.300000012;
			        //ADD
			        u_xlat28.x = (-u_xlat28.x) + 1.0;
			        //MAD
			        u_xlat3.x = (-u_xlat16.x) * u_xlat28.x + u_xlat3.x;
			        //MOV
			        u_xlat4.y = u_xlat15.y;
			        u_xlat4.y = clamp(u_xlat4.y, 0.0, 1.0);
			        //MAD
			        u_xlat28.x = u_xlat4.y * -2.0 + 3.0;
			        //MOV
			        u_xlat4.x = u_xlat4.x;
			        u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
			        //MAD
			        u_xlat40 = u_xlat4.x * -2.0 + 3.0;
			        //MUL
			        u_xlat4.xy = u_xlat4.xy * u_xlat4.xy;
			        //MUL
			        u_xlat4.x = u_xlat4.x * u_xlat40;
			        //MUL
			        u_xlat4.x = u_xlat4.x * 3.0;
			        //MAD
			        u_xlat4.x = u_xlat28.x * u_xlat4.y + (-u_xlat4.x);
			        //MAD
			        u_xlat4.x = (-u_xlat4.x) * 0.159999996 + 1.0;
			        //MUL
			        u_xlat16.xyz = u_xlat15.xyz * u_xlat4.xxx;
			        //MUL
			        u_xlat15.x = u_xlat16.y * 2.22222233;
			        u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
			        //MAD
			        u_xlat39 = u_xlat15.x * -2.0 + 3.0;
			        //MAD
			        u_xlat27.x = u_xlat15.y * u_xlat4.x + -0.449999988;
			        //MUL
			        u_xlat15.y = u_xlat27.x * 2.22222233;
			        u_xlat15.y = clamp(u_xlat15.y, 0.0, 1.0);
			        //MAD
			        u_xlat4.x = u_xlat15.y * -2.0 + 3.0;
			        //MUL
			        u_xlat15.xy = u_xlat15.xy * u_xlat15.xy;
			        //MUL
			        u_xlat27.x = u_xlat15.y * u_xlat4.x;
			        //MAD
			        u_xlat15.x = u_xlat39 * u_xlat15.x + (-u_xlat27.x);
			        //MAD
			        u_xlat15.x = (-u_xlat15.x) * 0.0700000003 + 1.0;
			        //MUL
			        u_xlat5.xyz = u_xlat15.xxx * u_xlat16.xzy;
			        //MAD
			        u_xlat15.x = u_xlat16.y * u_xlat15.x + 0.600000024;
			        //MUL
			        u_xlat15.x = u_xlat15.x * 1.25;
			        u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
			        //MAD
			        u_xlat27.x = u_xlat15.x * -2.0 + 3.0;
			        //MUL
			        u_xlat15.x = u_xlat15.x * u_xlat15.x;
			        //MAD
			        u_xlat15.x = (-u_xlat27.x) * u_xlat15.x + 1.0;
			        //MAD
			        u_xlat15.x = u_xlat15.x * 0.200000003 + 1.0;
			        //MUL
			        u_xlat5.xy = u_xlat15.xx * u_xlat5.xy;
			        //MUL
			        u_xlat5.w = u_xlat5.z * 0.800000012;
			        //MUL
			        u_xlat15.xyz = u_xlat5.xzy * float3(0.449999988, 0.359999985, 0.449999988);
			        //DP3
			        u_xlat4.x = dot(u_xlat5.xyw, u_xlat5.xyw);
			        //RSQ
			        u_xlat16.x = rsqrt(u_xlat4.x);
			        //MUL
			        u_xlat6 = u_xlat16.xxxx * u_xlat5.xxwy;
			        //MAD
			        u_xlat28.xy = u_xlat5.xz * float2(0.449999988, 0.359999985) + float2(-0.140000001, -0.140000001);
			        //SAMPLE_L
			        u_xlat7 = tex2Dlod(_NoiseTex, float4(u_xlat28.xy, 0.0,1.5));
			        //SAMPLE_L
			        u_xlat8 = tex2Dlod(_NoiseTex, float4(u_xlat15.xz, 0.0,0.0));
			        //SAMPLE_L
			        u_xlat9 = tex2Dlod(_NoiseTex, float4(u_xlat15.yz, 0.0,1.5));
			        //MUL
			        u_xlat15.x = abs(u_xlat6.z) * u_xlat8.x;
			        //MAD
			        u_xlat15.x = u_xlat7.x * abs(u_xlat6.w) + u_xlat15.x;
			        //MAD
			        u_xlat15.x = u_xlat9.x * abs(u_xlat6.y) + u_xlat15.x;
			        //SQRT
			        u_xlat27.x = sqrt(u_xlat4.x);
			        //ADD
			        u_xlat27.x = u_xlat27.x + -1.0;
			        //MAD
			        u_xlat15.x = (-u_xlat15.x) * 0.100000001 + u_xlat27.x;
			        //MIN
			        u_xlat27.x = min(abs(u_xlat6.y), abs(u_xlat6.z));
			        //MAX
			        u_xlat39 = max(abs(u_xlat6.y), abs(u_xlat6.z));
			        //DIV
			        u_xlat39 = float(1.0) / u_xlat39;
			        //MUL
			        u_xlat27.x = u_xlat39 * u_xlat27.x;
			        //MUL
			        u_xlat39 = u_xlat27.x * u_xlat27.x;
			        //MAD
			        u_xlat4.x = u_xlat39 * 0.0208350997 + -0.0851330012;
			        //MAD
			        u_xlat4.x = u_xlat39 * u_xlat4.x + 0.180141002;
			        //MAD
			        u_xlat4.x = u_xlat39 * u_xlat4.x + -0.330299497;
			        //MAD
			        u_xlat39 = u_xlat39 * u_xlat4.x + 0.999866009;
			        //MUL
			        u_xlat4.x = u_xlat39 * u_xlat27.x;
			        //LT
			        u_xlatb28 = abs(u_xlat6.y)<abs(u_xlat6.z);
			        //MAD
			        u_xlat4.x = u_xlat4.x * -2.0 + 1.57079637;
			        //AND
			        u_xlat4.x = u_xlatb28 ? u_xlat4.x : float(0.0);
			        //MAD
			        u_xlat27.x = u_xlat27.x * u_xlat39 + u_xlat4.x;
			        //LT
			        u_xlatb39 = u_xlat6.y<(-u_xlat6.x);
			        //AND
			        u_xlat39 = u_xlatb39 ? -3.14159274 : float(0.0);
			        //ADD
			        u_xlat27.x = u_xlat39 + u_xlat27.x;
			        //MIN
			        u_xlat39 = min(u_xlat6.y, u_xlat6.z);
			        //MAX
			        u_xlat4.x = max(u_xlat6.y, u_xlat6.z);
			        //LT
			        u_xlatb39 = u_xlat39<(-u_xlat39);
			        //GE
			        u_xlatb4.x = u_xlat4.x>=(-u_xlat4.x);
			        //AND
			        u_xlatb39 = u_xlatb39 && u_xlatb4.x;
			        //MOVC
			        u_xlat27.x = (u_xlatb39) ? (-u_xlat27.x) : u_xlat27.x;
			        //MIN
			        u_xlat6.x = min(u_xlat27.x, 3.14159012);
			        //MAD
			        u_xlat27.x = (-u_xlat6.w) * u_xlat6.w + 1.0;
			        //MUL
			        u_xlat27.x = u_xlat27.x * 899.175598;
			        //LOG
			        u_xlat27.x = log2(u_xlat27.x);
			        //MUL
			        u_xlat27.x = u_xlat27.x * 0.720210016;
			        //ROUND_NI
			        u_xlat27.x = floor(u_xlat27.x);
			        //MAX
			        u_xlat27.x = max(u_xlat27.x, 2.0);
			        //MUL
			        u_xlat27.x = u_xlat27.x * 0.694241941;
			        //EXP
			        u_xlat27.x = exp2(u_xlat27.x);
			        //MUL
			        u_xlat27.xy = u_xlat27.xx * float2(0.44721359, 0.723606825);
			        //ROUND_NE
			        u_xlat27.xy = round(u_xlat27.xy);
			        //ADD
			        u_xlat4.xz = u_xlat27.yx + float2(1.0, 1.0);
			        //MUL
			        u_xlat30.xy = u_xlat4.xz * float2(0.618034005, 0.618034005);
			        //ROUND_NI
			        u_xlat30.xy = floor(u_xlat30.xy);
			        //MAD
			        u_xlat4.xz = u_xlat4.xz * float2(0.618034005, 0.618034005) + (-u_xlat30.xy);
			        //MAD
			        u_xlat4.xz = u_xlat4.xz * float2(6.28318024, 6.28318024) + float2(-3.88321877, -3.88321877);
			        //MUL
			        u_xlat27.xy = u_xlat27.xy * float2(-0.015625, -0.015625);
			        //MUL
			        u_xlat40 = u_xlat27.x * u_xlat4.x;
			        //MAD
			        u_xlat40 = u_xlat4.z * u_xlat27.y + (-u_xlat40);
			        //MUL
			        u_xlat7.xz = u_xlat27.yx * float2(1.0, -1.0);
			        //MUL
			        u_xlat7.yw = u_xlat4.xz * float2(-1.0, 1.0);
			        //DIV
			        u_xlat7 = u_xlat7 / (float4)(u_xlat40);
			        //MAD
			        u_xlat6.y = u_xlat5.y * u_xlat16.x + -0.9921875;
			        //DP2
			        u_xlat4.x = dot(u_xlat7.xy, u_xlat6.xy);
			        //DP2
			        u_xlat4.z = dot(u_xlat7.zw, u_xlat6.xy);
			        //ROUND_NI
			        u_xlat6.xy = floor(u_xlat4.xz);
			        //MOV
			        u_xlat7.x = float(100000.0);
			        //MOV
			        u_xlat7.y = float(0.0);
			        //MOV
			        u_xlat7.z = float(0.0);
			        //MOV
			        u_xlat7.w = float(0.0);
			        //LOOP
			        for(uint u_xlatu_loop_2 = 0u ; u_xlatu_loop_2<4u ; u_xlatu_loop_2++)
			        {
			            //AND
			            u_xlatu28.x = u_xlatu_loop_2 & 1u;
			            //USHR
			            u_xlatu28.y = u_xlatu_loop_2 >> 1u;
			            //UTOF
			            u_xlat8.xy = float2(u_xlatu28.xy);
			            //ADD
			            u_xlat28.xy = u_xlat6.xy + u_xlat8.xy;
			            //DP2
			            u_xlat28.x = dot(u_xlat27.xy, u_xlat28.xy);
			            //ADD
			            u_xlat28.x = u_xlat28.x + 0.9921875;
			            //MAX
			            u_xlat40 = max(u_xlat28.x, -1.0);
			            //MIN
			            u_xlat40 = min(u_xlat40, 1.0);
			            //MAD
			            u_xlat28.x = u_xlat40 * 2.0 + (-u_xlat28.x);
			            //MAD
			            u_xlat28.x = (-u_xlat28.x) * 64.0 + 64.0;
			            //ROUND_NI
			            u_xlat28.x = floor(u_xlat28.x);
			            //MUL
			            u_xlat40 = u_xlat28.x * 0.618034005;
			            //ROUND_NI
			            u_xlat40 = floor(u_xlat40);
			            //MAD
			            u_xlat40 = u_xlat28.x * 0.618034005 + (-u_xlat40);
			            //MUL
			            u_xlat40 = u_xlat40 * 6.28318024;
			            //MAD
			            u_xlat28.x = u_xlat28.x * 2.0 + 1.0;
			            //MAD
			            u_xlat8.w = (-u_xlat28.x) * 0.0078125 + 1.0;
			            //MAD
			            u_xlat28.x = (-u_xlat8.w) * u_xlat8.w + 1.0;
			            //SQRT
			            u_xlat28.x = sqrt(u_xlat28.x);
			            //SINCOS
			            u_xlat9.x = sin(u_xlat40);
			            u_xlat10.x = cos(u_xlat40);
			            //MUL
			            u_xlat8.y = u_xlat28.x * u_xlat10.x;
			            //MUL
			            u_xlat8.z = u_xlat28.x * u_xlat9.x;
			            //MAD
			            u_xlat9.xyz = (-u_xlat5.xwy) * u_xlat16.xxx + u_xlat8.yzw;
			            //DP3
			            u_xlat8.x = dot(u_xlat9.xyz, u_xlat9.xyz);
			            //LT
			            u_xlatb28 = u_xlat8.x<u_xlat7.x;
			            //MOVC
			            u_xlat7 = ((bool)(u_xlatb28)) ? u_xlat8 : u_xlat7;
			        //ENDLOOP
			        }
			        //MAD
			        u_xlat4.xyz = (-u_xlat7.yzw) * float3(1.01999998, 1.01999998, 1.01999998) + u_xlat5.xwy;
			        //DP3
			        u_xlat27.x = dot(u_xlat4.xyz, u_xlat4.xyz);
			        //SQRT
			        u_xlat27.x = sqrt(u_xlat27.x);
			        //ADD
			        u_xlat27.x = u_xlat27.x + -0.0599999987;
			        //ADD
			        u_xlat39 = (-u_xlat27.x) + u_xlat15.x;
			        //MAD
			        u_xlat39 = u_xlat39 * 50.0 + 0.5;
			        u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
			        //ADD
			        u_xlat27.x = (-u_xlat15.x) + u_xlat27.x;
			        //MAD
			        u_xlat27.x = u_xlat39 * u_xlat27.x + u_xlat15.x;
			        //MUL
			        u_xlat4.x = u_xlat39 * 0.00999999978;
			        //ADD
			        u_xlat39 = (-u_xlat39) + 1.0;
			        //MAD
			        u_xlat27.x = (-u_xlat4.x) * u_xlat39 + u_xlat27.x;
			        //LT
			        u_xlatb39 = u_xlat27.x<u_xlat15.x;
			        //MOVC
			        u_xlat15.x = (u_xlatb39) ? u_xlat27.x : u_xlat15.x;
			        //LT
			        u_xlatb27 = u_xlat3.x<u_xlat15.x;
			        //MOVC
			        u_xlat3.x = (u_xlatb27) ? u_xlat3.x : u_xlat15.x;
			        //MUL
			        u_xlat3.x = u_xlat3.x * 0.300000012;
			    //ELSE
			    } else {
			        //MOV
			        u_xlat3.x = 1.0;
			    //ENDIF
			    }
			    //MOV
			    u_xlat4.z = (-_Epsilon);
			    //MOV
			    u_xlat4.x = float(-0.0);
			    //MOV
			    u_xlat4.y = float(-0.0);
			    //ADD
			    u_xlat15.xyz = u_xlat0.xyz + u_xlat4.zyy;
			    //MAD
			    u_xlat17.z = u_xlat15.z * 3.33333325 + (-u_xlat36);
			    //ADD
			    u_xlat15.z = u_xlat17.z + 3.0;
			    //MUL
			    u_xlat15.xyz = u_xlat15.xyz * float3(3.33333325, 3.33333325, 0.0500000007);
			    //SINCOS
			    u_xlat5.x = sin(u_xlat15.z);
			    u_xlat6.x = cos(u_xlat15.z);
			    //MOV
			    u_xlat7.x = (-u_xlat5.x);
			    //MOV
			    u_xlat7.y = u_xlat6.x;
			    //MOV
			    u_xlat7.z = u_xlat5.x;
			    //DP2
			    u_xlat17.x = dot(u_xlat15.xy, u_xlat7.yz);
			    //DP2
			    u_xlat17.y = dot(u_xlat15.xy, u_xlat7.xy);
			    //ADD
			    u_xlat15.xyz = u_xlat17.xyz + float3(3.0, 3.0, 3.0);
			    //MUL
			    u_xlat5.xyz = u_xlat15.xyz * float3(0.166666672, 0.166666672, 0.166666672);
			    //ROUND_NI
			    u_xlat5.xyz = floor(u_xlat5.xyz);
			    //EQ
			    u_xlatb6.xy = ((u_xlat5.xyxx) == (float4(0.0, 0.0, 0.0, 0.0))).xy;
			    //OR
			    u_xlatb40 = u_xlatb6.y || u_xlatb6.x;
			    //IF
			    if(!u_xlatb40){
			        //MAD
			        u_xlat15.xyz = (-u_xlat5.xyz) * float3(6.0, 6.0, 6.0) + u_xlat15.xyz;
			        //ADD
			        u_xlat6.yzw = u_xlat15.xyz + float3(-3.0, -3.0, -3.0);
			        //MAD
			        u_xlat15.xyz = _Time.yyy * float3(1.29999995, 0.800000012, 1.20000005) + u_xlat5.xyz;
			        //SINCOS
			        u_xlat7.x = sin(u_xlat15.x);
			        u_xlat8.x = cos(u_xlat15.x);
			        //MOV
			        u_xlat9.x = (-u_xlat7.x);
			        //MOV
			        u_xlat9.y = u_xlat8.x;
			        //MOV
			        u_xlat9.z = u_xlat7.x;
			        //DP2
			        u_xlat6.x = dot(u_xlat6.yz, u_xlat9.yz);
			        //DP2
			        u_xlat7.x = dot(u_xlat6.yz, u_xlat9.xy);
			        //SINCOS
			        u_xlat8.x = sin(u_xlat15.y);
			        u_xlat9.x = cos(u_xlat15.y);
			        //MOV
			        u_xlat10.x = (-u_xlat8.x);
			        //MOV
			        u_xlat10.y = u_xlat9.x;
			        //MOV
			        u_xlat10.z = u_xlat8.x;
			        //DP2
			        u_xlat8.x = dot(u_xlat6.xw, u_xlat10.yz);
			        //DP2
			        u_xlat7.y = dot(u_xlat6.xw, u_xlat10.xy);
			        //SINCOS
			        u_xlat6.x = sin(u_xlat15.z);
			        u_xlat9.x = cos(u_xlat15.z);
			        //MOV
			        u_xlat10.x = (-u_xlat6.x);
			        //MOV
			        u_xlat10.y = u_xlat9.x;
			        //MOV
			        u_xlat10.z = u_xlat6.x;
			        //DP2
			        u_xlat8.y = dot(u_xlat7.xy, u_xlat10.yz);
			        //DP2
			        u_xlat8.z = dot(u_xlat7.xy, u_xlat10.xy);
			        //ADD
			        u_xlat15.x = u_xlat5.x + _Time.y;
			        //SINCOS
			        u_xlat15.x = sin(u_xlat15.x);
			        //MAD
			        u_xlat15.x = u_xlat15.x * 0.5 + 0.5;
			        //MAD
			        u_xlat15.x = u_xlat15.x * 0.199999988 + 0.800000012;
			        //MUL
			        u_xlat5.xyz = u_xlat15.xxx * u_xlat8.xyz;
			        //MAD
			        u_xlat6 = u_xlat8.yxyz * u_xlat15.xxxx + float4(-1.0, -0.0, -1.32000005, -0.0);
			        //MIN
			        u_xlat15.x = min(abs(u_xlat6.y), abs(u_xlat6.w));
			        //MAX
			        u_xlat27.x = max(abs(u_xlat6.y), abs(u_xlat6.w));
			        //DIV
			        u_xlat27.x = float(1.0) / u_xlat27.x;
			        //MUL
			        u_xlat15.x = u_xlat27.x * u_xlat15.x;
			        //MUL
			        u_xlat27.x = u_xlat15.x * u_xlat15.x;
			        //MAD
			        u_xlat39 = u_xlat27.x * 0.0208350997 + -0.0851330012;
			        //MAD
			        u_xlat39 = u_xlat27.x * u_xlat39 + 0.180141002;
			        //MAD
			        u_xlat39 = u_xlat27.x * u_xlat39 + -0.330299497;
			        //MAD
			        u_xlat27.x = u_xlat27.x * u_xlat39 + 0.999866009;
			        //MUL
			        u_xlat39 = u_xlat27.x * u_xlat15.x;
			        //LT
			        u_xlatb40 = abs(u_xlat6.y)<abs(u_xlat6.w);
			        //MAD
			        u_xlat39 = u_xlat39 * -2.0 + 1.57079637;
			        //AND
			        u_xlat39 = u_xlatb40 ? u_xlat39 : float(0.0);
			        //MAD
			        u_xlat15.x = u_xlat15.x * u_xlat27.x + u_xlat39;
			        //LT
			        u_xlatb27 = u_xlat6.y<(-u_xlat6.y);
			        //AND
			        u_xlat27.x = u_xlatb27 ? -3.14159274 : float(0.0);
			        //ADD
			        u_xlat15.x = u_xlat27.x + u_xlat15.x;
			        //MIN
			        u_xlat27.x = min(u_xlat6.y, u_xlat6.w);
			        //MAX
			        u_xlat39 = max(u_xlat6.y, u_xlat6.w);
			        //LT
			        u_xlatb27 = u_xlat27.x<(-u_xlat27.x);
			        //GE
			        u_xlatb39 = u_xlat39>=(-u_xlat39);
			        //AND
			        u_xlatb27 = u_xlatb39 && u_xlatb27;
			        //MOVC
			        u_xlat15.x = (u_xlatb27) ? (-u_xlat15.x) : u_xlat15.x;
			        //DP2
			        u_xlat27.x = dot(u_xlat6.yw, u_xlat6.yw);
			        //SQRT
			        u_xlat27.x = sqrt(u_xlat27.x);
			        //ADD
			        u_xlat15.x = u_xlat15.x + 0.314159274;
			        //MUL
			        u_xlat39 = u_xlat15.x * 1.5915494;
			        //ROUND_NI
			        u_xlat39 = floor(u_xlat39);
			        //MAD
			        u_xlat15.x = (-u_xlat39) * 0.628318548 + u_xlat15.x;
			        //ADD
			        u_xlat15.x = u_xlat15.x + -0.314159274;
			        //SINCOS
			        u_xlat7.x = sin(u_xlat15.x);
			        u_xlat8.x = cos(u_xlat15.x);
			        //MOV
			        u_xlat8.xz = u_xlat8.xx;
			        //MOV
			        u_xlat8.y = u_xlat7.x;
			        //MUL
			        u_xlat15.xyz = u_xlat27.xxx * u_xlat8.xyz;
			        //MAD
			        u_xlat15.xyz = u_xlat15.xyz * float3(2.0, 2.0, 2.0) + float3(-1.0, -0.0, -1.0);
			        //MUL
			        u_xlat7.xyz = u_xlat15.xyz * float3(0.5, 0.5, 3.0);
			        //SINCOS
			        u_xlat15.x = sin(u_xlat7.z);
			        //MAD
			        u_xlat8.y = u_xlat15.x * 0.100000001 + u_xlat6.z;
			        //ADD
			        u_xlat7.w = abs(u_xlat7.y) + 0.600000024;
			        //DP2
			        u_xlat15.x = dot(u_xlat7.xw, u_xlat7.xw);
			        //SQRT
			        u_xlat8.x = sqrt(u_xlat15.x);
			        //ADD
			        u_xlat15.xy = abs(u_xlat8.xy) + float2(-0.699999988, -0.00999999978);
			        //MAX
			        u_xlat39 = max(u_xlat15.y, u_xlat15.x);
			        //MIN
			        u_xlat39 = min(u_xlat39, 0.0);
			        //MAX
			        u_xlat15.xy = max(u_xlat15.xy, float2(0.0, 0.0));
			        //DP2
			        u_xlat15.x = dot(u_xlat15.xy, u_xlat15.xy);
			        //SQRT
			        u_xlat15.x = sqrt(u_xlat15.x);
			        //ADD
			        u_xlat15.x = u_xlat15.x + u_xlat39;
			        //MOV
			        u_xlat8.zw = u_xlat7.xy;
			        //ADD
			        u_xlat7.xyz = u_xlat8.zyw + float3(-0.0, -0.00999999978, -0.0);
			        //ADD
			        u_xlat7.xyz = abs(u_xlat7.xyz) + float3(-0.449999988, -0.0130000003, -0.00100000005);
			        //MAX
			        u_xlat27.x = max(u_xlat7.z, u_xlat7.y);
			        //MAX
			        u_xlat27.x = max(u_xlat27.x, u_xlat7.x);
			        //MIN
			        u_xlat27.x = min(u_xlat27.x, 0.0);
			        //MAX
			        u_xlat7.xyz = max(u_xlat7.xyz, float3(0.0, 0.0, 0.0));
			        //DP3
			        u_xlat39 = dot(u_xlat7.xyz, u_xlat7.xyz);
			        //SQRT
			        u_xlat39 = sqrt(u_xlat39);
			        //ADD
			        u_xlat27.x = u_xlat39 + u_xlat27.x;
			        //ADD
			        u_xlat39 = (-u_xlat15.x) + u_xlat27.x;
			        //MAD
			        u_xlat39 = u_xlat39 * 10.0 + 0.5;
			        u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
			        //ADD
			        u_xlat15.x = (-u_xlat27.x) + u_xlat15.x;
			        //MAD
			        u_xlat15.x = u_xlat39 * u_xlat15.x + u_xlat27.x;
			        //MUL
			        u_xlat27.x = u_xlat39 * 0.0500000007;
			        //ADD
			        u_xlat39 = (-u_xlat39) + 1.0;
			        //MAD
			        u_xlat15.x = (-u_xlat27.x) * u_xlat39 + u_xlat15.x;
			        //MUL
			        u_xlat27.x = u_xlat6.z * 4.0;
			        //SINCOS
			        u_xlat27.x = sin(u_xlat27.x);
			        //MAD
			        u_xlat27.x = u_xlat27.x * 0.100000001 + u_xlat6.y;
			        //ADD
			        u_xlat7.x = u_xlat27.x + -0.0500000007;
			        //MOV
			        u_xlat7.yw = u_xlat6.wz;
			        //DP2
			        u_xlat27.x = dot(u_xlat7.xy, u_xlat7.xy);
			        //SQRT
			        u_xlat7.z = sqrt(u_xlat27.x);
			        //ADD
			        u_xlat27.xy = abs(u_xlat7.zw) + float2(-0.0399999991, -0.699999988);
			        //MAX
			        u_xlat40 = max(u_xlat27.y, u_xlat27.x);
			        //MIN
			        u_xlat40 = min(u_xlat40, 0.0);
			        //MAX
			        u_xlat27.xy = max(u_xlat27.xy, float2(0.0, 0.0));
			        //DP2
			        u_xlat27.x = dot(u_xlat27.xy, u_xlat27.xy);
			        //SQRT
			        u_xlat27.x = sqrt(u_xlat27.x);
			        //ADD
			        u_xlat27.x = u_xlat27.x + u_xlat40;
			        //ADD
			        u_xlat39 = (-u_xlat15.x) + u_xlat27.x;
			        //MAD
			        u_xlat39 = u_xlat39 * 1.66666663 + 0.5;
			        u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
			        //ADD
			        u_xlat15.x = (-u_xlat27.x) + u_xlat15.x;
			        //MAD
			        u_xlat15.x = u_xlat39 * u_xlat15.x + u_xlat27.x;
			        //MUL
			        u_xlat27.x = u_xlat39 * 0.300000012;
			        //ADD
			        u_xlat39 = (-u_xlat39) + 1.0;
			        //MAD
			        u_xlat15.x = (-u_xlat27.x) * u_xlat39 + u_xlat15.x;
			        //MOV
			        u_xlat27.x = u_xlat5.y;
			        u_xlat27.x = clamp(u_xlat27.x, 0.0, 1.0);
			        //MAD
			        u_xlat39 = u_xlat27.x * -2.0 + 3.0;
			        //MUL
			        u_xlat27.x = u_xlat27.x * u_xlat27.x;
			        //MOV
			        u_xlat6.x = u_xlat6.x;
			        u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
			        //MAD
			        u_xlat40 = u_xlat6.x * -2.0 + 3.0;
			        //MUL
			        u_xlat41 = u_xlat6.x * u_xlat6.x;
			        //MUL
			        u_xlat40 = u_xlat40 * u_xlat41;
			        //MUL
			        u_xlat40 = u_xlat40 * 3.0;
			        //MAD
			        u_xlat27.x = u_xlat39 * u_xlat27.x + (-u_xlat40);
			        //MAD
			        u_xlat27.x = (-u_xlat27.x) * 0.159999996 + 1.0;
			        //MUL
			        u_xlat5.xzw = u_xlat27.xxx * u_xlat5.xyz;
			        //MUL
			        u_xlat27.y = u_xlat5.z * 2.22222233;
			        u_xlat27.y = clamp(u_xlat27.y, 0.0, 1.0);
			        //MAD
			        u_xlat40 = u_xlat27.y * -2.0 + 3.0;
			        //MAD
			        u_xlat27.x = u_xlat5.y * u_xlat27.x + -0.449999988;
			        //MUL
			        u_xlat27.x = u_xlat27.x * 2.22222233;
			        u_xlat27.x = clamp(u_xlat27.x, 0.0, 1.0);
			        //MAD
			        u_xlat17.x = u_xlat27.x * -2.0 + 3.0;
			        //MUL
			        u_xlat27.xy = u_xlat27.xy * u_xlat27.xy;
			        //MUL
			        u_xlat27.x = u_xlat27.x * u_xlat17.x;
			        //MAD
			        u_xlat27.x = u_xlat40 * u_xlat27.y + (-u_xlat27.x);
			        //MAD
			        u_xlat27.x = (-u_xlat27.x) * 0.0700000003 + 1.0;
			        //MUL
			        u_xlat6.xyz = u_xlat27.xxx * u_xlat5.xwz;
			        //MAD
			        u_xlat27.x = u_xlat5.z * u_xlat27.x + 0.600000024;
			        //MUL
			        u_xlat27.x = u_xlat27.x * 1.25;
			        u_xlat27.x = clamp(u_xlat27.x, 0.0, 1.0);
			        //MAD
			        u_xlat39 = u_xlat27.x * -2.0 + 3.0;
			        //MUL
			        u_xlat27.x = u_xlat27.x * u_xlat27.x;
			        //MAD
			        u_xlat27.x = (-u_xlat39) * u_xlat27.x + 1.0;
			        //MAD
			        u_xlat27.x = u_xlat27.x * 0.200000003 + 1.0;
			        //MUL
			        u_xlat6.xy = u_xlat27.xx * u_xlat6.xy;
			        //MUL
			        u_xlat6.w = u_xlat6.z * 0.800000012;
			        //MUL
			        u_xlat5.xyz = u_xlat6.xzy * float3(0.449999988, 0.359999985, 0.449999988);
			        //DP3
			        u_xlat27.x = dot(u_xlat6.xyw, u_xlat6.xyw);
			        //RSQ
			        u_xlat39 = rsqrt(u_xlat27.x);
			        //MUL
			        u_xlat7 = (float4)(u_xlat39) * u_xlat6.xxwy;
			        //MAD
			        u_xlat8.xy = u_xlat6.xz * float2(0.449999988, 0.359999985) + float2(-0.140000001, -0.140000001);
			        //SAMPLE_L
			        u_xlat8 = tex2Dlod(_NoiseTex, float4(u_xlat8.xy, 0.0,1.5));
			        //SAMPLE_L
			        u_xlat9 = tex2Dlod(_NoiseTex, float4(u_xlat5.xz, 0.0,0.0));
			        //SAMPLE_L
			        u_xlat5 = tex2Dlod(_NoiseTex, float4(u_xlat5.yz, 0.0,1.5));
			        //MUL
			        u_xlat40 = abs(u_xlat7.z) * u_xlat9.x;
			        //MAD
			        u_xlat40 = u_xlat8.x * abs(u_xlat7.w) + u_xlat40;
			        //MAD
			        u_xlat40 = u_xlat5.x * abs(u_xlat7.y) + u_xlat40;
			        //SQRT
			        u_xlat27.x = sqrt(u_xlat27.x);
			        //ADD
			        u_xlat27.x = u_xlat27.x + -1.0;
			        //MAD
			        u_xlat27.x = (-u_xlat40) * 0.100000001 + u_xlat27.x;
			        //MIN
			        u_xlat40 = min(abs(u_xlat7.y), abs(u_xlat7.z));
			        //MAX
			        u_xlat5.x = max(abs(u_xlat7.y), abs(u_xlat7.z));
			        //DIV
			        u_xlat5.x = float(1.0) / u_xlat5.x;
			        //MUL
			        u_xlat40 = u_xlat40 * u_xlat5.x;
			        //MUL
			        u_xlat5.x = u_xlat40 * u_xlat40;
			        //MAD
			        u_xlat17.x = u_xlat5.x * 0.0208350997 + -0.0851330012;
			        //MAD
			        u_xlat17.x = u_xlat5.x * u_xlat17.x + 0.180141002;
			        //MAD
			        u_xlat17.x = u_xlat5.x * u_xlat17.x + -0.330299497;
			        //MAD
			        u_xlat5.x = u_xlat5.x * u_xlat17.x + 0.999866009;
			        //MUL
			        u_xlat17.x = u_xlat40 * u_xlat5.x;
			        //LT
			        u_xlatb29 = abs(u_xlat7.y)<abs(u_xlat7.z);
			        //MAD
			        u_xlat17.x = u_xlat17.x * -2.0 + 1.57079637;
			        //AND
			        u_xlat17.x = u_xlatb29 ? u_xlat17.x : float(0.0);
			        //MAD
			        u_xlat40 = u_xlat40 * u_xlat5.x + u_xlat17.x;
			        //LT
			        u_xlatb5 = u_xlat7.y<(-u_xlat7.x);
			        //AND
			        u_xlat5.x = u_xlatb5 ? -3.14159274 : float(0.0);
			        //ADD
			        u_xlat40 = u_xlat40 + u_xlat5.x;
			        //MIN
			        u_xlat5.x = min(u_xlat7.y, u_xlat7.z);
			        //MAX
			        u_xlat17.x = max(u_xlat7.y, u_xlat7.z);
			        //LT
			        u_xlatb5 = u_xlat5.x<(-u_xlat5.x);
			        //GE
			        u_xlatb17 = u_xlat17.x>=(-u_xlat17.x);
			        //AND
			        u_xlatb5 = u_xlatb17 && u_xlatb5;
			        //MOVC
			        u_xlat40 = (u_xlatb5) ? (-u_xlat40) : u_xlat40;
			        //MIN
			        u_xlat5.x = min(u_xlat40, 3.14159012);
			        //MAD
			        u_xlat40 = (-u_xlat7.w) * u_xlat7.w + 1.0;
			        //MUL
			        u_xlat40 = u_xlat40 * 899.175598;
			        //LOG
			        u_xlat40 = log2(u_xlat40);
			        //MUL
			        u_xlat40 = u_xlat40 * 0.720210016;
			        //ROUND_NI
			        u_xlat40 = floor(u_xlat40);
			        //MAX
			        u_xlat40 = max(u_xlat40, 2.0);
			        //MUL
			        u_xlat40 = u_xlat40 * 0.694241941;
			        //EXP
			        u_xlat40 = exp2(u_xlat40);
			        //MUL
			        u_xlat29.xy = (float2)(u_xlat40) * float2(0.44721359, 0.723606825);
			        //ROUND_NE
			        u_xlat29.xy = round(u_xlat29.xy);
			        //ADD
			        u_xlat7.xy = u_xlat29.yx + float2(1.0, 1.0);
			        //MUL
			        u_xlat31.xy = u_xlat7.xy * float2(0.618034005, 0.618034005);
			        //ROUND_NI
			        u_xlat31.xy = floor(u_xlat31.xy);
			        //MAD
			        u_xlat7.xy = u_xlat7.xy * float2(0.618034005, 0.618034005) + (-u_xlat31.xy);
			        //MAD
			        u_xlat7.xy = u_xlat7.xy * float2(6.28318024, 6.28318024) + float2(-3.88321877, -3.88321877);
			        //MUL
			        u_xlat29.xy = u_xlat29.xy * float2(-0.015625, -0.015625);
			        //MUL
			        u_xlat40 = u_xlat29.x * u_xlat7.x;
			        //MAD
			        u_xlat40 = u_xlat7.y * u_xlat29.y + (-u_xlat40);
			        //MUL
			        u_xlat8.xz = u_xlat29.yx * float2(1.0, -1.0);
			        //MUL
			        u_xlat8.yw = u_xlat7.xy * float2(-1.0, 1.0);
			        //DIV
			        u_xlat7 = u_xlat8 / (float4)(u_xlat40);
			        //MAD
			        u_xlat5.y = u_xlat6.y * u_xlat39 + -0.9921875;
			        //DP2
			        u_xlat40 = dot(u_xlat7.xy, u_xlat5.xy);
			        //DP2
			        u_xlat5.x = dot(u_xlat7.zw, u_xlat5.xy);
			        //ROUND_NI
			        u_xlat7.x = floor(u_xlat40);
			        //ROUND_NI
			        u_xlat7.y = floor(u_xlat5.x);
			        //MOV
			        u_xlat8.x = float(100000.0);
			        //MOV
			        u_xlat8.y = float(0.0);
			        //MOV
			        u_xlat8.z = float(0.0);
			        //MOV
			        u_xlat8.w = float(0.0);
			        //LOOP
			        for(uint u_xlatu_loop_3 = 0u ; u_xlatu_loop_3<4u ; u_xlatu_loop_3++)
			        {
			            //AND
			            u_xlatu5.x = u_xlatu_loop_3 & 1u;
			            //USHR
			            u_xlatu5.y = u_xlatu_loop_3 >> 1u;
			            //UTOF
			            u_xlat9.xy = float2(u_xlatu5.xy);
			            //ADD
			            u_xlat5.xy = u_xlat7.xy + u_xlat9.xy;
			            //DP2
			            u_xlat5.x = dot(u_xlat29.xy, u_xlat5.xy);
			            //ADD
			            u_xlat5.x = u_xlat5.x + 0.9921875;
			            //MAX
			            u_xlat17.x = max(u_xlat5.x, -1.0);
			            //MIN
			            u_xlat17.x = min(u_xlat17.x, 1.0);
			            //MAD
			            u_xlat5.x = u_xlat17.x * 2.0 + (-u_xlat5.x);
			            //MAD
			            u_xlat5.x = (-u_xlat5.x) * 64.0 + 64.0;
			            //ROUND_NI
			            u_xlat5.x = floor(u_xlat5.x);
			            //MUL
			            u_xlat17.x = u_xlat5.x * 0.618034005;
			            //ROUND_NI
			            u_xlat17.x = floor(u_xlat17.x);
			            //MAD
			            u_xlat17.x = u_xlat5.x * 0.618034005 + (-u_xlat17.x);
			            //MUL
			            u_xlat17.x = u_xlat17.x * 6.28318024;
			            //MAD
			            u_xlat5.x = u_xlat5.x * 2.0 + 1.0;
			            //MAD
			            u_xlat9.w = (-u_xlat5.x) * 0.0078125 + 1.0;
			            //MAD
			            u_xlat5.x = (-u_xlat9.w) * u_xlat9.w + 1.0;
			            //SQRT
			            u_xlat5.x = sqrt(u_xlat5.x);
			            //SINCOS
			            u_xlat10.x = sin(u_xlat17.x);
			            u_xlat11.x = cos(u_xlat17.x);
			            //MUL
			            u_xlat9.y = u_xlat5.x * u_xlat11.x;
			            //MUL
			            u_xlat9.z = u_xlat5.x * u_xlat10.x;
			            //MAD
			            u_xlat10.xyz = (-u_xlat6.xwy) * (float3)(u_xlat39) + u_xlat9.yzw;
			            //DP3
			            u_xlat9.x = dot(u_xlat10.xyz, u_xlat10.xyz);
			            //LT
			            u_xlatb5 = u_xlat9.x<u_xlat8.x;
			            //MOVC
			            u_xlat8 = ((bool)(u_xlatb5)) ? u_xlat9 : u_xlat8;
			        //ENDLOOP
			        }
			        //MAD
			        u_xlat5.xyz = (-u_xlat8.yzw) * float3(1.01999998, 1.01999998, 1.01999998) + u_xlat6.xwy;
			        //DP3
			        u_xlat39 = dot(u_xlat5.xyz, u_xlat5.xyz);
			        //SQRT
			        u_xlat39 = sqrt(u_xlat39);
			        //ADD
			        u_xlat39 = u_xlat39 + -0.0599999987;
			        //ADD
			        u_xlat40 = (-u_xlat39) + u_xlat27.x;
			        //MAD
			        u_xlat40 = u_xlat40 * 50.0 + 0.5;
			        u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
			        //ADD
			        u_xlat39 = (-u_xlat27.x) + u_xlat39;
			        //MAD
			        u_xlat39 = u_xlat40 * u_xlat39 + u_xlat27.x;
			        //MUL
			        u_xlat5.x = u_xlat40 * 0.00999999978;
			        //ADD
			        u_xlat40 = (-u_xlat40) + 1.0;
			        //MAD
			        u_xlat39 = (-u_xlat5.x) * u_xlat40 + u_xlat39;
			        //LT
			        u_xlatb40 = u_xlat39<u_xlat27.x;
			        //MOVC
			        u_xlat27.x = (u_xlatb40) ? u_xlat39 : u_xlat27.x;
			        //LT
			        u_xlatb39 = u_xlat15.x<u_xlat27.x;
			        //MOVC
			        u_xlat15.x = (u_xlatb39) ? u_xlat15.x : u_xlat27.x;
			        //MUL
			        u_xlat5.x = u_xlat15.x * 0.300000012;
			    //ELSE
			    } else {
			        //MOV
			        u_xlat5.x = 1.0;
			    //ENDIF
			    }
			    //ADD
			    u_xlat15.xyz = u_xlat0.xyz + u_xlat4.yzy;
			    //MAD
			    u_xlat18.z = u_xlat15.z * 3.33333325 + (-u_xlat36);
			    //ADD
			    u_xlat15.z = u_xlat18.z + 3.0;
			    //MUL
			    u_xlat15.xyz = u_xlat15.xyz * float3(3.33333325, 3.33333325, 0.0500000007);
			    //SINCOS
			    u_xlat6.x = sin(u_xlat15.z);
			    u_xlat7.x = cos(u_xlat15.z);
			    //MOV
			    u_xlat8.x = (-u_xlat6.x);
			    //MOV
			    u_xlat8.y = u_xlat7.x;
			    //MOV
			    u_xlat8.z = u_xlat6.x;
			    //DP2
			    u_xlat18.x = dot(u_xlat15.xy, u_xlat8.yz);
			    //DP2
			    u_xlat18.y = dot(u_xlat15.xy, u_xlat8.xy);
			    //ADD
			    u_xlat15.xyz = u_xlat18.xyz + float3(3.0, 3.0, 3.0);
			    //MUL
			    u_xlat6.xyz = u_xlat15.xyz * float3(0.166666672, 0.166666672, 0.166666672);
			    //ROUND_NI
			    u_xlat6.xyz = floor(u_xlat6.xyz);
			    //EQ
			    u_xlatb7.xy = ((u_xlat6.xyxx) == (float4(0.0, 0.0, 0.0, 0.0))).xy;
			    //OR
			    u_xlatb40 = u_xlatb7.y || u_xlatb7.x;
			    //IF
			    if(!u_xlatb40){
			        //MAD
			        u_xlat15.xyz = (-u_xlat6.xyz) * float3(6.0, 6.0, 6.0) + u_xlat15.xyz;
			        //ADD
			        u_xlat7.yzw = u_xlat15.xyz + float3(-3.0, -3.0, -3.0);
			        //MAD
			        u_xlat15.xyz = _Time.yyy * float3(1.29999995, 0.800000012, 1.20000005) + u_xlat6.xyz;
			        //SINCOS
			        u_xlat8.x = sin(u_xlat15.x);
			        u_xlat9.x = cos(u_xlat15.x);
			        //MOV
			        u_xlat10.x = (-u_xlat8.x);
			        //MOV
			        u_xlat10.y = u_xlat9.x;
			        //MOV
			        u_xlat10.z = u_xlat8.x;
			        //DP2
			        u_xlat7.x = dot(u_xlat7.yz, u_xlat10.yz);
			        //DP2
			        u_xlat8.x = dot(u_xlat7.yz, u_xlat10.xy);
			        //SINCOS
			        u_xlat9.x = sin(u_xlat15.y);
			        u_xlat10.x = cos(u_xlat15.y);
			        //MOV
			        u_xlat11.x = (-u_xlat9.x);
			        //MOV
			        u_xlat11.y = u_xlat10.x;
			        //MOV
			        u_xlat11.z = u_xlat9.x;
			        //DP2
			        u_xlat9.x = dot(u_xlat7.xw, u_xlat11.yz);
			        //DP2
			        u_xlat8.y = dot(u_xlat7.xw, u_xlat11.xy);
			        //SINCOS
			        u_xlat7.x = sin(u_xlat15.z);
			        u_xlat10.x = cos(u_xlat15.z);
			        //MOV
			        u_xlat11.x = (-u_xlat7.x);
			        //MOV
			        u_xlat11.y = u_xlat10.x;
			        //MOV
			        u_xlat11.z = u_xlat7.x;
			        //DP2
			        u_xlat9.y = dot(u_xlat8.xy, u_xlat11.yz);
			        //DP2
			        u_xlat9.z = dot(u_xlat8.xy, u_xlat11.xy);
			        //ADD
			        u_xlat15.x = u_xlat6.x + _Time.y;
			        //SINCOS
			        u_xlat15.x = sin(u_xlat15.x);
			        //MAD
			        u_xlat15.x = u_xlat15.x * 0.5 + 0.5;
			        //MAD
			        u_xlat15.x = u_xlat15.x * 0.199999988 + 0.800000012;
			        //MUL
			        u_xlat6.xyz = u_xlat15.xxx * u_xlat9.xyz;
			        //MAD
			        u_xlat7 = u_xlat9.yxyz * u_xlat15.xxxx + float4(-1.0, -0.0, -1.32000005, -0.0);
			        //MIN
			        u_xlat15.x = min(abs(u_xlat7.y), abs(u_xlat7.w));
			        //MAX
			        u_xlat27.x = max(abs(u_xlat7.y), abs(u_xlat7.w));
			        //DIV
			        u_xlat27.x = float(1.0) / u_xlat27.x;
			        //MUL
			        u_xlat15.x = u_xlat27.x * u_xlat15.x;
			        //MUL
			        u_xlat27.x = u_xlat15.x * u_xlat15.x;
			        //MAD
			        u_xlat39 = u_xlat27.x * 0.0208350997 + -0.0851330012;
			        //MAD
			        u_xlat39 = u_xlat27.x * u_xlat39 + 0.180141002;
			        //MAD
			        u_xlat39 = u_xlat27.x * u_xlat39 + -0.330299497;
			        //MAD
			        u_xlat27.x = u_xlat27.x * u_xlat39 + 0.999866009;
			        //MUL
			        u_xlat39 = u_xlat27.x * u_xlat15.x;
			        //LT
			        u_xlatb40 = abs(u_xlat7.y)<abs(u_xlat7.w);
			        //MAD
			        u_xlat39 = u_xlat39 * -2.0 + 1.57079637;
			        //AND
			        u_xlat39 = u_xlatb40 ? u_xlat39 : float(0.0);
			        //MAD
			        u_xlat15.x = u_xlat15.x * u_xlat27.x + u_xlat39;
			        //LT
			        u_xlatb27 = u_xlat7.y<(-u_xlat7.y);
			        //AND
			        u_xlat27.x = u_xlatb27 ? -3.14159274 : float(0.0);
			        //ADD
			        u_xlat15.x = u_xlat27.x + u_xlat15.x;
			        //MIN
			        u_xlat27.x = min(u_xlat7.y, u_xlat7.w);
			        //MAX
			        u_xlat39 = max(u_xlat7.y, u_xlat7.w);
			        //LT
			        u_xlatb27 = u_xlat27.x<(-u_xlat27.x);
			        //GE
			        u_xlatb39 = u_xlat39>=(-u_xlat39);
			        //AND
			        u_xlatb27 = u_xlatb39 && u_xlatb27;
			        //MOVC
			        u_xlat15.x = (u_xlatb27) ? (-u_xlat15.x) : u_xlat15.x;
			        //DP2
			        u_xlat27.x = dot(u_xlat7.yw, u_xlat7.yw);
			        //SQRT
			        u_xlat27.x = sqrt(u_xlat27.x);
			        //ADD
			        u_xlat15.x = u_xlat15.x + 0.314159274;
			        //MUL
			        u_xlat39 = u_xlat15.x * 1.5915494;
			        //ROUND_NI
			        u_xlat39 = floor(u_xlat39);
			        //MAD
			        u_xlat15.x = (-u_xlat39) * 0.628318548 + u_xlat15.x;
			        //ADD
			        u_xlat15.x = u_xlat15.x + -0.314159274;
			        //SINCOS
			        u_xlat8.x = sin(u_xlat15.x);
			        u_xlat9.x = cos(u_xlat15.x);
			        //MOV
			        u_xlat9.xz = u_xlat9.xx;
			        //MOV
			        u_xlat9.y = u_xlat8.x;
			        //MUL
			        u_xlat15.xyz = u_xlat27.xxx * u_xlat9.xyz;
			        //MAD
			        u_xlat15.xyz = u_xlat15.xyz * float3(2.0, 2.0, 2.0) + float3(-1.0, -0.0, -1.0);
			        //MUL
			        u_xlat8.xyz = u_xlat15.xyz * float3(0.5, 0.5, 3.0);
			        //SINCOS
			        u_xlat15.x = sin(u_xlat8.z);
			        //MAD
			        u_xlat9.y = u_xlat15.x * 0.100000001 + u_xlat7.z;
			        //ADD
			        u_xlat8.w = abs(u_xlat8.y) + 0.600000024;
			        //DP2
			        u_xlat15.x = dot(u_xlat8.xw, u_xlat8.xw);
			        //SQRT
			        u_xlat9.x = sqrt(u_xlat15.x);
			        //ADD
			        u_xlat15.xy = abs(u_xlat9.xy) + float2(-0.699999988, -0.00999999978);
			        //MAX
			        u_xlat39 = max(u_xlat15.y, u_xlat15.x);
			        //MIN
			        u_xlat39 = min(u_xlat39, 0.0);
			        //MAX
			        u_xlat15.xy = max(u_xlat15.xy, float2(0.0, 0.0));
			        //DP2
			        u_xlat15.x = dot(u_xlat15.xy, u_xlat15.xy);
			        //SQRT
			        u_xlat15.x = sqrt(u_xlat15.x);
			        //ADD
			        u_xlat15.x = u_xlat15.x + u_xlat39;
			        //MOV
			        u_xlat9.zw = u_xlat8.xy;
			        //ADD
			        u_xlat8.xyz = u_xlat9.zyw + float3(-0.0, -0.00999999978, -0.0);
			        //ADD
			        u_xlat8.xyz = abs(u_xlat8.xyz) + float3(-0.449999988, -0.0130000003, -0.00100000005);
			        //MAX
			        u_xlat27.x = max(u_xlat8.z, u_xlat8.y);
			        //MAX
			        u_xlat27.x = max(u_xlat27.x, u_xlat8.x);
			        //MIN
			        u_xlat27.x = min(u_xlat27.x, 0.0);
			        //MAX
			        u_xlat8.xyz = max(u_xlat8.xyz, float3(0.0, 0.0, 0.0));
			        //DP3
			        u_xlat39 = dot(u_xlat8.xyz, u_xlat8.xyz);
			        //SQRT
			        u_xlat39 = sqrt(u_xlat39);
			        //ADD
			        u_xlat27.x = u_xlat39 + u_xlat27.x;
			        //ADD
			        u_xlat39 = (-u_xlat15.x) + u_xlat27.x;
			        //MAD
			        u_xlat39 = u_xlat39 * 10.0 + 0.5;
			        u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
			        //ADD
			        u_xlat15.x = (-u_xlat27.x) + u_xlat15.x;
			        //MAD
			        u_xlat15.x = u_xlat39 * u_xlat15.x + u_xlat27.x;
			        //MUL
			        u_xlat27.x = u_xlat39 * 0.0500000007;
			        //ADD
			        u_xlat39 = (-u_xlat39) + 1.0;
			        //MAD
			        u_xlat15.x = (-u_xlat27.x) * u_xlat39 + u_xlat15.x;
			        //MUL
			        u_xlat27.x = u_xlat7.z * 4.0;
			        //SINCOS
			        u_xlat27.x = sin(u_xlat27.x);
			        //MAD
			        u_xlat27.x = u_xlat27.x * 0.100000001 + u_xlat7.y;
			        //ADD
			        u_xlat8.x = u_xlat27.x + -0.0500000007;
			        //MOV
			        u_xlat8.yw = u_xlat7.wz;
			        //DP2
			        u_xlat27.x = dot(u_xlat8.xy, u_xlat8.xy);
			        //SQRT
			        u_xlat8.z = sqrt(u_xlat27.x);
			        //ADD
			        u_xlat27.xy = abs(u_xlat8.zw) + float2(-0.0399999991, -0.699999988);
			        //MAX
			        u_xlat40 = max(u_xlat27.y, u_xlat27.x);
			        //MIN
			        u_xlat40 = min(u_xlat40, 0.0);
			        //MAX
			        u_xlat27.xy = max(u_xlat27.xy, float2(0.0, 0.0));
			        //DP2
			        u_xlat27.x = dot(u_xlat27.xy, u_xlat27.xy);
			        //SQRT
			        u_xlat27.x = sqrt(u_xlat27.x);
			        //ADD
			        u_xlat27.x = u_xlat27.x + u_xlat40;
			        //ADD
			        u_xlat39 = (-u_xlat15.x) + u_xlat27.x;
			        //MAD
			        u_xlat39 = u_xlat39 * 1.66666663 + 0.5;
			        u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
			        //ADD
			        u_xlat15.x = (-u_xlat27.x) + u_xlat15.x;
			        //MAD
			        u_xlat15.x = u_xlat39 * u_xlat15.x + u_xlat27.x;
			        //MUL
			        u_xlat27.x = u_xlat39 * 0.300000012;
			        //ADD
			        u_xlat39 = (-u_xlat39) + 1.0;
			        //MAD
			        u_xlat15.x = (-u_xlat27.x) * u_xlat39 + u_xlat15.x;
			        //MOV
			        u_xlat27.x = u_xlat6.y;
			        u_xlat27.x = clamp(u_xlat27.x, 0.0, 1.0);
			        //MAD
			        u_xlat39 = u_xlat27.x * -2.0 + 3.0;
			        //MUL
			        u_xlat27.x = u_xlat27.x * u_xlat27.x;
			        //MOV
			        u_xlat7.x = u_xlat7.x;
			        u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
			        //MAD
			        u_xlat40 = u_xlat7.x * -2.0 + 3.0;
			        //MUL
			        u_xlat41 = u_xlat7.x * u_xlat7.x;
			        //MUL
			        u_xlat40 = u_xlat40 * u_xlat41;
			        //MUL
			        u_xlat40 = u_xlat40 * 3.0;
			        //MAD
			        u_xlat27.x = u_xlat39 * u_xlat27.x + (-u_xlat40);
			        //MAD
			        u_xlat27.x = (-u_xlat27.x) * 0.159999996 + 1.0;
			        //MUL
			        u_xlat6.xzw = u_xlat27.xxx * u_xlat6.xyz;
			        //MUL
			        u_xlat27.y = u_xlat6.z * 2.22222233;
			        u_xlat27.y = clamp(u_xlat27.y, 0.0, 1.0);
			        //MAD
			        u_xlat40 = u_xlat27.y * -2.0 + 3.0;
			        //MAD
			        u_xlat27.x = u_xlat6.y * u_xlat27.x + -0.449999988;
			        //MUL
			        u_xlat27.x = u_xlat27.x * 2.22222233;
			        u_xlat27.x = clamp(u_xlat27.x, 0.0, 1.0);
			        //MAD
			        u_xlat41 = u_xlat27.x * -2.0 + 3.0;
			        //MUL
			        u_xlat27.xy = u_xlat27.xy * u_xlat27.xy;
			        //MUL
			        u_xlat27.x = u_xlat27.x * u_xlat41;
			        //MAD
			        u_xlat27.x = u_xlat40 * u_xlat27.y + (-u_xlat27.x);
			        //MAD
			        u_xlat27.x = (-u_xlat27.x) * 0.0700000003 + 1.0;
			        //MUL
			        u_xlat7.xyz = u_xlat27.xxx * u_xlat6.xwz;
			        //MAD
			        u_xlat27.x = u_xlat6.z * u_xlat27.x + 0.600000024;
			        //MUL
			        u_xlat27.x = u_xlat27.x * 1.25;
			        u_xlat27.x = clamp(u_xlat27.x, 0.0, 1.0);
			        //MAD
			        u_xlat39 = u_xlat27.x * -2.0 + 3.0;
			        //MUL
			        u_xlat27.x = u_xlat27.x * u_xlat27.x;
			        //MAD
			        u_xlat27.x = (-u_xlat39) * u_xlat27.x + 1.0;
			        //MAD
			        u_xlat27.x = u_xlat27.x * 0.200000003 + 1.0;
			        //MUL
			        u_xlat7.xy = u_xlat27.xx * u_xlat7.xy;
			        //MUL
			        u_xlat7.w = u_xlat7.z * 0.800000012;
			        //MUL
			        u_xlat6.xyz = u_xlat7.xzy * float3(0.449999988, 0.359999985, 0.449999988);
			        //DP3
			        u_xlat27.x = dot(u_xlat7.xyw, u_xlat7.xyw);
			        //RSQ
			        u_xlat39 = rsqrt(u_xlat27.x);
			        //MUL
			        u_xlat8 = (float4)(u_xlat39) * u_xlat7.xxwy;
			        //MAD
			        u_xlat9.xy = u_xlat7.xz * float2(0.449999988, 0.359999985) + float2(-0.140000001, -0.140000001);
			        //SAMPLE_L
			        u_xlat9 = tex2Dlod(_NoiseTex, float4(u_xlat9.xy, 0.0,1.5));
			        //SAMPLE_L
			        u_xlat10 = tex2Dlod(_NoiseTex, float4(u_xlat6.xz, 0.0,0.0));
			        //SAMPLE_L
			        u_xlat6 = tex2Dlod(_NoiseTex, float4(u_xlat6.yz, 0.0,1.5));
			        //MUL
			        u_xlat40 = abs(u_xlat8.z) * u_xlat10.x;
			        //MAD
			        u_xlat40 = u_xlat9.x * abs(u_xlat8.w) + u_xlat40;
			        //MAD
			        u_xlat40 = u_xlat6.x * abs(u_xlat8.y) + u_xlat40;
			        //SQRT
			        u_xlat27.x = sqrt(u_xlat27.x);
			        //ADD
			        u_xlat27.x = u_xlat27.x + -1.0;
			        //MAD
			        u_xlat27.x = (-u_xlat40) * 0.100000001 + u_xlat27.x;
			        //MIN
			        u_xlat40 = min(abs(u_xlat8.y), abs(u_xlat8.z));
			        //MAX
			        u_xlat41 = max(abs(u_xlat8.y), abs(u_xlat8.z));
			        //DIV
			        u_xlat41 = float(1.0) / u_xlat41;
			        //MUL
			        u_xlat40 = u_xlat40 * u_xlat41;
			        //MUL
			        u_xlat41 = u_xlat40 * u_xlat40;
			        //MAD
			        u_xlat6.x = u_xlat41 * 0.0208350997 + -0.0851330012;
			        //MAD
			        u_xlat6.x = u_xlat41 * u_xlat6.x + 0.180141002;
			        //MAD
			        u_xlat6.x = u_xlat41 * u_xlat6.x + -0.330299497;
			        //MAD
			        u_xlat41 = u_xlat41 * u_xlat6.x + 0.999866009;
			        //MUL
			        u_xlat6.x = u_xlat40 * u_xlat41;
			        //LT
			        u_xlatb18 = abs(u_xlat8.y)<abs(u_xlat8.z);
			        //MAD
			        u_xlat6.x = u_xlat6.x * -2.0 + 1.57079637;
			        //AND
			        u_xlat6.x = u_xlatb18 ? u_xlat6.x : float(0.0);
			        //MAD
			        u_xlat40 = u_xlat40 * u_xlat41 + u_xlat6.x;
			        //LT
			        u_xlatb41 = u_xlat8.y<(-u_xlat8.x);
			        //AND
			        u_xlat41 = u_xlatb41 ? -3.14159274 : float(0.0);
			        //ADD
			        u_xlat40 = u_xlat40 + u_xlat41;
			        //MIN
			        u_xlat41 = min(u_xlat8.y, u_xlat8.z);
			        //MAX
			        u_xlat6.x = max(u_xlat8.y, u_xlat8.z);
			        //LT
			        u_xlatb41 = u_xlat41<(-u_xlat41);
			        //GE
			        u_xlatb6.x = u_xlat6.x>=(-u_xlat6.x);
			        //AND
			        u_xlatb41 = u_xlatb41 && u_xlatb6.x;
			        //MOVC
			        u_xlat40 = (u_xlatb41) ? (-u_xlat40) : u_xlat40;
			        //MIN
			        u_xlat6.x = min(u_xlat40, 3.14159012);
			        //MAD
			        u_xlat40 = (-u_xlat8.w) * u_xlat8.w + 1.0;
			        //MUL
			        u_xlat40 = u_xlat40 * 899.175598;
			        //LOG
			        u_xlat40 = log2(u_xlat40);
			        //MUL
			        u_xlat40 = u_xlat40 * 0.720210016;
			        //ROUND_NI
			        u_xlat40 = floor(u_xlat40);
			        //MAX
			        u_xlat40 = max(u_xlat40, 2.0);
			        //MUL
			        u_xlat40 = u_xlat40 * 0.694241941;
			        //EXP
			        u_xlat40 = exp2(u_xlat40);
			        //MUL
			        u_xlat30.xy = (float2)(u_xlat40) * float2(0.44721359, 0.723606825);
			        //ROUND_NE
			        u_xlat30.xy = round(u_xlat30.xy);
			        //ADD
			        u_xlat8.xy = u_xlat30.yx + float2(1.0, 1.0);
			        //MUL
			        u_xlat32.xy = u_xlat8.xy * float2(0.618034005, 0.618034005);
			        //ROUND_NI
			        u_xlat32.xy = floor(u_xlat32.xy);
			        //MAD
			        u_xlat8.xy = u_xlat8.xy * float2(0.618034005, 0.618034005) + (-u_xlat32.xy);
			        //MAD
			        u_xlat8.xy = u_xlat8.xy * float2(6.28318024, 6.28318024) + float2(-3.88321877, -3.88321877);
			        //MUL
			        u_xlat30.xy = u_xlat30.xy * float2(-0.015625, -0.015625);
			        //MUL
			        u_xlat40 = u_xlat30.x * u_xlat8.x;
			        //MAD
			        u_xlat40 = u_xlat8.y * u_xlat30.y + (-u_xlat40);
			        //MUL
			        u_xlat9.xz = u_xlat30.yx * float2(1.0, -1.0);
			        //MUL
			        u_xlat9.yw = u_xlat8.xy * float2(-1.0, 1.0);
			        //DIV
			        u_xlat8 = u_xlat9 / (float4)(u_xlat40);
			        //MAD
			        u_xlat6.y = u_xlat7.y * u_xlat39 + -0.9921875;
			        //DP2
			        u_xlat40 = dot(u_xlat8.xy, u_xlat6.xy);
			        //DP2
			        u_xlat41 = dot(u_xlat8.zw, u_xlat6.xy);
			        //ROUND_NI
			        u_xlat6.x = floor(u_xlat40);
			        //ROUND_NI
			        u_xlat6.y = floor(u_xlat41);
			        //MOV
			        u_xlat8.x = float(100000.0);
			        //MOV
			        u_xlat8.y = float(0.0);
			        //MOV
			        u_xlat8.z = float(0.0);
			        //MOV
			        u_xlat8.w = float(0.0);
			        //LOOP
			        for(uint u_xlatu_loop_4 = 0u ; u_xlatu_loop_4<4u ; u_xlatu_loop_4++)
			        {
			            //AND
			            u_xlatu41 = u_xlatu_loop_4 & 1u;
			            //USHR
			            u_xlatu31 = u_xlatu_loop_4 >> 1u;
			            //UTOF
			            u_xlat9.x = float(u_xlatu41);
			            //UTOF
			            u_xlat9.y = float(u_xlatu31);
			            //ADD
			            u_xlat9.xy = u_xlat6.xy + u_xlat9.xy;
			            //DP2
			            u_xlat41 = dot(u_xlat30.xy, u_xlat9.xy);
			            //ADD
			            u_xlat41 = u_xlat41 + 0.9921875;
			            //MAX
			            u_xlat31.x = max(u_xlat41, -1.0);
			            //MIN
			            u_xlat31.x = min(u_xlat31.x, 1.0);
			            //MAD
			            u_xlat41 = u_xlat31.x * 2.0 + (-u_xlat41);
			            //MAD
			            u_xlat41 = (-u_xlat41) * 64.0 + 64.0;
			            //ROUND_NI
			            u_xlat41 = floor(u_xlat41);
			            //MUL
			            u_xlat31.x = u_xlat41 * 0.618034005;
			            //ROUND_NI
			            u_xlat31.x = floor(u_xlat31.x);
			            //MAD
			            u_xlat31.x = u_xlat41 * 0.618034005 + (-u_xlat31.x);
			            //MUL
			            u_xlat31.x = u_xlat31.x * 6.28318024;
			            //MAD
			            u_xlat41 = u_xlat41 * 2.0 + 1.0;
			            //MAD
			            u_xlat9.w = (-u_xlat41) * 0.0078125 + 1.0;
			            //MAD
			            u_xlat41 = (-u_xlat9.w) * u_xlat9.w + 1.0;
			            //SQRT
			            u_xlat41 = sqrt(u_xlat41);
			            //SINCOS
			            u_xlat10.x = sin(u_xlat31.x);
			            u_xlat11.x = cos(u_xlat31.x);
			            //MUL
			            u_xlat9.y = u_xlat41 * u_xlat11.x;
			            //MUL
			            u_xlat9.z = u_xlat41 * u_xlat10.x;
			            //MAD
			            u_xlat10.xyz = (-u_xlat7.xwy) * (float3)(u_xlat39) + u_xlat9.yzw;
			            //DP3
			            u_xlat9.x = dot(u_xlat10.xyz, u_xlat10.xyz);
			            //LT
			            u_xlatb41 = u_xlat9.x<u_xlat8.x;
			            //MOVC
			            u_xlat8 = ((bool)(u_xlatb41)) ? u_xlat9 : u_xlat8;
			        //ENDLOOP
			        }
			        //MAD
			        u_xlat6.xyz = (-u_xlat8.yzw) * float3(1.01999998, 1.01999998, 1.01999998) + u_xlat7.xwy;
			        //DP3
			        u_xlat39 = dot(u_xlat6.xyz, u_xlat6.xyz);
			        //SQRT
			        u_xlat39 = sqrt(u_xlat39);
			        //ADD
			        u_xlat39 = u_xlat39 + -0.0599999987;
			        //ADD
			        u_xlat40 = (-u_xlat39) + u_xlat27.x;
			        //MAD
			        u_xlat40 = u_xlat40 * 50.0 + 0.5;
			        u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
			        //ADD
			        u_xlat39 = (-u_xlat27.x) + u_xlat39;
			        //MAD
			        u_xlat39 = u_xlat40 * u_xlat39 + u_xlat27.x;
			        //MUL
			        u_xlat41 = u_xlat40 * 0.00999999978;
			        //ADD
			        u_xlat40 = (-u_xlat40) + 1.0;
			        //MAD
			        u_xlat39 = (-u_xlat41) * u_xlat40 + u_xlat39;
			        //LT
			        u_xlatb40 = u_xlat39<u_xlat27.x;
			        //MOVC
			        u_xlat27.x = (u_xlatb40) ? u_xlat39 : u_xlat27.x;
			        //LT
			        u_xlatb39 = u_xlat15.x<u_xlat27.x;
			        //MOVC
			        u_xlat15.x = (u_xlatb39) ? u_xlat15.x : u_xlat27.x;
			        //MUL
			        u_xlat5.y = u_xlat15.x * 0.300000012;
			    //ELSE
			    } else {
			        //MOV
			        u_xlat5.y = 1.0;
			    //ENDIF
			    }
			    //ADD
			    u_xlat15.xyz = u_xlat0.xyz + u_xlat4.xyz;
			    //MUL
			    u_xlat15.xy = u_xlat15.xy * float2(3.33333325, 3.33333325);
			    //MAD
			    u_xlat16.z = u_xlat15.z * 3.33333325 + (-u_xlat36);
			    //ADD
			    u_xlat36 = u_xlat16.z + 3.0;
			    //MUL
			    u_xlat36 = u_xlat36 * 0.0500000007;
			    //SINCOS
			    u_xlat4.x = sin(u_xlat36);
			    u_xlat6.x = cos(u_xlat36);
			    //MOV
			    u_xlat7.x = (-u_xlat4.x);
			    //MOV
			    u_xlat7.y = u_xlat6.x;
			    //MOV
			    u_xlat7.z = u_xlat4.x;
			    //DP2
			    u_xlat16.x = dot(u_xlat15.xy, u_xlat7.yz);
			    //DP2
			    u_xlat16.y = dot(u_xlat15.xy, u_xlat7.xy);
			    //ADD
			    u_xlat15.xyz = u_xlat16.xyz + float3(3.0, 3.0, 3.0);
			    //MUL
			    u_xlat4.xyz = u_xlat15.xyz * float3(0.166666672, 0.166666672, 0.166666672);
			    //ROUND_NI
			    u_xlat4.xyz = floor(u_xlat4.xyz);
			    //EQ
			    u_xlatb6.xy = ((u_xlat4.xyxx) == (float4(0.0, 0.0, 0.0, 0.0))).xy;
			    //OR
			    u_xlatb36 = u_xlatb6.y || u_xlatb6.x;
			    //IF
			    if(!u_xlatb36){
			        //MAD
			        u_xlat15.xyz = (-u_xlat4.xyz) * float3(6.0, 6.0, 6.0) + u_xlat15.xyz;
			        //ADD
			        u_xlat6.yzw = u_xlat15.xyz + float3(-3.0, -3.0, -3.0);
			        //MAD
			        u_xlat15.xyz = _Time.yyy * float3(1.29999995, 0.800000012, 1.20000005) + u_xlat4.xyz;
			        //SINCOS
			        u_xlat7.x = sin(u_xlat15.x);
			        u_xlat8.x = cos(u_xlat15.x);
			        //MOV
			        u_xlat9.x = (-u_xlat7.x);
			        //MOV
			        u_xlat9.y = u_xlat8.x;
			        //MOV
			        u_xlat9.z = u_xlat7.x;
			        //DP2
			        u_xlat6.x = dot(u_xlat6.yz, u_xlat9.yz);
			        //DP2
			        u_xlat7.x = dot(u_xlat6.yz, u_xlat9.xy);
			        //SINCOS
			        u_xlat8.x = sin(u_xlat15.y);
			        u_xlat9.x = cos(u_xlat15.y);
			        //MOV
			        u_xlat10.x = (-u_xlat8.x);
			        //MOV
			        u_xlat10.y = u_xlat9.x;
			        //MOV
			        u_xlat10.z = u_xlat8.x;
			        //DP2
			        u_xlat8.x = dot(u_xlat6.xw, u_xlat10.yz);
			        //DP2
			        u_xlat7.y = dot(u_xlat6.xw, u_xlat10.xy);
			        //SINCOS
			        u_xlat6.x = sin(u_xlat15.z);
			        u_xlat9.x = cos(u_xlat15.z);
			        //MOV
			        u_xlat10.x = (-u_xlat6.x);
			        //MOV
			        u_xlat10.y = u_xlat9.x;
			        //MOV
			        u_xlat10.z = u_xlat6.x;
			        //DP2
			        u_xlat8.y = dot(u_xlat7.xy, u_xlat10.yz);
			        //DP2
			        u_xlat8.z = dot(u_xlat7.xy, u_xlat10.xy);
			        //ADD
			        u_xlat36 = u_xlat4.x + _Time.y;
			        //SINCOS
			        u_xlat36 = sin(u_xlat36);
			        //MAD
			        u_xlat36 = u_xlat36 * 0.5 + 0.5;
			        //MAD
			        u_xlat36 = u_xlat36 * 0.199999988 + 0.800000012;
			        //MUL
			        u_xlat15.xyz = (float3)(u_xlat36) * u_xlat8.xyz;
			        //MAD
			        u_xlat4 = u_xlat8.yxyz * (float4)(u_xlat36) + float4(-1.0, -0.0, -1.32000005, -0.0);
			        //MIN
			        u_xlat36 = min(abs(u_xlat4.y), abs(u_xlat4.w));
			        //MAX
			        u_xlat41 = max(abs(u_xlat4.y), abs(u_xlat4.w));
			        //DIV
			        u_xlat41 = float(1.0) / u_xlat41;
			        //MUL
			        u_xlat36 = u_xlat36 * u_xlat41;
			        //MUL
			        u_xlat41 = u_xlat36 * u_xlat36;
			        //MAD
			        u_xlat6.x = u_xlat41 * 0.0208350997 + -0.0851330012;
			        //MAD
			        u_xlat6.x = u_xlat41 * u_xlat6.x + 0.180141002;
			        //MAD
			        u_xlat6.x = u_xlat41 * u_xlat6.x + -0.330299497;
			        //MAD
			        u_xlat41 = u_xlat41 * u_xlat6.x + 0.999866009;
			        //MUL
			        u_xlat6.x = u_xlat36 * u_xlat41;
			        //LT
			        u_xlatb18 = abs(u_xlat4.y)<abs(u_xlat4.w);
			        //MAD
			        u_xlat6.x = u_xlat6.x * -2.0 + 1.57079637;
			        //AND
			        u_xlat6.x = u_xlatb18 ? u_xlat6.x : float(0.0);
			        //MAD
			        u_xlat36 = u_xlat36 * u_xlat41 + u_xlat6.x;
			        //LT
			        u_xlatb41 = u_xlat4.y<(-u_xlat4.y);
			        //AND
			        u_xlat41 = u_xlatb41 ? -3.14159274 : float(0.0);
			        //ADD
			        u_xlat36 = u_xlat36 + u_xlat41;
			        //MIN
			        u_xlat41 = min(u_xlat4.y, u_xlat4.w);
			        //MAX
			        u_xlat6.x = max(u_xlat4.y, u_xlat4.w);
			        //LT
			        u_xlatb41 = u_xlat41<(-u_xlat41);
			        //GE
			        u_xlatb6.x = u_xlat6.x>=(-u_xlat6.x);
			        //AND
			        u_xlatb41 = u_xlatb41 && u_xlatb6.x;
			        //MOVC
			        u_xlat36 = (u_xlatb41) ? (-u_xlat36) : u_xlat36;
			        //DP2
			        u_xlat41 = dot(u_xlat4.yw, u_xlat4.yw);
			        //SQRT
			        u_xlat41 = sqrt(u_xlat41);
			        //ADD
			        u_xlat36 = u_xlat36 + 0.314159274;
			        //MUL
			        u_xlat6.x = u_xlat36 * 1.5915494;
			        //ROUND_NI
			        u_xlat6.x = floor(u_xlat6.x);
			        //MAD
			        u_xlat36 = (-u_xlat6.x) * 0.628318548 + u_xlat36;
			        //ADD
			        u_xlat36 = u_xlat36 + -0.314159274;
			        //SINCOS
			        u_xlat6.x = sin(u_xlat36);
			        u_xlat7.x = cos(u_xlat36);
			        //MOV
			        u_xlat7.xz = u_xlat7.xx;
			        //MOV
			        u_xlat7.y = u_xlat6.x;
			        //MUL
			        u_xlat6.xyz = (float3)(u_xlat41) * u_xlat7.xyz;
			        //MAD
			        u_xlat6.xyz = u_xlat6.xyz * float3(2.0, 2.0, 2.0) + float3(-1.0, -0.0, -1.0);
			        //MUL
			        u_xlat6.xyz = u_xlat6.xyz * float3(0.5, 0.5, 3.0);
			        //SINCOS
			        u_xlat36 = sin(u_xlat6.z);
			        //MAD
			        u_xlat7.y = u_xlat36 * 0.100000001 + u_xlat4.z;
			        //ADD
			        u_xlat6.w = abs(u_xlat6.y) + 0.600000024;
			        //DP2
			        u_xlat36 = dot(u_xlat6.xw, u_xlat6.xw);
			        //SQRT
			        u_xlat7.x = sqrt(u_xlat36);
			        //ADD
			        u_xlat30.xy = abs(u_xlat7.xy) + float2(-0.699999988, -0.00999999978);
			        //MAX
			        u_xlat36 = max(u_xlat30.y, u_xlat30.x);
			        //MIN
			        u_xlat36 = min(u_xlat36, 0.0);
			        //MAX
			        u_xlat30.xy = max(u_xlat30.xy, float2(0.0, 0.0));
			        //DP2
			        u_xlat41 = dot(u_xlat30.xy, u_xlat30.xy);
			        //SQRT
			        u_xlat41 = sqrt(u_xlat41);
			        //ADD
			        u_xlat36 = u_xlat36 + u_xlat41;
			        //MOV
			        u_xlat7.zw = u_xlat6.xy;
			        //ADD
			        u_xlat6.xyz = u_xlat7.zyw + float3(-0.0, -0.00999999978, -0.0);
			        //ADD
			        u_xlat6.xyz = abs(u_xlat6.xyz) + float3(-0.449999988, -0.0130000003, -0.00100000005);
			        //MAX
			        u_xlat41 = max(u_xlat6.z, u_xlat6.y);
			        //MAX
			        u_xlat41 = max(u_xlat41, u_xlat6.x);
			        //MIN
			        u_xlat41 = min(u_xlat41, 0.0);
			        //MAX
			        u_xlat6.xyz = max(u_xlat6.xyz, float3(0.0, 0.0, 0.0));
			        //DP3
			        u_xlat6.x = dot(u_xlat6.xyz, u_xlat6.xyz);
			        //SQRT
			        u_xlat6.x = sqrt(u_xlat6.x);
			        //ADD
			        u_xlat41 = u_xlat41 + u_xlat6.x;
			        //ADD
			        u_xlat6.x = (-u_xlat36) + u_xlat41;
			        //MAD
			        u_xlat6.x = u_xlat6.x * 10.0 + 0.5;
			        u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
			        //ADD
			        u_xlat36 = u_xlat36 + (-u_xlat41);
			        //MAD
			        u_xlat36 = u_xlat6.x * u_xlat36 + u_xlat41;
			        //MUL
			        u_xlat41 = u_xlat6.x * 0.0500000007;
			        //ADD
			        u_xlat6.x = (-u_xlat6.x) + 1.0;
			        //MAD
			        u_xlat36 = (-u_xlat41) * u_xlat6.x + u_xlat36;
			        //MUL
			        u_xlat41 = u_xlat4.z * 4.0;
			        //SINCOS
			        u_xlat41 = sin(u_xlat41);
			        //MAD
			        u_xlat16.x = u_xlat41 * 0.100000001 + u_xlat4.y;
			        //ADD
			        u_xlat6.x = u_xlat16.x + -0.0500000007;
			        //MOV
			        u_xlat6.yw = u_xlat4.wz;
			        //DP2
			        u_xlat16.x = dot(u_xlat6.xy, u_xlat6.xy);
			        //SQRT
			        u_xlat6.z = sqrt(u_xlat16.x);
			        //ADD
			        u_xlat16.xy = abs(u_xlat6.zw) + float2(-0.0399999991, -0.699999988);
			        //MAX
			        u_xlat40 = max(u_xlat16.y, u_xlat16.x);
			        //MIN
			        u_xlat40 = min(u_xlat40, 0.0);
			        //MAX
			        u_xlat16.xy = max(u_xlat16.xy, float2(0.0, 0.0));
			        //DP2
			        u_xlat16.x = dot(u_xlat16.xy, u_xlat16.xy);
			        //SQRT
			        u_xlat16.x = sqrt(u_xlat16.x);
			        //ADD
			        u_xlat16.x = u_xlat16.x + u_xlat40;
			        //ADD
			        u_xlat28.x = (-u_xlat36) + u_xlat16.x;
			        //MAD
			        u_xlat28.x = u_xlat28.x * 1.66666663 + 0.5;
			        u_xlat28.x = clamp(u_xlat28.x, 0.0, 1.0);
			        //ADD
			        u_xlat36 = u_xlat36 + (-u_xlat16.x);
			        //MAD
			        u_xlat36 = u_xlat28.x * u_xlat36 + u_xlat16.x;
			        //MUL
			        u_xlat16.x = u_xlat28.x * 0.300000012;
			        //ADD
			        u_xlat28.x = (-u_xlat28.x) + 1.0;
			        //MAD
			        u_xlat36 = (-u_xlat16.x) * u_xlat28.x + u_xlat36;
			        //MOV
			        u_xlat4.y = u_xlat15.y;
			        u_xlat4.y = clamp(u_xlat4.y, 0.0, 1.0);
			        //MAD
			        u_xlat28.x = u_xlat4.y * -2.0 + 3.0;
			        //MOV
			        u_xlat4.x = u_xlat4.x;
			        u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
			        //MAD
			        u_xlat40 = u_xlat4.x * -2.0 + 3.0;
			        //MUL
			        u_xlat4.xy = u_xlat4.xy * u_xlat4.xy;
			        //MUL
			        u_xlat4.x = u_xlat4.x * u_xlat40;
			        //MUL
			        u_xlat4.x = u_xlat4.x * 3.0;
			        //MAD
			        u_xlat4.x = u_xlat28.x * u_xlat4.y + (-u_xlat4.x);
			        //MAD
			        u_xlat4.x = (-u_xlat4.x) * 0.159999996 + 1.0;
			        //MUL
			        u_xlat16.xyz = u_xlat15.xyz * u_xlat4.xxx;
			        //MUL
			        u_xlat15.x = u_xlat16.y * 2.22222233;
			        u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
			        //MAD
			        u_xlat39 = u_xlat15.x * -2.0 + 3.0;
			        //MAD
			        u_xlat27.x = u_xlat15.y * u_xlat4.x + -0.449999988;
			        //MUL
			        u_xlat15.y = u_xlat27.x * 2.22222233;
			        u_xlat15.y = clamp(u_xlat15.y, 0.0, 1.0);
			        //MAD
			        u_xlat4.x = u_xlat15.y * -2.0 + 3.0;
			        //MUL
			        u_xlat15.xy = u_xlat15.xy * u_xlat15.xy;
			        //MUL
			        u_xlat27.x = u_xlat15.y * u_xlat4.x;
			        //MAD
			        u_xlat15.x = u_xlat39 * u_xlat15.x + (-u_xlat27.x);
			        //MAD
			        u_xlat15.x = (-u_xlat15.x) * 0.0700000003 + 1.0;
			        //MUL
			        u_xlat6.xyz = u_xlat15.xxx * u_xlat16.xzy;
			        //MAD
			        u_xlat15.x = u_xlat16.y * u_xlat15.x + 0.600000024;
			        //MUL
			        u_xlat15.x = u_xlat15.x * 1.25;
			        u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
			        //MAD
			        u_xlat27.x = u_xlat15.x * -2.0 + 3.0;
			        //MUL
			        u_xlat15.x = u_xlat15.x * u_xlat15.x;
			        //MAD
			        u_xlat15.x = (-u_xlat27.x) * u_xlat15.x + 1.0;
			        //MAD
			        u_xlat15.x = u_xlat15.x * 0.200000003 + 1.0;
			        //MUL
			        u_xlat6.xy = u_xlat15.xx * u_xlat6.xy;
			        //MUL
			        u_xlat6.w = u_xlat6.z * 0.800000012;
			        //MUL
			        u_xlat15.xyz = u_xlat6.xzy * float3(0.449999988, 0.359999985, 0.449999988);
			        //DP3
			        u_xlat4.x = dot(u_xlat6.xyw, u_xlat6.xyw);
			        //RSQ
			        u_xlat16.x = rsqrt(u_xlat4.x);
			        //MUL
			        u_xlat7 = u_xlat16.xxxx * u_xlat6.xxwy;
			        //MAD
			        u_xlat28.xy = u_xlat6.xz * float2(0.449999988, 0.359999985) + float2(-0.140000001, -0.140000001);
			        //SAMPLE_L
			        u_xlat8 = tex2Dlod(_NoiseTex, float4(u_xlat28.xy, 0.0,1.5));
			        //SAMPLE_L
			        u_xlat9 = tex2Dlod(_NoiseTex, float4(u_xlat15.xz, 0.0,0.0));
			        //SAMPLE_L
			        u_xlat10 = tex2Dlod(_NoiseTex, float4(u_xlat15.yz, 0.0,1.5));
			        //MUL
			        u_xlat15.x = abs(u_xlat7.z) * u_xlat9.x;
			        //MAD
			        u_xlat15.x = u_xlat8.x * abs(u_xlat7.w) + u_xlat15.x;
			        //MAD
			        u_xlat15.x = u_xlat10.x * abs(u_xlat7.y) + u_xlat15.x;
			        //SQRT
			        u_xlat27.x = sqrt(u_xlat4.x);
			        //ADD
			        u_xlat27.x = u_xlat27.x + -1.0;
			        //MAD
			        u_xlat15.x = (-u_xlat15.x) * 0.100000001 + u_xlat27.x;
			        //MIN
			        u_xlat27.x = min(abs(u_xlat7.y), abs(u_xlat7.z));
			        //MAX
			        u_xlat39 = max(abs(u_xlat7.y), abs(u_xlat7.z));
			        //DIV
			        u_xlat39 = float(1.0) / u_xlat39;
			        //MUL
			        u_xlat27.x = u_xlat39 * u_xlat27.x;
			        //MUL
			        u_xlat39 = u_xlat27.x * u_xlat27.x;
			        //MAD
			        u_xlat4.x = u_xlat39 * 0.0208350997 + -0.0851330012;
			        //MAD
			        u_xlat4.x = u_xlat39 * u_xlat4.x + 0.180141002;
			        //MAD
			        u_xlat4.x = u_xlat39 * u_xlat4.x + -0.330299497;
			        //MAD
			        u_xlat39 = u_xlat39 * u_xlat4.x + 0.999866009;
			        //MUL
			        u_xlat4.x = u_xlat39 * u_xlat27.x;
			        //LT
			        u_xlatb28 = abs(u_xlat7.y)<abs(u_xlat7.z);
			        //MAD
			        u_xlat4.x = u_xlat4.x * -2.0 + 1.57079637;
			        //AND
			        u_xlat4.x = u_xlatb28 ? u_xlat4.x : float(0.0);
			        //MAD
			        u_xlat27.x = u_xlat27.x * u_xlat39 + u_xlat4.x;
			        //LT
			        u_xlatb39 = u_xlat7.y<(-u_xlat7.x);
			        //AND
			        u_xlat39 = u_xlatb39 ? -3.14159274 : float(0.0);
			        //ADD
			        u_xlat27.x = u_xlat39 + u_xlat27.x;
			        //MIN
			        u_xlat39 = min(u_xlat7.y, u_xlat7.z);
			        //MAX
			        u_xlat4.x = max(u_xlat7.y, u_xlat7.z);
			        //LT
			        u_xlatb39 = u_xlat39<(-u_xlat39);
			        //GE
			        u_xlatb4.x = u_xlat4.x>=(-u_xlat4.x);
			        //AND
			        u_xlatb39 = u_xlatb39 && u_xlatb4.x;
			        //MOVC
			        u_xlat27.x = (u_xlatb39) ? (-u_xlat27.x) : u_xlat27.x;
			        //MIN
			        u_xlat7.x = min(u_xlat27.x, 3.14159012);
			        //MAD
			        u_xlat27.x = (-u_xlat7.w) * u_xlat7.w + 1.0;
			        //MUL
			        u_xlat27.x = u_xlat27.x * 899.175598;
			        //LOG
			        u_xlat27.x = log2(u_xlat27.x);
			        //MUL
			        u_xlat27.x = u_xlat27.x * 0.720210016;
			        //ROUND_NI
			        u_xlat27.x = floor(u_xlat27.x);
			        //MAX
			        u_xlat27.x = max(u_xlat27.x, 2.0);
			        //MUL
			        u_xlat27.x = u_xlat27.x * 0.694241941;
			        //EXP
			        u_xlat27.x = exp2(u_xlat27.x);
			        //MUL
			        u_xlat27.xy = u_xlat27.xx * float2(0.44721359, 0.723606825);
			        //ROUND_NE
			        u_xlat27.xy = round(u_xlat27.xy);
			        //ADD
			        u_xlat4.xz = u_xlat27.yx + float2(1.0, 1.0);
			        //MUL
			        u_xlat31.xy = u_xlat4.xz * float2(0.618034005, 0.618034005);
			        //ROUND_NI
			        u_xlat31.xy = floor(u_xlat31.xy);
			        //MAD
			        u_xlat4.xz = u_xlat4.xz * float2(0.618034005, 0.618034005) + (-u_xlat31.xy);
			        //MAD
			        u_xlat4.xz = u_xlat4.xz * float2(6.28318024, 6.28318024) + float2(-3.88321877, -3.88321877);
			        //MUL
			        u_xlat27.xy = u_xlat27.xy * float2(-0.015625, -0.015625);
			        //MUL
			        u_xlat40 = u_xlat27.x * u_xlat4.x;
			        //MAD
			        u_xlat40 = u_xlat4.z * u_xlat27.y + (-u_xlat40);
			        //MUL
			        u_xlat8.xz = u_xlat27.yx * float2(1.0, -1.0);
			        //MUL
			        u_xlat8.yw = u_xlat4.xz * float2(-1.0, 1.0);
			        //DIV
			        u_xlat8 = u_xlat8 / (float4)(u_xlat40);
			        //MAD
			        u_xlat7.y = u_xlat6.y * u_xlat16.x + -0.9921875;
			        //DP2
			        u_xlat4.x = dot(u_xlat8.xy, u_xlat7.xy);
			        //DP2
			        u_xlat4.z = dot(u_xlat8.zw, u_xlat7.xy);
			        //ROUND_NI
			        u_xlat7.xy = floor(u_xlat4.xz);
			        //MOV
			        u_xlat8.x = float(100000.0);
			        //MOV
			        u_xlat8.y = float(0.0);
			        //MOV
			        u_xlat8.z = float(0.0);
			        //MOV
			        u_xlat8.w = float(0.0);
			        //LOOP
			        for(uint u_xlatu_loop_5 = 0u ; u_xlatu_loop_5<4u ; u_xlatu_loop_5++)
			        {
			            //AND
			            u_xlatu28.x = u_xlatu_loop_5 & 1u;
			            //USHR
			            u_xlatu28.y = u_xlatu_loop_5 >> 1u;
			            //UTOF
			            u_xlat9.xy = float2(u_xlatu28.xy);
			            //ADD
			            u_xlat28.xy = u_xlat7.xy + u_xlat9.xy;
			            //DP2
			            u_xlat28.x = dot(u_xlat27.xy, u_xlat28.xy);
			            //ADD
			            u_xlat28.x = u_xlat28.x + 0.9921875;
			            //MAX
			            u_xlat40 = max(u_xlat28.x, -1.0);
			            //MIN
			            u_xlat40 = min(u_xlat40, 1.0);
			            //MAD
			            u_xlat28.x = u_xlat40 * 2.0 + (-u_xlat28.x);
			            //MAD
			            u_xlat28.x = (-u_xlat28.x) * 64.0 + 64.0;
			            //ROUND_NI
			            u_xlat28.x = floor(u_xlat28.x);
			            //MUL
			            u_xlat40 = u_xlat28.x * 0.618034005;
			            //ROUND_NI
			            u_xlat40 = floor(u_xlat40);
			            //MAD
			            u_xlat40 = u_xlat28.x * 0.618034005 + (-u_xlat40);
			            //MUL
			            u_xlat40 = u_xlat40 * 6.28318024;
			            //MAD
			            u_xlat28.x = u_xlat28.x * 2.0 + 1.0;
			            //MAD
			            u_xlat9.w = (-u_xlat28.x) * 0.0078125 + 1.0;
			            //MAD
			            u_xlat28.x = (-u_xlat9.w) * u_xlat9.w + 1.0;
			            //SQRT
			            u_xlat28.x = sqrt(u_xlat28.x);
			            //SINCOS
			            u_xlat10.x = sin(u_xlat40);
			            u_xlat11.x = cos(u_xlat40);
			            //MUL
			            u_xlat9.y = u_xlat28.x * u_xlat11.x;
			            //MUL
			            u_xlat9.z = u_xlat28.x * u_xlat10.x;
			            //MAD
			            u_xlat10.xyz = (-u_xlat6.xwy) * u_xlat16.xxx + u_xlat9.yzw;
			            //DP3
			            u_xlat9.x = dot(u_xlat10.xyz, u_xlat10.xyz);
			            //LT
			            u_xlatb28 = u_xlat9.x<u_xlat8.x;
			            //MOVC
			            u_xlat8 = ((bool)(u_xlatb28)) ? u_xlat9 : u_xlat8;
			        //ENDLOOP
			        }
			        //MAD
			        u_xlat4.xyz = (-u_xlat8.yzw) * float3(1.01999998, 1.01999998, 1.01999998) + u_xlat6.xwy;
			        //DP3
			        u_xlat27.x = dot(u_xlat4.xyz, u_xlat4.xyz);
			        //SQRT
			        u_xlat27.x = sqrt(u_xlat27.x);
			        //ADD
			        u_xlat27.x = u_xlat27.x + -0.0599999987;
			        //ADD
			        u_xlat39 = (-u_xlat27.x) + u_xlat15.x;
			        //MAD
			        u_xlat39 = u_xlat39 * 50.0 + 0.5;
			        u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
			        //ADD
			        u_xlat27.x = (-u_xlat15.x) + u_xlat27.x;
			        //MAD
			        u_xlat27.x = u_xlat39 * u_xlat27.x + u_xlat15.x;
			        //MUL
			        u_xlat4.x = u_xlat39 * 0.00999999978;
			        //ADD
			        u_xlat39 = (-u_xlat39) + 1.0;
			        //MAD
			        u_xlat27.x = (-u_xlat4.x) * u_xlat39 + u_xlat27.x;
			        //LT
			        u_xlatb39 = u_xlat27.x<u_xlat15.x;
			        //MOVC
			        u_xlat15.x = (u_xlatb39) ? u_xlat27.x : u_xlat15.x;
			        //LT
			        u_xlatb27 = u_xlat36<u_xlat15.x;
			        //MOVC
			        u_xlat36 = (u_xlatb27) ? u_xlat36 : u_xlat15.x;
			        //MUL
			        u_xlat5.z = u_xlat36 * 0.300000012;
			    //ELSE
			    } else {
			        //MOV
			        u_xlat5.z = 1.0;
			    //ENDIF
			    }
			    //ADD
			    u_xlat3.xyz = u_xlat3.xxx + (-u_xlat5.xyz);
			    //MUL
			    u_xlat4 = u_xlat3.yyyy * unity_ObjectToWorld._m01_m11_m21_m31;
			    //MAD
			    u_xlat4 = unity_ObjectToWorld._m00_m10_m20_m30 * u_xlat3.xxxx + u_xlat4;
			    //MAD
			    u_xlat3 = unity_ObjectToWorld._m02_m12_m22_m32 * u_xlat3.zzzz + u_xlat4;
			    //DP4
			    u_xlat36 = dot(u_xlat3, u_xlat3);
			    //RSQ
			    u_xlat36 = rsqrt(u_xlat36);
			    //MUL
			    u_xlat3.xyz = (float3)(u_xlat36) * u_xlat3.xyz;
			    //MUL
			    u_xlat4.xyz = u_xlat0.yyy * unity_ObjectToWorld._m01_m11_m21_m31.xyz;
			    //MAD
			    u_xlat0.xyw = unity_ObjectToWorld._m00_m10_m20_m30.xyz * u_xlat0.xxx + u_xlat4.xyz;
			    //MAD
			    u_xlat0.xyz = unity_ObjectToWorld._m02_m12_m22_m32.xyz * u_xlat0.zzz + u_xlat0.xyw;
			    //ADD
			    u_xlat0.xyz = u_xlat0.xyz + unity_ObjectToWorld._m03_m13_m23_m33.xyz;
			    //ADD
			    u_xlat0.xyz = (-u_xlat0.xyz) + unity_StereoWorldSpaceCameraPos[0].xyz;
			    //DP3
			    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
			    //RSQ
			    u_xlat36 = rsqrt(u_xlat36);
			    //MUL
			    u_xlat0.xyz = (float3)(u_xlat36) * u_xlat0.xyz;
			    //DP3
			    u_xlat0.x = dot(u_xlat0.xyz, u_xlat3.xyz);
			    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
			    //ADD
			    u_xlat0.x = (-u_xlat0.x) + 1.0;
			    //LOG
			    u_xlat0.x = log2(u_xlat0.x);
			    //MUL
			    u_xlat0.x = u_xlat0.x * 1.5;
			    //EXP
			    u_xlat0.x = exp2(u_xlat0.x);
			    //IF
			    if(!u_xlatb38){
			        //MAD
			        u_xlat12.xyz = (-u_xlat2.xyz) * float3(6.0, 6.0, 6.0) + u_xlat13.xyz;
			        //ADD
			        u_xlat3.yzw = u_xlat12.xyz + float3(-3.0, -3.0, -3.0);
			        //MAD
			        u_xlat12.xyz = _Time.yyy * float3(1.29999995, 0.800000012, 1.20000005) + u_xlat2.xyz;
			        //SINCOS
			        u_xlat4.x = sin(u_xlat12.x);
			        u_xlat5.x = cos(u_xlat12.x);
			        //MOV
			        u_xlat6.x = (-u_xlat4.x);
			        //MOV
			        u_xlat6.y = u_xlat5.x;
			        //MOV
			        u_xlat6.z = u_xlat4.x;
			        //DP2
			        u_xlat3.x = dot(u_xlat3.yz, u_xlat6.yz);
			        //DP2
			        u_xlat4.x = dot(u_xlat3.yz, u_xlat6.xy);
			        //SINCOS
			        u_xlat5.x = sin(u_xlat12.y);
			        u_xlat6.x = cos(u_xlat12.y);
			        //MOV
			        u_xlat7.x = (-u_xlat5.x);
			        //MOV
			        u_xlat7.y = u_xlat6.x;
			        //MOV
			        u_xlat7.z = u_xlat5.x;
			        //DP2
			        u_xlat5.x = dot(u_xlat3.xw, u_xlat7.yz);
			        //DP2
			        u_xlat4.y = dot(u_xlat3.xw, u_xlat7.xy);
			        //SINCOS
			        u_xlat3.x = sin(u_xlat12.z);
			        u_xlat6.x = cos(u_xlat12.z);
			        //MOV
			        u_xlat7.x = (-u_xlat3.x);
			        //MOV
			        u_xlat7.y = u_xlat6.x;
			        //MOV
			        u_xlat7.z = u_xlat3.x;
			        //DP2
			        u_xlat5.y = dot(u_xlat4.xy, u_xlat7.yz);
			        //DP2
			        u_xlat5.z = dot(u_xlat4.xy, u_xlat7.xy);
			        //ADD
			        u_xlat12.x = u_xlat2.x + _Time.y;
			        //SINCOS
			        u_xlat12.x = sin(u_xlat12.x);
			        //MAD
			        u_xlat12.x = u_xlat12.x * 0.5 + 0.5;
			        //MAD
			        u_xlat12.x = u_xlat12.x * 0.199999988 + 0.800000012;
			        //MUL
			        u_xlat13.xyz = u_xlat12.xxx * u_xlat5.xyz;
			        //MAD
			        u_xlat2 = u_xlat5.yxyz * u_xlat12.xxxx + float4(-1.0, -0.0, -1.32000005, -0.0);
			        //MIN
			        u_xlat12.x = min(abs(u_xlat2.y), abs(u_xlat2.w));
			        //MAX
			        u_xlat24.x = max(abs(u_xlat2.y), abs(u_xlat2.w));
			        //DIV
			        u_xlat24.x = float(1.0) / u_xlat24.x;
			        //MUL
			        u_xlat12.x = u_xlat24.x * u_xlat12.x;
			        //MUL
			        u_xlat24.x = u_xlat12.x * u_xlat12.x;
			        //MAD
			        u_xlat36 = u_xlat24.x * 0.0208350997 + -0.0851330012;
			        //MAD
			        u_xlat36 = u_xlat24.x * u_xlat36 + 0.180141002;
			        //MAD
			        u_xlat36 = u_xlat24.x * u_xlat36 + -0.330299497;
			        //MAD
			        u_xlat24.x = u_xlat24.x * u_xlat36 + 0.999866009;
			        //MUL
			        u_xlat36 = u_xlat24.x * u_xlat12.x;
			        //LT
			        u_xlatb3.x = abs(u_xlat2.y)<abs(u_xlat2.w);
			        //MAD
			        u_xlat36 = u_xlat36 * -2.0 + 1.57079637;
			        //AND
			        u_xlat36 = u_xlatb3.x ? u_xlat36 : float(0.0);
			        //MAD
			        u_xlat12.x = u_xlat12.x * u_xlat24.x + u_xlat36;
			        //LT
			        u_xlatb24 = u_xlat2.y<(-u_xlat2.y);
			        //AND
			        u_xlat24.x = u_xlatb24 ? -3.14159274 : float(0.0);
			        //ADD
			        u_xlat12.x = u_xlat24.x + u_xlat12.x;
			        //MIN
			        u_xlat24.x = min(u_xlat2.y, u_xlat2.w);
			        //MAX
			        u_xlat36 = max(u_xlat2.y, u_xlat2.w);
			        //LT
			        u_xlatb24 = u_xlat24.x<(-u_xlat24.x);
			        //GE
			        u_xlatb36 = u_xlat36>=(-u_xlat36);
			        //AND
			        u_xlatb24 = u_xlatb36 && u_xlatb24;
			        //MOVC
			        u_xlat12.x = (u_xlatb24) ? (-u_xlat12.x) : u_xlat12.x;
			        //DP2
			        u_xlat24.x = dot(u_xlat2.yw, u_xlat2.yw);
			        //SQRT
			        u_xlat24.x = sqrt(u_xlat24.x);
			        //ADD
			        u_xlat12.x = u_xlat12.x + 0.314159274;
			        //MUL
			        u_xlat36 = u_xlat12.x * 1.5915494;
			        //ROUND_NI
			        u_xlat36 = floor(u_xlat36);
			        //MAD
			        u_xlat12.x = (-u_xlat36) * 0.628318548 + u_xlat12.x;
			        //ADD
			        u_xlat12.x = u_xlat12.x + -0.314159274;
			        //SINCOS
			        u_xlat3.x = sin(u_xlat12.x);
			        u_xlat4.x = cos(u_xlat12.x);
			        //MOV
			        u_xlat4.xz = u_xlat4.xx;
			        //MOV
			        u_xlat4.y = u_xlat3.x;
			        //MUL
			        u_xlat12.xyz = u_xlat24.xxx * u_xlat4.xyz;
			        //MAD
			        u_xlat12.xyz = u_xlat12.xyz * float3(2.0, 2.0, 2.0) + float3(-1.0, -0.0, -1.0);
			        //MUL
			        u_xlat3.xyz = u_xlat12.xyz * float3(0.5, 0.5, 3.0);
			        //SINCOS
			        u_xlat12.x = sin(u_xlat3.z);
			        //MAD
			        u_xlat4.y = u_xlat12.x * 0.100000001 + u_xlat2.z;
			        //ADD
			        u_xlat3.w = abs(u_xlat3.y) + 0.600000024;
			        //DP2
			        u_xlat12.x = dot(u_xlat3.xw, u_xlat3.xw);
			        //SQRT
			        u_xlat4.x = sqrt(u_xlat12.x);
			        //ADD
			        u_xlat12.xy = abs(u_xlat4.xy) + float2(-0.699999988, -0.00999999978);
			        //MAX
			        u_xlat36 = max(u_xlat12.y, u_xlat12.x);
			        //MIN
			        u_xlat36 = min(u_xlat36, 0.0);
			        //MAX
			        u_xlat12.xy = max(u_xlat12.xy, float2(0.0, 0.0));
			        //DP2
			        u_xlat12.x = dot(u_xlat12.xy, u_xlat12.xy);
			        //SQRT
			        u_xlat12.x = sqrt(u_xlat12.x);
			        //ADD
			        u_xlat12.x = u_xlat12.x + u_xlat36;
			        //MOV
			        u_xlat4.zw = u_xlat3.xy;
			        //ADD
			        u_xlat3.xyz = u_xlat4.zyw + float3(-0.0, -0.00999999978, -0.0);
			        //ADD
			        u_xlat3.xyz = abs(u_xlat3.xyz) + float3(-0.449999988, -0.0130000003, -0.00100000005);
			        //MAX
			        u_xlat24.x = max(u_xlat3.z, u_xlat3.y);
			        //MAX
			        u_xlat24.x = max(u_xlat24.x, u_xlat3.x);
			        //MIN
			        u_xlat24.x = min(u_xlat24.x, 0.0);
			        //MAX
			        u_xlat3.xyz = max(u_xlat3.xyz, float3(0.0, 0.0, 0.0));
			        //DP3
			        u_xlat36 = dot(u_xlat3.xyz, u_xlat3.xyz);
			        //SQRT
			        u_xlat36 = sqrt(u_xlat36);
			        //ADD
			        u_xlat24.x = u_xlat36 + u_xlat24.x;
			        //ADD
			        u_xlat36 = (-u_xlat12.x) + u_xlat24.x;
			        //MAD
			        u_xlat36 = u_xlat36 * 10.0 + 0.5;
			        u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
			        //ADD
			        u_xlat12.x = (-u_xlat24.x) + u_xlat12.x;
			        //MAD
			        u_xlat12.x = u_xlat36 * u_xlat12.x + u_xlat24.x;
			        //MUL
			        u_xlat24.x = u_xlat36 * 0.0500000007;
			        //ADD
			        u_xlat36 = (-u_xlat36) + 1.0;
			        //MAD
			        u_xlat12.x = (-u_xlat24.x) * u_xlat36 + u_xlat12.x;
			        //MUL
			        u_xlat24.x = u_xlat2.z * 4.0;
			        //SINCOS
			        u_xlat24.x = sin(u_xlat24.x);
			        //MAD
			        u_xlat24.x = u_xlat24.x * 0.100000001 + u_xlat2.y;
			        //ADD
			        u_xlat3.x = u_xlat24.x + -0.0500000007;
			        //MOV
			        u_xlat3.yw = u_xlat2.wz;
			        //DP2
			        u_xlat24.x = dot(u_xlat3.xy, u_xlat3.xy);
			        //SQRT
			        u_xlat3.z = sqrt(u_xlat24.x);
			        //ADD
			        u_xlat24.xy = abs(u_xlat3.zw) + float2(-0.0399999991, -0.699999988);
			        //MAX
			        u_xlat14.x = max(u_xlat24.y, u_xlat24.x);
			        //MIN
			        u_xlat14.x = min(u_xlat14.x, 0.0);
			        //MAX
			        u_xlat24.xy = max(u_xlat24.xy, float2(0.0, 0.0));
			        //DP2
			        u_xlat24.x = dot(u_xlat24.xy, u_xlat24.xy);
			        //SQRT
			        u_xlat24.x = sqrt(u_xlat24.x);
			        //ADD
			        u_xlat24.x = u_xlat24.x + u_xlat14.x;
			        //ADD
			        u_xlat36 = (-u_xlat12.x) + u_xlat24.x;
			        //MAD
			        u_xlat36 = u_xlat36 * 1.66666663 + 0.5;
			        u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
			        //ADD
			        u_xlat12.x = (-u_xlat24.x) + u_xlat12.x;
			        //MAD
			        u_xlat12.x = u_xlat36 * u_xlat12.x + u_xlat24.x;
			        //MUL
			        u_xlat24.x = u_xlat36 * 0.300000012;
			        //ADD
			        u_xlat36 = (-u_xlat36) + 1.0;
			        //MAD
			        u_xlat12.x = (-u_xlat24.x) * u_xlat36 + u_xlat12.x;
			        //MOV
			        u_xlat24.x = u_xlat13.y;
			        u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
			        //MAD
			        u_xlat36 = u_xlat24.x * -2.0 + 3.0;
			        //MUL
			        u_xlat24.x = u_xlat24.x * u_xlat24.x;
			        //MOV
			        u_xlat2.x = u_xlat2.x;
			        u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
			        //MAD
			        u_xlat14.x = u_xlat2.x * -2.0 + 3.0;
			        //MUL
			        u_xlat2.x = u_xlat2.x * u_xlat2.x;
			        //MUL
			        u_xlat2.x = u_xlat2.x * u_xlat14.x;
			        //MUL
			        u_xlat2.x = u_xlat2.x * 3.0;
			        //MAD
			        u_xlat24.x = u_xlat36 * u_xlat24.x + (-u_xlat2.x);
			        //MAD
			        u_xlat24.x = (-u_xlat24.x) * 0.159999996 + 1.0;
			        //MUL
			        u_xlat2.xyz = u_xlat24.xxx * u_xlat13.xyz;
			        //MUL
			        u_xlat24.y = u_xlat2.y * 2.22222233;
			        u_xlat24.y = clamp(u_xlat24.y, 0.0, 1.0);
			        //MAD
			        u_xlat13.x = u_xlat24.y * -2.0 + 3.0;
			        //MAD
			        u_xlat24.x = u_xlat13.y * u_xlat24.x + -0.449999988;
			        //MUL
			        u_xlat24.x = u_xlat24.x * 2.22222233;
			        u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
			        //MAD
			        u_xlat25 = u_xlat24.x * -2.0 + 3.0;
			        //MUL
			        u_xlat24.xy = u_xlat24.xy * u_xlat24.xy;
			        //MUL
			        u_xlat24.x = u_xlat24.x * u_xlat25;
			        //MAD
			        u_xlat24.x = u_xlat13.x * u_xlat24.y + (-u_xlat24.x);
			        //MAD
			        u_xlat24.x = (-u_xlat24.x) * 0.0700000003 + 1.0;
			        //MUL
			        u_xlat3.xyz = u_xlat24.xxx * u_xlat2.xzy;
			        //MAD
			        u_xlat24.x = u_xlat2.y * u_xlat24.x + 0.600000024;
			        //MUL
			        u_xlat24.x = u_xlat24.x * 1.25;
			        u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
			        //MAD
			        u_xlat36 = u_xlat24.x * -2.0 + 3.0;
			        //MUL
			        u_xlat24.x = u_xlat24.x * u_xlat24.x;
			        //MAD
			        u_xlat24.x = (-u_xlat36) * u_xlat24.x + 1.0;
			        //MAD
			        u_xlat24.x = u_xlat24.x * 0.200000003 + 1.0;
			        //MUL
			        u_xlat3.xy = u_xlat24.xx * u_xlat3.xy;
			        //MUL
			        u_xlat3.w = u_xlat3.z * 0.800000012;
			        //MUL
			        u_xlat13.xyz = u_xlat3.xzy * float3(0.449999988, 0.359999985, 0.449999988);
			        //DP3
			        u_xlat24.x = dot(u_xlat3.xyw, u_xlat3.xyw);
			        //RSQ
			        u_xlat36 = rsqrt(u_xlat24.x);
			        //MUL
			        u_xlat2 = (float4)(u_xlat36) * u_xlat3.xxwy;
			        //MAD
			        u_xlat4.xy = u_xlat3.xz * float2(0.449999988, 0.359999985) + float2(-0.140000001, -0.140000001);
			        //SAMPLE_L
			        u_xlat4 = tex2Dlod(_NoiseTex, float4(u_xlat4.xy, 0.0,1.5));
			        //SAMPLE_L
			        u_xlat5 = tex2Dlod(_NoiseTex, float4(u_xlat13.xz, 0.0,0.0));
			        //SAMPLE_L
			        u_xlat6 = tex2Dlod(_NoiseTex, float4(u_xlat13.yz, 0.0,1.5));
			        //MUL
			        u_xlat13.x = abs(u_xlat2.z) * u_xlat5.x;
			        //MAD
			        u_xlat13.x = u_xlat4.x * abs(u_xlat2.w) + u_xlat13.x;
			        //MAD
			        u_xlat13.x = u_xlat6.x * abs(u_xlat2.y) + u_xlat13.x;
			        //SQRT
			        u_xlat24.x = sqrt(u_xlat24.x);
			        //ADD
			        u_xlat24.x = u_xlat24.x + -1.0;
			        //MAD
			        u_xlat28.y = (-u_xlat13.x) * 0.100000001 + u_xlat24.x;
			        //MIN
			        u_xlat24.x = min(abs(u_xlat2.y), abs(u_xlat2.z));
			        //MAX
			        u_xlat13.x = max(abs(u_xlat2.y), abs(u_xlat2.z));
			        //DIV
			        u_xlat13.x = float(1.0) / u_xlat13.x;
			        //MUL
			        u_xlat24.x = u_xlat24.x * u_xlat13.x;
			        //MUL
			        u_xlat13.x = u_xlat24.x * u_xlat24.x;
			        //MAD
			        u_xlat25 = u_xlat13.x * 0.0208350997 + -0.0851330012;
			        //MAD
			        u_xlat25 = u_xlat13.x * u_xlat25 + 0.180141002;
			        //MAD
			        u_xlat25 = u_xlat13.x * u_xlat25 + -0.330299497;
			        //MAD
			        u_xlat13.x = u_xlat13.x * u_xlat25 + 0.999866009;
			        //MUL
			        u_xlat25 = u_xlat24.x * u_xlat13.x;
			        //LT
			        u_xlatb37 = abs(u_xlat2.y)<abs(u_xlat2.z);
			        //MAD
			        u_xlat25 = u_xlat25 * -2.0 + 1.57079637;
			        //AND
			        u_xlat25 = u_xlatb37 ? u_xlat25 : float(0.0);
			        //MAD
			        u_xlat24.x = u_xlat24.x * u_xlat13.x + u_xlat25;
			        //LT
			        u_xlatb13 = u_xlat2.y<(-u_xlat2.x);
			        //AND
			        u_xlat13.x = u_xlatb13 ? -3.14159274 : float(0.0);
			        //ADD
			        u_xlat24.x = u_xlat24.x + u_xlat13.x;
			        //MIN
			        u_xlat13.x = min(u_xlat2.y, u_xlat2.z);
			        //MAX
			        u_xlat25 = max(u_xlat2.y, u_xlat2.z);
			        //LT
			        u_xlatb13 = u_xlat13.x<(-u_xlat13.x);
			        //GE
			        u_xlatb25 = u_xlat25>=(-u_xlat25);
			        //AND
			        u_xlatb13 = u_xlatb25 && u_xlatb13;
			        //MOVC
			        u_xlat24.x = (u_xlatb13) ? (-u_xlat24.x) : u_xlat24.x;
			        //MIN
			        u_xlat2.x = min(u_xlat24.x, 3.14159012);
			        //MAD
			        u_xlat24.x = (-u_xlat2.w) * u_xlat2.w + 1.0;
			        //MUL
			        u_xlat24.x = u_xlat24.x * 899.175598;
			        //LOG
			        u_xlat24.x = log2(u_xlat24.x);
			        //MUL
			        u_xlat24.x = u_xlat24.x * 0.720210016;
			        //ROUND_NI
			        u_xlat24.x = floor(u_xlat24.x);
			        //MAX
			        u_xlat24.x = max(u_xlat24.x, 2.0);
			        //MUL
			        u_xlat24.x = u_xlat24.x * 0.694241941;
			        //EXP
			        u_xlat24.x = exp2(u_xlat24.x);
			        //MUL
			        u_xlat13.xy = u_xlat24.xx * float2(0.44721359, 0.723606825);
			        //ROUND_NE
			        u_xlat13.xy = round(u_xlat13.xy);
			        //ADD
			        u_xlat26.xy = u_xlat13.yx + float2(1.0, 1.0);
			        //MUL
			        u_xlat5.xy = u_xlat26.xy * float2(0.618034005, 0.618034005);
			        //ROUND_NI
			        u_xlat5.xy = floor(u_xlat5.xy);
			        //MAD
			        u_xlat26.xy = u_xlat26.xy * float2(0.618034005, 0.618034005) + (-u_xlat5.xy);
			        //MAD
			        u_xlat26.xy = u_xlat26.xy * float2(6.28318024, 6.28318024) + float2(-3.88321877, -3.88321877);
			        //MUL
			        u_xlat13.xy = u_xlat13.xy * float2(-0.015625, -0.015625);
			        //MUL
			        u_xlat24.x = u_xlat13.x * u_xlat26.x;
			        //MAD
			        u_xlat24.x = u_xlat26.y * u_xlat13.y + (-u_xlat24.x);
			        //MUL
			        u_xlat5.xz = u_xlat13.yx * float2(1.0, -1.0);
			        //MUL
			        u_xlat5.yw = u_xlat26.xy * float2(-1.0, 1.0);
			        //DIV
			        u_xlat5 = u_xlat5 / u_xlat24.xxxx;
			        //MAD
			        u_xlat2.y = u_xlat3.y * u_xlat36 + -0.9921875;
			        //DP2
			        u_xlat24.x = dot(u_xlat5.xy, u_xlat2.xy);
			        //DP2
			        u_xlat37 = dot(u_xlat5.zw, u_xlat2.xy);
			        //ROUND_NI
			        u_xlat2.x = floor(u_xlat24.x);
			        //ROUND_NI
			        u_xlat2.y = floor(u_xlat37);
			        //MOV
			        u_xlat5.x = float(100000.0);
			        //MOV
			        u_xlat5.y = float(0.0);
			        //MOV
			        u_xlat5.z = float(0.0);
			        //MOV
			        u_xlat5.w = float(0.0);
			        //LOOP
			        for(uint u_xlatu_loop_6 = 0u ; u_xlatu_loop_6<4u ; u_xlatu_loop_6++)
			        {
			            //AND
			            u_xlatu37 = u_xlatu_loop_6 & 1u;
			            //USHR
			            u_xlatu26 = u_xlatu_loop_6 >> 1u;
			            //UTOF
			            u_xlat6.x = float(u_xlatu37);
			            //UTOF
			            u_xlat6.y = float(u_xlatu26);
			            //ADD
			            u_xlat26.xy = u_xlat2.xy + u_xlat6.xy;
			            //DP2
			            u_xlat37 = dot(u_xlat13.xy, u_xlat26.xy);
			            //ADD
			            u_xlat37 = u_xlat37 + 0.9921875;
			            //MAX
			            u_xlat26.x = max(u_xlat37, -1.0);
			            //MIN
			            u_xlat26.x = min(u_xlat26.x, 1.0);
			            //MAD
			            u_xlat37 = u_xlat26.x * 2.0 + (-u_xlat37);
			            //MAD
			            u_xlat37 = (-u_xlat37) * 64.0 + 64.0;
			            //ROUND_NI
			            u_xlat37 = floor(u_xlat37);
			            //MUL
			            u_xlat26.x = u_xlat37 * 0.618034005;
			            //ROUND_NI
			            u_xlat26.x = floor(u_xlat26.x);
			            //MAD
			            u_xlat26.x = u_xlat37 * 0.618034005 + (-u_xlat26.x);
			            //MUL
			            u_xlat26.x = u_xlat26.x * 6.28318024;
			            //MAD
			            u_xlat37 = u_xlat37 * 2.0 + 1.0;
			            //MAD
			            u_xlat6.w = (-u_xlat37) * 0.0078125 + 1.0;
			            //MAD
			            u_xlat37 = (-u_xlat6.w) * u_xlat6.w + 1.0;
			            //SQRT
			            u_xlat37 = sqrt(u_xlat37);
			            //SINCOS
			            u_xlat7.x = sin(u_xlat26.x);
			            u_xlat8.x = cos(u_xlat26.x);
			            //MUL
			            u_xlat6.y = u_xlat37 * u_xlat8.x;
			            //MUL
			            u_xlat6.z = u_xlat37 * u_xlat7.x;
			            //MAD
			            u_xlat7.xyz = (-u_xlat3.xwy) * (float3)(u_xlat36) + u_xlat6.yzw;
			            //DP3
			            u_xlat6.x = dot(u_xlat7.xyz, u_xlat7.xyz);
			            //LT
			            u_xlatb37 = u_xlat6.x<u_xlat5.x;
			            //MOVC
			            u_xlat5 = ((bool)(u_xlatb37)) ? u_xlat6 : u_xlat5;
			        //ENDLOOP
			        }
			        //MAD
			        u_xlat13.xyz = (-u_xlat5.yzw) * float3(1.01999998, 1.01999998, 1.01999998) + u_xlat3.xwy;
			        //DP3
			        u_xlat24.x = dot(u_xlat13.xyz, u_xlat13.xyz);
			        //SQRT
			        u_xlat24.x = sqrt(u_xlat24.x);
			        //ADD
			        u_xlat24.x = u_xlat24.x + -0.0599999987;
			        //ADD
			        u_xlat36 = (-u_xlat24.x) + u_xlat28.y;
			        //MAD
			        u_xlat36 = u_xlat36 * 50.0 + 0.5;
			        u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
			        //ADD
			        u_xlat24.x = (-u_xlat28.y) + u_xlat24.x;
			        //MAD
			        u_xlat24.x = u_xlat36 * u_xlat24.x + u_xlat28.y;
			        //MUL
			        u_xlat13.x = u_xlat36 * 0.00999999978;
			        //ADD
			        u_xlat36 = (-u_xlat36) + 1.0;
			        //MAD
			        u_xlat4.y = (-u_xlat13.x) * u_xlat36 + u_xlat24.x;
			        //LT
			        u_xlatb24 = u_xlat4.y<u_xlat28.y;
			        //MOV
			        u_xlat4.x = float(1.0);
			        //MOV
			        u_xlat28.x = float(0.0);
			        //MOVC
			        u_xlat24.xy = ((bool)(u_xlatb24)) ? u_xlat4.xy : u_xlat28.xy;
			        //LT
			        u_xlatb12 = u_xlat12.x<u_xlat24.y;
			        //MOVC
			        u_xlat12.x = (u_xlatb12) ? 2.0 : u_xlat24.x;
			    //ELSE
			    } else {
			        //MOV
			        u_xlat12.x = 0.0;
			    //ENDIF
			    }
			    //LT
			    u_xlatb24 = u_xlat12.x<1.0;
			    //LT
			    u_xlatb12 = 1.10000002<u_xlat12.x;
			    //MOVC
			    u_xlat13.xyz = ((bool)(u_xlatb24)) ? float3(0.328000009, 0.0219999999, 0.0108000003) : float3(0.0500000007, 0.150000006, 0.0);
			    //OR
			    u_xlatb12 = u_xlatb12 || u_xlatb24;
			    //MOVC
			    u_xlat12.xyz = ((bool)(u_xlatb12)) ? u_xlat13.xyz : float3(0.00999999978, 0.00999999978, 0.00999999978);
			    //MUL
			    u_xlat12.xyz = u_xlat1.xxx * u_xlat12.xyz;
			    //ADD
			    u_xlat0.x = u_xlat0.x + 1.0;
			    //MUL
			    fragmentOut.SV_Target0.xyz = u_xlat0.xxx * u_xlat12.xyz;
			    //MOV
			    fragmentOut.SV_Target0.w = 1.0;
			    //RET
			    return fragmentOut;
			}
			#endif
			ENDCG
		}
	}
}
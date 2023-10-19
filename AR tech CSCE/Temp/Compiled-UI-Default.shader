// Compiled shader for Android

//////////////////////////////////////////////////////////////////////////
// 
// NOTE: This is *not* a valid shader file, the contents are provided just
// for information and for debugging purposes only.
// 
//////////////////////////////////////////////////////////////////////////
// Skipping shader variants that would not be included into build of current scene.

Shader "UI/Default" {
Properties {
[PerRendererData]  _MainTex ("Sprite Texture", 2D) = "white" { }
 _Color ("Tint", Color) = (1.000000,1.000000,1.000000,1.000000)
 _StencilComp ("Stencil Comparison", Float) = 8.000000
 _Stencil ("Stencil ID", Float) = 0.000000
 _StencilOp ("Stencil Operation", Float) = 0.000000
 _StencilWriteMask ("Stencil Write Mask", Float) = 255.000000
 _StencilReadMask ("Stencil Read Mask", Float) = 255.000000
 _ColorMask ("Color Mask", Float) = 15.000000
[Toggle(UNITY_UI_ALPHACLIP)]  _UseUIAlphaClip ("Use Alpha Clip", Float) = 0.000000
}
SubShader { 
 Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" "CanUseSpriteAtlas"="true" "PreviewType"="Plane" }
 Pass {
  Name "Default"
  Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" "CanUseSpriteAtlas"="true" "PreviewType"="Plane" }
  ZTest [unity_GUIZTestMode]
  ZWrite Off
  Cull Off
  Stencil {
   Ref [_Stencil]
   ReadMask [_StencilReadMask]
   WriteMask [_StencilWriteMask]
   Comp [_StencilComp]
   Pass [_StencilOp]
  }
  Blend One OneMinusSrcAlpha
  ColorMask [_ColorMask]
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
//////////////////////////////////////////////////////
Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "gles3":
Set 2D Texture "_MainTex" to slot 0

Constant Buffer "$Globals" (16 bytes) {
  Vector4 _TextureSampleAdd at 0
}
Constant Buffer "$Globals" (264 bytes) {
  Matrix4x4 unity_ObjectToWorld at 16
  Matrix4x4 glstate_matrix_projection at 80
  Matrix4x4 unity_MatrixVP at 144
  Vector4 _ScreenParams at 0
  Vector4 _Color at 208
  Vector4 _ClipRect at 224
  Vector4 _MainTex_ST at 240
  Float _UIMaskSoftnessX at 256
  Float _UIMaskSoftnessY at 260
}

Shader Disassembly:
#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _ClipRect;
uniform 	vec4 _MainTex_ST;
uniform 	float _UIMaskSoftnessX;
uniform 	float _UIMaskSoftnessY;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat1 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.ww / abs(u_xlat0.xy);
    u_xlat0.xy = vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) * vec2(0.25, 0.25) + abs(u_xlat0.xy);
    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    u_xlat0 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat0 = min(u_xlat0, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat0.xy = in_POSITION0.xy * vec2(2.0, 2.0) + (-u_xlat0.xy);
    vs_TEXCOORD2.xy = (-u_xlat0.zw) + u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _TextureSampleAdd;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
void main()
{
    u_xlat16_0.x = vs_COLOR0.w * 255.0;
    u_xlat16_0.x = roundEven(u_xlat16_0.x);
    u_xlat16_0.w = u_xlat16_0.x * 0.00392156886;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat16_1 + _TextureSampleAdd;
    u_xlat16_0.xyz = vs_COLOR0.xyz;
    u_xlat0 = u_xlat16_0 * u_xlat1;
    SV_Target0.xyz = u_xlat0.www * u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
    return;
}

#endif


//////////////////////////////////////////////////////
Keywords: <none>
-- Hardware tier variant: Tier 2
-- Vertex shader for "gles3":
Set 2D Texture "_MainTex" to slot 0

Constant Buffer "$Globals" (16 bytes) {
  Vector4 _TextureSampleAdd at 0
}
Constant Buffer "$Globals" (264 bytes) {
  Matrix4x4 unity_ObjectToWorld at 16
  Matrix4x4 glstate_matrix_projection at 80
  Matrix4x4 unity_MatrixVP at 144
  Vector4 _ScreenParams at 0
  Vector4 _Color at 208
  Vector4 _ClipRect at 224
  Vector4 _MainTex_ST at 240
  Float _UIMaskSoftnessX at 256
  Float _UIMaskSoftnessY at 260
}

Shader Disassembly:
#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _ClipRect;
uniform 	vec4 _MainTex_ST;
uniform 	float _UIMaskSoftnessX;
uniform 	float _UIMaskSoftnessY;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat1 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.ww / abs(u_xlat0.xy);
    u_xlat0.xy = vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) * vec2(0.25, 0.25) + abs(u_xlat0.xy);
    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    u_xlat0 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat0 = min(u_xlat0, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat0.xy = in_POSITION0.xy * vec2(2.0, 2.0) + (-u_xlat0.xy);
    vs_TEXCOORD2.xy = (-u_xlat0.zw) + u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _TextureSampleAdd;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
void main()
{
    u_xlat16_0.x = vs_COLOR0.w * 255.0;
    u_xlat16_0.x = roundEven(u_xlat16_0.x);
    u_xlat16_0.w = u_xlat16_0.x * 0.00392156886;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat16_1 + _TextureSampleAdd;
    u_xlat16_0.xyz = vs_COLOR0.xyz;
    u_xlat0 = u_xlat16_0 * u_xlat1;
    SV_Target0.xyz = u_xlat0.www * u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
    return;
}

#endif


//////////////////////////////////////////////////////
Keywords: <none>
-- Hardware tier variant: Tier 3
-- Vertex shader for "gles3":
Set 2D Texture "_MainTex" to slot 0

Constant Buffer "$Globals" (16 bytes) {
  Vector4 _TextureSampleAdd at 0
}
Constant Buffer "$Globals" (264 bytes) {
  Matrix4x4 unity_ObjectToWorld at 16
  Matrix4x4 glstate_matrix_projection at 80
  Matrix4x4 unity_MatrixVP at 144
  Vector4 _ScreenParams at 0
  Vector4 _Color at 208
  Vector4 _ClipRect at 224
  Vector4 _MainTex_ST at 240
  Float _UIMaskSoftnessX at 256
  Float _UIMaskSoftnessY at 260
}

Shader Disassembly:
#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _ClipRect;
uniform 	vec4 _MainTex_ST;
uniform 	float _UIMaskSoftnessX;
uniform 	float _UIMaskSoftnessY;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat1 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.ww / abs(u_xlat0.xy);
    u_xlat0.xy = vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) * vec2(0.25, 0.25) + abs(u_xlat0.xy);
    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    u_xlat0 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat0 = min(u_xlat0, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat0.xy = in_POSITION0.xy * vec2(2.0, 2.0) + (-u_xlat0.xy);
    vs_TEXCOORD2.xy = (-u_xlat0.zw) + u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _TextureSampleAdd;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
void main()
{
    u_xlat16_0.x = vs_COLOR0.w * 255.0;
    u_xlat16_0.x = roundEven(u_xlat16_0.x);
    u_xlat16_0.w = u_xlat16_0.x * 0.00392156886;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat16_1 + _TextureSampleAdd;
    u_xlat16_0.xyz = vs_COLOR0.xyz;
    u_xlat0 = u_xlat16_0 * u_xlat1;
    SV_Target0.xyz = u_xlat0.www * u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
    return;
}

#endif


//////////////////////////////////////////////////////
Keywords: UNITY_UI_ALPHACLIP
-- Hardware tier variant: Tier 1
-- Vertex shader for "gles3":
Set 2D Texture "_MainTex" to slot 0

Constant Buffer "$Globals" (16 bytes) {
  Vector4 _TextureSampleAdd at 0
}
Constant Buffer "$Globals" (264 bytes) {
  Matrix4x4 unity_ObjectToWorld at 16
  Matrix4x4 glstate_matrix_projection at 80
  Matrix4x4 unity_MatrixVP at 144
  Vector4 _ScreenParams at 0
  Vector4 _Color at 208
  Vector4 _ClipRect at 224
  Vector4 _MainTex_ST at 240
  Float _UIMaskSoftnessX at 256
  Float _UIMaskSoftnessY at 260
}

Shader Disassembly:
#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _ClipRect;
uniform 	vec4 _MainTex_ST;
uniform 	float _UIMaskSoftnessX;
uniform 	float _UIMaskSoftnessY;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat1 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.ww / abs(u_xlat0.xy);
    u_xlat0.xy = vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) * vec2(0.25, 0.25) + abs(u_xlat0.xy);
    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    u_xlat0 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat0 = min(u_xlat0, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat0.xy = in_POSITION0.xy * vec2(2.0, 2.0) + (-u_xlat0.xy);
    vs_TEXCOORD2.xy = (-u_xlat0.zw) + u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _TextureSampleAdd;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump float u_xlat16_2;
bool u_xlatb3;
void main()
{
    u_xlat16_0.x = vs_COLOR0.w * 255.0;
    u_xlat16_0.x = roundEven(u_xlat16_0.x);
    u_xlat16_0.w = u_xlat16_0.x * 0.00392156886;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat16_1 + _TextureSampleAdd;
    u_xlat16_2 = u_xlat16_0.w * u_xlat1.w + -0.00100000005;
    u_xlatb3 = u_xlat16_2<0.0;
    if(u_xlatb3){discard;}
    u_xlat16_0.xyz = vs_COLOR0.xyz;
    u_xlat0 = u_xlat16_0 * u_xlat1;
    SV_Target0.xyz = u_xlat0.www * u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
    return;
}

#endif


//////////////////////////////////////////////////////
Keywords: UNITY_UI_ALPHACLIP
-- Hardware tier variant: Tier 2
-- Vertex shader for "gles3":
Set 2D Texture "_MainTex" to slot 0

Constant Buffer "$Globals" (16 bytes) {
  Vector4 _TextureSampleAdd at 0
}
Constant Buffer "$Globals" (264 bytes) {
  Matrix4x4 unity_ObjectToWorld at 16
  Matrix4x4 glstate_matrix_projection at 80
  Matrix4x4 unity_MatrixVP at 144
  Vector4 _ScreenParams at 0
  Vector4 _Color at 208
  Vector4 _ClipRect at 224
  Vector4 _MainTex_ST at 240
  Float _UIMaskSoftnessX at 256
  Float _UIMaskSoftnessY at 260
}

Shader Disassembly:
#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _ClipRect;
uniform 	vec4 _MainTex_ST;
uniform 	float _UIMaskSoftnessX;
uniform 	float _UIMaskSoftnessY;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat1 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.ww / abs(u_xlat0.xy);
    u_xlat0.xy = vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) * vec2(0.25, 0.25) + abs(u_xlat0.xy);
    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    u_xlat0 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat0 = min(u_xlat0, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat0.xy = in_POSITION0.xy * vec2(2.0, 2.0) + (-u_xlat0.xy);
    vs_TEXCOORD2.xy = (-u_xlat0.zw) + u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _TextureSampleAdd;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump float u_xlat16_2;
bool u_xlatb3;
void main()
{
    u_xlat16_0.x = vs_COLOR0.w * 255.0;
    u_xlat16_0.x = roundEven(u_xlat16_0.x);
    u_xlat16_0.w = u_xlat16_0.x * 0.00392156886;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat16_1 + _TextureSampleAdd;
    u_xlat16_2 = u_xlat16_0.w * u_xlat1.w + -0.00100000005;
    u_xlatb3 = u_xlat16_2<0.0;
    if(u_xlatb3){discard;}
    u_xlat16_0.xyz = vs_COLOR0.xyz;
    u_xlat0 = u_xlat16_0 * u_xlat1;
    SV_Target0.xyz = u_xlat0.www * u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
    return;
}

#endif


//////////////////////////////////////////////////////
Keywords: UNITY_UI_ALPHACLIP
-- Hardware tier variant: Tier 3
-- Vertex shader for "gles3":
Set 2D Texture "_MainTex" to slot 0

Constant Buffer "$Globals" (16 bytes) {
  Vector4 _TextureSampleAdd at 0
}
Constant Buffer "$Globals" (264 bytes) {
  Matrix4x4 unity_ObjectToWorld at 16
  Matrix4x4 glstate_matrix_projection at 80
  Matrix4x4 unity_MatrixVP at 144
  Vector4 _ScreenParams at 0
  Vector4 _Color at 208
  Vector4 _ClipRect at 224
  Vector4 _MainTex_ST at 240
  Float _UIMaskSoftnessX at 256
  Float _UIMaskSoftnessY at 260
}

Shader Disassembly:
#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _ClipRect;
uniform 	vec4 _MainTex_ST;
uniform 	float _UIMaskSoftnessX;
uniform 	float _UIMaskSoftnessY;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat1 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.ww / abs(u_xlat0.xy);
    u_xlat0.xy = vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) * vec2(0.25, 0.25) + abs(u_xlat0.xy);
    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    u_xlat0 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat0 = min(u_xlat0, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat0.xy = in_POSITION0.xy * vec2(2.0, 2.0) + (-u_xlat0.xy);
    vs_TEXCOORD2.xy = (-u_xlat0.zw) + u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _TextureSampleAdd;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump float u_xlat16_2;
bool u_xlatb3;
void main()
{
    u_xlat16_0.x = vs_COLOR0.w * 255.0;
    u_xlat16_0.x = roundEven(u_xlat16_0.x);
    u_xlat16_0.w = u_xlat16_0.x * 0.00392156886;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat16_1 + _TextureSampleAdd;
    u_xlat16_2 = u_xlat16_0.w * u_xlat1.w + -0.00100000005;
    u_xlatb3 = u_xlat16_2<0.0;
    if(u_xlatb3){discard;}
    u_xlat16_0.xyz = vs_COLOR0.xyz;
    u_xlat0 = u_xlat16_0 * u_xlat1;
    SV_Target0.xyz = u_xlat0.www * u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
    return;
}

#endif


//////////////////////////////////////////////////////
Keywords: UNITY_UI_CLIP_RECT
-- Hardware tier variant: Tier 1
-- Vertex shader for "gles3":
Set 2D Texture "_MainTex" to slot 0

Constant Buffer "$Globals" (32 bytes) {
  Vector4 _TextureSampleAdd at 0
  Vector4 _ClipRect at 16
}
Constant Buffer "$Globals" (264 bytes) {
  Matrix4x4 unity_ObjectToWorld at 16
  Matrix4x4 glstate_matrix_projection at 80
  Matrix4x4 unity_MatrixVP at 144
  Vector4 _ScreenParams at 0
  Vector4 _Color at 208
  Vector4 _ClipRect at 224
  Vector4 _MainTex_ST at 240
  Float _UIMaskSoftnessX at 256
  Float _UIMaskSoftnessY at 260
}

Shader Disassembly:
#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _ClipRect;
uniform 	vec4 _MainTex_ST;
uniform 	float _UIMaskSoftnessX;
uniform 	float _UIMaskSoftnessY;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat1 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.ww / abs(u_xlat0.xy);
    u_xlat0.xy = vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) * vec2(0.25, 0.25) + abs(u_xlat0.xy);
    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    u_xlat0 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat0 = min(u_xlat0, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat0.xy = in_POSITION0.xy * vec2(2.0, 2.0) + (-u_xlat0.xy);
    vs_TEXCOORD2.xy = (-u_xlat0.zw) + u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump float u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump float u_xlat16_4;
void main()
{
    u_xlat0.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat0.xy = u_xlat0.xy + -abs(vs_TEXCOORD2.xy);
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD2.zw;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat16_1 = u_xlat0.y * u_xlat0.x;
    u_xlat16_4 = vs_COLOR0.w * 255.0;
    u_xlat16_4 = roundEven(u_xlat16_4);
    u_xlat16_0.w = u_xlat16_4 * 0.00392156886;
    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2 = u_xlat16_2 + _TextureSampleAdd;
    u_xlat16_0.xyz = vs_COLOR0.xyz;
    u_xlat0 = u_xlat16_0 * u_xlat2;
    u_xlat16_1 = u_xlat16_1 * u_xlat0.w;
    SV_Target0.xyz = u_xlat0.xyz * vec3(u_xlat16_1);
    SV_Target0.w = u_xlat16_1;
    return;
}

#endif


//////////////////////////////////////////////////////
Keywords: UNITY_UI_CLIP_RECT
-- Hardware tier variant: Tier 2
-- Vertex shader for "gles3":
Set 2D Texture "_MainTex" to slot 0

Constant Buffer "$Globals" (32 bytes) {
  Vector4 _TextureSampleAdd at 0
  Vector4 _ClipRect at 16
}
Constant Buffer "$Globals" (264 bytes) {
  Matrix4x4 unity_ObjectToWorld at 16
  Matrix4x4 glstate_matrix_projection at 80
  Matrix4x4 unity_MatrixVP at 144
  Vector4 _ScreenParams at 0
  Vector4 _Color at 208
  Vector4 _ClipRect at 224
  Vector4 _MainTex_ST at 240
  Float _UIMaskSoftnessX at 256
  Float _UIMaskSoftnessY at 260
}

Shader Disassembly:
#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _ClipRect;
uniform 	vec4 _MainTex_ST;
uniform 	float _UIMaskSoftnessX;
uniform 	float _UIMaskSoftnessY;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat1 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.ww / abs(u_xlat0.xy);
    u_xlat0.xy = vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) * vec2(0.25, 0.25) + abs(u_xlat0.xy);
    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    u_xlat0 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat0 = min(u_xlat0, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat0.xy = in_POSITION0.xy * vec2(2.0, 2.0) + (-u_xlat0.xy);
    vs_TEXCOORD2.xy = (-u_xlat0.zw) + u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump float u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump float u_xlat16_4;
void main()
{
    u_xlat0.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat0.xy = u_xlat0.xy + -abs(vs_TEXCOORD2.xy);
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD2.zw;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat16_1 = u_xlat0.y * u_xlat0.x;
    u_xlat16_4 = vs_COLOR0.w * 255.0;
    u_xlat16_4 = roundEven(u_xlat16_4);
    u_xlat16_0.w = u_xlat16_4 * 0.00392156886;
    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2 = u_xlat16_2 + _TextureSampleAdd;
    u_xlat16_0.xyz = vs_COLOR0.xyz;
    u_xlat0 = u_xlat16_0 * u_xlat2;
    u_xlat16_1 = u_xlat16_1 * u_xlat0.w;
    SV_Target0.xyz = u_xlat0.xyz * vec3(u_xlat16_1);
    SV_Target0.w = u_xlat16_1;
    return;
}

#endif


//////////////////////////////////////////////////////
Keywords: UNITY_UI_CLIP_RECT
-- Hardware tier variant: Tier 3
-- Vertex shader for "gles3":
Set 2D Texture "_MainTex" to slot 0

Constant Buffer "$Globals" (32 bytes) {
  Vector4 _TextureSampleAdd at 0
  Vector4 _ClipRect at 16
}
Constant Buffer "$Globals" (264 bytes) {
  Matrix4x4 unity_ObjectToWorld at 16
  Matrix4x4 glstate_matrix_projection at 80
  Matrix4x4 unity_MatrixVP at 144
  Vector4 _ScreenParams at 0
  Vector4 _Color at 208
  Vector4 _ClipRect at 224
  Vector4 _MainTex_ST at 240
  Float _UIMaskSoftnessX at 256
  Float _UIMaskSoftnessY at 260
}

Shader Disassembly:
#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _ClipRect;
uniform 	vec4 _MainTex_ST;
uniform 	float _UIMaskSoftnessX;
uniform 	float _UIMaskSoftnessY;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat1 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.ww / abs(u_xlat0.xy);
    u_xlat0.xy = vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) * vec2(0.25, 0.25) + abs(u_xlat0.xy);
    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    u_xlat0 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat0 = min(u_xlat0, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat0.xy = in_POSITION0.xy * vec2(2.0, 2.0) + (-u_xlat0.xy);
    vs_TEXCOORD2.xy = (-u_xlat0.zw) + u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump float u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump float u_xlat16_4;
void main()
{
    u_xlat0.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat0.xy = u_xlat0.xy + -abs(vs_TEXCOORD2.xy);
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD2.zw;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat16_1 = u_xlat0.y * u_xlat0.x;
    u_xlat16_4 = vs_COLOR0.w * 255.0;
    u_xlat16_4 = roundEven(u_xlat16_4);
    u_xlat16_0.w = u_xlat16_4 * 0.00392156886;
    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2 = u_xlat16_2 + _TextureSampleAdd;
    u_xlat16_0.xyz = vs_COLOR0.xyz;
    u_xlat0 = u_xlat16_0 * u_xlat2;
    u_xlat16_1 = u_xlat16_1 * u_xlat0.w;
    SV_Target0.xyz = u_xlat0.xyz * vec3(u_xlat16_1);
    SV_Target0.w = u_xlat16_1;
    return;
}

#endif


//////////////////////////////////////////////////////
Keywords: UNITY_UI_ALPHACLIP UNITY_UI_CLIP_RECT
-- Hardware tier variant: Tier 1
-- Vertex shader for "gles3":
Set 2D Texture "_MainTex" to slot 0

Constant Buffer "$Globals" (32 bytes) {
  Vector4 _TextureSampleAdd at 0
  Vector4 _ClipRect at 16
}
Constant Buffer "$Globals" (264 bytes) {
  Matrix4x4 unity_ObjectToWorld at 16
  Matrix4x4 glstate_matrix_projection at 80
  Matrix4x4 unity_MatrixVP at 144
  Vector4 _ScreenParams at 0
  Vector4 _Color at 208
  Vector4 _ClipRect at 224
  Vector4 _MainTex_ST at 240
  Float _UIMaskSoftnessX at 256
  Float _UIMaskSoftnessY at 260
}

Shader Disassembly:
#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _ClipRect;
uniform 	vec4 _MainTex_ST;
uniform 	float _UIMaskSoftnessX;
uniform 	float _UIMaskSoftnessY;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat1 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.ww / abs(u_xlat0.xy);
    u_xlat0.xy = vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) * vec2(0.25, 0.25) + abs(u_xlat0.xy);
    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    u_xlat0 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat0 = min(u_xlat0, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat0.xy = in_POSITION0.xy * vec2(2.0, 2.0) + (-u_xlat0.xy);
    vs_TEXCOORD2.xy = (-u_xlat0.zw) + u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
mediump float u_xlat16_2;
mediump float u_xlat16_5;
void main()
{
    u_xlat16_0.x = vs_COLOR0.w * 255.0;
    u_xlat16_0.x = roundEven(u_xlat16_0.x);
    u_xlat16_0.w = u_xlat16_0.x * 0.00392156886;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat16_1 + _TextureSampleAdd;
    u_xlat16_0.xyz = vs_COLOR0.xyz;
    u_xlat0 = u_xlat16_0 * u_xlat1;
    u_xlat1.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat1.xy = u_xlat1.xy + -abs(vs_TEXCOORD2.xy);
    u_xlat1.xy = u_xlat1.xy * vs_TEXCOORD2.zw;
    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
    u_xlat16_2 = u_xlat1.y * u_xlat1.x;
    u_xlat16_5 = u_xlat0.w * u_xlat16_2 + -0.00100000005;
    u_xlat16_2 = u_xlat0.w * u_xlat16_2;
    SV_Target0.xyz = u_xlat0.xyz * vec3(u_xlat16_2);
    SV_Target0.w = u_xlat16_2;
    u_xlatb1 = u_xlat16_5<0.0;
    if(u_xlatb1){discard;}
    return;
}

#endif


//////////////////////////////////////////////////////
Keywords: UNITY_UI_ALPHACLIP UNITY_UI_CLIP_RECT
-- Hardware tier variant: Tier 2
-- Vertex shader for "gles3":
Set 2D Texture "_MainTex" to slot 0

Constant Buffer "$Globals" (32 bytes) {
  Vector4 _TextureSampleAdd at 0
  Vector4 _ClipRect at 16
}
Constant Buffer "$Globals" (264 bytes) {
  Matrix4x4 unity_ObjectToWorld at 16
  Matrix4x4 glstate_matrix_projection at 80
  Matrix4x4 unity_MatrixVP at 144
  Vector4 _ScreenParams at 0
  Vector4 _Color at 208
  Vector4 _ClipRect at 224
  Vector4 _MainTex_ST at 240
  Float _UIMaskSoftnessX at 256
  Float _UIMaskSoftnessY at 260
}

Shader Disassembly:
#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _ClipRect;
uniform 	vec4 _MainTex_ST;
uniform 	float _UIMaskSoftnessX;
uniform 	float _UIMaskSoftnessY;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat1 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.ww / abs(u_xlat0.xy);
    u_xlat0.xy = vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) * vec2(0.25, 0.25) + abs(u_xlat0.xy);
    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    u_xlat0 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat0 = min(u_xlat0, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat0.xy = in_POSITION0.xy * vec2(2.0, 2.0) + (-u_xlat0.xy);
    vs_TEXCOORD2.xy = (-u_xlat0.zw) + u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
mediump float u_xlat16_2;
mediump float u_xlat16_5;
void main()
{
    u_xlat16_0.x = vs_COLOR0.w * 255.0;
    u_xlat16_0.x = roundEven(u_xlat16_0.x);
    u_xlat16_0.w = u_xlat16_0.x * 0.00392156886;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat16_1 + _TextureSampleAdd;
    u_xlat16_0.xyz = vs_COLOR0.xyz;
    u_xlat0 = u_xlat16_0 * u_xlat1;
    u_xlat1.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat1.xy = u_xlat1.xy + -abs(vs_TEXCOORD2.xy);
    u_xlat1.xy = u_xlat1.xy * vs_TEXCOORD2.zw;
    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
    u_xlat16_2 = u_xlat1.y * u_xlat1.x;
    u_xlat16_5 = u_xlat0.w * u_xlat16_2 + -0.00100000005;
    u_xlat16_2 = u_xlat0.w * u_xlat16_2;
    SV_Target0.xyz = u_xlat0.xyz * vec3(u_xlat16_2);
    SV_Target0.w = u_xlat16_2;
    u_xlatb1 = u_xlat16_5<0.0;
    if(u_xlatb1){discard;}
    return;
}

#endif


//////////////////////////////////////////////////////
Keywords: UNITY_UI_ALPHACLIP UNITY_UI_CLIP_RECT
-- Hardware tier variant: Tier 3
-- Vertex shader for "gles3":
Set 2D Texture "_MainTex" to slot 0

Constant Buffer "$Globals" (32 bytes) {
  Vector4 _TextureSampleAdd at 0
  Vector4 _ClipRect at 16
}
Constant Buffer "$Globals" (264 bytes) {
  Matrix4x4 unity_ObjectToWorld at 16
  Matrix4x4 glstate_matrix_projection at 80
  Matrix4x4 unity_MatrixVP at 144
  Vector4 _ScreenParams at 0
  Vector4 _Color at 208
  Vector4 _ClipRect at 224
  Vector4 _MainTex_ST at 240
  Float _UIMaskSoftnessX at 256
  Float _UIMaskSoftnessY at 260
}

Shader Disassembly:
#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _ClipRect;
uniform 	vec4 _MainTex_ST;
uniform 	float _UIMaskSoftnessX;
uniform 	float _UIMaskSoftnessY;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat1 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.ww / abs(u_xlat0.xy);
    u_xlat0.xy = vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) * vec2(0.25, 0.25) + abs(u_xlat0.xy);
    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    u_xlat0 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat0 = min(u_xlat0, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat0.xy = in_POSITION0.xy * vec2(2.0, 2.0) + (-u_xlat0.xy);
    vs_TEXCOORD2.xy = (-u_xlat0.zw) + u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
mediump float u_xlat16_2;
mediump float u_xlat16_5;
void main()
{
    u_xlat16_0.x = vs_COLOR0.w * 255.0;
    u_xlat16_0.x = roundEven(u_xlat16_0.x);
    u_xlat16_0.w = u_xlat16_0.x * 0.00392156886;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat16_1 + _TextureSampleAdd;
    u_xlat16_0.xyz = vs_COLOR0.xyz;
    u_xlat0 = u_xlat16_0 * u_xlat1;
    u_xlat1.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat1.xy = u_xlat1.xy + -abs(vs_TEXCOORD2.xy);
    u_xlat1.xy = u_xlat1.xy * vs_TEXCOORD2.zw;
    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
    u_xlat16_2 = u_xlat1.y * u_xlat1.x;
    u_xlat16_5 = u_xlat0.w * u_xlat16_2 + -0.00100000005;
    u_xlat16_2 = u_xlat0.w * u_xlat16_2;
    SV_Target0.xyz = u_xlat0.xyz * vec3(u_xlat16_2);
    SV_Target0.w = u_xlat16_2;
    u_xlatb1 = u_xlat16_5<0.0;
    if(u_xlatb1){discard;}
    return;
}

#endif


//////////////////////////////////////////////////////
Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "vulkan":
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord0"

Set 2D Texture "_MainTex" to set: 0, binding: 1, used in: Fragment  using sampler in set: 0, binding: 0, used in: Fragment 

Constant Buffer "PGlobals1920914817" (16 bytes) on set: 1, binding: 0, used in: Fragment  {
  Vector4 _TextureSampleAdd at 0
}
Constant Buffer "VGlobals1920914817" (264 bytes) on set: 1, binding: 1, used in: Vertex  {
  Matrix4x4 glstate_matrix_projection at 80
  Matrix4x4 unity_MatrixVP at 144
  Matrix4x4 unity_ObjectToWorld at 16
  Vector4 _ClipRect at 224
  Vector4 _Color at 208
  Vector4 _MainTex_ST at 240
  Vector4 _ScreenParams at 0
  Float _UIMaskSoftnessX at 256
  Float _UIMaskSoftnessY at 260
}

Shader Disassembly:
Disassembly for Vertex:
// Module Version 10000
// Generated by (magic number): 80006
// Id's are bound by 208

                              Capability Shader
               1:             ExtInstImport  "GLSL.std.450"
                              MemoryModel Logical GLSL450
                              EntryPoint Vertex 4  "main" 11 80 84 90 94 96 107 155
                              Name 94  "vs_TEXCOORD0"
                              Name 107  "vs_TEXCOORD1"
                              Name 155  "vs_TEXCOORD2"
                              Decorate 11 Location 0
                              Decorate 16 ArrayStride 16
                              Decorate 17 ArrayStride 16
                              Decorate 18 ArrayStride 16
                              MemberDecorate 19 0 Offset 0
                              MemberDecorate 19 1 Offset 16
                              MemberDecorate 19 2 Offset 80
                              MemberDecorate 19 3 Offset 144
                              MemberDecorate 19 4 RelaxedPrecision
                              MemberDecorate 19 4 Offset 208
                              MemberDecorate 19 5 Offset 224
                              MemberDecorate 19 6 Offset 240
                              MemberDecorate 19 7 Offset 256
                              MemberDecorate 19 8 Offset 260
                              Decorate 19 Block
                              Decorate 21 DescriptorSet 1
                              Decorate 21 Binding 1
                              MemberDecorate 78 0 BuiltIn Position
                              MemberDecorate 78 1 BuiltIn PointSize
                              MemberDecorate 78 2 BuiltIn ClipDistance
                              Decorate 78 Block
                              Decorate 84 Location 1
                              Decorate 88 RelaxedPrecision
                              Decorate 90 RelaxedPrecision
                              Decorate 90 Location 0
                              Decorate 94(vs_TEXCOORD0) Location 1
                              Decorate 96 Location 2
                              Decorate 107(vs_TEXCOORD1) Location 2
                              Decorate 155(vs_TEXCOORD2) Location 3
               2:             TypeVoid
               3:             TypeFunction 2
               6:             TypeFloat 32
               7:             TypeVector 6(float) 4
               8:             TypePointer Private 7(fvec4)
               9:      8(ptr) Variable Private
              10:             TypePointer Input 7(fvec4)
              11:     10(ptr) Variable Input
              14:             TypeInt 32 0
              15:     14(int) Constant 4
              16:             TypeArray 7(fvec4) 15
              17:             TypeArray 7(fvec4) 15
              18:             TypeArray 7(fvec4) 15
              19:             TypeStruct 7(fvec4) 16 17 18 7(fvec4) 7(fvec4) 7(fvec4) 6(float) 6(float)
              20:             TypePointer Uniform 19(struct)
              21:     20(ptr) Variable Uniform
              22:             TypeInt 32 1
              23:     22(int) Constant 1
              24:             TypePointer Uniform 7(fvec4)
              28:     22(int) Constant 0
              36:     22(int) Constant 2
              45:     22(int) Constant 3
              49:      8(ptr) Variable Private
              76:     14(int) Constant 1
              77:             TypeArray 6(float) 76
              78:             TypeStruct 7(fvec4) 6(float) 77
              79:             TypePointer Output 78(struct)
              80:     79(ptr) Variable Output
              82:             TypePointer Output 7(fvec4)
              84:     10(ptr) Variable Input
              86:     22(int) Constant 4
              90:     82(ptr) Variable Output
              92:             TypeVector 6(float) 2
              93:             TypePointer Output 92(fvec2)
94(vs_TEXCOORD0):     93(ptr) Variable Output
              95:             TypePointer Input 92(fvec2)
              96:     95(ptr) Variable Input
              98:     22(int) Constant 6
107(vs_TEXCOORD1):     82(ptr) Variable Output
             138:     22(int) Constant 7
             139:             TypePointer Uniform 6(float)
             142:     22(int) Constant 8
             146:    6(float) Constant 1048576000
             147:   92(fvec2) ConstantComposite 146 146
155(vs_TEXCOORD2):     82(ptr) Variable Output
             161:     22(int) Constant 5
             164:    6(float) Constant 3499426553
             165:    7(fvec4) ConstantComposite 164 164 164 164
             168:    6(float) Constant 1351942905
             169:    7(fvec4) ConstantComposite 168 168 168 168
             173:    6(float) Constant 1073741824
             174:   92(fvec2) ConstantComposite 173 173
             190:             TypePointer Output 6(float)
             196:             TypePointer Function 7(fvec4)
             198:             TypeVector 22(int) 4
             199:             TypePointer Function 198(ivec4)
             201:             TypeBool
             202:             TypeVector 201(bool) 4
             203:             TypePointer Function 202(bvec4)
             205:             TypeVector 14(int) 4
             206:             TypePointer Function 205(ivec4)
               4:           2 Function None 3
               5:             Label
             197:    196(ptr) Variable Function
             200:    199(ptr) Variable Function
             204:    203(ptr) Variable Function
             207:    206(ptr) Variable Function
              12:    7(fvec4) Load 11
              13:    7(fvec4) VectorShuffle 12 12 1 1 1 1
              25:     24(ptr) AccessChain 21 23 23
              26:    7(fvec4) Load 25
              27:    7(fvec4) FMul 13 26
                              Store 9 27
              29:     24(ptr) AccessChain 21 23 28
              30:    7(fvec4) Load 29
              31:    7(fvec4) Load 11
              32:    7(fvec4) VectorShuffle 31 31 0 0 0 0
              33:    7(fvec4) FMul 30 32
              34:    7(fvec4) Load 9
              35:    7(fvec4) FAdd 33 34
                              Store 9 35
              37:     24(ptr) AccessChain 21 23 36
              38:    7(fvec4) Load 37
              39:    7(fvec4) Load 11
              40:    7(fvec4) VectorShuffle 39 39 2 2 2 2
              41:    7(fvec4) FMul 38 40
              42:    7(fvec4) Load 9
              43:    7(fvec4) FAdd 41 42
                              Store 9 43
              44:    7(fvec4) Load 9
              46:     24(ptr) AccessChain 21 23 45
              47:    7(fvec4) Load 46
              48:    7(fvec4) FAdd 44 47
                              Store 9 48
              50:    7(fvec4) Load 9
              51:    7(fvec4) VectorShuffle 50 50 1 1 1 1
              52:     24(ptr) AccessChain 21 45 23
              53:    7(fvec4) Load 52
              54:    7(fvec4) FMul 51 53
                              Store 49 54
              55:     24(ptr) AccessChain 21 45 28
              56:    7(fvec4) Load 55
              57:    7(fvec4) Load 9
              58:    7(fvec4) VectorShuffle 57 57 0 0 0 0
              59:    7(fvec4) FMul 56 58
              60:    7(fvec4) Load 49
              61:    7(fvec4) FAdd 59 60
                              Store 49 61
              62:     24(ptr) AccessChain 21 45 36
              63:    7(fvec4) Load 62
              64:    7(fvec4) Load 9
              65:    7(fvec4) VectorShuffle 64 64 2 2 2 2
              66:    7(fvec4) FMul 63 65
              67:    7(fvec4) Load 49
              68:    7(fvec4) FAdd 66 67
                              Store 49 68
              69:     24(ptr) AccessChain 21 45 45
              70:    7(fvec4) Load 69
              71:    7(fvec4) Load 9
              72:    7(fvec4) VectorShuffle 71 71 3 3 3 3
              73:    7(fvec4) FMul 70 72
              74:    7(fvec4) Load 49
              75:    7(fvec4) FAdd 73 74
                              Store 9 75
              81:    7(fvec4) Load 9
              83:     82(ptr) AccessChain 80 28
                              Store 83 81
              85:    7(fvec4) Load 84
              87:     24(ptr) AccessChain 21 86
              88:    7(fvec4) Load 87
              89:    7(fvec4) FMul 85 88
                              Store 49 89
              91:    7(fvec4) Load 49
                              Store 90 91
              97:   92(fvec2) Load 96
              99:     24(ptr) AccessChain 21 98
             100:    7(fvec4) Load 99
             101:   92(fvec2) VectorShuffle 100 100 0 1
             102:   92(fvec2) FMul 97 101
             103:     24(ptr) AccessChain 21 98
             104:    7(fvec4) Load 103
             105:   92(fvec2) VectorShuffle 104 104 2 3
             106:   92(fvec2) FAdd 102 105
                              Store 94(vs_TEXCOORD0) 106
             108:    7(fvec4) Load 11
                              Store 107(vs_TEXCOORD1) 108
             109:     24(ptr) AccessChain 21 28
             110:    7(fvec4) Load 109
             111:   92(fvec2) VectorShuffle 110 110 1 1
             112:     24(ptr) AccessChain 21 36 23
             113:    7(fvec4) Load 112
             114:   92(fvec2) VectorShuffle 113 113 0 1
             115:   92(fvec2) FMul 111 114
             116:    7(fvec4) Load 9
             117:    7(fvec4) VectorShuffle 116 115 4 5 2 3
                              Store 9 117
             118:     24(ptr) AccessChain 21 36 28
             119:    7(fvec4) Load 118
             120:   92(fvec2) VectorShuffle 119 119 0 1
             121:     24(ptr) AccessChain 21 28
             122:    7(fvec4) Load 121
             123:   92(fvec2) VectorShuffle 122 122 0 0
             124:   92(fvec2) FMul 120 123
             125:    7(fvec4) Load 9
             126:   92(fvec2) VectorShuffle 125 125 0 1
             127:   92(fvec2) FAdd 124 126
             128:    7(fvec4) Load 9
             129:    7(fvec4) VectorShuffle 128 127 4 5 2 3
                              Store 9 129
             130:    7(fvec4) Load 9
             131:   92(fvec2) VectorShuffle 130 130 3 3
             132:    7(fvec4) Load 9
             133:   92(fvec2) VectorShuffle 132 132 0 1
             134:   92(fvec2) ExtInst 1(GLSL.std.450) 4(FAbs) 133
             135:   92(fvec2) FDiv 131 134
             136:    7(fvec4) Load 9
             137:    7(fvec4) VectorShuffle 136 135 4 5 2 3
                              Store 9 137
             140:    139(ptr) AccessChain 21 138
             141:    6(float) Load 140
             143:    139(ptr) AccessChain 21 142
             144:    6(float) Load 143
             145:   92(fvec2) CompositeConstruct 141 144
             148:   92(fvec2) FMul 145 147
             149:    7(fvec4) Load 9
             150:   92(fvec2) VectorShuffle 149 149 0 1
             151:   92(fvec2) ExtInst 1(GLSL.std.450) 4(FAbs) 150
             152:   92(fvec2) FAdd 148 151
             153:    7(fvec4) Load 9
             154:    7(fvec4) VectorShuffle 153 152 4 5 2 3
                              Store 9 154
             156:    7(fvec4) Load 9
             157:   92(fvec2) VectorShuffle 156 156 0 1
             158:   92(fvec2) FDiv 147 157
             159:    7(fvec4) Load 155(vs_TEXCOORD2)
             160:    7(fvec4) VectorShuffle 159 158 0 1 4 5
                              Store 155(vs_TEXCOORD2) 160
             162:     24(ptr) AccessChain 21 161
             163:    7(fvec4) Load 162
             166:    7(fvec4) ExtInst 1(GLSL.std.450) 40(FMax) 163 165
                              Store 9 166
             167:    7(fvec4) Load 9
             170:    7(fvec4) ExtInst 1(GLSL.std.450) 37(FMin) 167 169
                              Store 9 170
             171:    7(fvec4) Load 11
             172:   92(fvec2) VectorShuffle 171 171 0 1
             175:   92(fvec2) FMul 172 174
             176:    7(fvec4) Load 9
             177:   92(fvec2) VectorShuffle 176 176 0 1
             178:   92(fvec2) FNegate 177
             179:   92(fvec2) FAdd 175 178
             180:    7(fvec4) Load 9
             181:    7(fvec4) VectorShuffle 180 179 4 5 2 3
                              Store 9 181
             182:    7(fvec4) Load 9
             183:   92(fvec2) VectorShuffle 182 182 2 3
             184:   92(fvec2) FNegate 183
             185:    7(fvec4) Load 9
             186:   92(fvec2) VectorShuffle 185 185 0 1
             187:   92(fvec2) FAdd 184 186
             188:    7(fvec4) Load 155(vs_TEXCOORD2)
             189:    7(fvec4) VectorShuffle 188 187 4 5 2 3
                              Store 155(vs_TEXCOORD2) 189
             191:    190(ptr) AccessChain 80 28 76
             192:    6(float) Load 191
             193:    6(float) FNegate 192
             194:    190(ptr) AccessChain 80 28 76
                              Store 194 193
                              Return
                              FunctionEnd

Disassembly for Fragment:
// Module Version 10000
// Generated by (magic number): 80006
// Id's are bound by 93

                              Capability Shader
               1:             ExtInstImport  "GLSL.std.450"
                              MemoryModel Logical GLSL450
                              EntryPoint Fragment 4  "main" 11 44 68
                              ExecutionMode 4 OriginUpperLeft
                              Name 44  "vs_TEXCOORD0"
                              Decorate 9 RelaxedPrecision
                              Decorate 11 RelaxedPrecision
                              Decorate 11 Location 0
                              Decorate 16 RelaxedPrecision
                              Decorate 18 RelaxedPrecision
                              Decorate 23 RelaxedPrecision
                              Decorate 24 RelaxedPrecision
                              Decorate 27 RelaxedPrecision
                              Decorate 29 RelaxedPrecision
                              Decorate 31 RelaxedPrecision
                              Decorate 34 RelaxedPrecision
                              Decorate 34 DescriptorSet 0
                              Decorate 34 Binding 1
                              Decorate 35 RelaxedPrecision
                              Decorate 38 RelaxedPrecision
                              Decorate 38 DescriptorSet 0
                              Decorate 38 Binding 0
                              Decorate 39 RelaxedPrecision
                              Decorate 44(vs_TEXCOORD0) Location 1
                              Decorate 48 RelaxedPrecision
                              MemberDecorate 49 0 RelaxedPrecision
                              MemberDecorate 49 0 Offset 0
                              Decorate 49 Block
                              Decorate 51 DescriptorSet 1
                              Decorate 51 Binding 0
                              Decorate 56 RelaxedPrecision
                              Decorate 57 RelaxedPrecision
                              Decorate 59 RelaxedPrecision
                              Decorate 60 RelaxedPrecision
                              Decorate 64 RelaxedPrecision
                              Decorate 68 RelaxedPrecision
                              Decorate 68 Location 0
               2:             TypeVoid
               3:             TypeFunction 2
               6:             TypeFloat 32
               7:             TypeVector 6(float) 4
               8:             TypePointer Private 7(fvec4)
               9:      8(ptr) Variable Private
              10:             TypePointer Input 7(fvec4)
              11:     10(ptr) Variable Input
              12:             TypeInt 32 0
              13:     12(int) Constant 3
              14:             TypePointer Input 6(float)
              17:    6(float) Constant 1132396544
              19:     12(int) Constant 0
              20:             TypePointer Private 6(float)
              28:    6(float) Constant 998277249
              31:      8(ptr) Variable Private
              32:             TypeImage 6(float) 2D sampled format:Unknown
              33:             TypePointer UniformConstant 32
              34:     33(ptr) Variable UniformConstant
              36:             TypeSampler
              37:             TypePointer UniformConstant 36
              38:     37(ptr) Variable UniformConstant
              40:             TypeSampledImage 32
              42:             TypeVector 6(float) 2
              43:             TypePointer Input 42(fvec2)
44(vs_TEXCOORD0):     43(ptr) Variable Input
              47:      8(ptr) Variable Private
              49:             TypeStruct 7(fvec4)
              50:             TypePointer Uniform 49(struct)
              51:     50(ptr) Variable Uniform
              52:             TypeInt 32 1
              53:     52(int) Constant 0
              54:             TypePointer Uniform 7(fvec4)
              58:             TypeVector 6(float) 3
              63:      8(ptr) Variable Private
              67:             TypePointer Output 7(fvec4)
              68:     67(ptr) Variable Output
              78:             TypePointer Output 6(float)
              81:             TypePointer Function 7(fvec4)
              83:             TypeVector 52(int) 4
              84:             TypePointer Function 83(ivec4)
              86:             TypeBool
              87:             TypeVector 86(bool) 4
              88:             TypePointer Function 87(bvec4)
              90:             TypeVector 12(int) 4
              91:             TypePointer Function 90(ivec4)
               4:           2 Function None 3
               5:             Label
              82:     81(ptr) Variable Function
              85:     84(ptr) Variable Function
              89:     88(ptr) Variable Function
              92:     91(ptr) Variable Function
              15:     14(ptr) AccessChain 11 13
              16:    6(float) Load 15
              18:    6(float) FMul 16 17
              21:     20(ptr) AccessChain 9 19
                              Store 21 18
              22:     20(ptr) AccessChain 9 19
              23:    6(float) Load 22
              24:    6(float) ExtInst 1(GLSL.std.450) 2(RoundEven) 23
              25:     20(ptr) AccessChain 9 19
                              Store 25 24
              26:     20(ptr) AccessChain 9 19
              27:    6(float) Load 26
              29:    6(float) FMul 27 28
              30:     20(ptr) AccessChain 9 13
                              Store 30 29
              35:          32 Load 34
              39:          36 Load 38
              41:          40 SampledImage 35 39
              45:   42(fvec2) Load 44(vs_TEXCOORD0)
              46:    7(fvec4) ImageSampleImplicitLod 41 45
                              Store 31 46
              48:    7(fvec4) Load 31
              55:     54(ptr) AccessChain 51 53
              56:    7(fvec4) Load 55
              57:    7(fvec4) FAdd 48 56
                              Store 47 57
              59:    7(fvec4) Load 11
              60:   58(fvec3) VectorShuffle 59 59 0 1 2
              61:    7(fvec4) Load 9
              62:    7(fvec4) VectorShuffle 61 60 4 5 6 3
                              Store 9 62
              64:    7(fvec4) Load 9
              65:    7(fvec4) Load 47
              66:    7(fvec4) FMul 64 65
                              Store 63 66
              69:    7(fvec4) Load 63
              70:   58(fvec3) VectorShuffle 69 69 3 3 3
              71:    7(fvec4) Load 63
              72:   58(fvec3) VectorShuffle 71 71 0 1 2
              73:   58(fvec3) FMul 70 72
              74:    7(fvec4) Load 68
              75:    7(fvec4) VectorShuffle 74 73 4 5 6 3
                              Store 68 75
              76:     20(ptr) AccessChain 63 13
              77:    6(float) Load 76
              79:     78(ptr) AccessChain 68 13
                              Store 79 77
                              Return
                              FunctionEnd

Disassembly for Hull:
Not present.



//////////////////////////////////////////////////////
Keywords: <none>
-- Hardware tier variant: Tier 2
-- Vertex shader for "vulkan":
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord0"

Set 2D Texture "_MainTex" to set: 0, binding: 1, used in: Fragment  using sampler in set: 0, binding: 0, used in: Fragment 

Constant Buffer "PGlobals1920914817" (16 bytes) on set: 1, binding: 0, used in: Fragment  {
  Vector4 _TextureSampleAdd at 0
}
Constant Buffer "VGlobals1920914817" (264 bytes) on set: 1, binding: 1, used in: Vertex  {
  Matrix4x4 glstate_matrix_projection at 80
  Matrix4x4 unity_MatrixVP at 144
  Matrix4x4 unity_ObjectToWorld at 16
  Vector4 _ClipRect at 224
  Vector4 _Color at 208
  Vector4 _MainTex_ST at 240
  Vector4 _ScreenParams at 0
  Float _UIMaskSoftnessX at 256
  Float _UIMaskSoftnessY at 260
}

Shader Disassembly:
Disassembly for Vertex:
// Module Version 10000
// Generated by (magic number): 80006
// Id's are bound by 208

                              Capability Shader
               1:             ExtInstImport  "GLSL.std.450"
                              MemoryModel Logical GLSL450
                              EntryPoint Vertex 4  "main" 11 80 84 90 94 96 107 155
                              Name 94  "vs_TEXCOORD0"
                              Name 107  "vs_TEXCOORD1"
                              Name 155  "vs_TEXCOORD2"
                              Decorate 11 Location 0
                              Decorate 16 ArrayStride 16
                              Decorate 17 ArrayStride 16
                              Decorate 18 ArrayStride 16
                              MemberDecorate 19 0 Offset 0
                              MemberDecorate 19 1 Offset 16
                              MemberDecorate 19 2 Offset 80
                              MemberDecorate 19 3 Offset 144
                              MemberDecorate 19 4 RelaxedPrecision
                              MemberDecorate 19 4 Offset 208
                              MemberDecorate 19 5 Offset 224
                              MemberDecorate 19 6 Offset 240
                              MemberDecorate 19 7 Offset 256
                              MemberDecorate 19 8 Offset 260
                              Decorate 19 Block
                              Decorate 21 DescriptorSet 1
                              Decorate 21 Binding 1
                              MemberDecorate 78 0 BuiltIn Position
                              MemberDecorate 78 1 BuiltIn PointSize
                              MemberDecorate 78 2 BuiltIn ClipDistance
                              Decorate 78 Block
                              Decorate 84 Location 1
                              Decorate 88 RelaxedPrecision
                              Decorate 90 RelaxedPrecision
                              Decorate 90 Location 0
                              Decorate 94(vs_TEXCOORD0) Location 1
                              Decorate 96 Location 2
                              Decorate 107(vs_TEXCOORD1) Location 2
                              Decorate 155(vs_TEXCOORD2) Location 3
               2:             TypeVoid
               3:             TypeFunction 2
               6:             TypeFloat 32
               7:             TypeVector 6(float) 4
               8:             TypePointer Private 7(fvec4)
               9:      8(ptr) Variable Private
              10:             TypePointer Input 7(fvec4)
              11:     10(ptr) Variable Input
              14:             TypeInt 32 0
              15:     14(int) Constant 4
              16:             TypeArray 7(fvec4) 15
              17:             TypeArray 7(fvec4) 15
              18:             TypeArray 7(fvec4) 15
              19:             TypeStruct 7(fvec4) 16 17 18 7(fvec4) 7(fvec4) 7(fvec4) 6(float) 6(float)
              20:             TypePointer Uniform 19(struct)
              21:     20(ptr) Variable Uniform
              22:             TypeInt 32 1
              23:     22(int) Constant 1
              24:             TypePointer Uniform 7(fvec4)
              28:     22(int) Constant 0
              36:     22(int) Constant 2
              45:     22(int) Constant 3
              49:      8(ptr) Variable Private
              76:     14(int) Constant 1
              77:             TypeArray 6(float) 76
              78:             TypeStruct 7(fvec4) 6(float) 77
              79:             TypePointer Output 78(struct)
              80:     79(ptr) Variable Output
              82:             TypePointer Output 7(fvec4)
              84:     10(ptr) Variable Input
              86:     22(int) Constant 4
              90:     82(ptr) Variable Output
              92:             TypeVector 6(float) 2
              93:             TypePointer Output 92(fvec2)
94(vs_TEXCOORD0):     93(ptr) Variable Output
              95:             TypePointer Input 92(fvec2)
              96:     95(ptr) Variable Input
              98:     22(int) Constant 6
107(vs_TEXCOORD1):     82(ptr) Variable Output
             138:     22(int) Constant 7
             139:             TypePointer Uniform 6(float)
             142:     22(int) Constant 8
             146:    6(float) Constant 1048576000
             147:   92(fvec2) ConstantComposite 146 146
155(vs_TEXCOORD2):     82(ptr) Variable Output
             161:     22(int) Constant 5
             164:    6(float) Constant 3499426553
             165:    7(fvec4) ConstantComposite 164 164 164 164
             168:    6(float) Constant 1351942905
             169:    7(fvec4) ConstantComposite 168 168 168 168
             173:    6(float) Constant 1073741824
             174:   92(fvec2) ConstantComposite 173 173
             190:             TypePointer Output 6(float)
             196:             TypePointer Function 7(fvec4)
             198:             TypeVector 22(int) 4
             199:             TypePointer Function 198(ivec4)
             201:             TypeBool
             202:             TypeVector 201(bool) 4
             203:             TypePointer Function 202(bvec4)
             205:             TypeVector 14(int) 4
             206:             TypePointer Function 205(ivec4)
               4:           2 Function None 3
               5:             Label
             197:    196(ptr) Variable Function
             200:    199(ptr) Variable Function
             204:    203(ptr) Variable Function
             207:    206(ptr) Variable Function
              12:    7(fvec4) Load 11
              13:    7(fvec4) VectorShuffle 12 12 1 1 1 1
              25:     24(ptr) AccessChain 21 23 23
              26:    7(fvec4) Load 25
              27:    7(fvec4) FMul 13 26
                              Store 9 27
              29:     24(ptr) AccessChain 21 23 28
              30:    7(fvec4) Load 29
              31:    7(fvec4) Load 11
              32:    7(fvec4) VectorShuffle 31 31 0 0 0 0
              33:    7(fvec4) FMul 30 32
              34:    7(fvec4) Load 9
              35:    7(fvec4) FAdd 33 34
                              Store 9 35
              37:     24(ptr) AccessChain 21 23 36
              38:    7(fvec4) Load 37
              39:    7(fvec4) Load 11
              40:    7(fvec4) VectorShuffle 39 39 2 2 2 2
              41:    7(fvec4) FMul 38 40
              42:    7(fvec4) Load 9
              43:    7(fvec4) FAdd 41 42
                              Store 9 43
              44:    7(fvec4) Load 9
              46:     24(ptr) AccessChain 21 23 45
              47:    7(fvec4) Load 46
              48:    7(fvec4) FAdd 44 47
                              Store 9 48
              50:    7(fvec4) Load 9
              51:    7(fvec4) VectorShuffle 50 50 1 1 1 1
              52:     24(ptr) AccessChain 21 45 23
              53:    7(fvec4) Load 52
              54:    7(fvec4) FMul 51 53
                              Store 49 54
              55:     24(ptr) AccessChain 21 45 28
              56:    7(fvec4) Load 55
              57:    7(fvec4) Load 9
              58:    7(fvec4) VectorShuffle 57 57 0 0 0 0
              59:    7(fvec4) FMul 56 58
              60:    7(fvec4) Load 49
              61:    7(fvec4) FAdd 59 60
                              Store 49 61
              62:     24(ptr) AccessChain 21 45 36
              63:    7(fvec4) Load 62
              64:    7(fvec4) Load 9
              65:    7(fvec4) VectorShuffle 64 64 2 2 2 2
              66:    7(fvec4) FMul 63 65
              67:    7(fvec4) Load 49
              68:    7(fvec4) FAdd 66 67
                              Store 49 68
              69:     24(ptr) AccessChain 21 45 45
              70:    7(fvec4) Load 69
              71:    7(fvec4) Load 9
              72:    7(fvec4) VectorShuffle 71 71 3 3 3 3
              73:    7(fvec4) FMul 70 72
              74:    7(fvec4) Load 49
              75:    7(fvec4) FAdd 73 74
                              Store 9 75
              81:    7(fvec4) Load 9
              83:     82(ptr) AccessChain 80 28
                              Store 83 81
              85:    7(fvec4) Load 84
              87:     24(ptr) AccessChain 21 86
              88:    7(fvec4) Load 87
              89:    7(fvec4) FMul 85 88
                              Store 49 89
              91:    7(fvec4) Load 49
                              Store 90 91
              97:   92(fvec2) Load 96
              99:     24(ptr) AccessChain 21 98
             100:    7(fvec4) Load 99
             101:   92(fvec2) VectorShuffle 100 100 0 1
             102:   92(fvec2) FMul 97 101
             103:     24(ptr) AccessChain 21 98
             104:    7(fvec4) Load 103
             105:   92(fvec2) VectorShuffle 104 104 2 3
             106:   92(fvec2) FAdd 102 105
                              Store 94(vs_TEXCOORD0) 106
             108:    7(fvec4) Load 11
                              Store 107(vs_TEXCOORD1) 108
             109:     24(ptr) AccessChain 21 28
             110:    7(fvec4) Load 109
             111:   92(fvec2) VectorShuffle 110 110 1 1
             112:     24(ptr) AccessChain 21 36 23
             113:    7(fvec4) Load 112
             114:   92(fvec2) VectorShuffle 113 113 0 1
             115:   92(fvec2) FMul 111 114
             116:    7(fvec4) Load 9
             117:    7(fvec4) VectorShuffle 116 115 4 5 2 3
                              Store 9 117
             118:     24(ptr) AccessChain 21 36 28
             119:    7(fvec4) Load 118
             120:   92(fvec2) VectorShuffle 119 119 0 1
             121:     24(ptr) AccessChain 21 28
             122:    7(fvec4) Load 121
             123:   92(fvec2) VectorShuffle 122 122 0 0
             124:   92(fvec2) FMul 120 123
             125:    7(fvec4) Load 9
             126:   92(fvec2) VectorShuffle 125 125 0 1
             127:   92(fvec2) FAdd 124 126
             128:    7(fvec4) Load 9
             129:    7(fvec4) VectorShuffle 128 127 4 5 2 3
                              Store 9 129
             130:    7(fvec4) Load 9
             131:   92(fvec2) VectorShuffle 130 130 3 3
             132:    7(fvec4) Load 9
             133:   92(fvec2) VectorShuffle 132 132 0 1
             134:   92(fvec2) ExtInst 1(GLSL.std.450) 4(FAbs) 133
             135:   92(fvec2) FDiv 131 134
             136:    7(fvec4) Load 9
             137:    7(fvec4) VectorShuffle 136 135 4 5 2 3
                              Store 9 137
             140:    139(ptr) AccessChain 21 138
             141:    6(float) Load 140
             143:    139(ptr) AccessChain 21 142
             144:    6(float) Load 143
             145:   92(fvec2) CompositeConstruct 141 144
             148:   92(fvec2) FMul 145 147
             149:    7(fvec4) Load 9
             150:   92(fvec2) VectorShuffle 149 149 0 1
             151:   92(fvec2) ExtInst 1(GLSL.std.450) 4(FAbs) 150
             152:   92(fvec2) FAdd 148 151
             153:    7(fvec4) Load 9
             154:    7(fvec4) VectorShuffle 153 152 4 5 2 3
                              Store 9 154
             156:    7(fvec4) Load 9
             157:   92(fvec2) VectorShuffle 156 156 0 1
             158:   92(fvec2) FDiv 147 157
             159:    7(fvec4) Load 155(vs_TEXCOORD2)
             160:    7(fvec4) VectorShuffle 159 158 0 1 4 5
                              Store 155(vs_TEXCOORD2) 160
             162:     24(ptr) AccessChain 21 161
             163:    7(fvec4) Load 162
             166:    7(fvec4) ExtInst 1(GLSL.std.450) 40(FMax) 163 165
                              Store 9 166
             167:    7(fvec4) Load 9
             170:    7(fvec4) ExtInst 1(GLSL.std.450) 37(FMin) 167 169
                              Store 9 170
             171:    7(fvec4) Load 11
             172:   92(fvec2) VectorShuffle 171 171 0 1
             175:   92(fvec2) FMul 172 174
             176:    7(fvec4) Load 9
             177:   92(fvec2) VectorShuffle 176 176 0 1
             178:   92(fvec2) FNegate 177
             179:   92(fvec2) FAdd 175 178
             180:    7(fvec4) Load 9
             181:    7(fvec4) VectorShuffle 180 179 4 5 2 3
                              Store 9 181
             182:    7(fvec4) Load 9
             183:   92(fvec2) VectorShuffle 182 182 2 3
             184:   92(fvec2) FNegate 183
             185:    7(fvec4) Load 9
             186:   92(fvec2) VectorShuffle 185 185 0 1
             187:   92(fvec2) FAdd 184 186
             188:    7(fvec4) Load 155(vs_TEXCOORD2)
             189:    7(fvec4) VectorShuffle 188 187 4 5 2 3
                              Store 155(vs_TEXCOORD2) 189
             191:    190(ptr) AccessChain 80 28 76
             192:    6(float) Load 191
             193:    6(float) FNegate 192
             194:    190(ptr) AccessChain 80 28 76
                              Store 194 193
                              Return
                              FunctionEnd

Disassembly for Fragment:
// Module Version 10000
// Generated by (magic number): 80006
// Id's are bound by 93

                              Capability Shader
               1:             ExtInstImport  "GLSL.std.450"
                              MemoryModel Logical GLSL450
                              EntryPoint Fragment 4  "main" 11 44 68
                              ExecutionMode 4 OriginUpperLeft
                              Name 44  "vs_TEXCOORD0"
                              Decorate 9 RelaxedPrecision
                              Decorate 11 RelaxedPrecision
                              Decorate 11 Location 0
                              Decorate 16 RelaxedPrecision
                              Decorate 18 RelaxedPrecision
                              Decorate 23 RelaxedPrecision
                              Decorate 24 RelaxedPrecision
                              Decorate 27 RelaxedPrecision
                              Decorate 29 RelaxedPrecision
                              Decorate 31 RelaxedPrecision
                              Decorate 34 RelaxedPrecision
                              Decorate 34 DescriptorSet 0
                              Decorate 34 Binding 1
                              Decorate 35 RelaxedPrecision
                              Decorate 38 RelaxedPrecision
                              Decorate 38 DescriptorSet 0
                              Decorate 38 Binding 0
                              Decorate 39 RelaxedPrecision
                              Decorate 44(vs_TEXCOORD0) Location 1
                              Decorate 48 RelaxedPrecision
                              MemberDecorate 49 0 RelaxedPrecision
                              MemberDecorate 49 0 Offset 0
                              Decorate 49 Block
                              Decorate 51 DescriptorSet 1
                              Decorate 51 Binding 0
                              Decorate 56 RelaxedPrecision
                              Decorate 57 RelaxedPrecision
                              Decorate 59 RelaxedPrecision
                              Decorate 60 RelaxedPrecision
                              Decorate 64 RelaxedPrecision
                              Decorate 68 RelaxedPrecision
                              Decorate 68 Location 0
               2:             TypeVoid
               3:             TypeFunction 2
               6:             TypeFloat 32
               7:             TypeVector 6(float) 4
               8:             TypePointer Private 7(fvec4)
               9:      8(ptr) Variable Private
              10:             TypePointer Input 7(fvec4)
              11:     10(ptr) Variable Input
              12:             TypeInt 32 0
              13:     12(int) Constant 3
              14:             TypePointer Input 6(float)
              17:    6(float) Constant 1132396544
              19:     12(int) Constant 0
              20:             TypePointer Private 6(float)
              28:    6(float) Constant 998277249
              31:      8(ptr) Variable Private
              32:             TypeImage 6(float) 2D sampled format:Unknown
              33:             TypePointer UniformConstant 32
              34:     33(ptr) Variable UniformConstant
              36:             TypeSampler
              37:             TypePointer UniformConstant 36
              38:     37(ptr) Variable UniformConstant
              40:             TypeSampledImage 32
              42:             TypeVector 6(float) 2
              43:             TypePointer Input 42(fvec2)
44(vs_TEXCOORD0):     43(ptr) Variable Input
              47:      8(ptr) Variable Private
              49:             TypeStruct 7(fvec4)
              50:             TypePointer Uniform 49(struct)
              51:     50(ptr) Variable Uniform
              52:             TypeInt 32 1
              53:     52(int) Constant 0
              54:             TypePointer Uniform 7(fvec4)
              58:             TypeVector 6(float) 3
              63:      8(ptr) Variable Private
              67:             TypePointer Output 7(fvec4)
              68:     67(ptr) Variable Output
              78:             TypePointer Output 6(float)
              81:             TypePointer Function 7(fvec4)
              83:             TypeVector 52(int) 4
              84:             TypePointer Function 83(ivec4)
              86:             TypeBool
              87:             TypeVector 86(bool) 4
              88:             TypePointer Function 87(bvec4)
              90:             TypeVector 12(int) 4
              91:             TypePointer Function 90(ivec4)
               4:           2 Function None 3
               5:             Label
              82:     81(ptr) Variable Function
              85:     84(ptr) Variable Function
              89:     88(ptr) Variable Function
              92:     91(ptr) Variable Function
              15:     14(ptr) AccessChain 11 13
              16:    6(float) Load 15
              18:    6(float) FMul 16 17
              21:     20(ptr) AccessChain 9 19
                              Store 21 18
              22:     20(ptr) AccessChain 9 19
              23:    6(float) Load 22
              24:    6(float) ExtInst 1(GLSL.std.450) 2(RoundEven) 23
              25:     20(ptr) AccessChain 9 19
                              Store 25 24
              26:     20(ptr) AccessChain 9 19
              27:    6(float) Load 26
              29:    6(float) FMul 27 28
              30:     20(ptr) AccessChain 9 13
                              Store 30 29
              35:          32 Load 34
              39:          36 Load 38
              41:          40 SampledImage 35 39
              45:   42(fvec2) Load 44(vs_TEXCOORD0)
              46:    7(fvec4) ImageSampleImplicitLod 41 45
                              Store 31 46
              48:    7(fvec4) Load 31
              55:     54(ptr) AccessChain 51 53
              56:    7(fvec4) Load 55
              57:    7(fvec4) FAdd 48 56
                              Store 47 57
              59:    7(fvec4) Load 11
              60:   58(fvec3) VectorShuffle 59 59 0 1 2
              61:    7(fvec4) Load 9
              62:    7(fvec4) VectorShuffle 61 60 4 5 6 3
                              Store 9 62
              64:    7(fvec4) Load 9
              65:    7(fvec4) Load 47
              66:    7(fvec4) FMul 64 65
                              Store 63 66
              69:    7(fvec4) Load 63
              70:   58(fvec3) VectorShuffle 69 69 3 3 3
              71:    7(fvec4) Load 63
              72:   58(fvec3) VectorShuffle 71 71 0 1 2
              73:   58(fvec3) FMul 70 72
              74:    7(fvec4) Load 68
              75:    7(fvec4) VectorShuffle 74 73 4 5 6 3
                              Store 68 75
              76:     20(ptr) AccessChain 63 13
              77:    6(float) Load 76
              79:     78(ptr) AccessChain 68 13
                              Store 79 77
                              Return
                              FunctionEnd

Disassembly for Hull:
Not present.



//////////////////////////////////////////////////////
Keywords: <none>
-- Hardware tier variant: Tier 3
-- Vertex shader for "vulkan":
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord0"

Set 2D Texture "_MainTex" to set: 0, binding: 1, used in: Fragment  using sampler in set: 0, binding: 0, used in: Fragment 

Constant Buffer "PGlobals1920914817" (16 bytes) on set: 1, binding: 0, used in: Fragment  {
  Vector4 _TextureSampleAdd at 0
}
Constant Buffer "VGlobals1920914817" (264 bytes) on set: 1, binding: 1, used in: Vertex  {
  Matrix4x4 glstate_matrix_projection at 80
  Matrix4x4 unity_MatrixVP at 144
  Matrix4x4 unity_ObjectToWorld at 16
  Vector4 _ClipRect at 224
  Vector4 _Color at 208
  Vector4 _MainTex_ST at 240
  Vector4 _ScreenParams at 0
  Float _UIMaskSoftnessX at 256
  Float _UIMaskSoftnessY at 260
}

Shader Disassembly:
Disassembly for Vertex:
// Module Version 10000
// Generated by (magic number): 80006
// Id's are bound by 208

                              Capability Shader
               1:             ExtInstImport  "GLSL.std.450"
                              MemoryModel Logical GLSL450
                              EntryPoint Vertex 4  "main" 11 80 84 90 94 96 107 155
                              Name 94  "vs_TEXCOORD0"
                              Name 107  "vs_TEXCOORD1"
                              Name 155  "vs_TEXCOORD2"
                              Decorate 11 Location 0
                              Decorate 16 ArrayStride 16
                              Decorate 17 ArrayStride 16
                              Decorate 18 ArrayStride 16
                              MemberDecorate 19 0 Offset 0
                              MemberDecorate 19 1 Offset 16
                              MemberDecorate 19 2 Offset 80
                              MemberDecorate 19 3 Offset 144
                              MemberDecorate 19 4 RelaxedPrecision
                              MemberDecorate 19 4 Offset 208
                              MemberDecorate 19 5 Offset 224
                              MemberDecorate 19 6 Offset 240
                              MemberDecorate 19 7 Offset 256
                              MemberDecorate 19 8 Offset 260
                              Decorate 19 Block
                              Decorate 21 DescriptorSet 1
                              Decorate 21 Binding 1
                              MemberDecorate 78 0 BuiltIn Position
                              MemberDecorate 78 1 BuiltIn PointSize
                              MemberDecorate 78 2 BuiltIn ClipDistance
                              Decorate 78 Block
                              Decorate 84 Location 1
                              Decorate 88 RelaxedPrecision
                              Decorate 90 RelaxedPrecision
                              Decorate 90 Location 0
                              Decorate 94(vs_TEXCOORD0) Location 1
                              Decorate 96 Location 2
                              Decorate 107(vs_TEXCOORD1) Location 2
                              Decorate 155(vs_TEXCOORD2) Location 3
               2:             TypeVoid
               3:             TypeFunction 2
               6:             TypeFloat 32
               7:             TypeVector 6(float) 4
               8:             TypePointer Private 7(fvec4)
               9:      8(ptr) Variable Private
              10:             TypePointer Input 7(fvec4)
              11:     10(ptr) Variable Input
              14:             TypeInt 32 0
              15:     14(int) Constant 4
              16:             TypeArray 7(fvec4) 15
              17:             TypeArray 7(fvec4) 15
              18:             TypeArray 7(fvec4) 15
              19:             TypeStruct 7(fvec4) 16 17 18 7(fvec4) 7(fvec4) 7(fvec4) 6(float) 6(float)
              20:             TypePointer Uniform 19(struct)
              21:     20(ptr) Variable Uniform
              22:             TypeInt 32 1
              23:     22(int) Constant 1
              24:             TypePointer Uniform 7(fvec4)
              28:     22(int) Constant 0
              36:     22(int) Constant 2
              45:     22(int) Constant 3
              49:      8(ptr) Variable Private
              76:     14(int) Constant 1
              77:             TypeArray 6(float) 76
              78:             TypeStruct 7(fvec4) 6(float) 77
              79:             TypePointer Output 78(struct)
              80:     79(ptr) Variable Output
              82:             TypePointer Output 7(fvec4)
              84:     10(ptr) Variable Input
              86:     22(int) Constant 4
              90:     82(ptr) Variable Output
              92:             TypeVector 6(float) 2
              93:             TypePointer Output 92(fvec2)
94(vs_TEXCOORD0):     93(ptr) Variable Output
              95:             TypePointer Input 92(fvec2)
              96:     95(ptr) Variable Input
              98:     22(int) Constant 6
107(vs_TEXCOORD1):     82(ptr) Variable Output
             138:     22(int) Constant 7
             139:             TypePointer Uniform 6(float)
             142:     22(int) Constant 8
             146:    6(float) Constant 1048576000
             147:   92(fvec2) ConstantComposite 146 146
155(vs_TEXCOORD2):     82(ptr) Variable Output
             161:     22(int) Constant 5
             164:    6(float) Constant 3499426553
             165:    7(fvec4) ConstantComposite 164 164 164 164
             168:    6(float) Constant 1351942905
             169:    7(fvec4) ConstantComposite 168 168 168 168
             173:    6(float) Constant 1073741824
             174:   92(fvec2) ConstantComposite 173 173
             190:             TypePointer Output 6(float)
             196:             TypePointer Function 7(fvec4)
             198:             TypeVector 22(int) 4
             199:             TypePointer Function 198(ivec4)
             201:             TypeBool
             202:             TypeVector 201(bool) 4
             203:             TypePointer Function 202(bvec4)
             205:             TypeVector 14(int) 4
             206:             TypePointer Function 205(ivec4)
               4:           2 Function None 3
               5:             Label
             197:    196(ptr) Variable Function
             200:    199(ptr) Variable Function
             204:    203(ptr) Variable Function
             207:    206(ptr) Variable Function
              12:    7(fvec4) Load 11
              13:    7(fvec4) VectorShuffle 12 12 1 1 1 1
              25:     24(ptr) AccessChain 21 23 23
              26:    7(fvec4) Load 25
              27:    7(fvec4) FMul 13 26
                              Store 9 27
              29:     24(ptr) AccessChain 21 23 28
              30:    7(fvec4) Load 29
              31:    7(fvec4) Load 11
              32:    7(fvec4) VectorShuffle 31 31 0 0 0 0
              33:    7(fvec4) FMul 30 32
              34:    7(fvec4) Load 9
              35:    7(fvec4) FAdd 33 34
                              Store 9 35
              37:     24(ptr) AccessChain 21 23 36
              38:    7(fvec4) Load 37
              39:    7(fvec4) Load 11
              40:    7(fvec4) VectorShuffle 39 39 2 2 2 2
              41:    7(fvec4) FMul 38 40
              42:    7(fvec4) Load 9
              43:    7(fvec4) FAdd 41 42
                              Store 9 43
              44:    7(fvec4) Load 9
              46:     24(ptr) AccessChain 21 23 45
              47:    7(fvec4) Load 46
              48:    7(fvec4) FAdd 44 47
                              Store 9 48
              50:    7(fvec4) Load 9
              51:    7(fvec4) VectorShuffle 50 50 1 1 1 1
              52:     24(ptr) AccessChain 21 45 23
              53:    7(fvec4) Load 52
              54:    7(fvec4) FMul 51 53
                              Store 49 54
              55:     24(ptr) AccessChain 21 45 28
              56:    7(fvec4) Load 55
              57:    7(fvec4) Load 9
              58:    7(fvec4) VectorShuffle 57 57 0 0 0 0
              59:    7(fvec4) FMul 56 58
              60:    7(fvec4) Load 49
              61:    7(fvec4) FAdd 59 60
                              Store 49 61
              62:     24(ptr) AccessChain 21 45 36
              63:    7(fvec4) Load 62
              64:    7(fvec4) Load 9
              65:    7(fvec4) VectorShuffle 64 64 2 2 2 2
              66:    7(fvec4) FMul 63 65
              67:    7(fvec4) Load 49
              68:    7(fvec4) FAdd 66 67
                              Store 49 68
              69:     24(ptr) AccessChain 21 45 45
              70:    7(fvec4) Load 69
              71:    7(fvec4) Load 9
              72:    7(fvec4) VectorShuffle 71 71 3 3 3 3
              73:    7(fvec4) FMul 70 72
              74:    7(fvec4) Load 49
              75:    7(fvec4) FAdd 73 74
                              Store 9 75
              81:    7(fvec4) Load 9
              83:     82(ptr) AccessChain 80 28
                              Store 83 81
              85:    7(fvec4) Load 84
              87:     24(ptr) AccessChain 21 86
              88:    7(fvec4) Load 87
              89:    7(fvec4) FMul 85 88
                              Store 49 89
              91:    7(fvec4) Load 49
                              Store 90 91
              97:   92(fvec2) Load 96
              99:     24(ptr) AccessChain 21 98
             100:    7(fvec4) Load 99
             101:   92(fvec2) VectorShuffle 100 100 0 1
             102:   92(fvec2) FMul 97 101
             103:     24(ptr) AccessChain 21 98
             104:    7(fvec4) Load 103
             105:   92(fvec2) VectorShuffle 104 104 2 3
             106:   92(fvec2) FAdd 102 105
                              Store 94(vs_TEXCOORD0) 106
             108:    7(fvec4) Load 11
                              Store 107(vs_TEXCOORD1) 108
             109:     24(ptr) AccessChain 21 28
             110:    7(fvec4) Load 109
             111:   92(fvec2) VectorShuffle 110 110 1 1
             112:     24(ptr) AccessChain 21 36 23
             113:    7(fvec4) Load 112
             114:   92(fvec2) VectorShuffle 113 113 0 1
             115:   92(fvec2) FMul 111 114
             116:    7(fvec4) Load 9
             117:    7(fvec4) VectorShuffle 116 115 4 5 2 3
                              Store 9 117
             118:     24(ptr) AccessChain 21 36 28
             119:    7(fvec4) Load 118
             120:   92(fvec2) VectorShuffle 119 119 0 1
             121:     24(ptr) AccessChain 21 28
             122:    7(fvec4) Load 121
             123:   92(fvec2) VectorShuffle 122 122 0 0
             124:   92(fvec2) FMul 120 123
             125:    7(fvec4) Load 9
             126:   92(fvec2) VectorShuffle 125 125 0 1
             127:   92(fvec2) FAdd 124 126
             128:    7(fvec4) Load 9
             129:    7(fvec4) VectorShuffle 128 127 4 5 2 3
                              Store 9 129
             130:    7(fvec4) Load 9
             131:   92(fvec2) VectorShuffle 130 130 3 3
             132:    7(fvec4) Load 9
             133:   92(fvec2) VectorShuffle 132 132 0 1
             134:   92(fvec2) ExtInst 1(GLSL.std.450) 4(FAbs) 133
             135:   92(fvec2) FDiv 131 134
             136:    7(fvec4) Load 9
             137:    7(fvec4) VectorShuffle 136 135 4 5 2 3
                              Store 9 137
             140:    139(ptr) AccessChain 21 138
             141:    6(float) Load 140
             143:    139(ptr) AccessChain 21 142
             144:    6(float) Load 143
             145:   92(fvec2) CompositeConstruct 141 144
             148:   92(fvec2) FMul 145 147
             149:    7(fvec4) Load 9
             150:   92(fvec2) VectorShuffle 149 149 0 1
             151:   92(fvec2) ExtInst 1(GLSL.std.450) 4(FAbs) 150
             152:   92(fvec2) FAdd 148 151
             153:    7(fvec4) Load 9
             154:    7(fvec4) VectorShuffle 153 152 4 5 2 3
                              Store 9 154
             156:    7(fvec4) Load 9
             157:   92(fvec2) VectorShuffle 156 156 0 1
             158:   92(fvec2) FDiv 147 157
             159:    7(fvec4) Load 155(vs_TEXCOORD2)
             160:    7(fvec4) VectorShuffle 159 158 0 1 4 5
                              Store 155(vs_TEXCOORD2) 160
             162:     24(ptr) AccessChain 21 161
             163:    7(fvec4) Load 162
             166:    7(fvec4) ExtInst 1(GLSL.std.450) 40(FMax) 163 165
                              Store 9 166
             167:    7(fvec4) Load 9
             170:    7(fvec4) ExtInst 1(GLSL.std.450) 37(FMin) 167 169
                              Store 9 170
             171:    7(fvec4) Load 11
             172:   92(fvec2) VectorShuffle 171 171 0 1
             175:   92(fvec2) FMul 172 174
             176:    7(fvec4) Load 9
             177:   92(fvec2) VectorShuffle 176 176 0 1
             178:   92(fvec2) FNegate 177
             179:   92(fvec2) FAdd 175 178
             180:    7(fvec4) Load 9
             181:    7(fvec4) VectorShuffle 180 179 4 5 2 3
                              Store 9 181
             182:    7(fvec4) Load 9
             183:   92(fvec2) VectorShuffle 182 182 2 3
             184:   92(fvec2) FNegate 183
             185:    7(fvec4) Load 9
             186:   92(fvec2) VectorShuffle 185 185 0 1
             187:   92(fvec2) FAdd 184 186
             188:    7(fvec4) Load 155(vs_TEXCOORD2)
             189:    7(fvec4) VectorShuffle 188 187 4 5 2 3
                              Store 155(vs_TEXCOORD2) 189
             191:    190(ptr) AccessChain 80 28 76
             192:    6(float) Load 191
             193:    6(float) FNegate 192
             194:    190(ptr) AccessChain 80 28 76
                              Store 194 193
                              Return
                              FunctionEnd

Disassembly for Fragment:
// Module Version 10000
// Generated by (magic number): 80006
// Id's are bound by 93

                              Capability Shader
               1:             ExtInstImport  "GLSL.std.450"
                              MemoryModel Logical GLSL450
                              EntryPoint Fragment 4  "main" 11 44 68
                              ExecutionMode 4 OriginUpperLeft
                              Name 44  "vs_TEXCOORD0"
                              Decorate 9 RelaxedPrecision
                              Decorate 11 RelaxedPrecision
                              Decorate 11 Location 0
                              Decorate 16 RelaxedPrecision
                              Decorate 18 RelaxedPrecision
                              Decorate 23 RelaxedPrecision
                              Decorate 24 RelaxedPrecision
                              Decorate 27 RelaxedPrecision
                              Decorate 29 RelaxedPrecision
                              Decorate 31 RelaxedPrecision
                              Decorate 34 RelaxedPrecision
                              Decorate 34 DescriptorSet 0
                              Decorate 34 Binding 1
                              Decorate 35 RelaxedPrecision
                              Decorate 38 RelaxedPrecision
                              Decorate 38 DescriptorSet 0
                              Decorate 38 Binding 0
                              Decorate 39 RelaxedPrecision
                              Decorate 44(vs_TEXCOORD0) Location 1
                              Decorate 48 RelaxedPrecision
                              MemberDecorate 49 0 RelaxedPrecision
                              MemberDecorate 49 0 Offset 0
                              Decorate 49 Block
                              Decorate 51 DescriptorSet 1
                              Decorate 51 Binding 0
                              Decorate 56 RelaxedPrecision
                              Decorate 57 RelaxedPrecision
                              Decorate 59 RelaxedPrecision
                              Decorate 60 RelaxedPrecision
                              Decorate 64 RelaxedPrecision
                              Decorate 68 RelaxedPrecision
                              Decorate 68 Location 0
               2:             TypeVoid
               3:             TypeFunction 2
               6:             TypeFloat 32
               7:             TypeVector 6(float) 4
               8:             TypePointer Private 7(fvec4)
               9:      8(ptr) Variable Private
              10:             TypePointer Input 7(fvec4)
              11:     10(ptr) Variable Input
              12:             TypeInt 32 0
              13:     12(int) Constant 3
              14:             TypePointer Input 6(float)
              17:    6(float) Constant 1132396544
              19:     12(int) Constant 0
              20:             TypePointer Private 6(float)
              28:    6(float) Constant 998277249
              31:      8(ptr) Variable Private
              32:             TypeImage 6(float) 2D sampled format:Unknown
              33:             TypePointer UniformConstant 32
              34:     33(ptr) Variable UniformConstant
              36:             TypeSampler
              37:             TypePointer UniformConstant 36
              38:     37(ptr) Variable UniformConstant
              40:             TypeSampledImage 32
              42:             TypeVector 6(float) 2
              43:             TypePointer Input 42(fvec2)
44(vs_TEXCOORD0):     43(ptr) Variable Input
              47:      8(ptr) Variable Private
              49:             TypeStruct 7(fvec4)
              50:             TypePointer Uniform 49(struct)
              51:     50(ptr) Variable Uniform
              52:             TypeInt 32 1
              53:     52(int) Constant 0
              54:             TypePointer Uniform 7(fvec4)
              58:             TypeVector 6(float) 3
              63:      8(ptr) Variable Private
              67:             TypePointer Output 7(fvec4)
              68:     67(ptr) Variable Output
              78:             TypePointer Output 6(float)
              81:             TypePointer Function 7(fvec4)
              83:             TypeVector 52(int) 4
              84:             TypePointer Function 83(ivec4)
              86:             TypeBool
              87:             TypeVector 86(bool) 4
              88:             TypePointer Function 87(bvec4)
              90:             TypeVector 12(int) 4
              91:             TypePointer Function 90(ivec4)
               4:           2 Function None 3
               5:             Label
              82:     81(ptr) Variable Function
              85:     84(ptr) Variable Function
              89:     88(ptr) Variable Function
              92:     91(ptr) Variable Function
              15:     14(ptr) AccessChain 11 13
              16:    6(float) Load 15
              18:    6(float) FMul 16 17
              21:     20(ptr) AccessChain 9 19
                              Store 21 18
              22:     20(ptr) AccessChain 9 19
              23:    6(float) Load 22
              24:    6(float) ExtInst 1(GLSL.std.450) 2(RoundEven) 23
              25:     20(ptr) AccessChain 9 19
                              Store 25 24
              26:     20(ptr) AccessChain 9 19
              27:    6(float) Load 26
              29:    6(float) FMul 27 28
              30:     20(ptr) AccessChain 9 13
                              Store 30 29
              35:          32 Load 34
              39:          36 Load 38
              41:          40 SampledImage 35 39
              45:   42(fvec2) Load 44(vs_TEXCOORD0)
              46:    7(fvec4) ImageSampleImplicitLod 41 45
                              Store 31 46
              48:    7(fvec4) Load 31
              55:     54(ptr) AccessChain 51 53
              56:    7(fvec4) Load 55
              57:    7(fvec4) FAdd 48 56
                              Store 47 57
              59:    7(fvec4) Load 11
              60:   58(fvec3) VectorShuffle 59 59 0 1 2
              61:    7(fvec4) Load 9
              62:    7(fvec4) VectorShuffle 61 60 4 5 6 3
                              Store 9 62
              64:    7(fvec4) Load 9
              65:    7(fvec4) Load 47
              66:    7(fvec4) FMul 64 65
                              Store 63 66
              69:    7(fvec4) Load 63
              70:   58(fvec3) VectorShuffle 69 69 3 3 3
              71:    7(fvec4) Load 63
              72:   58(fvec3) VectorShuffle 71 71 0 1 2
              73:   58(fvec3) FMul 70 72
              74:    7(fvec4) Load 68
              75:    7(fvec4) VectorShuffle 74 73 4 5 6 3
                              Store 68 75
              76:     20(ptr) AccessChain 63 13
              77:    6(float) Load 76
              79:     78(ptr) AccessChain 68 13
                              Store 79 77
                              Return
                              FunctionEnd

Disassembly for Hull:
Not present.



//////////////////////////////////////////////////////
Keywords: UNITY_UI_ALPHACLIP
-- Hardware tier variant: Tier 1
-- Vertex shader for "vulkan":
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord0"

Set 2D Texture "_MainTex" to set: 0, binding: 1, used in: Fragment  using sampler in set: 0, binding: 0, used in: Fragment 

Constant Buffer "PGlobals590543094" (16 bytes) on set: 1, binding: 0, used in: Fragment  {
  Vector4 _TextureSampleAdd at 0
}
Constant Buffer "VGlobals590543094" (264 bytes) on set: 1, binding: 1, used in: Vertex  {
  Matrix4x4 glstate_matrix_projection at 80
  Matrix4x4 unity_MatrixVP at 144
  Matrix4x4 unity_ObjectToWorld at 16
  Vector4 _ClipRect at 224
  Vector4 _Color at 208
  Vector4 _MainTex_ST at 240
  Vector4 _ScreenParams at 0
  Float _UIMaskSoftnessX at 256
  Float _UIMaskSoftnessY at 260
}

Shader Disassembly:
Disassembly for Vertex:
// Module Version 10000
// Generated by (magic number): 80006
// Id's are bound by 208

                              Capability Shader
               1:             ExtInstImport  "GLSL.std.450"
                              MemoryModel Logical GLSL450
                              EntryPoint Vertex 4  "main" 11 80 84 90 94 96 107 155
                              Name 94  "vs_TEXCOORD0"
                              Name 107  "vs_TEXCOORD1"
                              Name 155  "vs_TEXCOORD2"
                              Decorate 11 Location 0
                              Decorate 16 ArrayStride 16
                              Decorate 17 ArrayStride 16
                              Decorate 18 ArrayStride 16
                              MemberDecorate 19 0 Offset 0
                              MemberDecorate 19 1 Offset 16
                              MemberDecorate 19 2 Offset 80
                              MemberDecorate 19 3 Offset 144
                              MemberDecorate 19 4 RelaxedPrecision
                              MemberDecorate 19 4 Offset 208
                              MemberDecorate 19 5 Offset 224
                              MemberDecorate 19 6 Offset 240
                              MemberDecorate 19 7 Offset 256
                              MemberDecorate 19 8 Offset 260
                              Decorate 19 Block
                              Decorate 21 DescriptorSet 1
                              Decorate 21 Binding 1
                              MemberDecorate 78 0 BuiltIn Position
                              MemberDecorate 78 1 BuiltIn PointSize
                              MemberDecorate 78 2 BuiltIn ClipDistance
                              Decorate 78 Block
                              Decorate 84 Location 1
                              Decorate 88 RelaxedPrecision
                              Decorate 90 RelaxedPrecision
                              Decorate 90 Location 0
                              Decorate 94(vs_TEXCOORD0) Location 1
                              Decorate 96 Location 2
                              Decorate 107(vs_TEXCOORD1) Location 2
                              Decorate 155(vs_TEXCOORD2) Location 3
               2:             TypeVoid
               3:             TypeFunction 2
               6:             TypeFloat 32
               7:             TypeVector 6(float) 4
               8:             TypePointer Private 7(fvec4)
               9:      8(ptr) Variable Private
              10:             TypePointer Input 7(fvec4)
              11:     10(ptr) Variable Input
              14:             TypeInt 32 0
              15:     14(int) Constant 4
              16:             TypeArray 7(fvec4) 15
              17:             TypeArray 7(fvec4) 15
              18:             TypeArray 7(fvec4) 15
              19:             TypeStruct 7(fvec4) 16 17 18 7(fvec4) 7(fvec4) 7(fvec4) 6(float) 6(float)
              20:             TypePointer Uniform 19(struct)
              21:     20(ptr) Variable Uniform
              22:             TypeInt 32 1
              23:     22(int) Constant 1
              24:             TypePointer Uniform 7(fvec4)
              28:     22(int) Constant 0
              36:     22(int) Constant 2
              45:     22(int) Constant 3
              49:      8(ptr) Variable Private
              76:     14(int) Constant 1
              77:             TypeArray 6(float) 76
              78:             TypeStruct 7(fvec4) 6(float) 77
              79:             TypePointer Output 78(struct)
              80:     79(ptr) Variable Output
              82:             TypePointer Output 7(fvec4)
              84:     10(ptr) Variable Input
              86:     22(int) Constant 4
              90:     82(ptr) Variable Output
              92:             TypeVector 6(float) 2
              93:             TypePointer Output 92(fvec2)
94(vs_TEXCOORD0):     93(ptr) Variable Output
              95:             TypePointer Input 92(fvec2)
              96:     95(ptr) Variable Input
              98:     22(int) Constant 6
107(vs_TEXCOORD1):     82(ptr) Variable Output
             138:     22(int) Constant 7
             139:             TypePointer Uniform 6(float)
             142:     22(int) Constant 8
             146:    6(float) Constant 1048576000
             147:   92(fvec2) ConstantComposite 146 146
155(vs_TEXCOORD2):     82(ptr) Variable Output
             161:     22(int) Constant 5
             164:    6(float) Constant 3499426553
             165:    7(fvec4) ConstantComposite 164 164 164 164
             168:    6(float) Constant 1351942905
             169:    7(fvec4) ConstantComposite 168 168 168 168
             173:    6(float) Constant 1073741824
             174:   92(fvec2) ConstantComposite 173 173
             190:             TypePointer Output 6(float)
             196:             TypePointer Function 7(fvec4)
             198:             TypeVector 22(int) 4
             199:             TypePointer Function 198(ivec4)
             201:             TypeBool
             202:             TypeVector 201(bool) 4
             203:             TypePointer Function 202(bvec4)
             205:             TypeVector 14(int) 4
             206:             TypePointer Function 205(ivec4)
               4:           2 Function None 3
               5:             Label
             197:    196(ptr) Variable Function
             200:    199(ptr) Variable Function
             204:    203(ptr) Variable Function
             207:    206(ptr) Variable Function
              12:    7(fvec4) Load 11
              13:    7(fvec4) VectorShuffle 12 12 1 1 1 1
              25:     24(ptr) AccessChain 21 23 23
              26:    7(fvec4) Load 25
              27:    7(fvec4) FMul 13 26
                              Store 9 27
              29:     24(ptr) AccessChain 21 23 28
              30:    7(fvec4) Load 29
              31:    7(fvec4) Load 11
              32:    7(fvec4) VectorShuffle 31 31 0 0 0 0
              33:    7(fvec4) FMul 30 32
              34:    7(fvec4) Load 9
              35:    7(fvec4) FAdd 33 34
                              Store 9 35
              37:     24(ptr) AccessChain 21 23 36
              38:    7(fvec4) Load 37
              39:    7(fvec4) Load 11
              40:    7(fvec4) VectorShuffle 39 39 2 2 2 2
              41:    7(fvec4) FMul 38 40
              42:    7(fvec4) Load 9
              43:    7(fvec4) FAdd 41 42
                              Store 9 43
              44:    7(fvec4) Load 9
              46:     24(ptr) AccessChain 21 23 45
              47:    7(fvec4) Load 46
              48:    7(fvec4) FAdd 44 47
                              Store 9 48
              50:    7(fvec4) Load 9
              51:    7(fvec4) VectorShuffle 50 50 1 1 1 1
              52:     24(ptr) AccessChain 21 45 23
              53:    7(fvec4) Load 52
              54:    7(fvec4) FMul 51 53
                              Store 49 54
              55:     24(ptr) AccessChain 21 45 28
              56:    7(fvec4) Load 55
              57:    7(fvec4) Load 9
              58:    7(fvec4) VectorShuffle 57 57 0 0 0 0
              59:    7(fvec4) FMul 56 58
              60:    7(fvec4) Load 49
              61:    7(fvec4) FAdd 59 60
                              Store 49 61
              62:     24(ptr) AccessChain 21 45 36
              63:    7(fvec4) Load 62
              64:    7(fvec4) Load 9
              65:    7(fvec4) VectorShuffle 64 64 2 2 2 2
              66:    7(fvec4) FMul 63 65
              67:    7(fvec4) Load 49
              68:    7(fvec4) FAdd 66 67
                              Store 49 68
              69:     24(ptr) AccessChain 21 45 45
              70:    7(fvec4) Load 69
              71:    7(fvec4) Load 9
              72:    7(fvec4) VectorShuffle 71 71 3 3 3 3
              73:    7(fvec4) FMul 70 72
              74:    7(fvec4) Load 49
              75:    7(fvec4) FAdd 73 74
                              Store 9 75
              81:    7(fvec4) Load 9
              83:     82(ptr) AccessChain 80 28
                              Store 83 81
              85:    7(fvec4) Load 84
              87:     24(ptr) AccessChain 21 86
              88:    7(fvec4) Load 87
              89:    7(fvec4) FMul 85 88
                              Store 49 89
              91:    7(fvec4) Load 49
                              Store 90 91
              97:   92(fvec2) Load 96
              99:     24(ptr) AccessChain 21 98
             100:    7(fvec4) Load 99
             101:   92(fvec2) VectorShuffle 100 100 0 1
             102:   92(fvec2) FMul 97 101
             103:     24(ptr) AccessChain 21 98
             104:    7(fvec4) Load 103
             105:   92(fvec2) VectorShuffle 104 104 2 3
             106:   92(fvec2) FAdd 102 105
                              Store 94(vs_TEXCOORD0) 106
             108:    7(fvec4) Load 11
                              Store 107(vs_TEXCOORD1) 108
             109:     24(ptr) AccessChain 21 28
             110:    7(fvec4) Load 109
             111:   92(fvec2) VectorShuffle 110 110 1 1
             112:     24(ptr) AccessChain 21 36 23
             113:    7(fvec4) Load 112
             114:   92(fvec2) VectorShuffle 113 113 0 1
             115:   92(fvec2) FMul 111 114
             116:    7(fvec4) Load 9
             117:    7(fvec4) VectorShuffle 116 115 4 5 2 3
                              Store 9 117
             118:     24(ptr) AccessChain 21 36 28
             119:    7(fvec4) Load 118
             120:   92(fvec2) VectorShuffle 119 119 0 1
             121:     24(ptr) AccessChain 21 28
             122:    7(fvec4) Load 121
             123:   92(fvec2) VectorShuffle 122 122 0 0
             124:   92(fvec2) FMul 120 123
             125:    7(fvec4) Load 9
             126:   92(fvec2) VectorShuffle 125 125 0 1
             127:   92(fvec2) FAdd 124 126
             128:    7(fvec4) Load 9
             129:    7(fvec4) VectorShuffle 128 127 4 5 2 3
                              Store 9 129
             130:    7(fvec4) Load 9
             131:   92(fvec2) VectorShuffle 130 130 3 3
             132:    7(fvec4) Load 9
             133:   92(fvec2) VectorShuffle 132 132 0 1
             134:   92(fvec2) ExtInst 1(GLSL.std.450) 4(FAbs) 133
             135:   92(fvec2) FDiv 131 134
             136:    7(fvec4) Load 9
             137:    7(fvec4) VectorShuffle 136 135 4 5 2 3
                              Store 9 137
             140:    139(ptr) AccessChain 21 138
             141:    6(float) Load 140
             143:    139(ptr) AccessChain 21 142
             144:    6(float) Load 143
             145:   92(fvec2) CompositeConstruct 141 144
             148:   92(fvec2) FMul 145 147
             149:    7(fvec4) Load 9
             150:   92(fvec2) VectorShuffle 149 149 0 1
             151:   92(fvec2) ExtInst 1(GLSL.std.450) 4(FAbs) 150
             152:   92(fvec2) FAdd 148 151
             153:    7(fvec4) Load 9
             154:    7(fvec4) VectorShuffle 153 152 4 5 2 3
                              Store 9 154
             156:    7(fvec4) Load 9
             157:   92(fvec2) VectorShuffle 156 156 0 1
             158:   92(fvec2) FDiv 147 157
             159:    7(fvec4) Load 155(vs_TEXCOORD2)
             160:    7(fvec4) VectorShuffle 159 158 0 1 4 5
                              Store 155(vs_TEXCOORD2) 160
             162:     24(ptr) AccessChain 21 161
             163:    7(fvec4) Load 162
             166:    7(fvec4) ExtInst 1(GLSL.std.450) 40(FMax) 163 165
                              Store 9 166
             167:    7(fvec4) Load 9
             170:    7(fvec4) ExtInst 1(GLSL.std.450) 37(FMin) 167 169
                              Store 9 170
             171:    7(fvec4) Load 11
             172:   92(fvec2) VectorShuffle 171 171 0 1
             175:   92(fvec2) FMul 172 174
             176:    7(fvec4) Load 9
             177:   92(fvec2) VectorShuffle 176 176 0 1
             178:   92(fvec2) FNegate 177
             179:   92(fvec2) FAdd 175 178
             180:    7(fvec4) Load 9
             181:    7(fvec4) VectorShuffle 180 179 4 5 2 3
                              Store 9 181
             182:    7(fvec4) Load 9
             183:   92(fvec2) VectorShuffle 182 182 2 3
             184:   92(fvec2) FNegate 183
             185:    7(fvec4) Load 9
             186:   92(fvec2) VectorShuffle 185 185 0 1
             187:   92(fvec2) FAdd 184 186
             188:    7(fvec4) Load 155(vs_TEXCOORD2)
             189:    7(fvec4) VectorShuffle 188 187 4 5 2 3
                              Store 155(vs_TEXCOORD2) 189
             191:    190(ptr) AccessChain 80 28 76
             192:    6(float) Load 191
             193:    6(float) FNegate 192
             194:    190(ptr) AccessChain 80 28 76
                              Store 194 193
                              Return
                              FunctionEnd

Disassembly for Fragment:
// Module Version 10000
// Generated by (magic number): 80006
// Id's are bound by 115

                              Capability Shader
               1:             ExtInstImport  "GLSL.std.450"
                              MemoryModel Logical GLSL450
                              EntryPoint Fragment 4  "main" 11 44 91
                              ExecutionMode 4 OriginUpperLeft
                              Name 44  "vs_TEXCOORD0"
                              Decorate 9 RelaxedPrecision
                              Decorate 11 RelaxedPrecision
                              Decorate 11 Location 0
                              Decorate 16 RelaxedPrecision
                              Decorate 18 RelaxedPrecision
                              Decorate 23 RelaxedPrecision
                              Decorate 24 RelaxedPrecision
                              Decorate 27 RelaxedPrecision
                              Decorate 29 RelaxedPrecision
                              Decorate 31 RelaxedPrecision
                              Decorate 34 RelaxedPrecision
                              Decorate 34 DescriptorSet 0
                              Decorate 34 Binding 1
                              Decorate 35 RelaxedPrecision
                              Decorate 38 RelaxedPrecision
                              Decorate 38 DescriptorSet 0
                              Decorate 38 Binding 0
                              Decorate 39 RelaxedPrecision
                              Decorate 44(vs_TEXCOORD0) Location 1
                              Decorate 48 RelaxedPrecision
                              MemberDecorate 49 0 RelaxedPrecision
                              MemberDecorate 49 0 Offset 0
                              Decorate 49 Block
                              Decorate 51 DescriptorSet 1
                              Decorate 51 Binding 0
                              Decorate 56 RelaxedPrecision
                              Decorate 57 RelaxedPrecision
                              Decorate 58 RelaxedPrecision
                              Decorate 60 RelaxedPrecision
                              Decorate 69 RelaxedPrecision
                              Decorate 82 RelaxedPrecision
                              Decorate 83 RelaxedPrecision
                              Decorate 87 RelaxedPrecision
                              Decorate 91 RelaxedPrecision
                              Decorate 91 Location 0
               2:             TypeVoid
               3:             TypeFunction 2
               6:             TypeFloat 32
               7:             TypeVector 6(float) 4
               8:             TypePointer Private 7(fvec4)
               9:      8(ptr) Variable Private
              10:             TypePointer Input 7(fvec4)
              11:     10(ptr) Variable Input
              12:             TypeInt 32 0
              13:     12(int) Constant 3
              14:             TypePointer Input 6(float)
              17:    6(float) Constant 1132396544
              19:     12(int) Constant 0
              20:             TypePointer Private 6(float)
              28:    6(float) Constant 998277249
              31:      8(ptr) Variable Private
              32:             TypeImage 6(float) 2D sampled format:Unknown
              33:             TypePointer UniformConstant 32
              34:     33(ptr) Variable UniformConstant
              36:             TypeSampler
              37:             TypePointer UniformConstant 36
              38:     37(ptr) Variable UniformConstant
              40:             TypeSampledImage 32
              42:             TypeVector 6(float) 2
              43:             TypePointer Input 42(fvec2)
44(vs_TEXCOORD0):     43(ptr) Variable Input
              47:      8(ptr) Variable Private
              49:             TypeStruct 7(fvec4)
              50:             TypePointer Uniform 49(struct)
              51:     50(ptr) Variable Uniform
              52:             TypeInt 32 1
              53:     52(int) Constant 0
              54:             TypePointer Uniform 7(fvec4)
              58:     20(ptr) Variable Private
              64:    6(float) Constant 3129152111
              66:             TypeBool
              67:             TypePointer Private 66(bool)
              68:     67(ptr) Variable Private
              70:    6(float) Constant 0
              73:     52(int) Constant 1
              75:     52(int) Constant 4294967295
              81:             TypeVector 6(float) 3
              86:      8(ptr) Variable Private
              90:             TypePointer Output 7(fvec4)
              91:     90(ptr) Variable Output
             101:             TypePointer Output 6(float)
             104:             TypePointer Function 7(fvec4)
             106:             TypeVector 52(int) 4
             107:             TypePointer Function 106(ivec4)
             109:             TypeVector 66(bool) 4
             110:             TypePointer Function 109(bvec4)
             112:             TypeVector 12(int) 4
             113:             TypePointer Function 112(ivec4)
               4:           2 Function None 3
               5:             Label
             105:    104(ptr) Variable Function
             108:    107(ptr) Variable Function
             111:    110(ptr) Variable Function
             114:    113(ptr) Variable Function
              15:     14(ptr) AccessChain 11 13
              16:    6(float) Load 15
              18:    6(float) FMul 16 17
              21:     20(ptr) AccessChain 9 19
                              Store 21 18
              22:     20(ptr) AccessChain 9 19
              23:    6(float) Load 22
              24:    6(float) ExtInst 1(GLSL.std.450) 2(RoundEven) 23
              25:     20(ptr) AccessChain 9 19
                              Store 25 24
              26:     20(ptr) AccessChain 9 19
              27:    6(float) Load 26
              29:    6(float) FMul 27 28
              30:     20(ptr) AccessChain 9 13
                              Store 30 29
              35:          32 Load 34
              39:          36 Load 38
              41:          40 SampledImage 35 39
              45:   42(fvec2) Load 44(vs_TEXCOORD0)
              46:    7(fvec4) ImageSampleImplicitLod 41 45
                              Store 31 46
              48:    7(fvec4) Load 31
              55:     54(ptr) AccessChain 51 53
              56:    7(fvec4) Load 55
              57:    7(fvec4) FAdd 48 56
                              Store 47 57
              59:     20(ptr) AccessChain 9 13
              60:    6(float) Load 59
              61:     20(ptr) AccessChain 47 13
              62:    6(float) Load 61
              63:    6(float) FMul 60 62
              65:    6(float) FAdd 63 64
                              Store 58 65
              69:    6(float) Load 58
              71:    66(bool) FOrdLessThan 69 70
                              Store 68 71
              72:    66(bool) Load 68
              74:     52(int) Select 72 73 53
              76:     52(int) IMul 74 75
              77:    66(bool) INotEqual 76 53
                              SelectionMerge 79 None
                              BranchConditional 77 78 79
              78:               Label
                                Kill
              79:             Label
              82:    7(fvec4) Load 11
              83:   81(fvec3) VectorShuffle 82 82 0 1 2
              84:    7(fvec4) Load 9
              85:    7(fvec4) VectorShuffle 84 83 4 5 6 3
                              Store 9 85
              87:    7(fvec4) Load 9
              88:    7(fvec4) Load 47
              89:    7(fvec4) FMul 87 88
                              Store 86 89
              92:    7(fvec4) Load 86
              93:   81(fvec3) VectorShuffle 92 92 3 3 3
              94:    7(fvec4) Load 86
              95:   81(fvec3) VectorShuffle 94 94 0 1 2
              96:   81(fvec3) FMul 93 95
              97:    7(fvec4) Load 91
              98:    7(fvec4) VectorShuffle 97 96 4 5 6 3
                              Store 91 98
              99:     20(ptr) AccessChain 86 13
             100:    6(float) Load 99
             102:    101(ptr) AccessChain 91 13
                              Store 102 100
                              Return
                              FunctionEnd

Disassembly for Hull:
Not present.



//////////////////////////////////////////////////////
Keywords: UNITY_UI_ALPHACLIP
-- Hardware tier variant: Tier 2
-- Vertex shader for "vulkan":
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord0"

Set 2D Texture "_MainTex" to set: 0, binding: 1, used in: Fragment  using sampler in set: 0, binding: 0, used in: Fragment 

Constant Buffer "PGlobals590543094" (16 bytes) on set: 1, binding: 0, used in: Fragment  {
  Vector4 _TextureSampleAdd at 0
}
Constant Buffer "VGlobals590543094" (264 bytes) on set: 1, binding: 1, used in: Vertex  {
  Matrix4x4 glstate_matrix_projection at 80
  Matrix4x4 unity_MatrixVP at 144
  Matrix4x4 unity_ObjectToWorld at 16
  Vector4 _ClipRect at 224
  Vector4 _Color at 208
  Vector4 _MainTex_ST at 240
  Vector4 _ScreenParams at 0
  Float _UIMaskSoftnessX at 256
  Float _UIMaskSoftnessY at 260
}

Shader Disassembly:
Disassembly for Vertex:
// Module Version 10000
// Generated by (magic number): 80006
// Id's are bound by 208

                              Capability Shader
               1:             ExtInstImport  "GLSL.std.450"
                              MemoryModel Logical GLSL450
                              EntryPoint Vertex 4  "main" 11 80 84 90 94 96 107 155
                              Name 94  "vs_TEXCOORD0"
                              Name 107  "vs_TEXCOORD1"
                              Name 155  "vs_TEXCOORD2"
                              Decorate 11 Location 0
                              Decorate 16 ArrayStride 16
                              Decorate 17 ArrayStride 16
                              Decorate 18 ArrayStride 16
                              MemberDecorate 19 0 Offset 0
                              MemberDecorate 19 1 Offset 16
                              MemberDecorate 19 2 Offset 80
                              MemberDecorate 19 3 Offset 144
                              MemberDecorate 19 4 RelaxedPrecision
                              MemberDecorate 19 4 Offset 208
                              MemberDecorate 19 5 Offset 224
                              MemberDecorate 19 6 Offset 240
                              MemberDecorate 19 7 Offset 256
                              MemberDecorate 19 8 Offset 260
                              Decorate 19 Block
                              Decorate 21 DescriptorSet 1
                              Decorate 21 Binding 1
                              MemberDecorate 78 0 BuiltIn Position
                              MemberDecorate 78 1 BuiltIn PointSize
                              MemberDecorate 78 2 BuiltIn ClipDistance
                              Decorate 78 Block
                              Decorate 84 Location 1
                              Decorate 88 RelaxedPrecision
                              Decorate 90 RelaxedPrecision
                              Decorate 90 Location 0
                              Decorate 94(vs_TEXCOORD0) Location 1
                              Decorate 96 Location 2
                              Decorate 107(vs_TEXCOORD1) Location 2
                              Decorate 155(vs_TEXCOORD2) Location 3
               2:             TypeVoid
               3:             TypeFunction 2
               6:             TypeFloat 32
               7:             TypeVector 6(float) 4
               8:             TypePointer Private 7(fvec4)
               9:      8(ptr) Variable Private
              10:             TypePointer Input 7(fvec4)
              11:     10(ptr) Variable Input
              14:             TypeInt 32 0
              15:     14(int) Constant 4
              16:             TypeArray 7(fvec4) 15
              17:             TypeArray 7(fvec4) 15
              18:             TypeArray 7(fvec4) 15
              19:             TypeStruct 7(fvec4) 16 17 18 7(fvec4) 7(fvec4) 7(fvec4) 6(float) 6(float)
              20:             TypePointer Uniform 19(struct)
              21:     20(ptr) Variable Uniform
              22:             TypeInt 32 1
              23:     22(int) Constant 1
              24:             TypePointer Uniform 7(fvec4)
              28:     22(int) Constant 0
              36:     22(int) Constant 2
              45:     22(int) Constant 3
              49:      8(ptr) Variable Private
              76:     14(int) Constant 1
              77:             TypeArray 6(float) 76
              78:             TypeStruct 7(fvec4) 6(float) 77
              79:             TypePointer Output 78(struct)
              80:     79(ptr) Variable Output
              82:             TypePointer Output 7(fvec4)
              84:     10(ptr) Variable Input
              86:     22(int) Constant 4
              90:     82(ptr) Variable Output
              92:             TypeVector 6(float) 2
              93:             TypePointer Output 92(fvec2)
94(vs_TEXCOORD0):     93(ptr) Variable Output
              95:             TypePointer Input 92(fvec2)
              96:     95(ptr) Variable Input
              98:     22(int) Constant 6
107(vs_TEXCOORD1):     82(ptr) Variable Output
             138:     22(int) Constant 7
             139:             TypePointer Uniform 6(float)
             142:     22(int) Constant 8
             146:    6(float) Constant 1048576000
             147:   92(fvec2) ConstantComposite 146 146
155(vs_TEXCOORD2):     82(ptr) Variable Output
             161:     22(int) Constant 5
             164:    6(float) Constant 3499426553
             165:    7(fvec4) ConstantComposite 164 164 164 164
             168:    6(float) Constant 1351942905
             169:    7(fvec4) ConstantComposite 168 168 168 168
             173:    6(float) Constant 1073741824
             174:   92(fvec2) ConstantComposite 173 173
             190:             TypePointer Output 6(float)
             196:             TypePointer Function 7(fvec4)
             198:             TypeVector 22(int) 4
             199:             TypePointer Function 198(ivec4)
             201:             TypeBool
             202:             TypeVector 201(bool) 4
             203:             TypePointer Function 202(bvec4)
             205:             TypeVector 14(int) 4
             206:             TypePointer Function 205(ivec4)
               4:           2 Function None 3
               5:             Label
             197:    196(ptr) Variable Function
             200:    199(ptr) Variable Function
             204:    203(ptr) Variable Function
             207:    206(ptr) Variable Function
              12:    7(fvec4) Load 11
              13:    7(fvec4) VectorShuffle 12 12 1 1 1 1
              25:     24(ptr) AccessChain 21 23 23
              26:    7(fvec4) Load 25
              27:    7(fvec4) FMul 13 26
                              Store 9 27
              29:     24(ptr) AccessChain 21 23 28
              30:    7(fvec4) Load 29
              31:    7(fvec4) Load 11
              32:    7(fvec4) VectorShuffle 31 31 0 0 0 0
              33:    7(fvec4) FMul 30 32
              34:    7(fvec4) Load 9
              35:    7(fvec4) FAdd 33 34
                              Store 9 35
              37:     24(ptr) AccessChain 21 23 36
              38:    7(fvec4) Load 37
              39:    7(fvec4) Load 11
              40:    7(fvec4) VectorShuffle 39 39 2 2 2 2
              41:    7(fvec4) FMul 38 40
              42:    7(fvec4) Load 9
              43:    7(fvec4) FAdd 41 42
                              Store 9 43
              44:    7(fvec4) Load 9
              46:     24(ptr) AccessChain 21 23 45
              47:    7(fvec4) Load 46
              48:    7(fvec4) FAdd 44 47
                              Store 9 48
              50:    7(fvec4) Load 9
              51:    7(fvec4) VectorShuffle 50 50 1 1 1 1
              52:     24(ptr) AccessChain 21 45 23
              53:    7(fvec4) Load 52
              54:    7(fvec4) FMul 51 53
                              Store 49 54
              55:     24(ptr) AccessChain 21 45 28
              56:    7(fvec4) Load 55
              57:    7(fvec4) Load 9
              58:    7(fvec4) VectorShuffle 57 57 0 0 0 0
              59:    7(fvec4) FMul 56 58
              60:    7(fvec4) Load 49
              61:    7(fvec4) FAdd 59 60
                              Store 49 61
              62:     24(ptr) AccessChain 21 45 36
              63:    7(fvec4) Load 62
              64:    7(fvec4) Load 9
              65:    7(fvec4) VectorShuffle 64 64 2 2 2 2
              66:    7(fvec4) FMul 63 65
              67:    7(fvec4) Load 49
              68:    7(fvec4) FAdd 66 67
                              Store 49 68
              69:     24(ptr) AccessChain 21 45 45
              70:    7(fvec4) Load 69
              71:    7(fvec4) Load 9
              72:    7(fvec4) VectorShuffle 71 71 3 3 3 3
              73:    7(fvec4) FMul 70 72
              74:    7(fvec4) Load 49
              75:    7(fvec4) FAdd 73 74
                              Store 9 75
              81:    7(fvec4) Load 9
              83:     82(ptr) AccessChain 80 28
                              Store 83 81
              85:    7(fvec4) Load 84
              87:     24(ptr) AccessChain 21 86
              88:    7(fvec4) Load 87
              89:    7(fvec4) FMul 85 88
                              Store 49 89
              91:    7(fvec4) Load 49
                              Store 90 91
              97:   92(fvec2) Load 96
              99:     24(ptr) AccessChain 21 98
             100:    7(fvec4) Load 99
             101:   92(fvec2) VectorShuffle 100 100 0 1
             102:   92(fvec2) FMul 97 101
             103:     24(ptr) AccessChain 21 98
             104:    7(fvec4) Load 103
             105:   92(fvec2) VectorShuffle 104 104 2 3
             106:   92(fvec2) FAdd 102 105
                              Store 94(vs_TEXCOORD0) 106
             108:    7(fvec4) Load 11
                              Store 107(vs_TEXCOORD1) 108
             109:     24(ptr) AccessChain 21 28
             110:    7(fvec4) Load 109
             111:   92(fvec2) VectorShuffle 110 110 1 1
             112:     24(ptr) AccessChain 21 36 23
             113:    7(fvec4) Load 112
             114:   92(fvec2) VectorShuffle 113 113 0 1
             115:   92(fvec2) FMul 111 114
             116:    7(fvec4) Load 9
             117:    7(fvec4) VectorShuffle 116 115 4 5 2 3
                              Store 9 117
             118:     24(ptr) AccessChain 21 36 28
             119:    7(fvec4) Load 118
             120:   92(fvec2) VectorShuffle 119 119 0 1
             121:     24(ptr) AccessChain 21 28
             122:    7(fvec4) Load 121
             123:   92(fvec2) VectorShuffle 122 122 0 0
             124:   92(fvec2) FMul 120 123
             125:    7(fvec4) Load 9
             126:   92(fvec2) VectorShuffle 125 125 0 1
             127:   92(fvec2) FAdd 124 126
             128:    7(fvec4) Load 9
             129:    7(fvec4) VectorShuffle 128 127 4 5 2 3
                              Store 9 129
             130:    7(fvec4) Load 9
             131:   92(fvec2) VectorShuffle 130 130 3 3
             132:    7(fvec4) Load 9
             133:   92(fvec2) VectorShuffle 132 132 0 1
             134:   92(fvec2) ExtInst 1(GLSL.std.450) 4(FAbs) 133
             135:   92(fvec2) FDiv 131 134
             136:    7(fvec4) Load 9
             137:    7(fvec4) VectorShuffle 136 135 4 5 2 3
                              Store 9 137
             140:    139(ptr) AccessChain 21 138
             141:    6(float) Load 140
             143:    139(ptr) AccessChain 21 142
             144:    6(float) Load 143
             145:   92(fvec2) CompositeConstruct 141 144
             148:   92(fvec2) FMul 145 147
             149:    7(fvec4) Load 9
             150:   92(fvec2) VectorShuffle 149 149 0 1
             151:   92(fvec2) ExtInst 1(GLSL.std.450) 4(FAbs) 150
             152:   92(fvec2) FAdd 148 151
             153:    7(fvec4) Load 9
             154:    7(fvec4) VectorShuffle 153 152 4 5 2 3
                              Store 9 154
             156:    7(fvec4) Load 9
             157:   92(fvec2) VectorShuffle 156 156 0 1
             158:   92(fvec2) FDiv 147 157
             159:    7(fvec4) Load 155(vs_TEXCOORD2)
             160:    7(fvec4) VectorShuffle 159 158 0 1 4 5
                              Store 155(vs_TEXCOORD2) 160
             162:     24(ptr) AccessChain 21 161
             163:    7(fvec4) Load 162
             166:    7(fvec4) ExtInst 1(GLSL.std.450) 40(FMax) 163 165
                              Store 9 166
             167:    7(fvec4) Load 9
             170:    7(fvec4) ExtInst 1(GLSL.std.450) 37(FMin) 167 169
                              Store 9 170
             171:    7(fvec4) Load 11
             172:   92(fvec2) VectorShuffle 171 171 0 1
             175:   92(fvec2) FMul 172 174
             176:    7(fvec4) Load 9
             177:   92(fvec2) VectorShuffle 176 176 0 1
             178:   92(fvec2) FNegate 177
             179:   92(fvec2) FAdd 175 178
             180:    7(fvec4) Load 9
             181:    7(fvec4) VectorShuffle 180 179 4 5 2 3
                              Store 9 181
             182:    7(fvec4) Load 9
             183:   92(fvec2) VectorShuffle 182 182 2 3
             184:   92(fvec2) FNegate 183
             185:    7(fvec4) Load 9
             186:   92(fvec2) VectorShuffle 185 185 0 1
             187:   92(fvec2) FAdd 184 186
             188:    7(fvec4) Load 155(vs_TEXCOORD2)
             189:    7(fvec4) VectorShuffle 188 187 4 5 2 3
                              Store 155(vs_TEXCOORD2) 189
             191:    190(ptr) AccessChain 80 28 76
             192:    6(float) Load 191
             193:    6(float) FNegate 192
             194:    190(ptr) AccessChain 80 28 76
                              Store 194 193
                              Return
                              FunctionEnd

Disassembly for Fragment:
// Module Version 10000
// Generated by (magic number): 80006
// Id's are bound by 115

                              Capability Shader
               1:             ExtInstImport  "GLSL.std.450"
                              MemoryModel Logical GLSL450
                              EntryPoint Fragment 4  "main" 11 44 91
                              ExecutionMode 4 OriginUpperLeft
                              Name 44  "vs_TEXCOORD0"
                              Decorate 9 RelaxedPrecision
                              Decorate 11 RelaxedPrecision
                              Decorate 11 Location 0
                              Decorate 16 RelaxedPrecision
                              Decorate 18 RelaxedPrecision
                              Decorate 23 RelaxedPrecision
                              Decorate 24 RelaxedPrecision
                              Decorate 27 RelaxedPrecision
                              Decorate 29 RelaxedPrecision
                              Decorate 31 RelaxedPrecision
                              Decorate 34 RelaxedPrecision
                              Decorate 34 DescriptorSet 0
                              Decorate 34 Binding 1
                              Decorate 35 RelaxedPrecision
                              Decorate 38 RelaxedPrecision
                              Decorate 38 DescriptorSet 0
                              Decorate 38 Binding 0
                              Decorate 39 RelaxedPrecision
                              Decorate 44(vs_TEXCOORD0) Location 1
                              Decorate 48 RelaxedPrecision
                              MemberDecorate 49 0 RelaxedPrecision
                              MemberDecorate 49 0 Offset 0
                              Decorate 49 Block
                              Decorate 51 DescriptorSet 1
                              Decorate 51 Binding 0
                              Decorate 56 RelaxedPrecision
                              Decorate 57 RelaxedPrecision
                              Decorate 58 RelaxedPrecision
                              Decorate 60 RelaxedPrecision
                              Decorate 69 RelaxedPrecision
                              Decorate 82 RelaxedPrecision
                              Decorate 83 RelaxedPrecision
                              Decorate 87 RelaxedPrecision
                              Decorate 91 RelaxedPrecision
                              Decorate 91 Location 0
               2:             TypeVoid
               3:             TypeFunction 2
               6:             TypeFloat 32
               7:             TypeVector 6(float) 4
               8:             TypePointer Private 7(fvec4)
               9:      8(ptr) Variable Private
              10:             TypePointer Input 7(fvec4)
              11:     10(ptr) Variable Input
              12:             TypeInt 32 0
              13:     12(int) Constant 3
              14:             TypePointer Input 6(float)
              17:    6(float) Constant 1132396544
              19:     12(int) Constant 0
              20:             TypePointer Private 6(float)
              28:    6(float) Constant 998277249
              31:      8(ptr) Variable Private
              32:             TypeImage 6(float) 2D sampled format:Unknown
              33:             TypePointer UniformConstant 32
              34:     33(ptr) Variable UniformConstant
              36:             TypeSampler
              37:             TypePointer UniformConstant 36
              38:     37(ptr) Variable UniformConstant
              40:             TypeSampledImage 32
              42:             TypeVector 6(float) 2
              43:             TypePointer Input 42(fvec2)
44(vs_TEXCOORD0):     43(ptr) Variable Input
              47:      8(ptr) Variable Private
              49:             TypeStruct 7(fvec4)
              50:             TypePointer Uniform 49(struct)
              51:     50(ptr) Variable Uniform
              52:             TypeInt 32 1
              53:     52(int) Constant 0
              54:             TypePointer Uniform 7(fvec4)
              58:     20(ptr) Variable Private
              64:    6(float) Constant 3129152111
              66:             TypeBool
              67:             TypePointer Private 66(bool)
              68:     67(ptr) Variable Private
              70:    6(float) Constant 0
              73:     52(int) Constant 1
              75:     52(int) Constant 4294967295
              81:             TypeVector 6(float) 3
              86:      8(ptr) Variable Private
              90:             TypePointer Output 7(fvec4)
              91:     90(ptr) Variable Output
             101:             TypePointer Output 6(float)
             104:             TypePointer Function 7(fvec4)
             106:             TypeVector 52(int) 4
             107:             TypePointer Function 106(ivec4)
             109:             TypeVector 66(bool) 4
             110:             TypePointer Function 109(bvec4)
             112:             TypeVector 12(int) 4
             113:             TypePointer Function 112(ivec4)
               4:           2 Function None 3
               5:             Label
             105:    104(ptr) Variable Function
             108:    107(ptr) Variable Function
             111:    110(ptr) Variable Function
             114:    113(ptr) Variable Function
              15:     14(ptr) AccessChain 11 13
              16:    6(float) Load 15
              18:    6(float) FMul 16 17
              21:     20(ptr) AccessChain 9 19
                              Store 21 18
              22:     20(ptr) AccessChain 9 19
              23:    6(float) Load 22
              24:    6(float) ExtInst 1(GLSL.std.450) 2(RoundEven) 23
              25:     20(ptr) AccessChain 9 19
                              Store 25 24
              26:     20(ptr) AccessChain 9 19
              27:    6(float) Load 26
              29:    6(float) FMul 27 28
              30:     20(ptr) AccessChain 9 13
                              Store 30 29
              35:          32 Load 34
              39:          36 Load 38
              41:          40 SampledImage 35 39
              45:   42(fvec2) Load 44(vs_TEXCOORD0)
              46:    7(fvec4) ImageSampleImplicitLod 41 45
                              Store 31 46
              48:    7(fvec4) Load 31
              55:     54(ptr) AccessChain 51 53
              56:    7(fvec4) Load 55
              57:    7(fvec4) FAdd 48 56
                              Store 47 57
              59:     20(ptr) AccessChain 9 13
              60:    6(float) Load 59
              61:     20(ptr) AccessChain 47 13
              62:    6(float) Load 61
              63:    6(float) FMul 60 62
              65:    6(float) FAdd 63 64
                              Store 58 65
              69:    6(float) Load 58
              71:    66(bool) FOrdLessThan 69 70
                              Store 68 71
              72:    66(bool) Load 68
              74:     52(int) Select 72 73 53
              76:     52(int) IMul 74 75
              77:    66(bool) INotEqual 76 53
                              SelectionMerge 79 None
                              BranchConditional 77 78 79
              78:               Label
                                Kill
              79:             Label
              82:    7(fvec4) Load 11
              83:   81(fvec3) VectorShuffle 82 82 0 1 2
              84:    7(fvec4) Load 9
              85:    7(fvec4) VectorShuffle 84 83 4 5 6 3
                              Store 9 85
              87:    7(fvec4) Load 9
              88:    7(fvec4) Load 47
              89:    7(fvec4) FMul 87 88
                              Store 86 89
              92:    7(fvec4) Load 86
              93:   81(fvec3) VectorShuffle 92 92 3 3 3
              94:    7(fvec4) Load 86
              95:   81(fvec3) VectorShuffle 94 94 0 1 2
              96:   81(fvec3) FMul 93 95
              97:    7(fvec4) Load 91
              98:    7(fvec4) VectorShuffle 97 96 4 5 6 3
                              Store 91 98
              99:     20(ptr) AccessChain 86 13
             100:    6(float) Load 99
             102:    101(ptr) AccessChain 91 13
                              Store 102 100
                              Return
                              FunctionEnd

Disassembly for Hull:
Not present.



//////////////////////////////////////////////////////
Keywords: UNITY_UI_ALPHACLIP
-- Hardware tier variant: Tier 3
-- Vertex shader for "vulkan":
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord0"

Set 2D Texture "_MainTex" to set: 0, binding: 1, used in: Fragment  using sampler in set: 0, binding: 0, used in: Fragment 

Constant Buffer "PGlobals590543094" (16 bytes) on set: 1, binding: 0, used in: Fragment  {
  Vector4 _TextureSampleAdd at 0
}
Constant Buffer "VGlobals590543094" (264 bytes) on set: 1, binding: 1, used in: Vertex  {
  Matrix4x4 glstate_matrix_projection at 80
  Matrix4x4 unity_MatrixVP at 144
  Matrix4x4 unity_ObjectToWorld at 16
  Vector4 _ClipRect at 224
  Vector4 _Color at 208
  Vector4 _MainTex_ST at 240
  Vector4 _ScreenParams at 0
  Float _UIMaskSoftnessX at 256
  Float _UIMaskSoftnessY at 260
}

Shader Disassembly:
Disassembly for Vertex:
// Module Version 10000
// Generated by (magic number): 80006
// Id's are bound by 208

                              Capability Shader
               1:             ExtInstImport  "GLSL.std.450"
                              MemoryModel Logical GLSL450
                              EntryPoint Vertex 4  "main" 11 80 84 90 94 96 107 155
                              Name 94  "vs_TEXCOORD0"
                              Name 107  "vs_TEXCOORD1"
                              Name 155  "vs_TEXCOORD2"
                              Decorate 11 Location 0
                              Decorate 16 ArrayStride 16
                              Decorate 17 ArrayStride 16
                              Decorate 18 ArrayStride 16
                              MemberDecorate 19 0 Offset 0
                              MemberDecorate 19 1 Offset 16
                              MemberDecorate 19 2 Offset 80
                              MemberDecorate 19 3 Offset 144
                              MemberDecorate 19 4 RelaxedPrecision
                              MemberDecorate 19 4 Offset 208
                              MemberDecorate 19 5 Offset 224
                              MemberDecorate 19 6 Offset 240
                              MemberDecorate 19 7 Offset 256
                              MemberDecorate 19 8 Offset 260
                              Decorate 19 Block
                              Decorate 21 DescriptorSet 1
                              Decorate 21 Binding 1
                              MemberDecorate 78 0 BuiltIn Position
                              MemberDecorate 78 1 BuiltIn PointSize
                              MemberDecorate 78 2 BuiltIn ClipDistance
                              Decorate 78 Block
                              Decorate 84 Location 1
                              Decorate 88 RelaxedPrecision
                              Decorate 90 RelaxedPrecision
                              Decorate 90 Location 0
                              Decorate 94(vs_TEXCOORD0) Location 1
                              Decorate 96 Location 2
                              Decorate 107(vs_TEXCOORD1) Location 2
                              Decorate 155(vs_TEXCOORD2) Location 3
               2:             TypeVoid
               3:             TypeFunction 2
               6:             TypeFloat 32
               7:             TypeVector 6(float) 4
               8:             TypePointer Private 7(fvec4)
               9:      8(ptr) Variable Private
              10:             TypePointer Input 7(fvec4)
              11:     10(ptr) Variable Input
              14:             TypeInt 32 0
              15:     14(int) Constant 4
              16:             TypeArray 7(fvec4) 15
              17:             TypeArray 7(fvec4) 15
              18:             TypeArray 7(fvec4) 15
              19:             TypeStruct 7(fvec4) 16 17 18 7(fvec4) 7(fvec4) 7(fvec4) 6(float) 6(float)
              20:             TypePointer Uniform 19(struct)
              21:     20(ptr) Variable Uniform
              22:             TypeInt 32 1
              23:     22(int) Constant 1
              24:             TypePointer Uniform 7(fvec4)
              28:     22(int) Constant 0
              36:     22(int) Constant 2
              45:     22(int) Constant 3
              49:      8(ptr) Variable Private
              76:     14(int) Constant 1
              77:             TypeArray 6(float) 76
              78:             TypeStruct 7(fvec4) 6(float) 77
              79:             TypePointer Output 78(struct)
              80:     79(ptr) Variable Output
              82:             TypePointer Output 7(fvec4)
              84:     10(ptr) Variable Input
              86:     22(int) Constant 4
              90:     82(ptr) Variable Output
              92:             TypeVector 6(float) 2
              93:             TypePointer Output 92(fvec2)
94(vs_TEXCOORD0):     93(ptr) Variable Output
              95:             TypePointer Input 92(fvec2)
              96:     95(ptr) Variable Input
              98:     22(int) Constant 6
107(vs_TEXCOORD1):     82(ptr) Variable Output
             138:     22(int) Constant 7
             139:             TypePointer Uniform 6(float)
             142:     22(int) Constant 8
             146:    6(float) Constant 1048576000
             147:   92(fvec2) ConstantComposite 146 146
155(vs_TEXCOORD2):     82(ptr) Variable Output
             161:     22(int) Constant 5
             164:    6(float) Constant 3499426553
             165:    7(fvec4) ConstantComposite 164 164 164 164
             168:    6(float) Constant 1351942905
             169:    7(fvec4) ConstantComposite 168 168 168 168
             173:    6(float) Constant 1073741824
             174:   92(fvec2) ConstantComposite 173 173
             190:             TypePointer Output 6(float)
             196:             TypePointer Function 7(fvec4)
             198:             TypeVector 22(int) 4
             199:             TypePointer Function 198(ivec4)
             201:             TypeBool
             202:             TypeVector 201(bool) 4
             203:             TypePointer Function 202(bvec4)
             205:             TypeVector 14(int) 4
             206:             TypePointer Function 205(ivec4)
               4:           2 Function None 3
               5:             Label
             197:    196(ptr) Variable Function
             200:    199(ptr) Variable Function
             204:    203(ptr) Variable Function
             207:    206(ptr) Variable Function
              12:    7(fvec4) Load 11
              13:    7(fvec4) VectorShuffle 12 12 1 1 1 1
              25:     24(ptr) AccessChain 21 23 23
              26:    7(fvec4) Load 25
              27:    7(fvec4) FMul 13 26
                              Store 9 27
              29:     24(ptr) AccessChain 21 23 28
              30:    7(fvec4) Load 29
              31:    7(fvec4) Load 11
              32:    7(fvec4) VectorShuffle 31 31 0 0 0 0
              33:    7(fvec4) FMul 30 32
              34:    7(fvec4) Load 9
              35:    7(fvec4) FAdd 33 34
                              Store 9 35
              37:     24(ptr) AccessChain 21 23 36
              38:    7(fvec4) Load 37
              39:    7(fvec4) Load 11
              40:    7(fvec4) VectorShuffle 39 39 2 2 2 2
              41:    7(fvec4) FMul 38 40
              42:    7(fvec4) Load 9
              43:    7(fvec4) FAdd 41 42
                              Store 9 43
              44:    7(fvec4) Load 9
              46:     24(ptr) AccessChain 21 23 45
              47:    7(fvec4) Load 46
              48:    7(fvec4) FAdd 44 47
                              Store 9 48
              50:    7(fvec4) Load 9
              51:    7(fvec4) VectorShuffle 50 50 1 1 1 1
              52:     24(ptr) AccessChain 21 45 23
              53:    7(fvec4) Load 52
              54:    7(fvec4) FMul 51 53
                              Store 49 54
              55:     24(ptr) AccessChain 21 45 28
              56:    7(fvec4) Load 55
              57:    7(fvec4) Load 9
              58:    7(fvec4) VectorShuffle 57 57 0 0 0 0
              59:    7(fvec4) FMul 56 58
              60:    7(fvec4) Load 49
              61:    7(fvec4) FAdd 59 60
                              Store 49 61
              62:     24(ptr) AccessChain 21 45 36
              63:    7(fvec4) Load 62
              64:    7(fvec4) Load 9
              65:    7(fvec4) VectorShuffle 64 64 2 2 2 2
              66:    7(fvec4) FMul 63 65
              67:    7(fvec4) Load 49
              68:    7(fvec4) FAdd 66 67
                              Store 49 68
              69:     24(ptr) AccessChain 21 45 45
              70:    7(fvec4) Load 69
              71:    7(fvec4) Load 9
              72:    7(fvec4) VectorShuffle 71 71 3 3 3 3
              73:    7(fvec4) FMul 70 72
              74:    7(fvec4) Load 49
              75:    7(fvec4) FAdd 73 74
                              Store 9 75
              81:    7(fvec4) Load 9
              83:     82(ptr) AccessChain 80 28
                              Store 83 81
              85:    7(fvec4) Load 84
              87:     24(ptr) AccessChain 21 86
              88:    7(fvec4) Load 87
              89:    7(fvec4) FMul 85 88
                              Store 49 89
              91:    7(fvec4) Load 49
                              Store 90 91
              97:   92(fvec2) Load 96
              99:     24(ptr) AccessChain 21 98
             100:    7(fvec4) Load 99
             101:   92(fvec2) VectorShuffle 100 100 0 1
             102:   92(fvec2) FMul 97 101
             103:     24(ptr) AccessChain 21 98
             104:    7(fvec4) Load 103
             105:   92(fvec2) VectorShuffle 104 104 2 3
             106:   92(fvec2) FAdd 102 105
                              Store 94(vs_TEXCOORD0) 106
             108:    7(fvec4) Load 11
                              Store 107(vs_TEXCOORD1) 108
             109:     24(ptr) AccessChain 21 28
             110:    7(fvec4) Load 109
             111:   92(fvec2) VectorShuffle 110 110 1 1
             112:     24(ptr) AccessChain 21 36 23
             113:    7(fvec4) Load 112
             114:   92(fvec2) VectorShuffle 113 113 0 1
             115:   92(fvec2) FMul 111 114
             116:    7(fvec4) Load 9
             117:    7(fvec4) VectorShuffle 116 115 4 5 2 3
                              Store 9 117
             118:     24(ptr) AccessChain 21 36 28
             119:    7(fvec4) Load 118
             120:   92(fvec2) VectorShuffle 119 119 0 1
             121:     24(ptr) AccessChain 21 28
             122:    7(fvec4) Load 121
             123:   92(fvec2) VectorShuffle 122 122 0 0
             124:   92(fvec2) FMul 120 123
             125:    7(fvec4) Load 9
             126:   92(fvec2) VectorShuffle 125 125 0 1
             127:   92(fvec2) FAdd 124 126
             128:    7(fvec4) Load 9
             129:    7(fvec4) VectorShuffle 128 127 4 5 2 3
                              Store 9 129
             130:    7(fvec4) Load 9
             131:   92(fvec2) VectorShuffle 130 130 3 3
             132:    7(fvec4) Load 9
             133:   92(fvec2) VectorShuffle 132 132 0 1
             134:   92(fvec2) ExtInst 1(GLSL.std.450) 4(FAbs) 133
             135:   92(fvec2) FDiv 131 134
             136:    7(fvec4) Load 9
             137:    7(fvec4) VectorShuffle 136 135 4 5 2 3
                              Store 9 137
             140:    139(ptr) AccessChain 21 138
             141:    6(float) Load 140
             143:    139(ptr) AccessChain 21 142
             144:    6(float) Load 143
             145:   92(fvec2) CompositeConstruct 141 144
             148:   92(fvec2) FMul 145 147
             149:    7(fvec4) Load 9
             150:   92(fvec2) VectorShuffle 149 149 0 1
             151:   92(fvec2) ExtInst 1(GLSL.std.450) 4(FAbs) 150
             152:   92(fvec2) FAdd 148 151
             153:    7(fvec4) Load 9
             154:    7(fvec4) VectorShuffle 153 152 4 5 2 3
                              Store 9 154
             156:    7(fvec4) Load 9
             157:   92(fvec2) VectorShuffle 156 156 0 1
             158:   92(fvec2) FDiv 147 157
             159:    7(fvec4) Load 155(vs_TEXCOORD2)
             160:    7(fvec4) VectorShuffle 159 158 0 1 4 5
                              Store 155(vs_TEXCOORD2) 160
             162:     24(ptr) AccessChain 21 161
             163:    7(fvec4) Load 162
             166:    7(fvec4) ExtInst 1(GLSL.std.450) 40(FMax) 163 165
                              Store 9 166
             167:    7(fvec4) Load 9
             170:    7(fvec4) ExtInst 1(GLSL.std.450) 37(FMin) 167 169
                              Store 9 170
             171:    7(fvec4) Load 11
             172:   92(fvec2) VectorShuffle 171 171 0 1
             175:   92(fvec2) FMul 172 174
             176:    7(fvec4) Load 9
             177:   92(fvec2) VectorShuffle 176 176 0 1
             178:   92(fvec2) FNegate 177
             179:   92(fvec2) FAdd 175 178
             180:    7(fvec4) Load 9
             181:    7(fvec4) VectorShuffle 180 179 4 5 2 3
                              Store 9 181
             182:    7(fvec4) Load 9
             183:   92(fvec2) VectorShuffle 182 182 2 3
             184:   92(fvec2) FNegate 183
             185:    7(fvec4) Load 9
             186:   92(fvec2) VectorShuffle 185 185 0 1
             187:   92(fvec2) FAdd 184 186
             188:    7(fvec4) Load 155(vs_TEXCOORD2)
             189:    7(fvec4) VectorShuffle 188 187 4 5 2 3
                              Store 155(vs_TEXCOORD2) 189
             191:    190(ptr) AccessChain 80 28 76
             192:    6(float) Load 191
             193:    6(float) FNegate 192
             194:    190(ptr) AccessChain 80 28 76
                              Store 194 193
                              Return
                              FunctionEnd

Disassembly for Fragment:
// Module Version 10000
// Generated by (magic number): 80006
// Id's are bound by 115

                              Capability Shader
               1:             ExtInstImport  "GLSL.std.450"
                              MemoryModel Logical GLSL450
                              EntryPoint Fragment 4  "main" 11 44 91
                              ExecutionMode 4 OriginUpperLeft
                              Name 44  "vs_TEXCOORD0"
                              Decorate 9 RelaxedPrecision
                              Decorate 11 RelaxedPrecision
                              Decorate 11 Location 0
                              Decorate 16 RelaxedPrecision
                              Decorate 18 RelaxedPrecision
                              Decorate 23 RelaxedPrecision
                              Decorate 24 RelaxedPrecision
                              Decorate 27 RelaxedPrecision
                              Decorate 29 RelaxedPrecision
                              Decorate 31 RelaxedPrecision
                              Decorate 34 RelaxedPrecision
                              Decorate 34 DescriptorSet 0
                              Decorate 34 Binding 1
                              Decorate 35 RelaxedPrecision
                              Decorate 38 RelaxedPrecision
                              Decorate 38 DescriptorSet 0
                              Decorate 38 Binding 0
                              Decorate 39 RelaxedPrecision
                              Decorate 44(vs_TEXCOORD0) Location 1
                              Decorate 48 RelaxedPrecision
                              MemberDecorate 49 0 RelaxedPrecision
                              MemberDecorate 49 0 Offset 0
                              Decorate 49 Block
                              Decorate 51 DescriptorSet 1
                              Decorate 51 Binding 0
                              Decorate 56 RelaxedPrecision
                              Decorate 57 RelaxedPrecision
                              Decorate 58 RelaxedPrecision
                              Decorate 60 RelaxedPrecision
                              Decorate 69 RelaxedPrecision
                              Decorate 82 RelaxedPrecision
                              Decorate 83 RelaxedPrecision
                              Decorate 87 RelaxedPrecision
                              Decorate 91 RelaxedPrecision
                              Decorate 91 Location 0
               2:             TypeVoid
               3:             TypeFunction 2
               6:             TypeFloat 32
               7:             TypeVector 6(float) 4
               8:             TypePointer Private 7(fvec4)
               9:      8(ptr) Variable Private
              10:             TypePointer Input 7(fvec4)
              11:     10(ptr) Variable Input
              12:             TypeInt 32 0
              13:     12(int) Constant 3
              14:             TypePointer Input 6(float)
              17:    6(float) Constant 1132396544
              19:     12(int) Constant 0
              20:             TypePointer Private 6(float)
              28:    6(float) Constant 998277249
              31:      8(ptr) Variable Private
              32:             TypeImage 6(float) 2D sampled format:Unknown
              33:             TypePointer UniformConstant 32
              34:     33(ptr) Variable UniformConstant
              36:             TypeSampler
              37:             TypePointer UniformConstant 36
              38:     37(ptr) Variable UniformConstant
              40:             TypeSampledImage 32
              42:             TypeVector 6(float) 2
              43:             TypePointer Input 42(fvec2)
44(vs_TEXCOORD0):     43(ptr) Variable Input
              47:      8(ptr) Variable Private
              49:             TypeStruct 7(fvec4)
              50:             TypePointer Uniform 49(struct)
              51:     50(ptr) Variable Uniform
              52:             TypeInt 32 1
              53:     52(int) Constant 0
              54:             TypePointer Uniform 7(fvec4)
              58:     20(ptr) Variable Private
              64:    6(float) Constant 3129152111
              66:             TypeBool
              67:             TypePointer Private 66(bool)
              68:     67(ptr) Variable Private
              70:    6(float) Constant 0
              73:     52(int) Constant 1
              75:     52(int) Constant 4294967295
              81:             TypeVector 6(float) 3
              86:      8(ptr) Variable Private
              90:             TypePointer Output 7(fvec4)
              91:     90(ptr) Variable Output
             101:             TypePointer Output 6(float)
             104:             TypePointer Function 7(fvec4)
             106:             TypeVector 52(int) 4
             107:             TypePointer Function 106(ivec4)
             109:             TypeVector 66(bool) 4
             110:             TypePointer Function 109(bvec4)
             112:             TypeVector 12(int) 4
             113:             TypePointer Function 112(ivec4)
               4:           2 Function None 3
               5:             Label
             105:    104(ptr) Variable Function
             108:    107(ptr) Variable Function
             111:    110(ptr) Variable Function
             114:    113(ptr) Variable Function
              15:     14(ptr) AccessChain 11 13
              16:    6(float) Load 15
              18:    6(float) FMul 16 17
              21:     20(ptr) AccessChain 9 19
                              Store 21 18
              22:     20(ptr) AccessChain 9 19
              23:    6(float) Load 22
              24:    6(float) ExtInst 1(GLSL.std.450) 2(RoundEven) 23
              25:     20(ptr) AccessChain 9 19
                              Store 25 24
              26:     20(ptr) AccessChain 9 19
              27:    6(float) Load 26
              29:    6(float) FMul 27 28
              30:     20(ptr) AccessChain 9 13
                              Store 30 29
              35:          32 Load 34
              39:          36 Load 38
              41:          40 SampledImage 35 39
              45:   42(fvec2) Load 44(vs_TEXCOORD0)
              46:    7(fvec4) ImageSampleImplicitLod 41 45
                              Store 31 46
              48:    7(fvec4) Load 31
              55:     54(ptr) AccessChain 51 53
              56:    7(fvec4) Load 55
              57:    7(fvec4) FAdd 48 56
                              Store 47 57
              59:     20(ptr) AccessChain 9 13
              60:    6(float) Load 59
              61:     20(ptr) AccessChain 47 13
              62:    6(float) Load 61
              63:    6(float) FMul 60 62
              65:    6(float) FAdd 63 64
                              Store 58 65
              69:    6(float) Load 58
              71:    66(bool) FOrdLessThan 69 70
                              Store 68 71
              72:    66(bool) Load 68
              74:     52(int) Select 72 73 53
              76:     52(int) IMul 74 75
              77:    66(bool) INotEqual 76 53
                              SelectionMerge 79 None
                              BranchConditional 77 78 79
              78:               Label
                                Kill
              79:             Label
              82:    7(fvec4) Load 11
              83:   81(fvec3) VectorShuffle 82 82 0 1 2
              84:    7(fvec4) Load 9
              85:    7(fvec4) VectorShuffle 84 83 4 5 6 3
                              Store 9 85
              87:    7(fvec4) Load 9
              88:    7(fvec4) Load 47
              89:    7(fvec4) FMul 87 88
                              Store 86 89
              92:    7(fvec4) Load 86
              93:   81(fvec3) VectorShuffle 92 92 3 3 3
              94:    7(fvec4) Load 86
              95:   81(fvec3) VectorShuffle 94 94 0 1 2
              96:   81(fvec3) FMul 93 95
              97:    7(fvec4) Load 91
              98:    7(fvec4) VectorShuffle 97 96 4 5 6 3
                              Store 91 98
              99:     20(ptr) AccessChain 86 13
             100:    6(float) Load 99
             102:    101(ptr) AccessChain 91 13
                              Store 102 100
                              Return
                              FunctionEnd

Disassembly for Hull:
Not present.



//////////////////////////////////////////////////////
Keywords: UNITY_UI_CLIP_RECT
-- Hardware tier variant: Tier 1
-- Vertex shader for "vulkan":
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord0"

Set 2D Texture "_MainTex" to set: 0, binding: 1, used in: Fragment  using sampler in set: 0, binding: 0, used in: Fragment 

Constant Buffer "PGlobals2928291404" (32 bytes) on set: 1, binding: 0, used in: Fragment  {
  Vector4 _ClipRect at 16
  Vector4 _TextureSampleAdd at 0
}
Constant Buffer "VGlobals2928291404" (264 bytes) on set: 1, binding: 1, used in: Vertex  {
  Matrix4x4 glstate_matrix_projection at 80
  Matrix4x4 unity_MatrixVP at 144
  Matrix4x4 unity_ObjectToWorld at 16
  Vector4 _ClipRect at 224
  Vector4 _Color at 208
  Vector4 _MainTex_ST at 240
  Vector4 _ScreenParams at 0
  Float _UIMaskSoftnessX at 256
  Float _UIMaskSoftnessY at 260
}

Shader Disassembly:
Disassembly for Vertex:
// Module Version 10000
// Generated by (magic number): 80006
// Id's are bound by 208

                              Capability Shader
               1:             ExtInstImport  "GLSL.std.450"
                              MemoryModel Logical GLSL450
                              EntryPoint Vertex 4  "main" 11 80 84 90 94 96 107 155
                              Name 94  "vs_TEXCOORD0"
                              Name 107  "vs_TEXCOORD1"
                              Name 155  "vs_TEXCOORD2"
                              Decorate 11 Location 0
                              Decorate 16 ArrayStride 16
                              Decorate 17 ArrayStride 16
                              Decorate 18 ArrayStride 16
                              MemberDecorate 19 0 Offset 0
                              MemberDecorate 19 1 Offset 16
                              MemberDecorate 19 2 Offset 80
                              MemberDecorate 19 3 Offset 144
                              MemberDecorate 19 4 RelaxedPrecision
                              MemberDecorate 19 4 Offset 208
                              MemberDecorate 19 5 Offset 224
                              MemberDecorate 19 6 Offset 240
                              MemberDecorate 19 7 Offset 256
                              MemberDecorate 19 8 Offset 260
                              Decorate 19 Block
                              Decorate 21 DescriptorSet 1
                              Decorate 21 Binding 1
                              MemberDecorate 78 0 BuiltIn Position
                              MemberDecorate 78 1 BuiltIn PointSize
                              MemberDecorate 78 2 BuiltIn ClipDistance
                              Decorate 78 Block
                              Decorate 84 Location 1
                              Decorate 88 RelaxedPrecision
                              Decorate 90 RelaxedPrecision
                              Decorate 90 Location 0
                              Decorate 94(vs_TEXCOORD0) Location 1
                              Decorate 96 Location 2
                              Decorate 107(vs_TEXCOORD1) Location 3
                              Decorate 155(vs_TEXCOORD2) Location 2
               2:             TypeVoid
               3:             TypeFunction 2
               6:             TypeFloat 32
               7:             TypeVector 6(float) 4
               8:             TypePointer Private 7(fvec4)
               9:      8(ptr) Variable Private
              10:             TypePointer Input 7(fvec4)
              11:     10(ptr) Variable Input
              14:             TypeInt 32 0
              15:     14(int) Constant 4
              16:             TypeArray 7(fvec4) 15
              17:             TypeArray 7(fvec4) 15
              18:             TypeArray 7(fvec4) 15
              19:             TypeStruct 7(fvec4) 16 17 18 7(fvec4) 7(fvec4) 7(fvec4) 6(float) 6(float)
              20:             TypePointer Uniform 19(struct)
              21:     20(ptr) Variable Uniform
              22:             TypeInt 32 1
              23:     22(int) Constant 1
              24:             TypePointer Uniform 7(fvec4)
              28:     22(int) Constant 0
              36:     22(int) Constant 2
              45:     22(int) Constant 3
              49:      8(ptr) Variable Private
              76:     14(int) Constant 1
              77:             TypeArray 6(float) 76
              78:             TypeStruct 7(fvec4) 6(float) 77
              79:             TypePointer Output 78(struct)
              80:     79(ptr) Variable Output
              82:             TypePointer Output 7(fvec4)
              84:     10(ptr) Variable Input
              86:     22(int) Constant 4
              90:     82(ptr) Variable Output
              92:             TypeVector 6(float) 2
              93:             TypePointer Output 92(fvec2)
94(vs_TEXCOORD0):     93(ptr) Variable Output
              95:             TypePointer Input 92(fvec2)
              96:     95(ptr) Variable Input
              98:     22(int) Constant 6
107(vs_TEXCOORD1):     82(ptr) Variable Output
             138:     22(int) Constant 7
             139:             TypePointer Uniform 6(float)
             142:     22(int) Constant 8
             146:    6(float) Constant 1048576000
             147:   92(fvec2) ConstantComposite 146 146
155(vs_TEXCOORD2):     82(ptr) Variable Output
             161:     22(int) Constant 5
             164:    6(float) Constant 3499426553
             165:    7(fvec4) ConstantComposite 164 164 164 164
             168:    6(float) Constant 1351942905
             169:    7(fvec4) ConstantComposite 168 168 168 168
             173:    6(float) Constant 1073741824
             174:   92(fvec2) ConstantComposite 173 173
             190:             TypePointer Output 6(float)
             196:             TypePointer Function 7(fvec4)
             198:             TypeVector 22(int) 4
             199:             TypePointer Function 198(ivec4)
             201:             TypeBool
             202:             TypeVector 201(bool) 4
             203:             TypePointer Function 202(bvec4)
             205:             TypeVector 14(int) 4
             206:             TypePointer Function 205(ivec4)
               4:           2 Function None 3
               5:             Label
             197:    196(ptr) Variable Function
             200:    199(ptr) Variable Function
             204:    203(ptr) Variable Function
             207:    206(ptr) Variable Function
              12:    7(fvec4) Load 11
              13:    7(fvec4) VectorShuffle 12 12 1 1 1 1
              25:     24(ptr) AccessChain 21 23 23
              26:    7(fvec4) Load 25
              27:    7(fvec4) FMul 13 26
                              Store 9 27
              29:     24(ptr) AccessChain 21 23 28
              30:    7(fvec4) Load 29
              31:    7(fvec4) Load 11
              32:    7(fvec4) VectorShuffle 31 31 0 0 0 0
              33:    7(fvec4) FMul 30 32
              34:    7(fvec4) Load 9
              35:    7(fvec4) FAdd 33 34
                              Store 9 35
              37:     24(ptr) AccessChain 21 23 36
              38:    7(fvec4) Load 37
              39:    7(fvec4) Load 11
              40:    7(fvec4) VectorShuffle 39 39 2 2 2 2
              41:    7(fvec4) FMul 38 40
              42:    7(fvec4) Load 9
              43:    7(fvec4) FAdd 41 42
                              Store 9 43
              44:    7(fvec4) Load 9
              46:     24(ptr) AccessChain 21 23 45
              47:    7(fvec4) Load 46
              48:    7(fvec4) FAdd 44 47
                              Store 9 48
              50:    7(fvec4) Load 9
              51:    7(fvec4) VectorShuffle 50 50 1 1 1 1
              52:     24(ptr) AccessChain 21 45 23
              53:    7(fvec4) Load 52
              54:    7(fvec4) FMul 51 53
                              Store 49 54
              55:     24(ptr) AccessChain 21 45 28
              56:    7(fvec4) Load 55
              57:    7(fvec4) Load 9
              58:    7(fvec4) VectorShuffle 57 57 0 0 0 0
              59:    7(fvec4) FMul 56 58
              60:    7(fvec4) Load 49
              61:    7(fvec4) FAdd 59 60
                              Store 49 61
              62:     24(ptr) AccessChain 21 45 36
              63:    7(fvec4) Load 62
              64:    7(fvec4) Load 9
              65:    7(fvec4) VectorShuffle 64 64 2 2 2 2
              66:    7(fvec4) FMul 63 65
              67:    7(fvec4) Load 49
              68:    7(fvec4) FAdd 66 67
                              Store 49 68
              69:     24(ptr) AccessChain 21 45 45
              70:    7(fvec4) Load 69
              71:    7(fvec4) Load 9
              72:    7(fvec4) VectorShuffle 71 71 3 3 3 3
              73:    7(fvec4) FMul 70 72
              74:    7(fvec4) Load 49
              75:    7(fvec4) FAdd 73 74
                              Store 9 75
              81:    7(fvec4) Load 9
              83:     82(ptr) AccessChain 80 28
                              Store 83 81
              85:    7(fvec4) Load 84
              87:     24(ptr) AccessChain 21 86
              88:    7(fvec4) Load 87
              89:    7(fvec4) FMul 85 88
                              Store 49 89
              91:    7(fvec4) Load 49
                              Store 90 91
              97:   92(fvec2) Load 96
              99:     24(ptr) AccessChain 21 98
             100:    7(fvec4) Load 99
             101:   92(fvec2) VectorShuffle 100 100 0 1
             102:   92(fvec2) FMul 97 101
             103:     24(ptr) AccessChain 21 98
             104:    7(fvec4) Load 103
             105:   92(fvec2) VectorShuffle 104 104 2 3
             106:   92(fvec2) FAdd 102 105
                              Store 94(vs_TEXCOORD0) 106
             108:    7(fvec4) Load 11
                              Store 107(vs_TEXCOORD1) 108
             109:     24(ptr) AccessChain 21 28
             110:    7(fvec4) Load 109
             111:   92(fvec2) VectorShuffle 110 110 1 1
             112:     24(ptr) AccessChain 21 36 23
             113:    7(fvec4) Load 112
             114:   92(fvec2) VectorShuffle 113 113 0 1
             115:   92(fvec2) FMul 111 114
             116:    7(fvec4) Load 9
             117:    7(fvec4) VectorShuffle 116 115 4 5 2 3
                              Store 9 117
             118:     24(ptr) AccessChain 21 36 28
             119:    7(fvec4) Load 118
             120:   92(fvec2) VectorShuffle 119 119 0 1
             121:     24(ptr) AccessChain 21 28
             122:    7(fvec4) Load 121
             123:   92(fvec2) VectorShuffle 122 122 0 0
             124:   92(fvec2) FMul 120 123
             125:    7(fvec4) Load 9
             126:   92(fvec2) VectorShuffle 125 125 0 1
             127:   92(fvec2) FAdd 124 126
             128:    7(fvec4) Load 9
             129:    7(fvec4) VectorShuffle 128 127 4 5 2 3
                              Store 9 129
             130:    7(fvec4) Load 9
             131:   92(fvec2) VectorShuffle 130 130 3 3
             132:    7(fvec4) Load 9
             133:   92(fvec2) VectorShuffle 132 132 0 1
             134:   92(fvec2) ExtInst 1(GLSL.std.450) 4(FAbs) 133
             135:   92(fvec2) FDiv 131 134
             136:    7(fvec4) Load 9
             137:    7(fvec4) VectorShuffle 136 135 4 5 2 3
                              Store 9 137
             140:    139(ptr) AccessChain 21 138
             141:    6(float) Load 140
             143:    139(ptr) AccessChain 21 142
             144:    6(float) Load 143
             145:   92(fvec2) CompositeConstruct 141 144
             148:   92(fvec2) FMul 145 147
             149:    7(fvec4) Load 9
             150:   92(fvec2) VectorShuffle 149 149 0 1
             151:   92(fvec2) ExtInst 1(GLSL.std.450) 4(FAbs) 150
             152:   92(fvec2) FAdd 148 151
             153:    7(fvec4) Load 9
             154:    7(fvec4) VectorShuffle 153 152 4 5 2 3
                              Store 9 154
             156:    7(fvec4) Load 9
             157:   92(fvec2) VectorShuffle 156 156 0 1
             158:   92(fvec2) FDiv 147 157
             159:    7(fvec4) Load 155(vs_TEXCOORD2)
             160:    7(fvec4) VectorShuffle 159 158 0 1 4 5
                              Store 155(vs_TEXCOORD2) 160
             162:     24(ptr) AccessChain 21 161
             163:    7(fvec4) Load 162
             166:    7(fvec4) ExtInst 1(GLSL.std.450) 40(FMax) 163 165
                              Store 9 166
             167:    7(fvec4) Load 9
             170:    7(fvec4) ExtInst 1(GLSL.std.450) 37(FMin) 167 169
                              Store 9 170
             171:    7(fvec4) Load 11
             172:   92(fvec2) VectorShuffle 171 171 0 1
             175:   92(fvec2) FMul 172 174
             176:    7(fvec4) Load 9
             177:   92(fvec2) VectorShuffle 176 176 0 1
             178:   92(fvec2) FNegate 177
             179:   92(fvec2) FAdd 175 178
             180:    7(fvec4) Load 9
             181:    7(fvec4) VectorShuffle 180 179 4 5 2 3
                              Store 9 181
             182:    7(fvec4) Load 9
             183:   92(fvec2) VectorShuffle 182 182 2 3
             184:   92(fvec2) FNegate 183
             185:    7(fvec4) Load 9
             186:   92(fvec2) VectorShuffle 185 185 0 1
             187:   92(fvec2) FAdd 184 186
             188:    7(fvec4) Load 155(vs_TEXCOORD2)
             189:    7(fvec4) VectorShuffle 188 187 4 5 2 3
                              Store 155(vs_TEXCOORD2) 189
             191:    190(ptr) AccessChain 80 28 76
             192:    6(float) Load 191
             193:    6(float) FNegate 192
             194:    190(ptr) AccessChain 80 28 76
                              Store 194 193
                              Return
                              FunctionEnd

Disassembly for Fragment:
// Module Version 10000
// Generated by (magic number): 80006
// Id's are bound by 137

                              Capability Shader
               1:             ExtInstImport  "GLSL.std.450"
                              MemoryModel Logical GLSL450
                              EntryPoint Fragment 4  "main" 30 65 91 113
                              ExecutionMode 4 OriginUpperLeft
                              Name 30  "vs_TEXCOORD2"
                              Name 91  "vs_TEXCOORD0"
                              MemberDecorate 10 0 RelaxedPrecision
                              MemberDecorate 10 0 Offset 0
                              MemberDecorate 10 1 Offset 16
                              Decorate 10 Block
                              Decorate 12 DescriptorSet 1
                              Decorate 12 Binding 0
                              Decorate 30(vs_TEXCOORD2) Location 2
                              Decorate 55 RelaxedPrecision
                              Decorate 64 RelaxedPrecision
                              Decorate 65 RelaxedPrecision
                              Decorate 65 Location 0
                              Decorate 69 RelaxedPrecision
                              Decorate 71 RelaxedPrecision
                              Decorate 72 RelaxedPrecision
                              Decorate 73 RelaxedPrecision
                              Decorate 74 RelaxedPrecision
                              Decorate 75 RelaxedPrecision
                              Decorate 77 RelaxedPrecision
                              Decorate 79 RelaxedPrecision
                              Decorate 82 RelaxedPrecision
                              Decorate 82 DescriptorSet 0
                              Decorate 82 Binding 1
                              Decorate 83 RelaxedPrecision
                              Decorate 86 RelaxedPrecision
                              Decorate 86 DescriptorSet 0
                              Decorate 86 Binding 0
                              Decorate 87 RelaxedPrecision
                              Decorate 91(vs_TEXCOORD0) Location 1
                              Decorate 95 RelaxedPrecision
                              Decorate 98 RelaxedPrecision
                              Decorate 99 RelaxedPrecision
                              Decorate 101 RelaxedPrecision
                              Decorate 102 RelaxedPrecision
                              Decorate 105 RelaxedPrecision
                              Decorate 108 RelaxedPrecision
                              Decorate 113 RelaxedPrecision
                              Decorate 113 Location 0
                              Decorate 116 RelaxedPrecision
                              Decorate 121 RelaxedPrecision
               2:             TypeVoid
               3:             TypeFunction 2
               6:             TypeFloat 32
               7:             TypeVector 6(float) 4
               8:             TypePointer Private 7(fvec4)
               9:      8(ptr) Variable Private
              10:             TypeStruct 7(fvec4) 7(fvec4)
              11:             TypePointer Uniform 10(struct)
              12:     11(ptr) Variable Uniform
              13:             TypeInt 32 1
              14:     13(int) Constant 1
              15:             TypeVector 6(float) 2
              16:             TypePointer Uniform 7(fvec4)
              29:             TypePointer Input 7(fvec4)
30(vs_TEXCOORD2):     29(ptr) Variable Input
              47:    6(float) Constant 0
              48:    6(float) Constant 1065353216
              54:             TypePointer Private 6(float)
              55:     54(ptr) Variable Private
              56:             TypeInt 32 0
              57:     56(int) Constant 1
              60:     56(int) Constant 0
              64:     54(ptr) Variable Private
              65:     29(ptr) Variable Input
              66:     56(int) Constant 3
              67:             TypePointer Input 6(float)
              70:    6(float) Constant 1132396544
              74:      8(ptr) Variable Private
              76:    6(float) Constant 998277249
              79:      8(ptr) Variable Private
              80:             TypeImage 6(float) 2D sampled format:Unknown
              81:             TypePointer UniformConstant 80
              82:     81(ptr) Variable UniformConstant
              84:             TypeSampler
              85:             TypePointer UniformConstant 84
              86:     85(ptr) Variable UniformConstant
              88:             TypeSampledImage 80
              90:             TypePointer Input 15(fvec2)
91(vs_TEXCOORD0):     90(ptr) Variable Input
              94:      8(ptr) Variable Private
              96:     13(int) Constant 0
             100:             TypeVector 6(float) 3
             112:             TypePointer Output 7(fvec4)
             113:    112(ptr) Variable Output
             122:             TypePointer Output 6(float)
             125:             TypePointer Function 7(fvec4)
             127:             TypeVector 13(int) 4
             128:             TypePointer Function 127(ivec4)
             130:             TypeBool
             131:             TypeVector 130(bool) 4
             132:             TypePointer Function 131(bvec4)
             134:             TypeVector 56(int) 4
             135:             TypePointer Function 134(ivec4)
               4:           2 Function None 3
               5:             Label
             126:    125(ptr) Variable Function
             129:    128(ptr) Variable Function
             133:    132(ptr) Variable Function
             136:    135(ptr) Variable Function
              17:     16(ptr) AccessChain 12 14
              18:    7(fvec4) Load 17
              19:   15(fvec2) VectorShuffle 18 18 0 1
              20:   15(fvec2) FNegate 19
              21:     16(ptr) AccessChain 12 14
              22:    7(fvec4) Load 21
              23:   15(fvec2) VectorShuffle 22 22 2 3
              24:   15(fvec2) FAdd 20 23
              25:    7(fvec4) Load 9
              26:    7(fvec4) VectorShuffle 25 24 4 5 2 3
                              Store 9 26
              27:    7(fvec4) Load 9
              28:   15(fvec2) VectorShuffle 27 27 0 1
              31:    7(fvec4) Load 30(vs_TEXCOORD2)
              32:   15(fvec2) VectorShuffle 31 31 0 1
              33:   15(fvec2) ExtInst 1(GLSL.std.450) 4(FAbs) 32
              34:   15(fvec2) FNegate 33
              35:   15(fvec2) FAdd 28 34
              36:    7(fvec4) Load 9
              37:    7(fvec4) VectorShuffle 36 35 4 5 2 3
                              Store 9 37
              38:    7(fvec4) Load 9
              39:   15(fvec2) VectorShuffle 38 38 0 1
              40:    7(fvec4) Load 30(vs_TEXCOORD2)
              41:   15(fvec2) VectorShuffle 40 40 2 3
              42:   15(fvec2) FMul 39 41
              43:    7(fvec4) Load 9
              44:    7(fvec4) VectorShuffle 43 42 4 5 2 3
                              Store 9 44
              45:    7(fvec4) Load 9
              46:   15(fvec2) VectorShuffle 45 45 0 1
              49:   15(fvec2) CompositeConstruct 47 47
              50:   15(fvec2) CompositeConstruct 48 48
              51:   15(fvec2) ExtInst 1(GLSL.std.450) 43(FClamp) 46 49 50
              52:    7(fvec4) Load 9
              53:    7(fvec4) VectorShuffle 52 51 4 5 2 3
                              Store 9 53
              58:     54(ptr) AccessChain 9 57
              59:    6(float) Load 58
              61:     54(ptr) AccessChain 9 60
              62:    6(float) Load 61
              63:    6(float) FMul 59 62
                              Store 55 63
              68:     67(ptr) AccessChain 65 66
              69:    6(float) Load 68
              71:    6(float) FMul 69 70
                              Store 64 71
              72:    6(float) Load 64
              73:    6(float) ExtInst 1(GLSL.std.450) 2(RoundEven) 72
                              Store 64 73
              75:    6(float) Load 64
              77:    6(float) FMul 75 76
              78:     54(ptr) AccessChain 74 66
                              Store 78 77
              83:          80 Load 82
              87:          84 Load 86
              89:          88 SampledImage 83 87
              92:   15(fvec2) Load 91(vs_TEXCOORD0)
              93:    7(fvec4) ImageSampleImplicitLod 89 92
                              Store 79 93
              95:    7(fvec4) Load 79
              97:     16(ptr) AccessChain 12 96
              98:    7(fvec4) Load 97
              99:    7(fvec4) FAdd 95 98
                              Store 94 99
             101:    7(fvec4) Load 65
             102:  100(fvec3) VectorShuffle 101 101 0 1 2
             103:    7(fvec4) Load 74
             104:    7(fvec4) VectorShuffle 103 102 4 5 6 3
                              Store 74 104
             105:    7(fvec4) Load 74
             106:    7(fvec4) Load 94
             107:    7(fvec4) FMul 105 106
                              Store 9 107
             108:    6(float) Load 55
             109:     54(ptr) AccessChain 9 66
             110:    6(float) Load 109
             111:    6(float) FMul 108 110
                              Store 55 111
             114:    7(fvec4) Load 9
             115:  100(fvec3) VectorShuffle 114 114 0 1 2
             116:    6(float) Load 55
             117:  100(fvec3) CompositeConstruct 116 116 116
             118:  100(fvec3) FMul 115 117
             119:    7(fvec4) Load 113
             120:    7(fvec4) VectorShuffle 119 118 4 5 6 3
                              Store 113 120
             121:    6(float) Load 55
             123:    122(ptr) AccessChain 113 66
                              Store 123 121
                              Return
                              FunctionEnd

Disassembly for Hull:
Not present.



//////////////////////////////////////////////////////
Keywords: UNITY_UI_CLIP_RECT
-- Hardware tier variant: Tier 2
-- Vertex shader for "vulkan":
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord0"

Set 2D Texture "_MainTex" to set: 0, binding: 1, used in: Fragment  using sampler in set: 0, binding: 0, used in: Fragment 

Constant Buffer "PGlobals2928291404" (32 bytes) on set: 1, binding: 0, used in: Fragment  {
  Vector4 _ClipRect at 16
  Vector4 _TextureSampleAdd at 0
}
Constant Buffer "VGlobals2928291404" (264 bytes) on set: 1, binding: 1, used in: Vertex  {
  Matrix4x4 glstate_matrix_projection at 80
  Matrix4x4 unity_MatrixVP at 144
  Matrix4x4 unity_ObjectToWorld at 16
  Vector4 _ClipRect at 224
  Vector4 _Color at 208
  Vector4 _MainTex_ST at 240
  Vector4 _ScreenParams at 0
  Float _UIMaskSoftnessX at 256
  Float _UIMaskSoftnessY at 260
}

Shader Disassembly:
Disassembly for Vertex:
// Module Version 10000
// Generated by (magic number): 80006
// Id's are bound by 208

                              Capability Shader
               1:             ExtInstImport  "GLSL.std.450"
                              MemoryModel Logical GLSL450
                              EntryPoint Vertex 4  "main" 11 80 84 90 94 96 107 155
                              Name 94  "vs_TEXCOORD0"
                              Name 107  "vs_TEXCOORD1"
                              Name 155  "vs_TEXCOORD2"
                              Decorate 11 Location 0
                              Decorate 16 ArrayStride 16
                              Decorate 17 ArrayStride 16
                              Decorate 18 ArrayStride 16
                              MemberDecorate 19 0 Offset 0
                              MemberDecorate 19 1 Offset 16
                              MemberDecorate 19 2 Offset 80
                              MemberDecorate 19 3 Offset 144
                              MemberDecorate 19 4 RelaxedPrecision
                              MemberDecorate 19 4 Offset 208
                              MemberDecorate 19 5 Offset 224
                              MemberDecorate 19 6 Offset 240
                              MemberDecorate 19 7 Offset 256
                              MemberDecorate 19 8 Offset 260
                              Decorate 19 Block
                              Decorate 21 DescriptorSet 1
                              Decorate 21 Binding 1
                              MemberDecorate 78 0 BuiltIn Position
                              MemberDecorate 78 1 BuiltIn PointSize
                              MemberDecorate 78 2 BuiltIn ClipDistance
                              Decorate 78 Block
                              Decorate 84 Location 1
                              Decorate 88 RelaxedPrecision
                              Decorate 90 RelaxedPrecision
                              Decorate 90 Location 0
                              Decorate 94(vs_TEXCOORD0) Location 1
                              Decorate 96 Location 2
                              Decorate 107(vs_TEXCOORD1) Location 3
                              Decorate 155(vs_TEXCOORD2) Location 2
               2:             TypeVoid
               3:             TypeFunction 2
               6:             TypeFloat 32
               7:             TypeVector 6(float) 4
               8:             TypePointer Private 7(fvec4)
               9:      8(ptr) Variable Private
              10:             TypePointer Input 7(fvec4)
              11:     10(ptr) Variable Input
              14:             TypeInt 32 0
              15:     14(int) Constant 4
              16:             TypeArray 7(fvec4) 15
              17:             TypeArray 7(fvec4) 15
              18:             TypeArray 7(fvec4) 15
              19:             TypeStruct 7(fvec4) 16 17 18 7(fvec4) 7(fvec4) 7(fvec4) 6(float) 6(float)
              20:             TypePointer Uniform 19(struct)
              21:     20(ptr) Variable Uniform
              22:             TypeInt 32 1
              23:     22(int) Constant 1
              24:             TypePointer Uniform 7(fvec4)
              28:     22(int) Constant 0
              36:     22(int) Constant 2
              45:     22(int) Constant 3
              49:      8(ptr) Variable Private
              76:     14(int) Constant 1
              77:             TypeArray 6(float) 76
              78:             TypeStruct 7(fvec4) 6(float) 77
              79:             TypePointer Output 78(struct)
              80:     79(ptr) Variable Output
              82:             TypePointer Output 7(fvec4)
              84:     10(ptr) Variable Input
              86:     22(int) Constant 4
              90:     82(ptr) Variable Output
              92:             TypeVector 6(float) 2
              93:             TypePointer Output 92(fvec2)
94(vs_TEXCOORD0):     93(ptr) Variable Output
              95:             TypePointer Input 92(fvec2)
              96:     95(ptr) Variable Input
              98:     22(int) Constant 6
107(vs_TEXCOORD1):     82(ptr) Variable Output
             138:     22(int) Constant 7
             139:             TypePointer Uniform 6(float)
             142:     22(int) Constant 8
             146:    6(float) Constant 1048576000
             147:   92(fvec2) ConstantComposite 146 146
155(vs_TEXCOORD2):     82(ptr) Variable Output
             161:     22(int) Constant 5
             164:    6(float) Constant 3499426553
             165:    7(fvec4) ConstantComposite 164 164 164 164
             168:    6(float) Constant 1351942905
             169:    7(fvec4) ConstantComposite 168 168 168 168
             173:    6(float) Constant 1073741824
             174:   92(fvec2) ConstantComposite 173 173
             190:             TypePointer Output 6(float)
             196:             TypePointer Function 7(fvec4)
             198:             TypeVector 22(int) 4
             199:             TypePointer Function 198(ivec4)
             201:             TypeBool
             202:             TypeVector 201(bool) 4
             203:             TypePointer Function 202(bvec4)
             205:             TypeVector 14(int) 4
             206:             TypePointer Function 205(ivec4)
               4:           2 Function None 3
               5:             Label
             197:    196(ptr) Variable Function
             200:    199(ptr) Variable Function
             204:    203(ptr) Variable Function
             207:    206(ptr) Variable Function
              12:    7(fvec4) Load 11
              13:    7(fvec4) VectorShuffle 12 12 1 1 1 1
              25:     24(ptr) AccessChain 21 23 23
              26:    7(fvec4) Load 25
              27:    7(fvec4) FMul 13 26
                              Store 9 27
              29:     24(ptr) AccessChain 21 23 28
              30:    7(fvec4) Load 29
              31:    7(fvec4) Load 11
              32:    7(fvec4) VectorShuffle 31 31 0 0 0 0
              33:    7(fvec4) FMul 30 32
              34:    7(fvec4) Load 9
              35:    7(fvec4) FAdd 33 34
                              Store 9 35
              37:     24(ptr) AccessChain 21 23 36
              38:    7(fvec4) Load 37
              39:    7(fvec4) Load 11
              40:    7(fvec4) VectorShuffle 39 39 2 2 2 2
              41:    7(fvec4) FMul 38 40
              42:    7(fvec4) Load 9
              43:    7(fvec4) FAdd 41 42
                              Store 9 43
              44:    7(fvec4) Load 9
              46:     24(ptr) AccessChain 21 23 45
              47:    7(fvec4) Load 46
              48:    7(fvec4) FAdd 44 47
                              Store 9 48
              50:    7(fvec4) Load 9
              51:    7(fvec4) VectorShuffle 50 50 1 1 1 1
              52:     24(ptr) AccessChain 21 45 23
              53:    7(fvec4) Load 52
              54:    7(fvec4) FMul 51 53
                              Store 49 54
              55:     24(ptr) AccessChain 21 45 28
              56:    7(fvec4) Load 55
              57:    7(fvec4) Load 9
              58:    7(fvec4) VectorShuffle 57 57 0 0 0 0
              59:    7(fvec4) FMul 56 58
              60:    7(fvec4) Load 49
              61:    7(fvec4) FAdd 59 60
                              Store 49 61
              62:     24(ptr) AccessChain 21 45 36
              63:    7(fvec4) Load 62
              64:    7(fvec4) Load 9
              65:    7(fvec4) VectorShuffle 64 64 2 2 2 2
              66:    7(fvec4) FMul 63 65
              67:    7(fvec4) Load 49
              68:    7(fvec4) FAdd 66 67
                              Store 49 68
              69:     24(ptr) AccessChain 21 45 45
              70:    7(fvec4) Load 69
              71:    7(fvec4) Load 9
              72:    7(fvec4) VectorShuffle 71 71 3 3 3 3
              73:    7(fvec4) FMul 70 72
              74:    7(fvec4) Load 49
              75:    7(fvec4) FAdd 73 74
                              Store 9 75
              81:    7(fvec4) Load 9
              83:     82(ptr) AccessChain 80 28
                              Store 83 81
              85:    7(fvec4) Load 84
              87:     24(ptr) AccessChain 21 86
              88:    7(fvec4) Load 87
              89:    7(fvec4) FMul 85 88
                              Store 49 89
              91:    7(fvec4) Load 49
                              Store 90 91
              97:   92(fvec2) Load 96
              99:     24(ptr) AccessChain 21 98
             100:    7(fvec4) Load 99
             101:   92(fvec2) VectorShuffle 100 100 0 1
             102:   92(fvec2) FMul 97 101
             103:     24(ptr) AccessChain 21 98
             104:    7(fvec4) Load 103
             105:   92(fvec2) VectorShuffle 104 104 2 3
             106:   92(fvec2) FAdd 102 105
                              Store 94(vs_TEXCOORD0) 106
             108:    7(fvec4) Load 11
                              Store 107(vs_TEXCOORD1) 108
             109:     24(ptr) AccessChain 21 28
             110:    7(fvec4) Load 109
             111:   92(fvec2) VectorShuffle 110 110 1 1
             112:     24(ptr) AccessChain 21 36 23
             113:    7(fvec4) Load 112
             114:   92(fvec2) VectorShuffle 113 113 0 1
             115:   92(fvec2) FMul 111 114
             116:    7(fvec4) Load 9
             117:    7(fvec4) VectorShuffle 116 115 4 5 2 3
                              Store 9 117
             118:     24(ptr) AccessChain 21 36 28
             119:    7(fvec4) Load 118
             120:   92(fvec2) VectorShuffle 119 119 0 1
             121:     24(ptr) AccessChain 21 28
             122:    7(fvec4) Load 121
             123:   92(fvec2) VectorShuffle 122 122 0 0
             124:   92(fvec2) FMul 120 123
             125:    7(fvec4) Load 9
             126:   92(fvec2) VectorShuffle 125 125 0 1
             127:   92(fvec2) FAdd 124 126
             128:    7(fvec4) Load 9
             129:    7(fvec4) VectorShuffle 128 127 4 5 2 3
                              Store 9 129
             130:    7(fvec4) Load 9
             131:   92(fvec2) VectorShuffle 130 130 3 3
             132:    7(fvec4) Load 9
             133:   92(fvec2) VectorShuffle 132 132 0 1
             134:   92(fvec2) ExtInst 1(GLSL.std.450) 4(FAbs) 133
             135:   92(fvec2) FDiv 131 134
             136:    7(fvec4) Load 9
             137:    7(fvec4) VectorShuffle 136 135 4 5 2 3
                              Store 9 137
             140:    139(ptr) AccessChain 21 138
             141:    6(float) Load 140
             143:    139(ptr) AccessChain 21 142
             144:    6(float) Load 143
             145:   92(fvec2) CompositeConstruct 141 144
             148:   92(fvec2) FMul 145 147
             149:    7(fvec4) Load 9
             150:   92(fvec2) VectorShuffle 149 149 0 1
             151:   92(fvec2) ExtInst 1(GLSL.std.450) 4(FAbs) 150
             152:   92(fvec2) FAdd 148 151
             153:    7(fvec4) Load 9
             154:    7(fvec4) VectorShuffle 153 152 4 5 2 3
                              Store 9 154
             156:    7(fvec4) Load 9
             157:   92(fvec2) VectorShuffle 156 156 0 1
             158:   92(fvec2) FDiv 147 157
             159:    7(fvec4) Load 155(vs_TEXCOORD2)
             160:    7(fvec4) VectorShuffle 159 158 0 1 4 5
                              Store 155(vs_TEXCOORD2) 160
             162:     24(ptr) AccessChain 21 161
             163:    7(fvec4) Load 162
             166:    7(fvec4) ExtInst 1(GLSL.std.450) 40(FMax) 163 165
                              Store 9 166
             167:    7(fvec4) Load 9
             170:    7(fvec4) ExtInst 1(GLSL.std.450) 37(FMin) 167 169
                              Store 9 170
             171:    7(fvec4) Load 11
             172:   92(fvec2) VectorShuffle 171 171 0 1
             175:   92(fvec2) FMul 172 174
             176:    7(fvec4) Load 9
             177:   92(fvec2) VectorShuffle 176 176 0 1
             178:   92(fvec2) FNegate 177
             179:   92(fvec2) FAdd 175 178
             180:    7(fvec4) Load 9
             181:    7(fvec4) VectorShuffle 180 179 4 5 2 3
                              Store 9 181
             182:    7(fvec4) Load 9
             183:   92(fvec2) VectorShuffle 182 182 2 3
             184:   92(fvec2) FNegate 183
             185:    7(fvec4) Load 9
             186:   92(fvec2) VectorShuffle 185 185 0 1
             187:   92(fvec2) FAdd 184 186
             188:    7(fvec4) Load 155(vs_TEXCOORD2)
             189:    7(fvec4) VectorShuffle 188 187 4 5 2 3
                              Store 155(vs_TEXCOORD2) 189
             191:    190(ptr) AccessChain 80 28 76
             192:    6(float) Load 191
             193:    6(float) FNegate 192
             194:    190(ptr) AccessChain 80 28 76
                              Store 194 193
                              Return
                              FunctionEnd

Disassembly for Fragment:
// Module Version 10000
// Generated by (magic number): 80006
// Id's are bound by 137

                              Capability Shader
               1:             ExtInstImport  "GLSL.std.450"
                              MemoryModel Logical GLSL450
                              EntryPoint Fragment 4  "main" 30 65 91 113
                              ExecutionMode 4 OriginUpperLeft
                              Name 30  "vs_TEXCOORD2"
                              Name 91  "vs_TEXCOORD0"
                              MemberDecorate 10 0 RelaxedPrecision
                              MemberDecorate 10 0 Offset 0
                              MemberDecorate 10 1 Offset 16
                              Decorate 10 Block
                              Decorate 12 DescriptorSet 1
                              Decorate 12 Binding 0
                              Decorate 30(vs_TEXCOORD2) Location 2
                              Decorate 55 RelaxedPrecision
                              Decorate 64 RelaxedPrecision
                              Decorate 65 RelaxedPrecision
                              Decorate 65 Location 0
                              Decorate 69 RelaxedPrecision
                              Decorate 71 RelaxedPrecision
                              Decorate 72 RelaxedPrecision
                              Decorate 73 RelaxedPrecision
                              Decorate 74 RelaxedPrecision
                              Decorate 75 RelaxedPrecision
                              Decorate 77 RelaxedPrecision
                              Decorate 79 RelaxedPrecision
                              Decorate 82 RelaxedPrecision
                              Decorate 82 DescriptorSet 0
                              Decorate 82 Binding 1
                              Decorate 83 RelaxedPrecision
                              Decorate 86 RelaxedPrecision
                              Decorate 86 DescriptorSet 0
                              Decorate 86 Binding 0
                              Decorate 87 RelaxedPrecision
                              Decorate 91(vs_TEXCOORD0) Location 1
                              Decorate 95 RelaxedPrecision
                              Decorate 98 RelaxedPrecision
                              Decorate 99 RelaxedPrecision
                              Decorate 101 RelaxedPrecision
                              Decorate 102 RelaxedPrecision
                              Decorate 105 RelaxedPrecision
                              Decorate 108 RelaxedPrecision
                              Decorate 113 RelaxedPrecision
                              Decorate 113 Location 0
                              Decorate 116 RelaxedPrecision
                              Decorate 121 RelaxedPrecision
               2:             TypeVoid
               3:             TypeFunction 2
               6:             TypeFloat 32
               7:             TypeVector 6(float) 4
               8:             TypePointer Private 7(fvec4)
               9:      8(ptr) Variable Private
              10:             TypeStruct 7(fvec4) 7(fvec4)
              11:             TypePointer Uniform 10(struct)
              12:     11(ptr) Variable Uniform
              13:             TypeInt 32 1
              14:     13(int) Constant 1
              15:             TypeVector 6(float) 2
              16:             TypePointer Uniform 7(fvec4)
              29:             TypePointer Input 7(fvec4)
30(vs_TEXCOORD2):     29(ptr) Variable Input
              47:    6(float) Constant 0
              48:    6(float) Constant 1065353216
              54:             TypePointer Private 6(float)
              55:     54(ptr) Variable Private
              56:             TypeInt 32 0
              57:     56(int) Constant 1
              60:     56(int) Constant 0
              64:     54(ptr) Variable Private
              65:     29(ptr) Variable Input
              66:     56(int) Constant 3
              67:             TypePointer Input 6(float)
              70:    6(float) Constant 1132396544
              74:      8(ptr) Variable Private
              76:    6(float) Constant 998277249
              79:      8(ptr) Variable Private
              80:             TypeImage 6(float) 2D sampled format:Unknown
              81:             TypePointer UniformConstant 80
              82:     81(ptr) Variable UniformConstant
              84:             TypeSampler
              85:             TypePointer UniformConstant 84
              86:     85(ptr) Variable UniformConstant
              88:             TypeSampledImage 80
              90:             TypePointer Input 15(fvec2)
91(vs_TEXCOORD0):     90(ptr) Variable Input
              94:      8(ptr) Variable Private
              96:     13(int) Constant 0
             100:             TypeVector 6(float) 3
             112:             TypePointer Output 7(fvec4)
             113:    112(ptr) Variable Output
             122:             TypePointer Output 6(float)
             125:             TypePointer Function 7(fvec4)
             127:             TypeVector 13(int) 4
             128:             TypePointer Function 127(ivec4)
             130:             TypeBool
             131:             TypeVector 130(bool) 4
             132:             TypePointer Function 131(bvec4)
             134:             TypeVector 56(int) 4
             135:             TypePointer Function 134(ivec4)
               4:           2 Function None 3
               5:             Label
             126:    125(ptr) Variable Function
             129:    128(ptr) Variable Function
             133:    132(ptr) Variable Function
             136:    135(ptr) Variable Function
              17:     16(ptr) AccessChain 12 14
              18:    7(fvec4) Load 17
              19:   15(fvec2) VectorShuffle 18 18 0 1
              20:   15(fvec2) FNegate 19
              21:     16(ptr) AccessChain 12 14
              22:    7(fvec4) Load 21
              23:   15(fvec2) VectorShuffle 22 22 2 3
              24:   15(fvec2) FAdd 20 23
              25:    7(fvec4) Load 9
              26:    7(fvec4) VectorShuffle 25 24 4 5 2 3
                              Store 9 26
              27:    7(fvec4) Load 9
              28:   15(fvec2) VectorShuffle 27 27 0 1
              31:    7(fvec4) Load 30(vs_TEXCOORD2)
              32:   15(fvec2) VectorShuffle 31 31 0 1
              33:   15(fvec2) ExtInst 1(GLSL.std.450) 4(FAbs) 32
              34:   15(fvec2) FNegate 33
              35:   15(fvec2) FAdd 28 34
              36:    7(fvec4) Load 9
              37:    7(fvec4) VectorShuffle 36 35 4 5 2 3
                              Store 9 37
              38:    7(fvec4) Load 9
              39:   15(fvec2) VectorShuffle 38 38 0 1
              40:    7(fvec4) Load 30(vs_TEXCOORD2)
              41:   15(fvec2) VectorShuffle 40 40 2 3
              42:   15(fvec2) FMul 39 41
              43:    7(fvec4) Load 9
              44:    7(fvec4) VectorShuffle 43 42 4 5 2 3
                              Store 9 44
              45:    7(fvec4) Load 9
              46:   15(fvec2) VectorShuffle 45 45 0 1
              49:   15(fvec2) CompositeConstruct 47 47
              50:   15(fvec2) CompositeConstruct 48 48
              51:   15(fvec2) ExtInst 1(GLSL.std.450) 43(FClamp) 46 49 50
              52:    7(fvec4) Load 9
              53:    7(fvec4) VectorShuffle 52 51 4 5 2 3
                              Store 9 53
              58:     54(ptr) AccessChain 9 57
              59:    6(float) Load 58
              61:     54(ptr) AccessChain 9 60
              62:    6(float) Load 61
              63:    6(float) FMul 59 62
                              Store 55 63
              68:     67(ptr) AccessChain 65 66
              69:    6(float) Load 68
              71:    6(float) FMul 69 70
                              Store 64 71
              72:    6(float) Load 64
              73:    6(float) ExtInst 1(GLSL.std.450) 2(RoundEven) 72
                              Store 64 73
              75:    6(float) Load 64
              77:    6(float) FMul 75 76
              78:     54(ptr) AccessChain 74 66
                              Store 78 77
              83:          80 Load 82
              87:          84 Load 86
              89:          88 SampledImage 83 87
              92:   15(fvec2) Load 91(vs_TEXCOORD0)
              93:    7(fvec4) ImageSampleImplicitLod 89 92
                              Store 79 93
              95:    7(fvec4) Load 79
              97:     16(ptr) AccessChain 12 96
              98:    7(fvec4) Load 97
              99:    7(fvec4) FAdd 95 98
                              Store 94 99
             101:    7(fvec4) Load 65
             102:  100(fvec3) VectorShuffle 101 101 0 1 2
             103:    7(fvec4) Load 74
             104:    7(fvec4) VectorShuffle 103 102 4 5 6 3
                              Store 74 104
             105:    7(fvec4) Load 74
             106:    7(fvec4) Load 94
             107:    7(fvec4) FMul 105 106
                              Store 9 107
             108:    6(float) Load 55
             109:     54(ptr) AccessChain 9 66
             110:    6(float) Load 109
             111:    6(float) FMul 108 110
                              Store 55 111
             114:    7(fvec4) Load 9
             115:  100(fvec3) VectorShuffle 114 114 0 1 2
             116:    6(float) Load 55
             117:  100(fvec3) CompositeConstruct 116 116 116
             118:  100(fvec3) FMul 115 117
             119:    7(fvec4) Load 113
             120:    7(fvec4) VectorShuffle 119 118 4 5 6 3
                              Store 113 120
             121:    6(float) Load 55
             123:    122(ptr) AccessChain 113 66
                              Store 123 121
                              Return
                              FunctionEnd

Disassembly for Hull:
Not present.



//////////////////////////////////////////////////////
Keywords: UNITY_UI_CLIP_RECT
-- Hardware tier variant: Tier 3
-- Vertex shader for "vulkan":
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord0"

Set 2D Texture "_MainTex" to set: 0, binding: 1, used in: Fragment  using sampler in set: 0, binding: 0, used in: Fragment 

Constant Buffer "PGlobals2928291404" (32 bytes) on set: 1, binding: 0, used in: Fragment  {
  Vector4 _ClipRect at 16
  Vector4 _TextureSampleAdd at 0
}
Constant Buffer "VGlobals2928291404" (264 bytes) on set: 1, binding: 1, used in: Vertex  {
  Matrix4x4 glstate_matrix_projection at 80
  Matrix4x4 unity_MatrixVP at 144
  Matrix4x4 unity_ObjectToWorld at 16
  Vector4 _ClipRect at 224
  Vector4 _Color at 208
  Vector4 _MainTex_ST at 240
  Vector4 _ScreenParams at 0
  Float _UIMaskSoftnessX at 256
  Float _UIMaskSoftnessY at 260
}

Shader Disassembly:
Disassembly for Vertex:
// Module Version 10000
// Generated by (magic number): 80006
// Id's are bound by 208

                              Capability Shader
               1:             ExtInstImport  "GLSL.std.450"
                              MemoryModel Logical GLSL450
                              EntryPoint Vertex 4  "main" 11 80 84 90 94 96 107 155
                              Name 94  "vs_TEXCOORD0"
                              Name 107  "vs_TEXCOORD1"
                              Name 155  "vs_TEXCOORD2"
                              Decorate 11 Location 0
                              Decorate 16 ArrayStride 16
                              Decorate 17 ArrayStride 16
                              Decorate 18 ArrayStride 16
                              MemberDecorate 19 0 Offset 0
                              MemberDecorate 19 1 Offset 16
                              MemberDecorate 19 2 Offset 80
                              MemberDecorate 19 3 Offset 144
                              MemberDecorate 19 4 RelaxedPrecision
                              MemberDecorate 19 4 Offset 208
                              MemberDecorate 19 5 Offset 224
                              MemberDecorate 19 6 Offset 240
                              MemberDecorate 19 7 Offset 256
                              MemberDecorate 19 8 Offset 260
                              Decorate 19 Block
                              Decorate 21 DescriptorSet 1
                              Decorate 21 Binding 1
                              MemberDecorate 78 0 BuiltIn Position
                              MemberDecorate 78 1 BuiltIn PointSize
                              MemberDecorate 78 2 BuiltIn ClipDistance
                              Decorate 78 Block
                              Decorate 84 Location 1
                              Decorate 88 RelaxedPrecision
                              Decorate 90 RelaxedPrecision
                              Decorate 90 Location 0
                              Decorate 94(vs_TEXCOORD0) Location 1
                              Decorate 96 Location 2
                              Decorate 107(vs_TEXCOORD1) Location 3
                              Decorate 155(vs_TEXCOORD2) Location 2
               2:             TypeVoid
               3:             TypeFunction 2
               6:             TypeFloat 32
               7:             TypeVector 6(float) 4
               8:             TypePointer Private 7(fvec4)
               9:      8(ptr) Variable Private
              10:             TypePointer Input 7(fvec4)
              11:     10(ptr) Variable Input
              14:             TypeInt 32 0
              15:     14(int) Constant 4
              16:             TypeArray 7(fvec4) 15
              17:             TypeArray 7(fvec4) 15
              18:             TypeArray 7(fvec4) 15
              19:             TypeStruct 7(fvec4) 16 17 18 7(fvec4) 7(fvec4) 7(fvec4) 6(float) 6(float)
              20:             TypePointer Uniform 19(struct)
              21:     20(ptr) Variable Uniform
              22:             TypeInt 32 1
              23:     22(int) Constant 1
              24:             TypePointer Uniform 7(fvec4)
              28:     22(int) Constant 0
              36:     22(int) Constant 2
              45:     22(int) Constant 3
              49:      8(ptr) Variable Private
              76:     14(int) Constant 1
              77:             TypeArray 6(float) 76
              78:             TypeStruct 7(fvec4) 6(float) 77
              79:             TypePointer Output 78(struct)
              80:     79(ptr) Variable Output
              82:             TypePointer Output 7(fvec4)
              84:     10(ptr) Variable Input
              86:     22(int) Constant 4
              90:     82(ptr) Variable Output
              92:             TypeVector 6(float) 2
              93:             TypePointer Output 92(fvec2)
94(vs_TEXCOORD0):     93(ptr) Variable Output
              95:             TypePointer Input 92(fvec2)
              96:     95(ptr) Variable Input
              98:     22(int) Constant 6
107(vs_TEXCOORD1):     82(ptr) Variable Output
             138:     22(int) Constant 7
             139:             TypePointer Uniform 6(float)
             142:     22(int) Constant 8
             146:    6(float) Constant 1048576000
             147:   92(fvec2) ConstantComposite 146 146
155(vs_TEXCOORD2):     82(ptr) Variable Output
             161:     22(int) Constant 5
             164:    6(float) Constant 3499426553
             165:    7(fvec4) ConstantComposite 164 164 164 164
             168:    6(float) Constant 1351942905
             169:    7(fvec4) ConstantComposite 168 168 168 168
             173:    6(float) Constant 1073741824
             174:   92(fvec2) ConstantComposite 173 173
             190:             TypePointer Output 6(float)
             196:             TypePointer Function 7(fvec4)
             198:             TypeVector 22(int) 4
             199:             TypePointer Function 198(ivec4)
             201:             TypeBool
             202:             TypeVector 201(bool) 4
             203:             TypePointer Function 202(bvec4)
             205:             TypeVector 14(int) 4
             206:             TypePointer Function 205(ivec4)
               4:           2 Function None 3
               5:             Label
             197:    196(ptr) Variable Function
             200:    199(ptr) Variable Function
             204:    203(ptr) Variable Function
             207:    206(ptr) Variable Function
              12:    7(fvec4) Load 11
              13:    7(fvec4) VectorShuffle 12 12 1 1 1 1
              25:     24(ptr) AccessChain 21 23 23
              26:    7(fvec4) Load 25
              27:    7(fvec4) FMul 13 26
                              Store 9 27
              29:     24(ptr) AccessChain 21 23 28
              30:    7(fvec4) Load 29
              31:    7(fvec4) Load 11
              32:    7(fvec4) VectorShuffle 31 31 0 0 0 0
              33:    7(fvec4) FMul 30 32
              34:    7(fvec4) Load 9
              35:    7(fvec4) FAdd 33 34
                              Store 9 35
              37:     24(ptr) AccessChain 21 23 36
              38:    7(fvec4) Load 37
              39:    7(fvec4) Load 11
              40:    7(fvec4) VectorShuffle 39 39 2 2 2 2
              41:    7(fvec4) FMul 38 40
              42:    7(fvec4) Load 9
              43:    7(fvec4) FAdd 41 42
                              Store 9 43
              44:    7(fvec4) Load 9
              46:     24(ptr) AccessChain 21 23 45
              47:    7(fvec4) Load 46
              48:    7(fvec4) FAdd 44 47
                              Store 9 48
              50:    7(fvec4) Load 9
              51:    7(fvec4) VectorShuffle 50 50 1 1 1 1
              52:     24(ptr) AccessChain 21 45 23
              53:    7(fvec4) Load 52
              54:    7(fvec4) FMul 51 53
                              Store 49 54
              55:     24(ptr) AccessChain 21 45 28
              56:    7(fvec4) Load 55
              57:    7(fvec4) Load 9
              58:    7(fvec4) VectorShuffle 57 57 0 0 0 0
              59:    7(fvec4) FMul 56 58
              60:    7(fvec4) Load 49
              61:    7(fvec4) FAdd 59 60
                              Store 49 61
              62:     24(ptr) AccessChain 21 45 36
              63:    7(fvec4) Load 62
              64:    7(fvec4) Load 9
              65:    7(fvec4) VectorShuffle 64 64 2 2 2 2
              66:    7(fvec4) FMul 63 65
              67:    7(fvec4) Load 49
              68:    7(fvec4) FAdd 66 67
                              Store 49 68
              69:     24(ptr) AccessChain 21 45 45
              70:    7(fvec4) Load 69
              71:    7(fvec4) Load 9
              72:    7(fvec4) VectorShuffle 71 71 3 3 3 3
              73:    7(fvec4) FMul 70 72
              74:    7(fvec4) Load 49
              75:    7(fvec4) FAdd 73 74
                              Store 9 75
              81:    7(fvec4) Load 9
              83:     82(ptr) AccessChain 80 28
                              Store 83 81
              85:    7(fvec4) Load 84
              87:     24(ptr) AccessChain 21 86
              88:    7(fvec4) Load 87
              89:    7(fvec4) FMul 85 88
                              Store 49 89
              91:    7(fvec4) Load 49
                              Store 90 91
              97:   92(fvec2) Load 96
              99:     24(ptr) AccessChain 21 98
             100:    7(fvec4) Load 99
             101:   92(fvec2) VectorShuffle 100 100 0 1
             102:   92(fvec2) FMul 97 101
             103:     24(ptr) AccessChain 21 98
             104:    7(fvec4) Load 103
             105:   92(fvec2) VectorShuffle 104 104 2 3
             106:   92(fvec2) FAdd 102 105
                              Store 94(vs_TEXCOORD0) 106
             108:    7(fvec4) Load 11
                              Store 107(vs_TEXCOORD1) 108
             109:     24(ptr) AccessChain 21 28
             110:    7(fvec4) Load 109
             111:   92(fvec2) VectorShuffle 110 110 1 1
             112:     24(ptr) AccessChain 21 36 23
             113:    7(fvec4) Load 112
             114:   92(fvec2) VectorShuffle 113 113 0 1
             115:   92(fvec2) FMul 111 114
             116:    7(fvec4) Load 9
             117:    7(fvec4) VectorShuffle 116 115 4 5 2 3
                              Store 9 117
             118:     24(ptr) AccessChain 21 36 28
             119:    7(fvec4) Load 118
             120:   92(fvec2) VectorShuffle 119 119 0 1
             121:     24(ptr) AccessChain 21 28
             122:    7(fvec4) Load 121
             123:   92(fvec2) VectorShuffle 122 122 0 0
             124:   92(fvec2) FMul 120 123
             125:    7(fvec4) Load 9
             126:   92(fvec2) VectorShuffle 125 125 0 1
             127:   92(fvec2) FAdd 124 126
             128:    7(fvec4) Load 9
             129:    7(fvec4) VectorShuffle 128 127 4 5 2 3
                              Store 9 129
             130:    7(fvec4) Load 9
             131:   92(fvec2) VectorShuffle 130 130 3 3
             132:    7(fvec4) Load 9
             133:   92(fvec2) VectorShuffle 132 132 0 1
             134:   92(fvec2) ExtInst 1(GLSL.std.450) 4(FAbs) 133
             135:   92(fvec2) FDiv 131 134
             136:    7(fvec4) Load 9
             137:    7(fvec4) VectorShuffle 136 135 4 5 2 3
                              Store 9 137
             140:    139(ptr) AccessChain 21 138
             141:    6(float) Load 140
             143:    139(ptr) AccessChain 21 142
             144:    6(float) Load 143
             145:   92(fvec2) CompositeConstruct 141 144
             148:   92(fvec2) FMul 145 147
             149:    7(fvec4) Load 9
             150:   92(fvec2) VectorShuffle 149 149 0 1
             151:   92(fvec2) ExtInst 1(GLSL.std.450) 4(FAbs) 150
             152:   92(fvec2) FAdd 148 151
             153:    7(fvec4) Load 9
             154:    7(fvec4) VectorShuffle 153 152 4 5 2 3
                              Store 9 154
             156:    7(fvec4) Load 9
             157:   92(fvec2) VectorShuffle 156 156 0 1
             158:   92(fvec2) FDiv 147 157
             159:    7(fvec4) Load 155(vs_TEXCOORD2)
             160:    7(fvec4) VectorShuffle 159 158 0 1 4 5
                              Store 155(vs_TEXCOORD2) 160
             162:     24(ptr) AccessChain 21 161
             163:    7(fvec4) Load 162
             166:    7(fvec4) ExtInst 1(GLSL.std.450) 40(FMax) 163 165
                              Store 9 166
             167:    7(fvec4) Load 9
             170:    7(fvec4) ExtInst 1(GLSL.std.450) 37(FMin) 167 169
                              Store 9 170
             171:    7(fvec4) Load 11
             172:   92(fvec2) VectorShuffle 171 171 0 1
             175:   92(fvec2) FMul 172 174
             176:    7(fvec4) Load 9
             177:   92(fvec2) VectorShuffle 176 176 0 1
             178:   92(fvec2) FNegate 177
             179:   92(fvec2) FAdd 175 178
             180:    7(fvec4) Load 9
             181:    7(fvec4) VectorShuffle 180 179 4 5 2 3
                              Store 9 181
             182:    7(fvec4) Load 9
             183:   92(fvec2) VectorShuffle 182 182 2 3
             184:   92(fvec2) FNegate 183
             185:    7(fvec4) Load 9
             186:   92(fvec2) VectorShuffle 185 185 0 1
             187:   92(fvec2) FAdd 184 186
             188:    7(fvec4) Load 155(vs_TEXCOORD2)
             189:    7(fvec4) VectorShuffle 188 187 4 5 2 3
                              Store 155(vs_TEXCOORD2) 189
             191:    190(ptr) AccessChain 80 28 76
             192:    6(float) Load 191
             193:    6(float) FNegate 192
             194:    190(ptr) AccessChain 80 28 76
                              Store 194 193
                              Return
                              FunctionEnd

Disassembly for Fragment:
// Module Version 10000
// Generated by (magic number): 80006
// Id's are bound by 137

                              Capability Shader
               1:             ExtInstImport  "GLSL.std.450"
                              MemoryModel Logical GLSL450
                              EntryPoint Fragment 4  "main" 30 65 91 113
                              ExecutionMode 4 OriginUpperLeft
                              Name 30  "vs_TEXCOORD2"
                              Name 91  "vs_TEXCOORD0"
                              MemberDecorate 10 0 RelaxedPrecision
                              MemberDecorate 10 0 Offset 0
                              MemberDecorate 10 1 Offset 16
                              Decorate 10 Block
                              Decorate 12 DescriptorSet 1
                              Decorate 12 Binding 0
                              Decorate 30(vs_TEXCOORD2) Location 2
                              Decorate 55 RelaxedPrecision
                              Decorate 64 RelaxedPrecision
                              Decorate 65 RelaxedPrecision
                              Decorate 65 Location 0
                              Decorate 69 RelaxedPrecision
                              Decorate 71 RelaxedPrecision
                              Decorate 72 RelaxedPrecision
                              Decorate 73 RelaxedPrecision
                              Decorate 74 RelaxedPrecision
                              Decorate 75 RelaxedPrecision
                              Decorate 77 RelaxedPrecision
                              Decorate 79 RelaxedPrecision
                              Decorate 82 RelaxedPrecision
                              Decorate 82 DescriptorSet 0
                              Decorate 82 Binding 1
                              Decorate 83 RelaxedPrecision
                              Decorate 86 RelaxedPrecision
                              Decorate 86 DescriptorSet 0
                              Decorate 86 Binding 0
                              Decorate 87 RelaxedPrecision
                              Decorate 91(vs_TEXCOORD0) Location 1
                              Decorate 95 RelaxedPrecision
                              Decorate 98 RelaxedPrecision
                              Decorate 99 RelaxedPrecision
                              Decorate 101 RelaxedPrecision
                              Decorate 102 RelaxedPrecision
                              Decorate 105 RelaxedPrecision
                              Decorate 108 RelaxedPrecision
                              Decorate 113 RelaxedPrecision
                              Decorate 113 Location 0
                              Decorate 116 RelaxedPrecision
                              Decorate 121 RelaxedPrecision
               2:             TypeVoid
               3:             TypeFunction 2
               6:             TypeFloat 32
               7:             TypeVector 6(float) 4
               8:             TypePointer Private 7(fvec4)
               9:      8(ptr) Variable Private
              10:             TypeStruct 7(fvec4) 7(fvec4)
              11:             TypePointer Uniform 10(struct)
              12:     11(ptr) Variable Uniform
              13:             TypeInt 32 1
              14:     13(int) Constant 1
              15:             TypeVector 6(float) 2
              16:             TypePointer Uniform 7(fvec4)
              29:             TypePointer Input 7(fvec4)
30(vs_TEXCOORD2):     29(ptr) Variable Input
              47:    6(float) Constant 0
              48:    6(float) Constant 1065353216
              54:             TypePointer Private 6(float)
              55:     54(ptr) Variable Private
              56:             TypeInt 32 0
              57:     56(int) Constant 1
              60:     56(int) Constant 0
              64:     54(ptr) Variable Private
              65:     29(ptr) Variable Input
              66:     56(int) Constant 3
              67:             TypePointer Input 6(float)
              70:    6(float) Constant 1132396544
              74:      8(ptr) Variable Private
              76:    6(float) Constant 998277249
              79:      8(ptr) Variable Private
              80:             TypeImage 6(float) 2D sampled format:Unknown
              81:             TypePointer UniformConstant 80
              82:     81(ptr) Variable UniformConstant
              84:             TypeSampler
              85:             TypePointer UniformConstant 84
              86:     85(ptr) Variable UniformConstant
              88:             TypeSampledImage 80
              90:             TypePointer Input 15(fvec2)
91(vs_TEXCOORD0):     90(ptr) Variable Input
              94:      8(ptr) Variable Private
              96:     13(int) Constant 0
             100:             TypeVector 6(float) 3
             112:             TypePointer Output 7(fvec4)
             113:    112(ptr) Variable Output
             122:             TypePointer Output 6(float)
             125:             TypePointer Function 7(fvec4)
             127:             TypeVector 13(int) 4
             128:             TypePointer Function 127(ivec4)
             130:             TypeBool
             131:             TypeVector 130(bool) 4
             132:             TypePointer Function 131(bvec4)
             134:             TypeVector 56(int) 4
             135:             TypePointer Function 134(ivec4)
               4:           2 Function None 3
               5:             Label
             126:    125(ptr) Variable Function
             129:    128(ptr) Variable Function
             133:    132(ptr) Variable Function
             136:    135(ptr) Variable Function
              17:     16(ptr) AccessChain 12 14
              18:    7(fvec4) Load 17
              19:   15(fvec2) VectorShuffle 18 18 0 1
              20:   15(fvec2) FNegate 19
              21:     16(ptr) AccessChain 12 14
              22:    7(fvec4) Load 21
              23:   15(fvec2) VectorShuffle 22 22 2 3
              24:   15(fvec2) FAdd 20 23
              25:    7(fvec4) Load 9
              26:    7(fvec4) VectorShuffle 25 24 4 5 2 3
                              Store 9 26
              27:    7(fvec4) Load 9
              28:   15(fvec2) VectorShuffle 27 27 0 1
              31:    7(fvec4) Load 30(vs_TEXCOORD2)
              32:   15(fvec2) VectorShuffle 31 31 0 1
              33:   15(fvec2) ExtInst 1(GLSL.std.450) 4(FAbs) 32
              34:   15(fvec2) FNegate 33
              35:   15(fvec2) FAdd 28 34
              36:    7(fvec4) Load 9
              37:    7(fvec4) VectorShuffle 36 35 4 5 2 3
                              Store 9 37
              38:    7(fvec4) Load 9
              39:   15(fvec2) VectorShuffle 38 38 0 1
              40:    7(fvec4) Load 30(vs_TEXCOORD2)
              41:   15(fvec2) VectorShuffle 40 40 2 3
              42:   15(fvec2) FMul 39 41
              43:    7(fvec4) Load 9
              44:    7(fvec4) VectorShuffle 43 42 4 5 2 3
                              Store 9 44
              45:    7(fvec4) Load 9
              46:   15(fvec2) VectorShuffle 45 45 0 1
              49:   15(fvec2) CompositeConstruct 47 47
              50:   15(fvec2) CompositeConstruct 48 48
              51:   15(fvec2) ExtInst 1(GLSL.std.450) 43(FClamp) 46 49 50
              52:    7(fvec4) Load 9
              53:    7(fvec4) VectorShuffle 52 51 4 5 2 3
                              Store 9 53
              58:     54(ptr) AccessChain 9 57
              59:    6(float) Load 58
              61:     54(ptr) AccessChain 9 60
              62:    6(float) Load 61
              63:    6(float) FMul 59 62
                              Store 55 63
              68:     67(ptr) AccessChain 65 66
              69:    6(float) Load 68
              71:    6(float) FMul 69 70
                              Store 64 71
              72:    6(float) Load 64
              73:    6(float) ExtInst 1(GLSL.std.450) 2(RoundEven) 72
                              Store 64 73
              75:    6(float) Load 64
              77:    6(float) FMul 75 76
              78:     54(ptr) AccessChain 74 66
                              Store 78 77
              83:          80 Load 82
              87:          84 Load 86
              89:          88 SampledImage 83 87
              92:   15(fvec2) Load 91(vs_TEXCOORD0)
              93:    7(fvec4) ImageSampleImplicitLod 89 92
                              Store 79 93
              95:    7(fvec4) Load 79
              97:     16(ptr) AccessChain 12 96
              98:    7(fvec4) Load 97
              99:    7(fvec4) FAdd 95 98
                              Store 94 99
             101:    7(fvec4) Load 65
             102:  100(fvec3) VectorShuffle 101 101 0 1 2
             103:    7(fvec4) Load 74
             104:    7(fvec4) VectorShuffle 103 102 4 5 6 3
                              Store 74 104
             105:    7(fvec4) Load 74
             106:    7(fvec4) Load 94
             107:    7(fvec4) FMul 105 106
                              Store 9 107
             108:    6(float) Load 55
             109:     54(ptr) AccessChain 9 66
             110:    6(float) Load 109
             111:    6(float) FMul 108 110
                              Store 55 111
             114:    7(fvec4) Load 9
             115:  100(fvec3) VectorShuffle 114 114 0 1 2
             116:    6(float) Load 55
             117:  100(fvec3) CompositeConstruct 116 116 116
             118:  100(fvec3) FMul 115 117
             119:    7(fvec4) Load 113
             120:    7(fvec4) VectorShuffle 119 118 4 5 6 3
                              Store 113 120
             121:    6(float) Load 55
             123:    122(ptr) AccessChain 113 66
                              Store 123 121
                              Return
                              FunctionEnd

Disassembly for Hull:
Not present.



//////////////////////////////////////////////////////
Keywords: UNITY_UI_ALPHACLIP UNITY_UI_CLIP_RECT
-- Hardware tier variant: Tier 1
-- Vertex shader for "vulkan":
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord0"

Set 2D Texture "_MainTex" to set: 0, binding: 1, used in: Fragment  using sampler in set: 0, binding: 0, used in: Fragment 

Constant Buffer "PGlobals2013609244" (32 bytes) on set: 1, binding: 0, used in: Fragment  {
  Vector4 _ClipRect at 16
  Vector4 _TextureSampleAdd at 0
}
Constant Buffer "VGlobals2013609244" (264 bytes) on set: 1, binding: 1, used in: Vertex  {
  Matrix4x4 glstate_matrix_projection at 80
  Matrix4x4 unity_MatrixVP at 144
  Matrix4x4 unity_ObjectToWorld at 16
  Vector4 _ClipRect at 224
  Vector4 _Color at 208
  Vector4 _MainTex_ST at 240
  Vector4 _ScreenParams at 0
  Float _UIMaskSoftnessX at 256
  Float _UIMaskSoftnessY at 260
}

Shader Disassembly:
Disassembly for Vertex:
// Module Version 10000
// Generated by (magic number): 80006
// Id's are bound by 208

                              Capability Shader
               1:             ExtInstImport  "GLSL.std.450"
                              MemoryModel Logical GLSL450
                              EntryPoint Vertex 4  "main" 11 80 84 90 94 96 107 155
                              Name 94  "vs_TEXCOORD0"
                              Name 107  "vs_TEXCOORD1"
                              Name 155  "vs_TEXCOORD2"
                              Decorate 11 Location 0
                              Decorate 16 ArrayStride 16
                              Decorate 17 ArrayStride 16
                              Decorate 18 ArrayStride 16
                              MemberDecorate 19 0 Offset 0
                              MemberDecorate 19 1 Offset 16
                              MemberDecorate 19 2 Offset 80
                              MemberDecorate 19 3 Offset 144
                              MemberDecorate 19 4 RelaxedPrecision
                              MemberDecorate 19 4 Offset 208
                              MemberDecorate 19 5 Offset 224
                              MemberDecorate 19 6 Offset 240
                              MemberDecorate 19 7 Offset 256
                              MemberDecorate 19 8 Offset 260
                              Decorate 19 Block
                              Decorate 21 DescriptorSet 1
                              Decorate 21 Binding 1
                              MemberDecorate 78 0 BuiltIn Position
                              MemberDecorate 78 1 BuiltIn PointSize
                              MemberDecorate 78 2 BuiltIn ClipDistance
                              Decorate 78 Block
                              Decorate 84 Location 1
                              Decorate 88 RelaxedPrecision
                              Decorate 90 RelaxedPrecision
                              Decorate 90 Location 0
                              Decorate 94(vs_TEXCOORD0) Location 1
                              Decorate 96 Location 2
                              Decorate 107(vs_TEXCOORD1) Location 3
                              Decorate 155(vs_TEXCOORD2) Location 2
               2:             TypeVoid
               3:             TypeFunction 2
               6:             TypeFloat 32
               7:             TypeVector 6(float) 4
               8:             TypePointer Private 7(fvec4)
               9:      8(ptr) Variable Private
              10:             TypePointer Input 7(fvec4)
              11:     10(ptr) Variable Input
              14:             TypeInt 32 0
              15:     14(int) Constant 4
              16:             TypeArray 7(fvec4) 15
              17:             TypeArray 7(fvec4) 15
              18:             TypeArray 7(fvec4) 15
              19:             TypeStruct 7(fvec4) 16 17 18 7(fvec4) 7(fvec4) 7(fvec4) 6(float) 6(float)
              20:             TypePointer Uniform 19(struct)
              21:     20(ptr) Variable Uniform
              22:             TypeInt 32 1
              23:     22(int) Constant 1
              24:             TypePointer Uniform 7(fvec4)
              28:     22(int) Constant 0
              36:     22(int) Constant 2
              45:     22(int) Constant 3
              49:      8(ptr) Variable Private
              76:     14(int) Constant 1
              77:             TypeArray 6(float) 76
              78:             TypeStruct 7(fvec4) 6(float) 77
              79:             TypePointer Output 78(struct)
              80:     79(ptr) Variable Output
              82:             TypePointer Output 7(fvec4)
              84:     10(ptr) Variable Input
              86:     22(int) Constant 4
              90:     82(ptr) Variable Output
              92:             TypeVector 6(float) 2
              93:             TypePointer Output 92(fvec2)
94(vs_TEXCOORD0):     93(ptr) Variable Output
              95:             TypePointer Input 92(fvec2)
              96:     95(ptr) Variable Input
              98:     22(int) Constant 6
107(vs_TEXCOORD1):     82(ptr) Variable Output
             138:     22(int) Constant 7
             139:             TypePointer Uniform 6(float)
             142:     22(int) Constant 8
             146:    6(float) Constant 1048576000
             147:   92(fvec2) ConstantComposite 146 146
155(vs_TEXCOORD2):     82(ptr) Variable Output
             161:     22(int) Constant 5
             164:    6(float) Constant 3499426553
             165:    7(fvec4) ConstantComposite 164 164 164 164
             168:    6(float) Constant 1351942905
             169:    7(fvec4) ConstantComposite 168 168 168 168
             173:    6(float) Constant 1073741824
             174:   92(fvec2) ConstantComposite 173 173
             190:             TypePointer Output 6(float)
             196:             TypePointer Function 7(fvec4)
             198:             TypeVector 22(int) 4
             199:             TypePointer Function 198(ivec4)
             201:             TypeBool
             202:             TypeVector 201(bool) 4
             203:             TypePointer Function 202(bvec4)
             205:             TypeVector 14(int) 4
             206:             TypePointer Function 205(ivec4)
               4:           2 Function None 3
               5:             Label
             197:    196(ptr) Variable Function
             200:    199(ptr) Variable Function
             204:    203(ptr) Variable Function
             207:    206(ptr) Variable Function
              12:    7(fvec4) Load 11
              13:    7(fvec4) VectorShuffle 12 12 1 1 1 1
              25:     24(ptr) AccessChain 21 23 23
              26:    7(fvec4) Load 25
              27:    7(fvec4) FMul 13 26
                              Store 9 27
              29:     24(ptr) AccessChain 21 23 28
              30:    7(fvec4) Load 29
              31:    7(fvec4) Load 11
              32:    7(fvec4) VectorShuffle 31 31 0 0 0 0
              33:    7(fvec4) FMul 30 32
              34:    7(fvec4) Load 9
              35:    7(fvec4) FAdd 33 34
                              Store 9 35
              37:     24(ptr) AccessChain 21 23 36
              38:    7(fvec4) Load 37
              39:    7(fvec4) Load 11
              40:    7(fvec4) VectorShuffle 39 39 2 2 2 2
              41:    7(fvec4) FMul 38 40
              42:    7(fvec4) Load 9
              43:    7(fvec4) FAdd 41 42
                              Store 9 43
              44:    7(fvec4) Load 9
              46:     24(ptr) AccessChain 21 23 45
              47:    7(fvec4) Load 46
              48:    7(fvec4) FAdd 44 47
                              Store 9 48
              50:    7(fvec4) Load 9
              51:    7(fvec4) VectorShuffle 50 50 1 1 1 1
              52:     24(ptr) AccessChain 21 45 23
              53:    7(fvec4) Load 52
              54:    7(fvec4) FMul 51 53
                              Store 49 54
              55:     24(ptr) AccessChain 21 45 28
              56:    7(fvec4) Load 55
              57:    7(fvec4) Load 9
              58:    7(fvec4) VectorShuffle 57 57 0 0 0 0
              59:    7(fvec4) FMul 56 58
              60:    7(fvec4) Load 49
              61:    7(fvec4) FAdd 59 60
                              Store 49 61
              62:     24(ptr) AccessChain 21 45 36
              63:    7(fvec4) Load 62
              64:    7(fvec4) Load 9
              65:    7(fvec4) VectorShuffle 64 64 2 2 2 2
              66:    7(fvec4) FMul 63 65
              67:    7(fvec4) Load 49
              68:    7(fvec4) FAdd 66 67
                              Store 49 68
              69:     24(ptr) AccessChain 21 45 45
              70:    7(fvec4) Load 69
              71:    7(fvec4) Load 9
              72:    7(fvec4) VectorShuffle 71 71 3 3 3 3
              73:    7(fvec4) FMul 70 72
              74:    7(fvec4) Load 49
              75:    7(fvec4) FAdd 73 74
                              Store 9 75
              81:    7(fvec4) Load 9
              83:     82(ptr) AccessChain 80 28
                              Store 83 81
              85:    7(fvec4) Load 84
              87:     24(ptr) AccessChain 21 86
              88:    7(fvec4) Load 87
              89:    7(fvec4) FMul 85 88
                              Store 49 89
              91:    7(fvec4) Load 49
                              Store 90 91
              97:   92(fvec2) Load 96
              99:     24(ptr) AccessChain 21 98
             100:    7(fvec4) Load 99
             101:   92(fvec2) VectorShuffle 100 100 0 1
             102:   92(fvec2) FMul 97 101
             103:     24(ptr) AccessChain 21 98
             104:    7(fvec4) Load 103
             105:   92(fvec2) VectorShuffle 104 104 2 3
             106:   92(fvec2) FAdd 102 105
                              Store 94(vs_TEXCOORD0) 106
             108:    7(fvec4) Load 11
                              Store 107(vs_TEXCOORD1) 108
             109:     24(ptr) AccessChain 21 28
             110:    7(fvec4) Load 109
             111:   92(fvec2) VectorShuffle 110 110 1 1
             112:     24(ptr) AccessChain 21 36 23
             113:    7(fvec4) Load 112
             114:   92(fvec2) VectorShuffle 113 113 0 1
             115:   92(fvec2) FMul 111 114
             116:    7(fvec4) Load 9
             117:    7(fvec4) VectorShuffle 116 115 4 5 2 3
                              Store 9 117
             118:     24(ptr) AccessChain 21 36 28
             119:    7(fvec4) Load 118
             120:   92(fvec2) VectorShuffle 119 119 0 1
             121:     24(ptr) AccessChain 21 28
             122:    7(fvec4) Load 121
             123:   92(fvec2) VectorShuffle 122 122 0 0
             124:   92(fvec2) FMul 120 123
             125:    7(fvec4) Load 9
             126:   92(fvec2) VectorShuffle 125 125 0 1
             127:   92(fvec2) FAdd 124 126
             128:    7(fvec4) Load 9
             129:    7(fvec4) VectorShuffle 128 127 4 5 2 3
                              Store 9 129
             130:    7(fvec4) Load 9
             131:   92(fvec2) VectorShuffle 130 130 3 3
             132:    7(fvec4) Load 9
             133:   92(fvec2) VectorShuffle 132 132 0 1
             134:   92(fvec2) ExtInst 1(GLSL.std.450) 4(FAbs) 133
             135:   92(fvec2) FDiv 131 134
             136:    7(fvec4) Load 9
             137:    7(fvec4) VectorShuffle 136 135 4 5 2 3
                              Store 9 137
             140:    139(ptr) AccessChain 21 138
             141:    6(float) Load 140
             143:    139(ptr) AccessChain 21 142
             144:    6(float) Load 143
             145:   92(fvec2) CompositeConstruct 141 144
             148:   92(fvec2) FMul 145 147
             149:    7(fvec4) Load 9
             150:   92(fvec2) VectorShuffle 149 149 0 1
             151:   92(fvec2) ExtInst 1(GLSL.std.450) 4(FAbs) 150
             152:   92(fvec2) FAdd 148 151
             153:    7(fvec4) Load 9
             154:    7(fvec4) VectorShuffle 153 152 4 5 2 3
                              Store 9 154
             156:    7(fvec4) Load 9
             157:   92(fvec2) VectorShuffle 156 156 0 1
             158:   92(fvec2) FDiv 147 157
             159:    7(fvec4) Load 155(vs_TEXCOORD2)
             160:    7(fvec4) VectorShuffle 159 158 0 1 4 5
                              Store 155(vs_TEXCOORD2) 160
             162:     24(ptr) AccessChain 21 161
             163:    7(fvec4) Load 162
             166:    7(fvec4) ExtInst 1(GLSL.std.450) 40(FMax) 163 165
                              Store 9 166
             167:    7(fvec4) Load 9
             170:    7(fvec4) ExtInst 1(GLSL.std.450) 37(FMin) 167 169
                              Store 9 170
             171:    7(fvec4) Load 11
             172:   92(fvec2) VectorShuffle 171 171 0 1
             175:   92(fvec2) FMul 172 174
             176:    7(fvec4) Load 9
             177:   92(fvec2) VectorShuffle 176 176 0 1
             178:   92(fvec2) FNegate 177
             179:   92(fvec2) FAdd 175 178
             180:    7(fvec4) Load 9
             181:    7(fvec4) VectorShuffle 180 179 4 5 2 3
                              Store 9 181
             182:    7(fvec4) Load 9
             183:   92(fvec2) VectorShuffle 182 182 2 3
             184:   92(fvec2) FNegate 183
             185:    7(fvec4) Load 9
             186:   92(fvec2) VectorShuffle 185 185 0 1
             187:   92(fvec2) FAdd 184 186
             188:    7(fvec4) Load 155(vs_TEXCOORD2)
             189:    7(fvec4) VectorShuffle 188 187 4 5 2 3
                              Store 155(vs_TEXCOORD2) 189
             191:    190(ptr) AccessChain 80 28 76
             192:    6(float) Load 191
             193:    6(float) FNegate 192
             194:    190(ptr) AccessChain 80 28 76
                              Store 194 193
                              Return
                              FunctionEnd

Disassembly for Fragment:
// Module Version 10000
// Generated by (magic number): 80006
// Id's are bound by 159

                              Capability Shader
               1:             ExtInstImport  "GLSL.std.450"
                              MemoryModel Logical GLSL450
                              EntryPoint Fragment 4  "main" 11 44 80 123
                              ExecutionMode 4 OriginUpperLeft
                              Name 44  "vs_TEXCOORD0"
                              Name 80  "vs_TEXCOORD2"
                              Decorate 9 RelaxedPrecision
                              Decorate 11 RelaxedPrecision
                              Decorate 11 Location 0
                              Decorate 16 RelaxedPrecision
                              Decorate 18 RelaxedPrecision
                              Decorate 23 RelaxedPrecision
                              Decorate 24 RelaxedPrecision
                              Decorate 27 RelaxedPrecision
                              Decorate 29 RelaxedPrecision
                              Decorate 31 RelaxedPrecision
                              Decorate 34 RelaxedPrecision
                              Decorate 34 DescriptorSet 0
                              Decorate 34 Binding 1
                              Decorate 35 RelaxedPrecision
                              Decorate 38 RelaxedPrecision
                              Decorate 38 DescriptorSet 0
                              Decorate 38 Binding 0
                              Decorate 39 RelaxedPrecision
                              Decorate 44(vs_TEXCOORD0) Location 1
                              Decorate 48 RelaxedPrecision
                              MemberDecorate 49 0 RelaxedPrecision
                              MemberDecorate 49 0 Offset 0
                              MemberDecorate 49 1 Offset 16
                              Decorate 49 Block
                              Decorate 51 DescriptorSet 1
                              Decorate 51 Binding 0
                              Decorate 56 RelaxedPrecision
                              Decorate 57 RelaxedPrecision
                              Decorate 59 RelaxedPrecision
                              Decorate 60 RelaxedPrecision
                              Decorate 64 RelaxedPrecision
                              Decorate 80(vs_TEXCOORD2) Location 2
                              Decorate 104 RelaxedPrecision
                              Decorate 111 RelaxedPrecision
                              Decorate 114 RelaxedPrecision
                              Decorate 120 RelaxedPrecision
                              Decorate 123 RelaxedPrecision
                              Decorate 123 Location 0
                              Decorate 126 RelaxedPrecision
                              Decorate 131 RelaxedPrecision
                              Decorate 137 RelaxedPrecision
               2:             TypeVoid
               3:             TypeFunction 2
               6:             TypeFloat 32
               7:             TypeVector 6(float) 4
               8:             TypePointer Private 7(fvec4)
               9:      8(ptr) Variable Private
              10:             TypePointer Input 7(fvec4)
              11:     10(ptr) Variable Input
              12:             TypeInt 32 0
              13:     12(int) Constant 3
              14:             TypePointer Input 6(float)
              17:    6(float) Constant 1132396544
              19:     12(int) Constant 0
              20:             TypePointer Private 6(float)
              28:    6(float) Constant 998277249
              31:      8(ptr) Variable Private
              32:             TypeImage 6(float) 2D sampled format:Unknown
              33:             TypePointer UniformConstant 32
              34:     33(ptr) Variable UniformConstant
              36:             TypeSampler
              37:             TypePointer UniformConstant 36
              38:     37(ptr) Variable UniformConstant
              40:             TypeSampledImage 32
              42:             TypeVector 6(float) 2
              43:             TypePointer Input 42(fvec2)
44(vs_TEXCOORD0):     43(ptr) Variable Input
              47:      8(ptr) Variable Private
              49:             TypeStruct 7(fvec4) 7(fvec4)
              50:             TypePointer Uniform 49(struct)
              51:     50(ptr) Variable Uniform
              52:             TypeInt 32 1
              53:     52(int) Constant 0
              54:             TypePointer Uniform 7(fvec4)
              58:             TypeVector 6(float) 3
              63:      8(ptr) Variable Private
              67:     52(int) Constant 1
80(vs_TEXCOORD2):     10(ptr) Variable Input
              97:    6(float) Constant 0
              98:    6(float) Constant 1065353216
             104:     20(ptr) Variable Private
             105:     12(int) Constant 1
             111:     20(ptr) Variable Private
             116:    6(float) Constant 3129152111
             122:             TypePointer Output 7(fvec4)
             123:    122(ptr) Variable Output
             132:             TypePointer Output 6(float)
             134:             TypeBool
             135:             TypePointer Private 134(bool)
             136:    135(ptr) Variable Private
             141:     52(int) Constant 4294967295
             148:             TypePointer Function 7(fvec4)
             150:             TypeVector 52(int) 4
             151:             TypePointer Function 150(ivec4)
             153:             TypeVector 134(bool) 4
             154:             TypePointer Function 153(bvec4)
             156:             TypeVector 12(int) 4
             157:             TypePointer Function 156(ivec4)
               4:           2 Function None 3
               5:             Label
             149:    148(ptr) Variable Function
             152:    151(ptr) Variable Function
             155:    154(ptr) Variable Function
             158:    157(ptr) Variable Function
              15:     14(ptr) AccessChain 11 13
              16:    6(float) Load 15
              18:    6(float) FMul 16 17
              21:     20(ptr) AccessChain 9 19
                              Store 21 18
              22:     20(ptr) AccessChain 9 19
              23:    6(float) Load 22
              24:    6(float) ExtInst 1(GLSL.std.450) 2(RoundEven) 23
              25:     20(ptr) AccessChain 9 19
                              Store 25 24
              26:     20(ptr) AccessChain 9 19
              27:    6(float) Load 26
              29:    6(float) FMul 27 28
              30:     20(ptr) AccessChain 9 13
                              Store 30 29
              35:          32 Load 34
              39:          36 Load 38
              41:          40 SampledImage 35 39
              45:   42(fvec2) Load 44(vs_TEXCOORD0)
              46:    7(fvec4) ImageSampleImplicitLod 41 45
                              Store 31 46
              48:    7(fvec4) Load 31
              55:     54(ptr) AccessChain 51 53
              56:    7(fvec4) Load 55
              57:    7(fvec4) FAdd 48 56
                              Store 47 57
              59:    7(fvec4) Load 11
              60:   58(fvec3) VectorShuffle 59 59 0 1 2
              61:    7(fvec4) Load 9
              62:    7(fvec4) VectorShuffle 61 60 4 5 6 3
                              Store 9 62
              64:    7(fvec4) Load 9
              65:    7(fvec4) Load 47
              66:    7(fvec4) FMul 64 65
                              Store 63 66
              68:     54(ptr) AccessChain 51 67
              69:    7(fvec4) Load 68
              70:   42(fvec2) VectorShuffle 69 69 0 1
              71:   42(fvec2) FNegate 70
              72:     54(ptr) AccessChain 51 67
              73:    7(fvec4) Load 72
              74:   42(fvec2) VectorShuffle 73 73 2 3
              75:   42(fvec2) FAdd 71 74
              76:    7(fvec4) Load 47
              77:    7(fvec4) VectorShuffle 76 75 4 5 2 3
                              Store 47 77
              78:    7(fvec4) Load 47
              79:   42(fvec2) VectorShuffle 78 78 0 1
              81:    7(fvec4) Load 80(vs_TEXCOORD2)
              82:   42(fvec2) VectorShuffle 81 81 0 1
              83:   42(fvec2) ExtInst 1(GLSL.std.450) 4(FAbs) 82
              84:   42(fvec2) FNegate 83
              85:   42(fvec2) FAdd 79 84
              86:    7(fvec4) Load 47
              87:    7(fvec4) VectorShuffle 86 85 4 5 2 3
                              Store 47 87
              88:    7(fvec4) Load 47
              89:   42(fvec2) VectorShuffle 88 88 0 1
              90:    7(fvec4) Load 80(vs_TEXCOORD2)
              91:   42(fvec2) VectorShuffle 90 90 2 3
              92:   42(fvec2) FMul 89 91
              93:    7(fvec4) Load 47
              94:    7(fvec4) VectorShuffle 93 92 4 5 2 3
                              Store 47 94
              95:    7(fvec4) Load 47
              96:   42(fvec2) VectorShuffle 95 95 0 1
              99:   42(fvec2) CompositeConstruct 97 97
             100:   42(fvec2) CompositeConstruct 98 98
             101:   42(fvec2) ExtInst 1(GLSL.std.450) 43(FClamp) 96 99 100
             102:    7(fvec4) Load 47
             103:    7(fvec4) VectorShuffle 102 101 4 5 2 3
                              Store 47 103
             106:     20(ptr) AccessChain 47 105
             107:    6(float) Load 106
             108:     20(ptr) AccessChain 47 19
             109:    6(float) Load 108
             110:    6(float) FMul 107 109
                              Store 104 110
             112:     20(ptr) AccessChain 63 13
             113:    6(float) Load 112
             114:    6(float) Load 104
             115:    6(float) FMul 113 114
             117:    6(float) FAdd 115 116
                              Store 111 117
             118:     20(ptr) AccessChain 63 13
             119:    6(float) Load 118
             120:    6(float) Load 104
             121:    6(float) FMul 119 120
                              Store 104 121
             124:    7(fvec4) Load 63
             125:   58(fvec3) VectorShuffle 124 124 0 1 2
             126:    6(float) Load 104
             127:   58(fvec3) CompositeConstruct 126 126 126
             128:   58(fvec3) FMul 125 127
             129:    7(fvec4) Load 123
             130:    7(fvec4) VectorShuffle 129 128 4 5 6 3
                              Store 123 130
             131:    6(float) Load 104
             133:    132(ptr) AccessChain 123 13
                              Store 133 131
             137:    6(float) Load 111
             138:   134(bool) FOrdLessThan 137 97
                              Store 136 138
             139:   134(bool) Load 136
             140:     52(int) Select 139 67 53
             142:     52(int) IMul 140 141
             143:   134(bool) INotEqual 142 53
                              SelectionMerge 145 None
                              BranchConditional 143 144 145
             144:               Label
                                Kill
             145:             Label
                              Return
                              FunctionEnd

Disassembly for Hull:
Not present.



//////////////////////////////////////////////////////
Keywords: UNITY_UI_ALPHACLIP UNITY_UI_CLIP_RECT
-- Hardware tier variant: Tier 2
-- Vertex shader for "vulkan":
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord0"

Set 2D Texture "_MainTex" to set: 0, binding: 1, used in: Fragment  using sampler in set: 0, binding: 0, used in: Fragment 

Constant Buffer "PGlobals2013609244" (32 bytes) on set: 1, binding: 0, used in: Fragment  {
  Vector4 _ClipRect at 16
  Vector4 _TextureSampleAdd at 0
}
Constant Buffer "VGlobals2013609244" (264 bytes) on set: 1, binding: 1, used in: Vertex  {
  Matrix4x4 glstate_matrix_projection at 80
  Matrix4x4 unity_MatrixVP at 144
  Matrix4x4 unity_ObjectToWorld at 16
  Vector4 _ClipRect at 224
  Vector4 _Color at 208
  Vector4 _MainTex_ST at 240
  Vector4 _ScreenParams at 0
  Float _UIMaskSoftnessX at 256
  Float _UIMaskSoftnessY at 260
}

Shader Disassembly:
Disassembly for Vertex:
// Module Version 10000
// Generated by (magic number): 80006
// Id's are bound by 208

                              Capability Shader
               1:             ExtInstImport  "GLSL.std.450"
                              MemoryModel Logical GLSL450
                              EntryPoint Vertex 4  "main" 11 80 84 90 94 96 107 155
                              Name 94  "vs_TEXCOORD0"
                              Name 107  "vs_TEXCOORD1"
                              Name 155  "vs_TEXCOORD2"
                              Decorate 11 Location 0
                              Decorate 16 ArrayStride 16
                              Decorate 17 ArrayStride 16
                              Decorate 18 ArrayStride 16
                              MemberDecorate 19 0 Offset 0
                              MemberDecorate 19 1 Offset 16
                              MemberDecorate 19 2 Offset 80
                              MemberDecorate 19 3 Offset 144
                              MemberDecorate 19 4 RelaxedPrecision
                              MemberDecorate 19 4 Offset 208
                              MemberDecorate 19 5 Offset 224
                              MemberDecorate 19 6 Offset 240
                              MemberDecorate 19 7 Offset 256
                              MemberDecorate 19 8 Offset 260
                              Decorate 19 Block
                              Decorate 21 DescriptorSet 1
                              Decorate 21 Binding 1
                              MemberDecorate 78 0 BuiltIn Position
                              MemberDecorate 78 1 BuiltIn PointSize
                              MemberDecorate 78 2 BuiltIn ClipDistance
                              Decorate 78 Block
                              Decorate 84 Location 1
                              Decorate 88 RelaxedPrecision
                              Decorate 90 RelaxedPrecision
                              Decorate 90 Location 0
                              Decorate 94(vs_TEXCOORD0) Location 1
                              Decorate 96 Location 2
                              Decorate 107(vs_TEXCOORD1) Location 3
                              Decorate 155(vs_TEXCOORD2) Location 2
               2:             TypeVoid
               3:             TypeFunction 2
               6:             TypeFloat 32
               7:             TypeVector 6(float) 4
               8:             TypePointer Private 7(fvec4)
               9:      8(ptr) Variable Private
              10:             TypePointer Input 7(fvec4)
              11:     10(ptr) Variable Input
              14:             TypeInt 32 0
              15:     14(int) Constant 4
              16:             TypeArray 7(fvec4) 15
              17:             TypeArray 7(fvec4) 15
              18:             TypeArray 7(fvec4) 15
              19:             TypeStruct 7(fvec4) 16 17 18 7(fvec4) 7(fvec4) 7(fvec4) 6(float) 6(float)
              20:             TypePointer Uniform 19(struct)
              21:     20(ptr) Variable Uniform
              22:             TypeInt 32 1
              23:     22(int) Constant 1
              24:             TypePointer Uniform 7(fvec4)
              28:     22(int) Constant 0
              36:     22(int) Constant 2
              45:     22(int) Constant 3
              49:      8(ptr) Variable Private
              76:     14(int) Constant 1
              77:             TypeArray 6(float) 76
              78:             TypeStruct 7(fvec4) 6(float) 77
              79:             TypePointer Output 78(struct)
              80:     79(ptr) Variable Output
              82:             TypePointer Output 7(fvec4)
              84:     10(ptr) Variable Input
              86:     22(int) Constant 4
              90:     82(ptr) Variable Output
              92:             TypeVector 6(float) 2
              93:             TypePointer Output 92(fvec2)
94(vs_TEXCOORD0):     93(ptr) Variable Output
              95:             TypePointer Input 92(fvec2)
              96:     95(ptr) Variable Input
              98:     22(int) Constant 6
107(vs_TEXCOORD1):     82(ptr) Variable Output
             138:     22(int) Constant 7
             139:             TypePointer Uniform 6(float)
             142:     22(int) Constant 8
             146:    6(float) Constant 1048576000
             147:   92(fvec2) ConstantComposite 146 146
155(vs_TEXCOORD2):     82(ptr) Variable Output
             161:     22(int) Constant 5
             164:    6(float) Constant 3499426553
             165:    7(fvec4) ConstantComposite 164 164 164 164
             168:    6(float) Constant 1351942905
             169:    7(fvec4) ConstantComposite 168 168 168 168
             173:    6(float) Constant 1073741824
             174:   92(fvec2) ConstantComposite 173 173
             190:             TypePointer Output 6(float)
             196:             TypePointer Function 7(fvec4)
             198:             TypeVector 22(int) 4
             199:             TypePointer Function 198(ivec4)
             201:             TypeBool
             202:             TypeVector 201(bool) 4
             203:             TypePointer Function 202(bvec4)
             205:             TypeVector 14(int) 4
             206:             TypePointer Function 205(ivec4)
               4:           2 Function None 3
               5:             Label
             197:    196(ptr) Variable Function
             200:    199(ptr) Variable Function
             204:    203(ptr) Variable Function
             207:    206(ptr) Variable Function
              12:    7(fvec4) Load 11
              13:    7(fvec4) VectorShuffle 12 12 1 1 1 1
              25:     24(ptr) AccessChain 21 23 23
              26:    7(fvec4) Load 25
              27:    7(fvec4) FMul 13 26
                              Store 9 27
              29:     24(ptr) AccessChain 21 23 28
              30:    7(fvec4) Load 29
              31:    7(fvec4) Load 11
              32:    7(fvec4) VectorShuffle 31 31 0 0 0 0
              33:    7(fvec4) FMul 30 32
              34:    7(fvec4) Load 9
              35:    7(fvec4) FAdd 33 34
                              Store 9 35
              37:     24(ptr) AccessChain 21 23 36
              38:    7(fvec4) Load 37
              39:    7(fvec4) Load 11
              40:    7(fvec4) VectorShuffle 39 39 2 2 2 2
              41:    7(fvec4) FMul 38 40
              42:    7(fvec4) Load 9
              43:    7(fvec4) FAdd 41 42
                              Store 9 43
              44:    7(fvec4) Load 9
              46:     24(ptr) AccessChain 21 23 45
              47:    7(fvec4) Load 46
              48:    7(fvec4) FAdd 44 47
                              Store 9 48
              50:    7(fvec4) Load 9
              51:    7(fvec4) VectorShuffle 50 50 1 1 1 1
              52:     24(ptr) AccessChain 21 45 23
              53:    7(fvec4) Load 52
              54:    7(fvec4) FMul 51 53
                              Store 49 54
              55:     24(ptr) AccessChain 21 45 28
              56:    7(fvec4) Load 55
              57:    7(fvec4) Load 9
              58:    7(fvec4) VectorShuffle 57 57 0 0 0 0
              59:    7(fvec4) FMul 56 58
              60:    7(fvec4) Load 49
              61:    7(fvec4) FAdd 59 60
                              Store 49 61
              62:     24(ptr) AccessChain 21 45 36
              63:    7(fvec4) Load 62
              64:    7(fvec4) Load 9
              65:    7(fvec4) VectorShuffle 64 64 2 2 2 2
              66:    7(fvec4) FMul 63 65
              67:    7(fvec4) Load 49
              68:    7(fvec4) FAdd 66 67
                              Store 49 68
              69:     24(ptr) AccessChain 21 45 45
              70:    7(fvec4) Load 69
              71:    7(fvec4) Load 9
              72:    7(fvec4) VectorShuffle 71 71 3 3 3 3
              73:    7(fvec4) FMul 70 72
              74:    7(fvec4) Load 49
              75:    7(fvec4) FAdd 73 74
                              Store 9 75
              81:    7(fvec4) Load 9
              83:     82(ptr) AccessChain 80 28
                              Store 83 81
              85:    7(fvec4) Load 84
              87:     24(ptr) AccessChain 21 86
              88:    7(fvec4) Load 87
              89:    7(fvec4) FMul 85 88
                              Store 49 89
              91:    7(fvec4) Load 49
                              Store 90 91
              97:   92(fvec2) Load 96
              99:     24(ptr) AccessChain 21 98
             100:    7(fvec4) Load 99
             101:   92(fvec2) VectorShuffle 100 100 0 1
             102:   92(fvec2) FMul 97 101
             103:     24(ptr) AccessChain 21 98
             104:    7(fvec4) Load 103
             105:   92(fvec2) VectorShuffle 104 104 2 3
             106:   92(fvec2) FAdd 102 105
                              Store 94(vs_TEXCOORD0) 106
             108:    7(fvec4) Load 11
                              Store 107(vs_TEXCOORD1) 108
             109:     24(ptr) AccessChain 21 28
             110:    7(fvec4) Load 109
             111:   92(fvec2) VectorShuffle 110 110 1 1
             112:     24(ptr) AccessChain 21 36 23
             113:    7(fvec4) Load 112
             114:   92(fvec2) VectorShuffle 113 113 0 1
             115:   92(fvec2) FMul 111 114
             116:    7(fvec4) Load 9
             117:    7(fvec4) VectorShuffle 116 115 4 5 2 3
                              Store 9 117
             118:     24(ptr) AccessChain 21 36 28
             119:    7(fvec4) Load 118
             120:   92(fvec2) VectorShuffle 119 119 0 1
             121:     24(ptr) AccessChain 21 28
             122:    7(fvec4) Load 121
             123:   92(fvec2) VectorShuffle 122 122 0 0
             124:   92(fvec2) FMul 120 123
             125:    7(fvec4) Load 9
             126:   92(fvec2) VectorShuffle 125 125 0 1
             127:   92(fvec2) FAdd 124 126
             128:    7(fvec4) Load 9
             129:    7(fvec4) VectorShuffle 128 127 4 5 2 3
                              Store 9 129
             130:    7(fvec4) Load 9
             131:   92(fvec2) VectorShuffle 130 130 3 3
             132:    7(fvec4) Load 9
             133:   92(fvec2) VectorShuffle 132 132 0 1
             134:   92(fvec2) ExtInst 1(GLSL.std.450) 4(FAbs) 133
             135:   92(fvec2) FDiv 131 134
             136:    7(fvec4) Load 9
             137:    7(fvec4) VectorShuffle 136 135 4 5 2 3
                              Store 9 137
             140:    139(ptr) AccessChain 21 138
             141:    6(float) Load 140
             143:    139(ptr) AccessChain 21 142
             144:    6(float) Load 143
             145:   92(fvec2) CompositeConstruct 141 144
             148:   92(fvec2) FMul 145 147
             149:    7(fvec4) Load 9
             150:   92(fvec2) VectorShuffle 149 149 0 1
             151:   92(fvec2) ExtInst 1(GLSL.std.450) 4(FAbs) 150
             152:   92(fvec2) FAdd 148 151
             153:    7(fvec4) Load 9
             154:    7(fvec4) VectorShuffle 153 152 4 5 2 3
                              Store 9 154
             156:    7(fvec4) Load 9
             157:   92(fvec2) VectorShuffle 156 156 0 1
             158:   92(fvec2) FDiv 147 157
             159:    7(fvec4) Load 155(vs_TEXCOORD2)
             160:    7(fvec4) VectorShuffle 159 158 0 1 4 5
                              Store 155(vs_TEXCOORD2) 160
             162:     24(ptr) AccessChain 21 161
             163:    7(fvec4) Load 162
             166:    7(fvec4) ExtInst 1(GLSL.std.450) 40(FMax) 163 165
                              Store 9 166
             167:    7(fvec4) Load 9
             170:    7(fvec4) ExtInst 1(GLSL.std.450) 37(FMin) 167 169
                              Store 9 170
             171:    7(fvec4) Load 11
             172:   92(fvec2) VectorShuffle 171 171 0 1
             175:   92(fvec2) FMul 172 174
             176:    7(fvec4) Load 9
             177:   92(fvec2) VectorShuffle 176 176 0 1
             178:   92(fvec2) FNegate 177
             179:   92(fvec2) FAdd 175 178
             180:    7(fvec4) Load 9
             181:    7(fvec4) VectorShuffle 180 179 4 5 2 3
                              Store 9 181
             182:    7(fvec4) Load 9
             183:   92(fvec2) VectorShuffle 182 182 2 3
             184:   92(fvec2) FNegate 183
             185:    7(fvec4) Load 9
             186:   92(fvec2) VectorShuffle 185 185 0 1
             187:   92(fvec2) FAdd 184 186
             188:    7(fvec4) Load 155(vs_TEXCOORD2)
             189:    7(fvec4) VectorShuffle 188 187 4 5 2 3
                              Store 155(vs_TEXCOORD2) 189
             191:    190(ptr) AccessChain 80 28 76
             192:    6(float) Load 191
             193:    6(float) FNegate 192
             194:    190(ptr) AccessChain 80 28 76
                              Store 194 193
                              Return
                              FunctionEnd

Disassembly for Fragment:
// Module Version 10000
// Generated by (magic number): 80006
// Id's are bound by 159

                              Capability Shader
               1:             ExtInstImport  "GLSL.std.450"
                              MemoryModel Logical GLSL450
                              EntryPoint Fragment 4  "main" 11 44 80 123
                              ExecutionMode 4 OriginUpperLeft
                              Name 44  "vs_TEXCOORD0"
                              Name 80  "vs_TEXCOORD2"
                              Decorate 9 RelaxedPrecision
                              Decorate 11 RelaxedPrecision
                              Decorate 11 Location 0
                              Decorate 16 RelaxedPrecision
                              Decorate 18 RelaxedPrecision
                              Decorate 23 RelaxedPrecision
                              Decorate 24 RelaxedPrecision
                              Decorate 27 RelaxedPrecision
                              Decorate 29 RelaxedPrecision
                              Decorate 31 RelaxedPrecision
                              Decorate 34 RelaxedPrecision
                              Decorate 34 DescriptorSet 0
                              Decorate 34 Binding 1
                              Decorate 35 RelaxedPrecision
                              Decorate 38 RelaxedPrecision
                              Decorate 38 DescriptorSet 0
                              Decorate 38 Binding 0
                              Decorate 39 RelaxedPrecision
                              Decorate 44(vs_TEXCOORD0) Location 1
                              Decorate 48 RelaxedPrecision
                              MemberDecorate 49 0 RelaxedPrecision
                              MemberDecorate 49 0 Offset 0
                              MemberDecorate 49 1 Offset 16
                              Decorate 49 Block
                              Decorate 51 DescriptorSet 1
                              Decorate 51 Binding 0
                              Decorate 56 RelaxedPrecision
                              Decorate 57 RelaxedPrecision
                              Decorate 59 RelaxedPrecision
                              Decorate 60 RelaxedPrecision
                              Decorate 64 RelaxedPrecision
                              Decorate 80(vs_TEXCOORD2) Location 2
                              Decorate 104 RelaxedPrecision
                              Decorate 111 RelaxedPrecision
                              Decorate 114 RelaxedPrecision
                              Decorate 120 RelaxedPrecision
                              Decorate 123 RelaxedPrecision
                              Decorate 123 Location 0
                              Decorate 126 RelaxedPrecision
                              Decorate 131 RelaxedPrecision
                              Decorate 137 RelaxedPrecision
               2:             TypeVoid
               3:             TypeFunction 2
               6:             TypeFloat 32
               7:             TypeVector 6(float) 4
               8:             TypePointer Private 7(fvec4)
               9:      8(ptr) Variable Private
              10:             TypePointer Input 7(fvec4)
              11:     10(ptr) Variable Input
              12:             TypeInt 32 0
              13:     12(int) Constant 3
              14:             TypePointer Input 6(float)
              17:    6(float) Constant 1132396544
              19:     12(int) Constant 0
              20:             TypePointer Private 6(float)
              28:    6(float) Constant 998277249
              31:      8(ptr) Variable Private
              32:             TypeImage 6(float) 2D sampled format:Unknown
              33:             TypePointer UniformConstant 32
              34:     33(ptr) Variable UniformConstant
              36:             TypeSampler
              37:             TypePointer UniformConstant 36
              38:     37(ptr) Variable UniformConstant
              40:             TypeSampledImage 32
              42:             TypeVector 6(float) 2
              43:             TypePointer Input 42(fvec2)
44(vs_TEXCOORD0):     43(ptr) Variable Input
              47:      8(ptr) Variable Private
              49:             TypeStruct 7(fvec4) 7(fvec4)
              50:             TypePointer Uniform 49(struct)
              51:     50(ptr) Variable Uniform
              52:             TypeInt 32 1
              53:     52(int) Constant 0
              54:             TypePointer Uniform 7(fvec4)
              58:             TypeVector 6(float) 3
              63:      8(ptr) Variable Private
              67:     52(int) Constant 1
80(vs_TEXCOORD2):     10(ptr) Variable Input
              97:    6(float) Constant 0
              98:    6(float) Constant 1065353216
             104:     20(ptr) Variable Private
             105:     12(int) Constant 1
             111:     20(ptr) Variable Private
             116:    6(float) Constant 3129152111
             122:             TypePointer Output 7(fvec4)
             123:    122(ptr) Variable Output
             132:             TypePointer Output 6(float)
             134:             TypeBool
             135:             TypePointer Private 134(bool)
             136:    135(ptr) Variable Private
             141:     52(int) Constant 4294967295
             148:             TypePointer Function 7(fvec4)
             150:             TypeVector 52(int) 4
             151:             TypePointer Function 150(ivec4)
             153:             TypeVector 134(bool) 4
             154:             TypePointer Function 153(bvec4)
             156:             TypeVector 12(int) 4
             157:             TypePointer Function 156(ivec4)
               4:           2 Function None 3
               5:             Label
             149:    148(ptr) Variable Function
             152:    151(ptr) Variable Function
             155:    154(ptr) Variable Function
             158:    157(ptr) Variable Function
              15:     14(ptr) AccessChain 11 13
              16:    6(float) Load 15
              18:    6(float) FMul 16 17
              21:     20(ptr) AccessChain 9 19
                              Store 21 18
              22:     20(ptr) AccessChain 9 19
              23:    6(float) Load 22
              24:    6(float) ExtInst 1(GLSL.std.450) 2(RoundEven) 23
              25:     20(ptr) AccessChain 9 19
                              Store 25 24
              26:     20(ptr) AccessChain 9 19
              27:    6(float) Load 26
              29:    6(float) FMul 27 28
              30:     20(ptr) AccessChain 9 13
                              Store 30 29
              35:          32 Load 34
              39:          36 Load 38
              41:          40 SampledImage 35 39
              45:   42(fvec2) Load 44(vs_TEXCOORD0)
              46:    7(fvec4) ImageSampleImplicitLod 41 45
                              Store 31 46
              48:    7(fvec4) Load 31
              55:     54(ptr) AccessChain 51 53
              56:    7(fvec4) Load 55
              57:    7(fvec4) FAdd 48 56
                              Store 47 57
              59:    7(fvec4) Load 11
              60:   58(fvec3) VectorShuffle 59 59 0 1 2
              61:    7(fvec4) Load 9
              62:    7(fvec4) VectorShuffle 61 60 4 5 6 3
                              Store 9 62
              64:    7(fvec4) Load 9
              65:    7(fvec4) Load 47
              66:    7(fvec4) FMul 64 65
                              Store 63 66
              68:     54(ptr) AccessChain 51 67
              69:    7(fvec4) Load 68
              70:   42(fvec2) VectorShuffle 69 69 0 1
              71:   42(fvec2) FNegate 70
              72:     54(ptr) AccessChain 51 67
              73:    7(fvec4) Load 72
              74:   42(fvec2) VectorShuffle 73 73 2 3
              75:   42(fvec2) FAdd 71 74
              76:    7(fvec4) Load 47
              77:    7(fvec4) VectorShuffle 76 75 4 5 2 3
                              Store 47 77
              78:    7(fvec4) Load 47
              79:   42(fvec2) VectorShuffle 78 78 0 1
              81:    7(fvec4) Load 80(vs_TEXCOORD2)
              82:   42(fvec2) VectorShuffle 81 81 0 1
              83:   42(fvec2) ExtInst 1(GLSL.std.450) 4(FAbs) 82
              84:   42(fvec2) FNegate 83
              85:   42(fvec2) FAdd 79 84
              86:    7(fvec4) Load 47
              87:    7(fvec4) VectorShuffle 86 85 4 5 2 3
                              Store 47 87
              88:    7(fvec4) Load 47
              89:   42(fvec2) VectorShuffle 88 88 0 1
              90:    7(fvec4) Load 80(vs_TEXCOORD2)
              91:   42(fvec2) VectorShuffle 90 90 2 3
              92:   42(fvec2) FMul 89 91
              93:    7(fvec4) Load 47
              94:    7(fvec4) VectorShuffle 93 92 4 5 2 3
                              Store 47 94
              95:    7(fvec4) Load 47
              96:   42(fvec2) VectorShuffle 95 95 0 1
              99:   42(fvec2) CompositeConstruct 97 97
             100:   42(fvec2) CompositeConstruct 98 98
             101:   42(fvec2) ExtInst 1(GLSL.std.450) 43(FClamp) 96 99 100
             102:    7(fvec4) Load 47
             103:    7(fvec4) VectorShuffle 102 101 4 5 2 3
                              Store 47 103
             106:     20(ptr) AccessChain 47 105
             107:    6(float) Load 106
             108:     20(ptr) AccessChain 47 19
             109:    6(float) Load 108
             110:    6(float) FMul 107 109
                              Store 104 110
             112:     20(ptr) AccessChain 63 13
             113:    6(float) Load 112
             114:    6(float) Load 104
             115:    6(float) FMul 113 114
             117:    6(float) FAdd 115 116
                              Store 111 117
             118:     20(ptr) AccessChain 63 13
             119:    6(float) Load 118
             120:    6(float) Load 104
             121:    6(float) FMul 119 120
                              Store 104 121
             124:    7(fvec4) Load 63
             125:   58(fvec3) VectorShuffle 124 124 0 1 2
             126:    6(float) Load 104
             127:   58(fvec3) CompositeConstruct 126 126 126
             128:   58(fvec3) FMul 125 127
             129:    7(fvec4) Load 123
             130:    7(fvec4) VectorShuffle 129 128 4 5 6 3
                              Store 123 130
             131:    6(float) Load 104
             133:    132(ptr) AccessChain 123 13
                              Store 133 131
             137:    6(float) Load 111
             138:   134(bool) FOrdLessThan 137 97
                              Store 136 138
             139:   134(bool) Load 136
             140:     52(int) Select 139 67 53
             142:     52(int) IMul 140 141
             143:   134(bool) INotEqual 142 53
                              SelectionMerge 145 None
                              BranchConditional 143 144 145
             144:               Label
                                Kill
             145:             Label
                              Return
                              FunctionEnd

Disassembly for Hull:
Not present.



//////////////////////////////////////////////////////
Keywords: UNITY_UI_ALPHACLIP UNITY_UI_CLIP_RECT
-- Hardware tier variant: Tier 3
-- Vertex shader for "vulkan":
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord0"

Set 2D Texture "_MainTex" to set: 0, binding: 1, used in: Fragment  using sampler in set: 0, binding: 0, used in: Fragment 

Constant Buffer "PGlobals2013609244" (32 bytes) on set: 1, binding: 0, used in: Fragment  {
  Vector4 _ClipRect at 16
  Vector4 _TextureSampleAdd at 0
}
Constant Buffer "VGlobals2013609244" (264 bytes) on set: 1, binding: 1, used in: Vertex  {
  Matrix4x4 glstate_matrix_projection at 80
  Matrix4x4 unity_MatrixVP at 144
  Matrix4x4 unity_ObjectToWorld at 16
  Vector4 _ClipRect at 224
  Vector4 _Color at 208
  Vector4 _MainTex_ST at 240
  Vector4 _ScreenParams at 0
  Float _UIMaskSoftnessX at 256
  Float _UIMaskSoftnessY at 260
}

Shader Disassembly:
Disassembly for Vertex:
// Module Version 10000
// Generated by (magic number): 80006
// Id's are bound by 208

                              Capability Shader
               1:             ExtInstImport  "GLSL.std.450"
                              MemoryModel Logical GLSL450
                              EntryPoint Vertex 4  "main" 11 80 84 90 94 96 107 155
                              Name 94  "vs_TEXCOORD0"
                              Name 107  "vs_TEXCOORD1"
                              Name 155  "vs_TEXCOORD2"
                              Decorate 11 Location 0
                              Decorate 16 ArrayStride 16
                              Decorate 17 ArrayStride 16
                              Decorate 18 ArrayStride 16
                              MemberDecorate 19 0 Offset 0
                              MemberDecorate 19 1 Offset 16
                              MemberDecorate 19 2 Offset 80
                              MemberDecorate 19 3 Offset 144
                              MemberDecorate 19 4 RelaxedPrecision
                              MemberDecorate 19 4 Offset 208
                              MemberDecorate 19 5 Offset 224
                              MemberDecorate 19 6 Offset 240
                              MemberDecorate 19 7 Offset 256
                              MemberDecorate 19 8 Offset 260
                              Decorate 19 Block
                              Decorate 21 DescriptorSet 1
                              Decorate 21 Binding 1
                              MemberDecorate 78 0 BuiltIn Position
                              MemberDecorate 78 1 BuiltIn PointSize
                              MemberDecorate 78 2 BuiltIn ClipDistance
                              Decorate 78 Block
                              Decorate 84 Location 1
                              Decorate 88 RelaxedPrecision
                              Decorate 90 RelaxedPrecision
                              Decorate 90 Location 0
                              Decorate 94(vs_TEXCOORD0) Location 1
                              Decorate 96 Location 2
                              Decorate 107(vs_TEXCOORD1) Location 3
                              Decorate 155(vs_TEXCOORD2) Location 2
               2:             TypeVoid
               3:             TypeFunction 2
               6:             TypeFloat 32
               7:             TypeVector 6(float) 4
               8:             TypePointer Private 7(fvec4)
               9:      8(ptr) Variable Private
              10:             TypePointer Input 7(fvec4)
              11:     10(ptr) Variable Input
              14:             TypeInt 32 0
              15:     14(int) Constant 4
              16:             TypeArray 7(fvec4) 15
              17:             TypeArray 7(fvec4) 15
              18:             TypeArray 7(fvec4) 15
              19:             TypeStruct 7(fvec4) 16 17 18 7(fvec4) 7(fvec4) 7(fvec4) 6(float) 6(float)
              20:             TypePointer Uniform 19(struct)
              21:     20(ptr) Variable Uniform
              22:             TypeInt 32 1
              23:     22(int) Constant 1
              24:             TypePointer Uniform 7(fvec4)
              28:     22(int) Constant 0
              36:     22(int) Constant 2
              45:     22(int) Constant 3
              49:      8(ptr) Variable Private
              76:     14(int) Constant 1
              77:             TypeArray 6(float) 76
              78:             TypeStruct 7(fvec4) 6(float) 77
              79:             TypePointer Output 78(struct)
              80:     79(ptr) Variable Output
              82:             TypePointer Output 7(fvec4)
              84:     10(ptr) Variable Input
              86:     22(int) Constant 4
              90:     82(ptr) Variable Output
              92:             TypeVector 6(float) 2
              93:             TypePointer Output 92(fvec2)
94(vs_TEXCOORD0):     93(ptr) Variable Output
              95:             TypePointer Input 92(fvec2)
              96:     95(ptr) Variable Input
              98:     22(int) Constant 6
107(vs_TEXCOORD1):     82(ptr) Variable Output
             138:     22(int) Constant 7
             139:             TypePointer Uniform 6(float)
             142:     22(int) Constant 8
             146:    6(float) Constant 1048576000
             147:   92(fvec2) ConstantComposite 146 146
155(vs_TEXCOORD2):     82(ptr) Variable Output
             161:     22(int) Constant 5
             164:    6(float) Constant 3499426553
             165:    7(fvec4) ConstantComposite 164 164 164 164
             168:    6(float) Constant 1351942905
             169:    7(fvec4) ConstantComposite 168 168 168 168
             173:    6(float) Constant 1073741824
             174:   92(fvec2) ConstantComposite 173 173
             190:             TypePointer Output 6(float)
             196:             TypePointer Function 7(fvec4)
             198:             TypeVector 22(int) 4
             199:             TypePointer Function 198(ivec4)
             201:             TypeBool
             202:             TypeVector 201(bool) 4
             203:             TypePointer Function 202(bvec4)
             205:             TypeVector 14(int) 4
             206:             TypePointer Function 205(ivec4)
               4:           2 Function None 3
               5:             Label
             197:    196(ptr) Variable Function
             200:    199(ptr) Variable Function
             204:    203(ptr) Variable Function
             207:    206(ptr) Variable Function
              12:    7(fvec4) Load 11
              13:    7(fvec4) VectorShuffle 12 12 1 1 1 1
              25:     24(ptr) AccessChain 21 23 23
              26:    7(fvec4) Load 25
              27:    7(fvec4) FMul 13 26
                              Store 9 27
              29:     24(ptr) AccessChain 21 23 28
              30:    7(fvec4) Load 29
              31:    7(fvec4) Load 11
              32:    7(fvec4) VectorShuffle 31 31 0 0 0 0
              33:    7(fvec4) FMul 30 32
              34:    7(fvec4) Load 9
              35:    7(fvec4) FAdd 33 34
                              Store 9 35
              37:     24(ptr) AccessChain 21 23 36
              38:    7(fvec4) Load 37
              39:    7(fvec4) Load 11
              40:    7(fvec4) VectorShuffle 39 39 2 2 2 2
              41:    7(fvec4) FMul 38 40
              42:    7(fvec4) Load 9
              43:    7(fvec4) FAdd 41 42
                              Store 9 43
              44:    7(fvec4) Load 9
              46:     24(ptr) AccessChain 21 23 45
              47:    7(fvec4) Load 46
              48:    7(fvec4) FAdd 44 47
                              Store 9 48
              50:    7(fvec4) Load 9
              51:    7(fvec4) VectorShuffle 50 50 1 1 1 1
              52:     24(ptr) AccessChain 21 45 23
              53:    7(fvec4) Load 52
              54:    7(fvec4) FMul 51 53
                              Store 49 54
              55:     24(ptr) AccessChain 21 45 28
              56:    7(fvec4) Load 55
              57:    7(fvec4) Load 9
              58:    7(fvec4) VectorShuffle 57 57 0 0 0 0
              59:    7(fvec4) FMul 56 58
              60:    7(fvec4) Load 49
              61:    7(fvec4) FAdd 59 60
                              Store 49 61
              62:     24(ptr) AccessChain 21 45 36
              63:    7(fvec4) Load 62
              64:    7(fvec4) Load 9
              65:    7(fvec4) VectorShuffle 64 64 2 2 2 2
              66:    7(fvec4) FMul 63 65
              67:    7(fvec4) Load 49
              68:    7(fvec4) FAdd 66 67
                              Store 49 68
              69:     24(ptr) AccessChain 21 45 45
              70:    7(fvec4) Load 69
              71:    7(fvec4) Load 9
              72:    7(fvec4) VectorShuffle 71 71 3 3 3 3
              73:    7(fvec4) FMul 70 72
              74:    7(fvec4) Load 49
              75:    7(fvec4) FAdd 73 74
                              Store 9 75
              81:    7(fvec4) Load 9
              83:     82(ptr) AccessChain 80 28
                              Store 83 81
              85:    7(fvec4) Load 84
              87:     24(ptr) AccessChain 21 86
              88:    7(fvec4) Load 87
              89:    7(fvec4) FMul 85 88
                              Store 49 89
              91:    7(fvec4) Load 49
                              Store 90 91
              97:   92(fvec2) Load 96
              99:     24(ptr) AccessChain 21 98
             100:    7(fvec4) Load 99
             101:   92(fvec2) VectorShuffle 100 100 0 1
             102:   92(fvec2) FMul 97 101
             103:     24(ptr) AccessChain 21 98
             104:    7(fvec4) Load 103
             105:   92(fvec2) VectorShuffle 104 104 2 3
             106:   92(fvec2) FAdd 102 105
                              Store 94(vs_TEXCOORD0) 106
             108:    7(fvec4) Load 11
                              Store 107(vs_TEXCOORD1) 108
             109:     24(ptr) AccessChain 21 28
             110:    7(fvec4) Load 109
             111:   92(fvec2) VectorShuffle 110 110 1 1
             112:     24(ptr) AccessChain 21 36 23
             113:    7(fvec4) Load 112
             114:   92(fvec2) VectorShuffle 113 113 0 1
             115:   92(fvec2) FMul 111 114
             116:    7(fvec4) Load 9
             117:    7(fvec4) VectorShuffle 116 115 4 5 2 3
                              Store 9 117
             118:     24(ptr) AccessChain 21 36 28
             119:    7(fvec4) Load 118
             120:   92(fvec2) VectorShuffle 119 119 0 1
             121:     24(ptr) AccessChain 21 28
             122:    7(fvec4) Load 121
             123:   92(fvec2) VectorShuffle 122 122 0 0
             124:   92(fvec2) FMul 120 123
             125:    7(fvec4) Load 9
             126:   92(fvec2) VectorShuffle 125 125 0 1
             127:   92(fvec2) FAdd 124 126
             128:    7(fvec4) Load 9
             129:    7(fvec4) VectorShuffle 128 127 4 5 2 3
                              Store 9 129
             130:    7(fvec4) Load 9
             131:   92(fvec2) VectorShuffle 130 130 3 3
             132:    7(fvec4) Load 9
             133:   92(fvec2) VectorShuffle 132 132 0 1
             134:   92(fvec2) ExtInst 1(GLSL.std.450) 4(FAbs) 133
             135:   92(fvec2) FDiv 131 134
             136:    7(fvec4) Load 9
             137:    7(fvec4) VectorShuffle 136 135 4 5 2 3
                              Store 9 137
             140:    139(ptr) AccessChain 21 138
             141:    6(float) Load 140
             143:    139(ptr) AccessChain 21 142
             144:    6(float) Load 143
             145:   92(fvec2) CompositeConstruct 141 144
             148:   92(fvec2) FMul 145 147
             149:    7(fvec4) Load 9
             150:   92(fvec2) VectorShuffle 149 149 0 1
             151:   92(fvec2) ExtInst 1(GLSL.std.450) 4(FAbs) 150
             152:   92(fvec2) FAdd 148 151
             153:    7(fvec4) Load 9
             154:    7(fvec4) VectorShuffle 153 152 4 5 2 3
                              Store 9 154
             156:    7(fvec4) Load 9
             157:   92(fvec2) VectorShuffle 156 156 0 1
             158:   92(fvec2) FDiv 147 157
             159:    7(fvec4) Load 155(vs_TEXCOORD2)
             160:    7(fvec4) VectorShuffle 159 158 0 1 4 5
                              Store 155(vs_TEXCOORD2) 160
             162:     24(ptr) AccessChain 21 161
             163:    7(fvec4) Load 162
             166:    7(fvec4) ExtInst 1(GLSL.std.450) 40(FMax) 163 165
                              Store 9 166
             167:    7(fvec4) Load 9
             170:    7(fvec4) ExtInst 1(GLSL.std.450) 37(FMin) 167 169
                              Store 9 170
             171:    7(fvec4) Load 11
             172:   92(fvec2) VectorShuffle 171 171 0 1
             175:   92(fvec2) FMul 172 174
             176:    7(fvec4) Load 9
             177:   92(fvec2) VectorShuffle 176 176 0 1
             178:   92(fvec2) FNegate 177
             179:   92(fvec2) FAdd 175 178
             180:    7(fvec4) Load 9
             181:    7(fvec4) VectorShuffle 180 179 4 5 2 3
                              Store 9 181
             182:    7(fvec4) Load 9
             183:   92(fvec2) VectorShuffle 182 182 2 3
             184:   92(fvec2) FNegate 183
             185:    7(fvec4) Load 9
             186:   92(fvec2) VectorShuffle 185 185 0 1
             187:   92(fvec2) FAdd 184 186
             188:    7(fvec4) Load 155(vs_TEXCOORD2)
             189:    7(fvec4) VectorShuffle 188 187 4 5 2 3
                              Store 155(vs_TEXCOORD2) 189
             191:    190(ptr) AccessChain 80 28 76
             192:    6(float) Load 191
             193:    6(float) FNegate 192
             194:    190(ptr) AccessChain 80 28 76
                              Store 194 193
                              Return
                              FunctionEnd

Disassembly for Fragment:
// Module Version 10000
// Generated by (magic number): 80006
// Id's are bound by 159

                              Capability Shader
               1:             ExtInstImport  "GLSL.std.450"
                              MemoryModel Logical GLSL450
                              EntryPoint Fragment 4  "main" 11 44 80 123
                              ExecutionMode 4 OriginUpperLeft
                              Name 44  "vs_TEXCOORD0"
                              Name 80  "vs_TEXCOORD2"
                              Decorate 9 RelaxedPrecision
                              Decorate 11 RelaxedPrecision
                              Decorate 11 Location 0
                              Decorate 16 RelaxedPrecision
                              Decorate 18 RelaxedPrecision
                              Decorate 23 RelaxedPrecision
                              Decorate 24 RelaxedPrecision
                              Decorate 27 RelaxedPrecision
                              Decorate 29 RelaxedPrecision
                              Decorate 31 RelaxedPrecision
                              Decorate 34 RelaxedPrecision
                              Decorate 34 DescriptorSet 0
                              Decorate 34 Binding 1
                              Decorate 35 RelaxedPrecision
                              Decorate 38 RelaxedPrecision
                              Decorate 38 DescriptorSet 0
                              Decorate 38 Binding 0
                              Decorate 39 RelaxedPrecision
                              Decorate 44(vs_TEXCOORD0) Location 1
                              Decorate 48 RelaxedPrecision
                              MemberDecorate 49 0 RelaxedPrecision
                              MemberDecorate 49 0 Offset 0
                              MemberDecorate 49 1 Offset 16
                              Decorate 49 Block
                              Decorate 51 DescriptorSet 1
                              Decorate 51 Binding 0
                              Decorate 56 RelaxedPrecision
                              Decorate 57 RelaxedPrecision
                              Decorate 59 RelaxedPrecision
                              Decorate 60 RelaxedPrecision
                              Decorate 64 RelaxedPrecision
                              Decorate 80(vs_TEXCOORD2) Location 2
                              Decorate 104 RelaxedPrecision
                              Decorate 111 RelaxedPrecision
                              Decorate 114 RelaxedPrecision
                              Decorate 120 RelaxedPrecision
                              Decorate 123 RelaxedPrecision
                              Decorate 123 Location 0
                              Decorate 126 RelaxedPrecision
                              Decorate 131 RelaxedPrecision
                              Decorate 137 RelaxedPrecision
               2:             TypeVoid
               3:             TypeFunction 2
               6:             TypeFloat 32
               7:             TypeVector 6(float) 4
               8:             TypePointer Private 7(fvec4)
               9:      8(ptr) Variable Private
              10:             TypePointer Input 7(fvec4)
              11:     10(ptr) Variable Input
              12:             TypeInt 32 0
              13:     12(int) Constant 3
              14:             TypePointer Input 6(float)
              17:    6(float) Constant 1132396544
              19:     12(int) Constant 0
              20:             TypePointer Private 6(float)
              28:    6(float) Constant 998277249
              31:      8(ptr) Variable Private
              32:             TypeImage 6(float) 2D sampled format:Unknown
              33:             TypePointer UniformConstant 32
              34:     33(ptr) Variable UniformConstant
              36:             TypeSampler
              37:             TypePointer UniformConstant 36
              38:     37(ptr) Variable UniformConstant
              40:             TypeSampledImage 32
              42:             TypeVector 6(float) 2
              43:             TypePointer Input 42(fvec2)
44(vs_TEXCOORD0):     43(ptr) Variable Input
              47:      8(ptr) Variable Private
              49:             TypeStruct 7(fvec4) 7(fvec4)
              50:             TypePointer Uniform 49(struct)
              51:     50(ptr) Variable Uniform
              52:             TypeInt 32 1
              53:     52(int) Constant 0
              54:             TypePointer Uniform 7(fvec4)
              58:             TypeVector 6(float) 3
              63:      8(ptr) Variable Private
              67:     52(int) Constant 1
80(vs_TEXCOORD2):     10(ptr) Variable Input
              97:    6(float) Constant 0
              98:    6(float) Constant 1065353216
             104:     20(ptr) Variable Private
             105:     12(int) Constant 1
             111:     20(ptr) Variable Private
             116:    6(float) Constant 3129152111
             122:             TypePointer Output 7(fvec4)
             123:    122(ptr) Variable Output
             132:             TypePointer Output 6(float)
             134:             TypeBool
             135:             TypePointer Private 134(bool)
             136:    135(ptr) Variable Private
             141:     52(int) Constant 4294967295
             148:             TypePointer Function 7(fvec4)
             150:             TypeVector 52(int) 4
             151:             TypePointer Function 150(ivec4)
             153:             TypeVector 134(bool) 4
             154:             TypePointer Function 153(bvec4)
             156:             TypeVector 12(int) 4
             157:             TypePointer Function 156(ivec4)
               4:           2 Function None 3
               5:             Label
             149:    148(ptr) Variable Function
             152:    151(ptr) Variable Function
             155:    154(ptr) Variable Function
             158:    157(ptr) Variable Function
              15:     14(ptr) AccessChain 11 13
              16:    6(float) Load 15
              18:    6(float) FMul 16 17
              21:     20(ptr) AccessChain 9 19
                              Store 21 18
              22:     20(ptr) AccessChain 9 19
              23:    6(float) Load 22
              24:    6(float) ExtInst 1(GLSL.std.450) 2(RoundEven) 23
              25:     20(ptr) AccessChain 9 19
                              Store 25 24
              26:     20(ptr) AccessChain 9 19
              27:    6(float) Load 26
              29:    6(float) FMul 27 28
              30:     20(ptr) AccessChain 9 13
                              Store 30 29
              35:          32 Load 34
              39:          36 Load 38
              41:          40 SampledImage 35 39
              45:   42(fvec2) Load 44(vs_TEXCOORD0)
              46:    7(fvec4) ImageSampleImplicitLod 41 45
                              Store 31 46
              48:    7(fvec4) Load 31
              55:     54(ptr) AccessChain 51 53
              56:    7(fvec4) Load 55
              57:    7(fvec4) FAdd 48 56
                              Store 47 57
              59:    7(fvec4) Load 11
              60:   58(fvec3) VectorShuffle 59 59 0 1 2
              61:    7(fvec4) Load 9
              62:    7(fvec4) VectorShuffle 61 60 4 5 6 3
                              Store 9 62
              64:    7(fvec4) Load 9
              65:    7(fvec4) Load 47
              66:    7(fvec4) FMul 64 65
                              Store 63 66
              68:     54(ptr) AccessChain 51 67
              69:    7(fvec4) Load 68
              70:   42(fvec2) VectorShuffle 69 69 0 1
              71:   42(fvec2) FNegate 70
              72:     54(ptr) AccessChain 51 67
              73:    7(fvec4) Load 72
              74:   42(fvec2) VectorShuffle 73 73 2 3
              75:   42(fvec2) FAdd 71 74
              76:    7(fvec4) Load 47
              77:    7(fvec4) VectorShuffle 76 75 4 5 2 3
                              Store 47 77
              78:    7(fvec4) Load 47
              79:   42(fvec2) VectorShuffle 78 78 0 1
              81:    7(fvec4) Load 80(vs_TEXCOORD2)
              82:   42(fvec2) VectorShuffle 81 81 0 1
              83:   42(fvec2) ExtInst 1(GLSL.std.450) 4(FAbs) 82
              84:   42(fvec2) FNegate 83
              85:   42(fvec2) FAdd 79 84
              86:    7(fvec4) Load 47
              87:    7(fvec4) VectorShuffle 86 85 4 5 2 3
                              Store 47 87
              88:    7(fvec4) Load 47
              89:   42(fvec2) VectorShuffle 88 88 0 1
              90:    7(fvec4) Load 80(vs_TEXCOORD2)
              91:   42(fvec2) VectorShuffle 90 90 2 3
              92:   42(fvec2) FMul 89 91
              93:    7(fvec4) Load 47
              94:    7(fvec4) VectorShuffle 93 92 4 5 2 3
                              Store 47 94
              95:    7(fvec4) Load 47
              96:   42(fvec2) VectorShuffle 95 95 0 1
              99:   42(fvec2) CompositeConstruct 97 97
             100:   42(fvec2) CompositeConstruct 98 98
             101:   42(fvec2) ExtInst 1(GLSL.std.450) 43(FClamp) 96 99 100
             102:    7(fvec4) Load 47
             103:    7(fvec4) VectorShuffle 102 101 4 5 2 3
                              Store 47 103
             106:     20(ptr) AccessChain 47 105
             107:    6(float) Load 106
             108:     20(ptr) AccessChain 47 19
             109:    6(float) Load 108
             110:    6(float) FMul 107 109
                              Store 104 110
             112:     20(ptr) AccessChain 63 13
             113:    6(float) Load 112
             114:    6(float) Load 104
             115:    6(float) FMul 113 114
             117:    6(float) FAdd 115 116
                              Store 111 117
             118:     20(ptr) AccessChain 63 13
             119:    6(float) Load 118
             120:    6(float) Load 104
             121:    6(float) FMul 119 120
                              Store 104 121
             124:    7(fvec4) Load 63
             125:   58(fvec3) VectorShuffle 124 124 0 1 2
             126:    6(float) Load 104
             127:   58(fvec3) CompositeConstruct 126 126 126
             128:   58(fvec3) FMul 125 127
             129:    7(fvec4) Load 123
             130:    7(fvec4) VectorShuffle 129 128 4 5 6 3
                              Store 123 130
             131:    6(float) Load 104
             133:    132(ptr) AccessChain 123 13
                              Store 133 131
             137:    6(float) Load 111
             138:   134(bool) FOrdLessThan 137 97
                              Store 136 138
             139:   134(bool) Load 136
             140:     52(int) Select 139 67 53
             142:     52(int) IMul 140 141
             143:   134(bool) INotEqual 142 53
                              SelectionMerge 145 None
                              BranchConditional 143 144 145
             144:               Label
                                Kill
             145:             Label
                              Return
                              FunctionEnd

Disassembly for Hull:
Not present.



 }
}
}
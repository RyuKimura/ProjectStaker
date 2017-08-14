// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.30 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.30;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:3,spmd:1,trmd:0,grmd:1,uamb:True,mssp:True,bkdf:True,hqlp:False,rprd:True,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:2865,x:32719,y:32712,varname:node_2865,prsc:2|diff-7939-RGB,spec-4757-OUT,gloss-925-OUT,normal-3649-OUT,difocc-7449-OUT,spcocc-7449-OUT,clip-7939-A;n:type:ShaderForge.SFN_Tex2d,id:7939,x:32125,y:32512,ptovrint:False,ptlb:Base Albedo + Alpha,ptin:_BaseAlbedoAlpha,varname:node_7939,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-9316-OUT;n:type:ShaderForge.SFN_Tex2d,id:7677,x:30876,y:32895,ptovrint:False,ptlb:Base Normal,ptin:_BaseNormal,varname:node_7677,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:3,isnm:True|UVIN-9316-OUT;n:type:ShaderForge.SFN_SwitchProperty,id:4757,x:32125,y:32719,ptovrint:False,ptlb:Metallic?,ptin:_Metallic,varname:node_4757,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-8905-OUT,B-7441-G;n:type:ShaderForge.SFN_Vector1,id:8905,x:31853,y:32666,varname:node_8905,prsc:2,v1:0;n:type:ShaderForge.SFN_Tex2d,id:7441,x:31853,y:32803,ptovrint:False,ptlb:Base OMR,ptin:_BaseOMR,varname:node_7441,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-9316-OUT;n:type:ShaderForge.SFN_OneMinus,id:6255,x:32125,y:32943,varname:node_6255,prsc:2|IN-7441-B;n:type:ShaderForge.SFN_Power,id:7449,x:32426,y:33083,varname:node_7449,prsc:2|VAL-7441-R,EXP-6212-OUT;n:type:ShaderForge.SFN_Slider,id:6212,x:32046,y:33263,ptovrint:False,ptlb:AO Power,ptin:_AOPower,varname:node_6212,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:2,max:10;n:type:ShaderForge.SFN_TexCoord,id:4224,x:30317,y:32701,varname:node_4224,prsc:2,uv:0;n:type:ShaderForge.SFN_Multiply,id:9316,x:30632,y:32700,varname:node_9316,prsc:2|A-4224-UVOUT,B-6419-OUT;n:type:ShaderForge.SFN_Slider,id:6419,x:30160,y:32882,ptovrint:False,ptlb:Base Tiling,ptin:_BaseTiling,varname:node_6419,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:10;n:type:ShaderForge.SFN_Tex2d,id:6424,x:30876,y:33424,ptovrint:False,ptlb:Detail Normal,ptin:_DetailNormal,varname:node_6424,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:3,isnm:True|UVIN-5748-OUT;n:type:ShaderForge.SFN_TexCoord,id:9505,x:29674,y:33491,varname:node_9505,prsc:2,uv:0;n:type:ShaderForge.SFN_Multiply,id:5748,x:30283,y:33602,varname:node_5748,prsc:2|A-1458-UVOUT,B-1133-OUT;n:type:ShaderForge.SFN_Slider,id:1133,x:29884,y:33760,ptovrint:False,ptlb:Detail Tiling,ptin:_DetailTiling,varname:node_1133,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:2,max:20;n:type:ShaderForge.SFN_Multiply,id:2148,x:31224,y:32884,varname:node_2148,prsc:2|A-7677-R,B-7991-OUT;n:type:ShaderForge.SFN_Multiply,id:3236,x:31224,y:33010,varname:node_3236,prsc:2|A-7677-G,B-7991-OUT;n:type:ShaderForge.SFN_Append,id:3795,x:31425,y:32884,varname:node_3795,prsc:2|A-2148-OUT,B-3236-OUT;n:type:ShaderForge.SFN_Append,id:7532,x:31669,y:33014,varname:node_7532,prsc:2|A-3795-OUT,B-7677-B;n:type:ShaderForge.SFN_Slider,id:7991,x:30719,y:33142,ptovrint:False,ptlb:Base Normal Intensity,ptin:_BaseNormalIntensity,varname:node_7991,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1.5,max:5;n:type:ShaderForge.SFN_Multiply,id:4540,x:31240,y:33260,varname:node_4540,prsc:2|A-6424-R,B-3650-OUT;n:type:ShaderForge.SFN_Multiply,id:88,x:31240,y:33386,varname:node_88,prsc:2|A-6424-G,B-3650-OUT;n:type:ShaderForge.SFN_Append,id:1277,x:31440,y:33386,varname:node_1277,prsc:2|A-4540-OUT,B-88-OUT;n:type:ShaderForge.SFN_Append,id:7230,x:31669,y:33227,varname:node_7230,prsc:2|A-1277-OUT,B-6424-B;n:type:ShaderForge.SFN_Slider,id:3650,x:30719,y:33270,ptovrint:False,ptlb:Detail Normal Intensity,ptin:_DetailNormalIntensity,varname:node_3650,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1.2,max:5;n:type:ShaderForge.SFN_Add,id:3649,x:32125,y:33082,varname:node_3649,prsc:2|A-7532-OUT,B-7230-OUT;n:type:ShaderForge.SFN_Rotator,id:1458,x:29952,y:33529,varname:node_1458,prsc:2|UVIN-9505-UVOUT,ANG-5849-OUT;n:type:ShaderForge.SFN_Slider,id:5849,x:29462,y:33706,ptovrint:False,ptlb:Detail Rotation,ptin:_DetailRotation,varname:node_5849,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:5;n:type:ShaderForge.SFN_SwitchProperty,id:925,x:32315,y:32844,ptovrint:False,ptlb:Invert Roughness?,ptin:_InvertRoughness,varname:node_925,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-7441-B,B-6255-OUT;proporder:6419-7939-7677-7991-7441-6212-925-4757-1133-6424-3650-5849;pass:END;sub:END;*/

Shader "Shader Forge/masterMaterial_opaque" {
    Properties {
        _BaseTiling ("Base Tiling", Range(0, 10)) = 1
        _BaseAlbedoAlpha ("Base Albedo + Alpha", 2D) = "white" {}
        _BaseNormal ("Base Normal", 2D) = "bump" {}
        _BaseNormalIntensity ("Base Normal Intensity", Range(0, 5)) = 1.5
        _BaseOMR ("Base OMR", 2D) = "white" {}
        _AOPower ("AO Power", Range(0, 10)) = 2
        [MaterialToggle] _InvertRoughness ("Invert Roughness?", Float ) = 0
        [MaterialToggle] _Metallic ("Metallic?", Float ) = 0
        _DetailTiling ("Detail Tiling", Range(0, 20)) = 2
        _DetailNormal ("Detail Normal", 2D) = "bump" {}
        _DetailNormalIntensity ("Detail Normal Intensity", Range(0, 5)) = 1.2
        _DetailRotation ("Detail Rotation", Range(0, 5)) = 0
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "Queue"="AlphaTest"
            "RenderType"="TransparentCutout"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Cull Off
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
            #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
            #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform sampler2D _BaseAlbedoAlpha; uniform float4 _BaseAlbedoAlpha_ST;
            uniform sampler2D _BaseNormal; uniform float4 _BaseNormal_ST;
            uniform fixed _Metallic;
            uniform sampler2D _BaseOMR; uniform float4 _BaseOMR_ST;
            uniform float _AOPower;
            uniform float _BaseTiling;
            uniform sampler2D _DetailNormal; uniform float4 _DetailNormal_ST;
            uniform float _DetailTiling;
            uniform float _BaseNormalIntensity;
            uniform float _DetailNormalIntensity;
            uniform float _DetailRotation;
            uniform fixed _InvertRoughness;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                float2 uv2 : TEXCOORD2;
                float4 posWorld : TEXCOORD3;
                float3 normalDir : TEXCOORD4;
                float3 tangentDir : TEXCOORD5;
                float3 bitangentDir : TEXCOORD6;
                LIGHTING_COORDS(7,8)
                UNITY_FOG_COORDS(9)
                #if defined(LIGHTMAP_ON) || defined(UNITY_SHOULD_SAMPLE_SH)
                    float4 ambientOrLightmapUV : TEXCOORD10;
                #endif
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                #ifdef LIGHTMAP_ON
                    o.ambientOrLightmapUV.xy = v.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
                    o.ambientOrLightmapUV.zw = 0;
                #elif UNITY_SHOULD_SAMPLE_SH
                #endif
                #ifdef DYNAMICLIGHTMAP_ON
                    o.ambientOrLightmapUV.zw = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
                #endif
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                i.normalDir = normalize(i.normalDir);
                i.normalDir *= faceSign;
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float2 node_9316 = (i.uv0*_BaseTiling);
                float3 _BaseNormal_var = UnpackNormal(tex2D(_BaseNormal,TRANSFORM_TEX(node_9316, _BaseNormal)));
                float node_1458_ang = _DetailRotation;
                float node_1458_spd = 1.0;
                float node_1458_cos = cos(node_1458_spd*node_1458_ang);
                float node_1458_sin = sin(node_1458_spd*node_1458_ang);
                float2 node_1458_piv = float2(0.5,0.5);
                float2 node_1458 = (mul(i.uv0-node_1458_piv,float2x2( node_1458_cos, -node_1458_sin, node_1458_sin, node_1458_cos))+node_1458_piv);
                float2 node_5748 = (node_1458*_DetailTiling);
                float3 _DetailNormal_var = UnpackNormal(tex2D(_DetailNormal,TRANSFORM_TEX(node_5748, _DetailNormal)));
                float3 normalLocal = (float3(float2((_BaseNormal_var.r*_BaseNormalIntensity),(_BaseNormal_var.g*_BaseNormalIntensity)),_BaseNormal_var.b)+float3(float2((_DetailNormal_var.r*_DetailNormalIntensity),(_DetailNormal_var.g*_DetailNormalIntensity)),_DetailNormal_var.b));
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float4 _BaseAlbedoAlpha_var = tex2D(_BaseAlbedoAlpha,TRANSFORM_TEX(node_9316, _BaseAlbedoAlpha));
                clip(_BaseAlbedoAlpha_var.a - 0.5);
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
                float Pi = 3.141592654;
                float InvPi = 0.31830988618;
///////// Gloss:
                float4 _BaseOMR_var = tex2D(_BaseOMR,TRANSFORM_TEX(node_9316, _BaseOMR));
                float gloss = 1.0 - lerp( _BaseOMR_var.b, (1.0 - _BaseOMR_var.b), _InvertRoughness ); // Convert roughness to gloss
                float specPow = exp2( gloss * 10.0+1.0);
/////// GI Data:
                UnityLight light;
                #ifdef LIGHTMAP_OFF
                    light.color = lightColor;
                    light.dir = lightDirection;
                    light.ndotl = LambertTerm (normalDirection, light.dir);
                #else
                    light.color = half3(0.f, 0.f, 0.f);
                    light.ndotl = 0.0f;
                    light.dir = half3(0.f, 0.f, 0.f);
                #endif
                UnityGIInput d;
                d.light = light;
                d.worldPos = i.posWorld.xyz;
                d.worldViewDir = viewDirection;
                d.atten = attenuation;
                #if defined(LIGHTMAP_ON) || defined(DYNAMICLIGHTMAP_ON)
                    d.ambient = 0;
                    d.lightmapUV = i.ambientOrLightmapUV;
                #else
                    d.ambient = i.ambientOrLightmapUV;
                #endif
                d.boxMax[0] = unity_SpecCube0_BoxMax;
                d.boxMin[0] = unity_SpecCube0_BoxMin;
                d.probePosition[0] = unity_SpecCube0_ProbePosition;
                d.probeHDR[0] = unity_SpecCube0_HDR;
                d.boxMax[1] = unity_SpecCube1_BoxMax;
                d.boxMin[1] = unity_SpecCube1_BoxMin;
                d.probePosition[1] = unity_SpecCube1_ProbePosition;
                d.probeHDR[1] = unity_SpecCube1_HDR;
                Unity_GlossyEnvironmentData ugls_en_data;
                ugls_en_data.roughness = 1.0 - gloss;
                ugls_en_data.reflUVW = viewReflectDirection;
                UnityGI gi = UnityGlobalIllumination(d, 1, normalDirection, ugls_en_data );
                lightDirection = gi.light.dir;
                lightColor = gi.light.color;
////// Specular:
                float NdotL = max(0, dot( normalDirection, lightDirection ));
                float node_7449 = pow(_BaseOMR_var.r,_AOPower);
                float3 specularAO = node_7449;
                float LdotH = max(0.0,dot(lightDirection, halfDirection));
                float3 specularColor = lerp( 0.0, _BaseOMR_var.g, _Metallic );
                float specularMonochrome;
                float3 diffuseColor = _BaseAlbedoAlpha_var.rgb; // Need this for specular when using metallic
                diffuseColor = DiffuseAndSpecularFromMetallic( diffuseColor, specularColor, specularColor, specularMonochrome );
                specularMonochrome = 1.0-specularMonochrome;
                float NdotV = max(0.0,dot( normalDirection, viewDirection ));
                float NdotH = max(0.0,dot( normalDirection, halfDirection ));
                float VdotH = max(0.0,dot( viewDirection, halfDirection ));
                float visTerm = SmithJointGGXVisibilityTerm( NdotL, NdotV, 1.0-gloss );
                float normTerm = max(0.0, GGXTerm(NdotH, 1.0-gloss));
                float specularPBL = (NdotL*visTerm*normTerm) * (UNITY_PI / 4);
                if (IsGammaSpace())
                    specularPBL = sqrt(max(1e-4h, specularPBL));
                specularPBL = max(0, specularPBL * NdotL);
                float3 directSpecular = (floor(attenuation) * _LightColor0.xyz)*specularPBL*FresnelTerm(specularColor, LdotH);
                half grazingTerm = saturate( gloss + specularMonochrome );
                float3 indirectSpecular = (gi.indirect.specular) * specularAO;
                indirectSpecular *= FresnelLerp (specularColor, grazingTerm, NdotV);
                float3 specular = (directSpecular + indirectSpecular);
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                half fd90 = 0.5 + 2 * LdotH * LdotH * (1-gloss);
                float nlPow5 = Pow5(1-NdotL);
                float nvPow5 = Pow5(1-NdotV);
                float3 directDiffuse = ((1 +(fd90 - 1)*nlPow5) * (1 + (fd90 - 1)*nvPow5) * NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += gi.indirect.diffuse;
                indirectDiffuse *= node_7449; // Diffuse AO
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse + specular;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            Cull Off
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
            #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
            #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform sampler2D _BaseAlbedoAlpha; uniform float4 _BaseAlbedoAlpha_ST;
            uniform sampler2D _BaseNormal; uniform float4 _BaseNormal_ST;
            uniform fixed _Metallic;
            uniform sampler2D _BaseOMR; uniform float4 _BaseOMR_ST;
            uniform float _BaseTiling;
            uniform sampler2D _DetailNormal; uniform float4 _DetailNormal_ST;
            uniform float _DetailTiling;
            uniform float _BaseNormalIntensity;
            uniform float _DetailNormalIntensity;
            uniform float _DetailRotation;
            uniform fixed _InvertRoughness;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                float2 uv2 : TEXCOORD2;
                float4 posWorld : TEXCOORD3;
                float3 normalDir : TEXCOORD4;
                float3 tangentDir : TEXCOORD5;
                float3 bitangentDir : TEXCOORD6;
                LIGHTING_COORDS(7,8)
                UNITY_FOG_COORDS(9)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                i.normalDir = normalize(i.normalDir);
                i.normalDir *= faceSign;
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float2 node_9316 = (i.uv0*_BaseTiling);
                float3 _BaseNormal_var = UnpackNormal(tex2D(_BaseNormal,TRANSFORM_TEX(node_9316, _BaseNormal)));
                float node_1458_ang = _DetailRotation;
                float node_1458_spd = 1.0;
                float node_1458_cos = cos(node_1458_spd*node_1458_ang);
                float node_1458_sin = sin(node_1458_spd*node_1458_ang);
                float2 node_1458_piv = float2(0.5,0.5);
                float2 node_1458 = (mul(i.uv0-node_1458_piv,float2x2( node_1458_cos, -node_1458_sin, node_1458_sin, node_1458_cos))+node_1458_piv);
                float2 node_5748 = (node_1458*_DetailTiling);
                float3 _DetailNormal_var = UnpackNormal(tex2D(_DetailNormal,TRANSFORM_TEX(node_5748, _DetailNormal)));
                float3 normalLocal = (float3(float2((_BaseNormal_var.r*_BaseNormalIntensity),(_BaseNormal_var.g*_BaseNormalIntensity)),_BaseNormal_var.b)+float3(float2((_DetailNormal_var.r*_DetailNormalIntensity),(_DetailNormal_var.g*_DetailNormalIntensity)),_DetailNormal_var.b));
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float4 _BaseAlbedoAlpha_var = tex2D(_BaseAlbedoAlpha,TRANSFORM_TEX(node_9316, _BaseAlbedoAlpha));
                clip(_BaseAlbedoAlpha_var.a - 0.5);
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
                float Pi = 3.141592654;
                float InvPi = 0.31830988618;
///////// Gloss:
                float4 _BaseOMR_var = tex2D(_BaseOMR,TRANSFORM_TEX(node_9316, _BaseOMR));
                float gloss = 1.0 - lerp( _BaseOMR_var.b, (1.0 - _BaseOMR_var.b), _InvertRoughness ); // Convert roughness to gloss
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                float NdotL = max(0, dot( normalDirection, lightDirection ));
                float LdotH = max(0.0,dot(lightDirection, halfDirection));
                float3 specularColor = lerp( 0.0, _BaseOMR_var.g, _Metallic );
                float specularMonochrome;
                float3 diffuseColor = _BaseAlbedoAlpha_var.rgb; // Need this for specular when using metallic
                diffuseColor = DiffuseAndSpecularFromMetallic( diffuseColor, specularColor, specularColor, specularMonochrome );
                specularMonochrome = 1.0-specularMonochrome;
                float NdotV = max(0.0,dot( normalDirection, viewDirection ));
                float NdotH = max(0.0,dot( normalDirection, halfDirection ));
                float VdotH = max(0.0,dot( viewDirection, halfDirection ));
                float visTerm = SmithJointGGXVisibilityTerm( NdotL, NdotV, 1.0-gloss );
                float normTerm = max(0.0, GGXTerm(NdotH, 1.0-gloss));
                float specularPBL = (NdotL*visTerm*normTerm) * (UNITY_PI / 4);
                if (IsGammaSpace())
                    specularPBL = sqrt(max(1e-4h, specularPBL));
                specularPBL = max(0, specularPBL * NdotL);
                float3 directSpecular = attenColor*specularPBL*FresnelTerm(specularColor, LdotH);
                float3 specular = directSpecular;
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                half fd90 = 0.5 + 2 * LdotH * LdotH * (1-gloss);
                float nlPow5 = Pow5(1-NdotL);
                float nvPow5 = Pow5(1-NdotV);
                float3 directDiffuse = ((1 +(fd90 - 1)*nlPow5) * (1 + (fd90 - 1)*nvPow5) * NdotL) * attenColor;
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse + specular;
                fixed4 finalRGBA = fixed4(finalColor * 1,0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
            #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
            #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform sampler2D _BaseAlbedoAlpha; uniform float4 _BaseAlbedoAlpha_ST;
            uniform float _BaseTiling;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
                float2 uv1 : TEXCOORD2;
                float2 uv2 : TEXCOORD3;
                float4 posWorld : TEXCOORD4;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float2 node_9316 = (i.uv0*_BaseTiling);
                float4 _BaseAlbedoAlpha_var = tex2D(_BaseAlbedoAlpha,TRANSFORM_TEX(node_9316, _BaseAlbedoAlpha));
                clip(_BaseAlbedoAlpha_var.a - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
        Pass {
            Name "Meta"
            Tags {
                "LightMode"="Meta"
            }
            Cull Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_META 1
            #define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #include "UnityMetaPass.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
            #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
            #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform sampler2D _BaseAlbedoAlpha; uniform float4 _BaseAlbedoAlpha_ST;
            uniform fixed _Metallic;
            uniform sampler2D _BaseOMR; uniform float4 _BaseOMR_ST;
            uniform float _BaseTiling;
            uniform fixed _InvertRoughness;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                float2 uv2 : TEXCOORD2;
                float4 posWorld : TEXCOORD3;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityMetaVertexPosition(v.vertex, v.texcoord1.xy, v.texcoord2.xy, unity_LightmapST, unity_DynamicLightmapST );
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : SV_Target {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                UnityMetaInput o;
                UNITY_INITIALIZE_OUTPUT( UnityMetaInput, o );
                
                o.Emission = 0;
                
                float2 node_9316 = (i.uv0*_BaseTiling);
                float4 _BaseAlbedoAlpha_var = tex2D(_BaseAlbedoAlpha,TRANSFORM_TEX(node_9316, _BaseAlbedoAlpha));
                float3 diffColor = _BaseAlbedoAlpha_var.rgb;
                float specularMonochrome;
                float3 specColor;
                float4 _BaseOMR_var = tex2D(_BaseOMR,TRANSFORM_TEX(node_9316, _BaseOMR));
                diffColor = DiffuseAndSpecularFromMetallic( diffColor, lerp( 0.0, _BaseOMR_var.g, _Metallic ), specColor, specularMonochrome );
                float roughness = lerp( _BaseOMR_var.b, (1.0 - _BaseOMR_var.b), _InvertRoughness );
                o.Albedo = diffColor + specColor * roughness * roughness * 0.5;
                
                return UnityMetaFragment( o );
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}

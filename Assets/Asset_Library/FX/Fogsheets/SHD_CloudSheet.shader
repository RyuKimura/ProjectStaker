// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.30 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.30;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:True,hqlp:False,rprd:True,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:1,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:2865,x:32719,y:32712,varname:node_2865,prsc:2|emission-6048-OUT,alpha-9142-OUT;n:type:ShaderForge.SFN_Tex2d,id:4087,x:31445,y:32972,ptovrint:False,ptlb:node_4087,ptin:_node_4087,varname:node_4087,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:7edeecdcb8d6eec4ea03f18cb07fa4b7,ntxv:0,isnm:False|UVIN-258-UVOUT;n:type:ShaderForge.SFN_Vector1,id:6048,x:32459,y:32745,varname:node_6048,prsc:2,v1:1;n:type:ShaderForge.SFN_Lerp,id:9142,x:32047,y:32961,varname:node_9142,prsc:2|A-5325-OUT,B-7498-OUT,T-6199-OUT;n:type:ShaderForge.SFN_Vector1,id:5325,x:31799,y:32841,varname:node_5325,prsc:2,v1:0;n:type:ShaderForge.SFN_TexCoord,id:8677,x:30541,y:32972,varname:node_8677,prsc:2,uv:0;n:type:ShaderForge.SFN_Multiply,id:6141,x:30532,y:33151,varname:node_6141,prsc:2|A-8677-V,B-1435-OUT;n:type:ShaderForge.SFN_Vector1,id:1435,x:30288,y:33185,varname:node_1435,prsc:2,v1:3;n:type:ShaderForge.SFN_Tex2d,id:215,x:31033,y:33207,ptovrint:False,ptlb:node_215,ptin:_node_215,varname:node_215,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:7edeecdcb8d6eec4ea03f18cb07fa4b7,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Panner,id:258,x:31254,y:32972,varname:node_258,prsc:2,spu:-0.01,spv:0|UVIN-241-OUT;n:type:ShaderForge.SFN_DepthBlend,id:2548,x:31715,y:33411,varname:node_2548,prsc:2|DIST-9122-OUT;n:type:ShaderForge.SFN_Multiply,id:6199,x:31715,y:33217,varname:node_6199,prsc:2|A-215-A,B-2548-OUT;n:type:ShaderForge.SFN_Vector1,id:9122,x:31254,y:33406,varname:node_9122,prsc:2,v1:50;n:type:ShaderForge.SFN_Multiply,id:7498,x:31715,y:32980,varname:node_7498,prsc:2|A-4087-R,B-2071-OUT;n:type:ShaderForge.SFN_Vector1,id:2071,x:31445,y:33137,varname:node_2071,prsc:2,v1:0.1;n:type:ShaderForge.SFN_Append,id:241,x:31033,y:32972,varname:node_241,prsc:2|A-4528-OUT,B-6141-OUT;n:type:ShaderForge.SFN_Vector1,id:723,x:30541,y:32834,varname:node_723,prsc:2,v1:2;n:type:ShaderForge.SFN_Multiply,id:4528,x:30785,y:32972,varname:node_4528,prsc:2|A-8677-U,B-723-OUT;proporder:4087-215;pass:END;sub:END;*/

Shader "Shader Forge/SHD_CloudSheet" {
    Properties {
        _node_4087 ("node_4087", 2D) = "white" {}
        _node_215 ("node_215", 2D) = "white" {}
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha OneMinusSrcAlpha
            Cull Front
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdbase
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform sampler2D _CameraDepthTexture;
            uniform float4 _TimeEditor;
            uniform sampler2D _node_4087; uniform float4 _node_4087_ST;
            uniform sampler2D _node_215; uniform float4 _node_215_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float4 projPos : TEXCOORD3;
                UNITY_FOG_COORDS(4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(-v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float sceneZ = max(0,LinearEyeDepth (UNITY_SAMPLE_DEPTH(tex2Dproj(_CameraDepthTexture, UNITY_PROJ_COORD(i.projPos)))) - _ProjectionParams.g);
                float partZ = max(0,i.projPos.z - _ProjectionParams.g);
////// Lighting:
////// Emissive:
                float node_6048 = 1.0;
                float3 emissive = float3(node_6048,node_6048,node_6048);
                float3 finalColor = emissive;
                float4 node_1220 = _Time + _TimeEditor;
                float2 node_258 = (float2((i.uv0.r*2.0),(i.uv0.g*3.0))+node_1220.g*float2(-0.01,0));
                float4 _node_4087_var = tex2D(_node_4087,TRANSFORM_TEX(node_258, _node_4087));
                float4 _node_215_var = tex2D(_node_215,TRANSFORM_TEX(i.uv0, _node_215));
                fixed4 finalRGBA = fixed4(finalColor,lerp(0.0,(_node_4087_var.r*0.1),(_node_215_var.a*saturate((sceneZ-partZ)/50.0))));
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
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
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #include "UnityMetaPass.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.pos = UnityMetaVertexPosition(v.vertex, v.texcoord1.xy, v.texcoord2.xy, unity_LightmapST, unity_DynamicLightmapST );
                return o;
            }
            float4 frag(VertexOutput i) : SV_Target {
                UnityMetaInput o;
                UNITY_INITIALIZE_OUTPUT( UnityMetaInput, o );
                
                float node_6048 = 1.0;
                o.Emission = float3(node_6048,node_6048,node_6048);
                
                float3 diffColor = float3(0,0,0);
                o.Albedo = diffColor;
                
                return UnityMetaFragment( o );
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}

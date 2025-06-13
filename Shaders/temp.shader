Shader "DeltaField/shaders/temp"{
    Properties{
        [Enum(UnityEngine.Rendering.CullMode)]
        _Cull("Culling Mode",Int)=2
        [KeywordEnum(Off,On)]
        _ZWrite("Z Write",Int)=1
        [Space(16)]
        [MaterialToggle]_Forced_Z_Scale_Zero("Forced Z Scale Zero",Float)=1.0
        [Toggle(_DISABLE_CUSTOM_BILLBOARD)]
        _DisableCustomBillBoard("Particle Billboard Mode(Feature)",Int)=0
        [Toggle(_NORMAL_PREVIEW)]
        _NormalPreview("Normal Preview Mode(Feature)",Int)=1.0
        [Toggle(_PREVIEW_MODE)]
        _PreviewMode("Preview Mode(Feature)",Int)=0
        [Space(16)]
        // Custom Property
        _MainTex("Main Tex",2D)=""{}
        _Color("Color",Color)=(0.5,0.5,0.5,1.0)
        [Space(16)]
        [KeywordEnum(None,Position,Rotation,Position_Rotation)]
        _StereoMergeMode("Stereo Merge Mode(Feature)",Int)=2
    }
    SubShader{
        Tags { "RenderType"="Opaque" "Queue"="Geometry" "LightMode"="ForwardBase"}
        Cull [_Cull]
        ZWrite [_ZWrite]

        GrabPass{
            //Unique names recommended.
            //重複しづらい名称を推奨します。
            // "_(NAME)"
            ///////////////////////////////
            // "_DELTAFIELD_GB_NAME_777"
            ///////////////////////////////
        }

        Pass{
            HLSLPROGRAM
            //Unique names recommended.
            //重複しづらい名称を推奨します。
            // #define GRABPASS_ID _(NAME)
            // #define GRABPASS_ID_ST _(NAME)_ST
            ////////////////////////////////////////
            // #define GRABPASS_ID _DELTAFIELD_GB_NAME_777
            // #define GRABPASS_ID_ST _DELTAFIELD_GB_NAME_777_ST
            ////////////////////////////////////////

            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #include "Packages/com.deltafield.shader_commons/Includes/features_stereo_merge.hlsl"

            #pragma shader_feature _ _DISABLE_CUSTOM_BILLBOARD
            #pragma shader_feature _ _NORMAL_PREVIEW
            #pragma shader_feature _ _PREVIEW_MODE

            struct appdata{
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 uv : TEXCOORD0;
                fixed4 color : COLOR;

                UNITY_VERTEX_INPUT_INSTANCE_ID
            };

            struct v2f{
                float4 vertex : SV_POSITION;
                float3 normal : NORMAL;
                float2 uv : TEXCOORD0;
                fixed alpha : TEXCOORD1;

                UNITY_VERTEX_INPUT_INSTANCE_ID
                UNITY_VERTEX_OUTPUT_STEREO
            };

            // sampler2D _DELTAFIELD_GB_NAME_777;
            // float4 _DELTAFIELD_GB_NAME_777_ST;

            float _Forced_Z_Scale_Zero;

            sampler2D _MainTex;
            half4 _Color;

            #include "Packages/com.deltafield.shader_commons/Includes/macro_stereo_merge.hlsl"
            #include "Packages/com.deltafield.shader_commons/Includes/functions_stereo_merge.hlsl"

            v2f vert (appdata v){
                v2f o;
                UNITY_SETUP_INSTANCE_ID(v);
                UNITY_INITIALIZE_OUTPUT(v2f,o);
                UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

                #ifdef _DISABLE_CUSTOM_BILLBOARD
                    o.alpha = v.color.a;
                    #include "Packages/com.deltafield.shader_commons/Includes/vertex_non_billboard.hlsl"
                #else
                    o.alpha = 1.0;
                    #include "Packages/com.deltafield.shader_commons/Includes/vertex_billboard.hlsl"
                #endif

                o.normal = v.normal;
                o.uv = v.uv;
                return o;
            }

            fixed4 frag (v2f i) : SV_Target{
                UNITY_SETUP_INSTANCE_ID(i)
                UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(i);

                #if _NORMAL_PREVIEW
                    fixed4 c = fixed4(i.normal,1.0);
                #else
                    fixed4 c = fixed4(lerp(UNITY_SAMPLE_SCREENSPACE_TEXTURE(_MainTex,i.uv),fixed4(_Color.rgb,1.0),_Color.a));
                #endif

                #ifdef _PREVIEW_MODE

                #else

                #endif
                return c;
            }
            ENDHLSL
        }
    }
}

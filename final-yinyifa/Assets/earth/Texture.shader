Shader "TEXTUREShader" {
//TEXTURE MAPPING LEARN FROM https://blog.csdn.net/l773575310/article/details/78538160
    Properties{
    _Color("Color", Color) = (1,1,1,1)
    _MainTex("Main Tex", 2D) = "white" {}	
    _Specular("Specular",Color) = (1,1,1,1)
    _Gloss("Gloss",Range(8.0,256)) = 20
    }
        SubShader{
        cull off

            Pass  {

               Tags {"LightMode" = "ForwardAdd"}

                CGPROGRAM

        // we'll provide both Vertex and Fragment shaders:
        #pragma vertex vert
        #pragma fragment frag

    #include "Lighting.cginc"
    #include "UnityCG.cginc"

    struct appdata {
        float4 vertex : POSITION;
        float3 normal : NORMAL;
        float4 texcoord : TEXCOORD0;
    };


    struct v2f {
        float4 vertex : SV_POSITION;
        float3 normal : TEXCOORD0;
        float3 pos : TEXCOORD1;
        float2 uv : TEXCOORD2;
    };

    sampler2D _MainTex;
    float4 _MainTex_ST;
    fixed4 _Color;
    fixed4 _Specular;
    float _Gloss;

    // ---------------------------------------------------------
    // the Vertex Shaders outputs positions on the Spline Curve:
    v2f vert(appdata v) {

        v2f o;
        o.vertex = UnityObjectToClipPos(v.vertex);
        o.normal = UnityObjectToWorldNormal(v.normal);
        o.pos = mul(unity_ObjectToWorld, v.vertex).xyz;

        o.uv = v.texcoord.xy * _MainTex_ST.xy + _MainTex_ST.zw;
        return o;
    } // end of vert shader


    // -------------------------------------------------
    // the Fragment Shader simply outputs a fixed color:


    fixed4 frag(v2f i) : SV_Target {
      
        fixed3 normal = normalize(i.normal);
        float3 lightDir = normalize(_WorldSpaceLightPos0.xyz);

        fixed3 albedo = tex2D(_MainTex, i.uv).rgb * _Color.rgb;
        fixed3 viewDir = normalize(UnityWorldSpaceViewDir(i.pos));

        fixed3 halfDir = normalize(viewDir + lightDir);

        fixed3 ambient = UNITY_LIGHTMODEL_AMBIENT.xyz * albedo;
        fixed3 diffuse = _LightColor0.xyz * albedo * saturate(dot(lightDir, normal));

        fixed3 specular = _LightColor0.xyz * _Specular.rgb * pow(saturate(dot(halfDir, normal)),_Gloss);

        //return fixed4(ambient, 1.0);
        //return fixed4(specular, 1.0);
        return fixed4(ambient + diffuse + specular, 1.0);
    } // end of frag shader

    ENDCG
}
    }
}
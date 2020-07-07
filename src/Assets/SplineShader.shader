/*  CSCI-B581 / Spring 2020 / Mitja Hmeljak

    The Vertex Shader component in this Unity Shader should:

    use t1, t2 values to compute the position of each
       vertex on the Spline Curve:
    t1 is for the "base curve",
    t2 is for the "offset curve".

    to calculate (on the GPU) the vertices on a single Spline Curve segment,
    to be displayed as a Mesh, using a Mesh Renderer.

    Original demo code by CSCI-B481 alumnus Rajin Shankar, IU Computer Science.
 */




Shader "SplineVertexShader" {

    Properties{
        /*_Color("Color", Color) = (1.0,1.0,1.0)*/
        //_SpecColor("Color", Color) = (1.0,1.0,1.0)
        _BaseColor("Base Color",Color) = (1.0,1.0,1.0,1.0)
        _Bright("Bright",Range(8.0,100.0)) = 20.0
    }

        SubShader{
            
            // actually, full of doesn't work as I think,
            // so i decided double the mesh and inverse the normal
            cull off

            //    Tags { "RenderType" = "Opaque" "Queue" = "Transparent" }

                //Tags { "RenderType" = "Opaque" "Queue" = "Transparent" }

                Pass  {

                   Tags {"LightMode" = "ForwardAdd"}

                    CGPROGRAM

                    // we'll provide both Vertex and Fragment shaders:
                    #pragma vertex vert
                    #pragma fragment frag

                    /*uniform float4 _Color;*/
                    //uniform float4 _SpecColor;
                    //uniform float4 _LightColor0;

                #include "Lighting.cginc"

                struct appdata {
                    float4 vertex : POSITION;
                    float3 normal : NORMAL;
                };

    // "varying" struct of variables,
    //     passed from vertex shader
    //     to fragment shader:
    struct v2f {
        float4 vertex : SV_POSITION;
        // the color output from the vertex shader:
        //fixed3 vColor : COLOR0;
        /*float4 posWorld : TEXCOORD0;
        float4 normalDir : TEXCOORD1;*/
        float3 normal : TEXCOORD0;
        float3 pos : TEXCOORD1;
    };

    // here we receive (from application, CPU side) the spline Hermite form matrix:
    //float4x4 _SplineMatrix;

    //// here we receive (from application, CPU side) the four control points:
    //float2 _Control0, _Control1, _Control2, _Control3;

    //// here we receive (from application, CPU side) how many steps there should be on curve:
    //float _Step;



    //// ---------------------------------------------------------
    //// the main spline calculation happens here, i.e.
    ////   the multiplication of the Hermite form (ch. 11.5.1 / 10.5.1 in textbook)
    ////   as per Assignment 02 instructions:
    ////   p(u) = uT * M * p
    ////   
    ////   Note: here we name the parameter t instead of u (that's in the textbook)
    ////   Note2: matrices are defined in "column major" !
    ////
    //float4 HermiteMult(float4x4 controlP, float4x4 splineM, float4 tParamsVector) {
    //    //
    //    // TODO - compute vertex on curve:
    //    //
    //    float4 vertexOnCurve = mul(mul(controlP, splineM), tParamsVector);
    //    return vertexOnCurve;
    //} // end of HermiteMult()



    //// ---------------------------------------------------------
    //// compute the Normal to the curve, at vertex provided by parameter t:
    //// 
    //float2 GetNormalToCurve(float t, float dt, float4x4 controlMatrix, float4x4 splineMatrix) {
    //    //
    //    // TODO - compute normal to segment (p1, p2) on curve
    //    //        where p1 is the vertex on curve at parameter t
    //    //        where p2 is the vertex on curve at parameter t2 = t + dt
    //    //
    //    // ADDITIONAL NOTE:
    //    //      The resulting normal should be normalized before returning it!
    //    //      And the returned value should be a float2 (not a float4!)
    //    //
    //    float2 normal;
    //    float4 tRow = float4(t * t * t, t * t, t, 1);
    //    float4 tRow2 = float4((t+dt) * (t + dt) * (t + dt), (t + dt) * (t + dt), (t + dt), 1);
    //    float4 p1 = HermiteMult(controlMatrix , splineMatrix , tRow);
    //    float4 p2 = HermiteMult(controlMatrix, splineMatrix, tRow2);
    //    float length = sqrt((p2.x - p1.x) * (p2.x - p1.x) + (p2.y - p1.y) * (p2.y - p1.y));
    //    normal = float2(-(p2.y-p1.y), p2.x-p1.x)/length;
    //    return normal;
    //}  // end of GetNormalToCurve()

    fixed4 _BaseColor;
    float _Bright;

    // ---------------------------------------------------------
    // the Vertex Shaders outputs positions on the Spline Curve:
    v2f vert(appdata v) {

        //// the output to this shader is:
        //v2f o;

        //// in the vertex shader,
        ////  we receive t in the x parameter,
        ////  and the offset in the y parameter:
        //float t = v.vertex.x;
        //float offset = v.vertex.y;
        //float4 tRow = float4(t * t * t, t * t, t, 1);

        ////
        //// TODO - compute matrix of four Control Points for spline:
        ////
        //float4x4 controlMatrix = float4x4(
        //    _Control0.x, _Control1.x, _Control2.x, _Control3.x,
        //    _Control0.y, _Control1.y, _Control2.y, _Control3.y,
        //    0, 0, 0, 0,
        //    0, 0, 0, 0
        //);

        //// base spline:
        //float4 worldPosition = HermiteMult(controlMatrix, _SplineMatrix, tRow);

        //// normal to obtain point on offset curve:
        //float2 normal = GetNormalToCurve(t, _Step, controlMatrix, _SplineMatrix);

        ////float3 n3 = float3(normal.x, normal.y, 0.0);
        //float3 n3 = float3(0.0,0.0,1.0);
        //// the following will do nothing when offset is 0,
        ////         i.e. vertex on "base curve",
        //// but it will move the vertex in the direction of the normal
        ////         for the vertex on "offset curve":
        //worldPosition.xy += normal * offset;

        //worldPosition.z = 0;
        //worldPosition.w = 1;

        //o.vertex = mul(UNITY_MATRIX_VP, worldPosition);
     

        //float4 normalDir = normalize(mul(float4(n3, 0.0), unity_WorldToObject));
        //float4 posWorld = mul(unity_ObjectToWorld, v.vertex);
        /*o.posWorld = mul(unity_ObjectToWorld, o.vertex);
        o.normalDir = normalize(mul(float4(n3, 0.0), unity_WorldToObject));*/
        //float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
        //// constants
        //float atten = 1.0;

        //// lighting
        //float3 diffuseReflection = atten * _LightColor0.xyz * max(0.0, dot(normalDir, lightDirection));

        //// specular highlights
        //float3 lightReflectDirection = reflect(-lightDirection, normalDir);
        //float3 viewDirection = normalize(float3(float4(_WorldSpaceCameraPos.xyz, 1.0) - posWorld.xyz));
        //float3 lightSeeDirection = max(0.0, dot(lightReflectDirection, viewDirection));
        //float3 shininessPower = pow(lightSeeDirection, _Shininess);

        //float3 specularReflection = atten * _SpecColor.rgb * shininessPower;

        //o.vColor = (diffuseReflection + specularReflection + UNITY_LIGHTMODEL_AMBIENT) * _Color.rgb;
        v2f o;
        o.vertex = UnityObjectToClipPos(v.vertex);
        o.normal = UnityObjectToWorldNormal(v.normal);
        o.pos = mul(unity_ObjectToWorld, v.vertex).xyz;

        return o;
    } // end of vert shader


    // -------------------------------------------------
    // the Fragment Shader simply outputs a fixed color:

    fixed4 _Color;

    fixed4 frag(v2f i) : SV_Target {
        //return _Color;
        //return fixed4(i.vColor,1.0);
        // vectors
        //float3 normalDirection = i.normalDir;
        //float atten = 1.0;

        //// diffuse
        //float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
        //float3 diffuseReflection = atten * _LightColor0.xyz * max(0.0, dot(normalDirection, lightDirection));

        //// specular
        //float3 lightReflectDirection = reflect(-lightDirection, normalDirection);
        //float3 viewDirection = normalize(float3(float4(_WorldSpaceCameraPos.xyz, 1.0) - i.posWorld.xyz));
        //float3 lightSeeDirection = max(0.0,dot(lightReflectDirection, viewDirection));
        //float3 shininessPower = pow(lightSeeDirection, _Shininess);

        //// add all
        //float3 specularReflection = atten * _SpecColor.rgb * shininessPower;
        //fixed3 ambient = UNITY_LIGHTMODEL_AMBIENT.xyz;
        //float3 lightFinal = diffuseReflection+ ambient;

        //return fixed4(lightFinal * _Color.rgb, 1.0);
        fixed3 normal = normalize(i.normal);
        float3 lightDir = normalize(_WorldSpaceLightPos0.xyz);

        fixed3 viewDir = normalize(UnityWorldSpaceViewDir(i.pos));

        fixed3 halfDir = normalize(viewDir + lightDir);

        fixed3 ambient = UNITY_LIGHTMODEL_AMBIENT.xyz * _BaseColor.xyz;
        fixed3 diffuse = _LightColor0.xyz * _BaseColor.xyz * saturate(dot(lightDir, normal));
        fixed3 specular = _LightColor0.xyz * pow(saturate(dot(halfDir, normal)),_Bright);

        //return fixed4(ambient, 1.0);
        //return fixed4(specular, 1.0);
        return fixed4(ambient + diffuse + specular, 1.0);
    } // end of frag shader

    ENDCG
}
    }
}
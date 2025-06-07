float4x4 BuildMatrix(float3x3 m){
    return float4x4(
        m[0],0.0,
        m[1],0.0,
        m[2],0.0,
        0.0,0.0,0.0,1.0
    );
}

float4x4 BuildObjectMatrix(float3x3 m, float3 offset){
    return float4x4(
        m[0],offset.x,
        m[1],offset.y,
        m[2],offset.z,
        0.0,0.0,0.0,1.0
    );
}

float3x3 RMatAverage(float3x3 ma, float3x3 mb){
    float3 y;
    float3 z;
    #if SHADER_TARGET_GLSL
        y = (ma._m01_m11_m21 + mb._m01_m11_m21)*0.5;
        z = (ma._m02_m12_m22 + mb._m02_m12_m22)*0.5;
    #else
        y = (ma[1] + mb[1])*0.5;
        z = (ma[2] + mb[2])*0.5;
    #endif
    float3 x = normalize(cross(y,z));
    z = normalize(z);
    y = cross(z,x);

    #if SHADER_TARGET_GLSL
        return float3x3(
            x[0],y[0],z[0],
            x[1],y[1],z[1],
            x[2],y[2],z[2],
            );
    #else
        return float3x3(x,y,z);
    #endif
}

float4x4 Z_Inverse(float4x4 mat){
    return float4x4(mat[0],mat[1],-mat[2],mat[3]);
}

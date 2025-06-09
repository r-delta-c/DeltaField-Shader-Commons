float4x4 Stereo_Merge_Matrix_V = DEFINE_STEREO_MERGE_MATRIX_V;
float4x4 Billboard_Matrix_M = {
    1.0,0.0,0.0,0.0,
    0.0,1.0,0.0,0.0,
    0.0,0.0,1.0,0.0,
    0.0,0.0,0.0,1.0
};

Billboard_Matrix_M._m00_m10_m20 = Stereo_Merge_Matrix_V[0].xyz*length(unity_ObjectToWorld._m00_m10_m20);
Billboard_Matrix_M._m01_m11_m21 = Stereo_Merge_Matrix_V[1].xyz*length(unity_ObjectToWorld._m01_m11_m21);
Billboard_Matrix_M._m02_m12_m22 = -Stereo_Merge_Matrix_V[2].xyz*length(unity_ObjectToWorld._m02_m12_m22)*(1.0-_Forced_Z_Scale_Zero);
Billboard_Matrix_M._m03_m13_m23 = unity_ObjectToWorld._m03_m13_m23;

o.vertex = mul(Billboard_Matrix_M,v.vertex);
o.vertex = mul(Stereo_Merge_Matrix_V,o.vertex);
o.vertex = mul(glstate_matrix_projection,o.vertex);
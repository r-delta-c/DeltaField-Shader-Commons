o.vertex = mul(UNITY_MATRIX_M,v.vertex);
o.vertex = mul(DEFINE_STEREO_AVERAGE_MATRIX_V,o.vertex);
o.vertex = mul(glstate_matrix_projection,o.vertex);
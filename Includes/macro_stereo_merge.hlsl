#if defined(USING_STEREO_MATRICES)
    #ifdef _STEREOMERGEMODE_POSITION
        #define DEFINE_STEREO_MERGE_MATRIX_V BuildObjectMatrix(unity_MatrixV,(unity_StereoMatrixV[0]._m03_m13_m23+unity_StereoMatrixV[1]._m03_m13_m23)*0.5)

    #elif _STEREOMERGEMODE_ROTATION
        #define DEFINE_STEREO_MERGE_MATRIX_V BuildObjectMatrix(RMatAverage((float3x3)unity_StereoMatrixV[0],(float3x3)unity_StereoMatrixV[1]),(unity_MatrixV._m03_m13_m23))

    #elif _STEREOMERGEMODE_POSITION_ROTATION
        #define DEFINE_STEREO_MERGE_MATRIX_V BuildObjectMatrix(RMatAverage((float3x3)unity_StereoMatrixV[0],(float3x3)unity_StereoMatrixV[1]),(unity_StereoMatrixV[0]._m03_m13_m23+unity_StereoMatrixV[1]._m03_m13_m23)*0.5)

    #else
        #define DEFINE_STEREO_MERGE_MATRIX_V unity_MatrixV
    #endif

    #define CAMERA_DISTANCE_MACRO length((unity_StereoWorldSpaceCameraPos[0]+unity_StereoWorldSpaceCameraPos[1])*0.5-o.vertex.xyz)
#else
    #define DEFINE_STEREO_MERGE_MATRIX_V unity_MatrixV
    #define CAMERA_DISTANCE_MACRO length(_WorldSpaceCameraPos-o.vertex.xyz)
#endif

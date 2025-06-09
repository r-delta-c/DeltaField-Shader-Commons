#if defined(USING_STEREO_MATRICES)
    #ifdef _ADJUSTSTEREOMATRIX_POSITION
        #define MAT_V BuildObjectMatrix(unity_WorldToCamera,(unity_StereoWorldToCamera[0]._m03_m13_m23+unity_StereoWorldToCamera[1]._m03_m13_m23)*0.5)
        #define DEFINE_STEREO_AVERAGE_MATRIX_V BuildObjectMatrix(unity_MatrixV,(unity_StereoMatrixV[0]._m03_m13_m23+unity_StereoMatrixV[1]._m03_m13_m23)*0.5)

    #elif _ADJUSTSTEREOMATRIX_ROTATION
        #define MAT_V BuildObjectMatrix(RMatAverage((float3x3)unity_StereoWorldToCamera[0],(float3x3)unity_StereoWorldToCamera[1]),(unity_WorldToCamera._m03_m13_m23))
        #define DEFINE_STEREO_AVERAGE_MATRIX_V BuildObjectMatrix(RMatAverage((float3x3)unity_StereoMatrixV[0],(float3x3)unity_StereoMatrixV[1]),(unity_MatrixV._m03_m13_m23))

    #elif _ADJUSTSTEREOMATRIX_POSITION_ROTATION
        #define MAT_V BuildObjectMatrix(RMatAverage((float3x3)unity_StereoWorldToCamera[0],(float3x3)unity_StereoWorldToCamera[1]),(unity_StereoWorldToCamera[0]._m03_m13_m23+unity_StereoWorldToCamera[1]._m03_m13_m23)*0.5)
        #define DEFINE_STEREO_AVERAGE_MATRIX_V BuildObjectMatrix(RMatAverage((float3x3)unity_StereoMatrixV[0],(float3x3)unity_StereoMatrixV[1]),(unity_StereoMatrixV[0]._m03_m13_m23+unity_StereoMatrixV[1]._m03_m13_m23)*0.5)

    #else
        #define MAT_V unity_WorldToCamera
        #define DEFINE_STEREO_AVERAGE_MATRIX_V unity_MatrixV
    #endif

    #define CAMERA_DISTANCE_MACRO length((unity_StereoWorldSpaceCameraPos[0]+unity_StereoWorldSpaceCameraPos[1])*0.5-o.vertex)
#else
    #define MAT_V unity_WorldToCamera
    #define DEFINE_STEREO_AVERAGE_MATRIX_V unity_MatrixV
    #define CAMERA_DISTANCE_MACRO length(_WorldSpaceCameraPos-o.vertex)
#endif

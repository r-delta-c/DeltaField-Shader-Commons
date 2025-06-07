#if defined(USING_STEREO_MATRICES)
    #ifdef _ADJUSTSTEREOMATRIX_POSITION
        #define MAT_V BuildObjectMatrix(unity_WorldToCamera,(unity_StereoWorldToCamera[0]._m03_m13_m23+unity_StereoWorldToCamera[1]._m03_m13_m23)*0.5)

    #elif _ADJUSTSTEREOMATRIX_ROTATION
        #define MAT_V BuildObjectMatrix(RMatAverage((float3x3)unity_StereoWorldToCamera[0],(float3x3)unity_StereoWorldToCamera[1]),(unity_WorldToCamera._m03_m13_m23))

    #elif _ADJUSTSTEREOMATRIX_POSITION_ROTATION
        #define MAT_V BuildObjectMatrix(RMatAverage((float3x3)unity_StereoWorldToCamera[0],(float3x3)unity_StereoWorldToCamera[1]),(unity_StereoWorldToCamera[0]._m03_m13_m23+unity_StereoWorldToCamera[1]._m03_m13_m23)*0.5)

    #else
        #define MAT_V unity_WorldToCamera
    #endif

    #define CAMERA_DISTANCE_MACRO length((unity_StereoWorldSpaceCameraPos[0]+unity_StereoWorldSpaceCameraPos[1])*0.5-o.vertex)
#else
    #define MAT_V unity_WorldToCamera
    #define CAMERA_DISTANCE_MACRO length(_WorldSpaceCameraPos-o.vertex)
#endif

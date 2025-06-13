float hash3D(float3 inputs){
    inputs = frac(inputs*0.3183099+float3(0.1,0.3,0.7));
    inputs *= 17.0;
    return frac(inputs.x*inputs.y*inputs.z*(inputs.x+inputs.y+inputs.z));
}

float ValueNoise3D(float3 inputs, float seed){
    float3 i = floor(inputs);
    float3 f = frac(inputs);

    float rand000 = hash3D(i+float3(0.0,0.0,0.0)+seed);
    float rand100 = hash3D(i+float3(1.0,0.0,0.0)+seed);
    float rand010 = hash3D(i+float3(0.0,1.0,0.0)+seed);
    float rand110 = hash3D(i+float3(1.0,1.0,0.0)+seed);
    float rand001 = hash3D(i+float3(0.0,0.0,1.0)+seed);
    float rand101 = hash3D(i+float3(1.0,0.0,1.0)+seed);
    float rand011 = hash3D(i+float3(0.0,1.0,1.0)+seed);
    float rand111 = hash3D(i+float3(1.0,1.0,1.0)+seed);

    float3 t = smoothstep(0.0,1.0,f);
    float x00 = lerp(rand000,rand100,t.x);
    float x10 = lerp(rand010,rand110,t.x);
    float x01 = lerp(rand001,rand101,t.x);
    float x11 = lerp(rand011,rand111,t.x);
    float y0  = lerp(x00,x10,t.y);
    float y1  = lerp(x01,x11,t.y);

    return lerp(y0,y1,t.z);
}

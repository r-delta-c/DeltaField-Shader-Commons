float random(float2 uv){
    return frac(sin(dot(uv.xy,float2(12.9898,78.233))) * 43758.5453123);
}

float2 random2(fixed2 st){
    st = fixed2( dot(st,fixed2(127.1,311.7)),
                   dot(st,fixed2(269.5,183.3)) );
    return frac(sin(st)*43758.5453123);
}

float PerlinNoise(float2 uv){
    float2 fl = floor(uv);
    float2 fr = frac(uv);

    float a = random2(fl);
    float b = random2(fl + float2(1.0,0.0));
    float c = random2(fl + float2(0.0,1.0));
    float d = random2(fl + float2(1.0,1.0));

    float2 u = fr*fr*(3.0-2.0*fr);
    return lerp(a,b,u.x)+(c-a)*u.y*(1.0-u.x)+(d-b)*u.x*u.y;
}

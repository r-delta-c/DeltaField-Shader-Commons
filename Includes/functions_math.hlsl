float mod(float x, float y){
    return x-y*floor(x/y);
}

float triloop(float x){
    return abs(mod(x-1.0,2.0)-1.0);
}

float InverseBias01(float x, float t){
    return x*t-(t-1.0)*0.5;
}

float EaseInOutPow(float x, float p){
    return x < 0.5 ? pow(x*2.0,p)*0.5 : 1.0-pow(x*-2.0+2.0,p)*0.5;
}

float EaseInOutPowInverse(float x, float p){
    return x > 0.5 ? pow(x*2.0-1.0,p)*0.5+0.5 : 1.0-pow(-x*2.0+1.0,p)*0.5-0.5;
}

float EaseBias(float t, float bias){
    float k = saturate(abs(bias));
    float e = lerp(1.0,8.0,k);
    return lerp(t,lerp(pow(t,e),1.0-pow(1.0-t,e),step(0.0,sign(bias))),k);
}

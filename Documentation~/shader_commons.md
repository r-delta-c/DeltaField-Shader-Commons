# Package contents | パッケージ内容
以下のファイルが含まれています。<br>

## [Includes/features_stereo_merge.hlsl](https://github.com/r-delta-c/DeltaField-Shader-Commons/blob/main/Includes/features_stereo_merge.hlsl)
Stereo Merge用のshader_featureが記述されています。<br>
ローカルキーワードとして指定したい場合は下記などの内容のように`.shader`ファイルに**直接**記述してください。
```
#pragma shader_feature_local _STEREOMERGEMODE_NONE _STEREOMERGEMODE_POSITION _STEREOMERGEMODE_ROTATION _STEREOMERGEMODE_POSITION_ROTATION
```
|keyword|Description|
|:------|:-|
_STEREOMERGEMODE_NONE | カメラの座標や向きを平均化をしない用途として使用されています。
_STEREOMERGEMODE_POSITION | カメラの座標を平均化する用途として使用されています。
_STEREOMERGEMODE_ROTATION | カメラの向きを平均化する用途として使用されています。
_STEREOMERGEMODE_POSITION_ROTATION | カメラの座標と向きを平均化する用途として使用されています。

## [Includes/functions_math.hlsl](https://github.com/r-delta-c/DeltaField-Shader-Commons/blob/main/Includes/functions_math.hlsl)
* Added v0.2.0-exp.1

modを始めとした様々な関数が含まれています。

## [Includes/functions_random.hlsl](https://github.com/r-delta-c/DeltaField-Shader-Commons/blob/main/Includes/functions_random.hlsl)
* Added v0.2.0-exp.1<br>

乱数に関する関数が含まれています。

## [Includes/functions_random3d.hlsl](https://github.com/r-delta-c/DeltaField-Shader-Commons/blob/main/Includes/functions_random3d.hlsl)
* Added v0.2.0-exp.1<br>

三次元の情報を基に乱数を生成する関数が含まれています。

## [Includes/functions_stereo_merge.hlsl](https://github.com/r-delta-c/DeltaField-Shader-Commons/blob/main/Includes/functions_stereo_merge.hlsl)
Stereo Merge用の関数が記述されています。

## [Includes/macro_stereo_merge.hlsl](https://github.com/r-delta-c/DeltaField-Shader-Commons/blob/main/Includes/macro_stereo_merge.hlsl)
Stereo Merge用のマクロが記述されています。
|Macro|  |
|:----|:-|
DEFINE_STEREO_MERGE_MATRIX_V | キーワードに応じたビュー行列が入ります。
CAMERA_DISTANCE_MACRO | 頂点とカメラまでの距離が入ります。ステレオレンダリングに対応しています。

## [Includes/vertex_billboard.hlsl](https://github.com/r-delta-c/DeltaField-Shader-Commons/blob/main/Includes/vertex_bollboard.hlsl)
ビルボード機能を有効にした時の頂点変換の処理が記述されています。<br>
これをIncludeする前に、`macro_stereo_merge.hlsl`を**Include**してください。<br>
ビルボード機能用に`_Forced_Z_Scale_Zero`という変数を使用しています。<br>
モデルの持つ奥行きを0にして平たくします。<br>
**必ず変数に加えてください。**

## [Includes/vertex_non_billboard.hlsl](https://github.com/r-delta-c/DeltaField-Shader-Commons/blob/main/Includes/vertex_non_billboard.hlsl)
ビルボード機能を無効にした時の頂点変換の処理が記述されています。<br>
これをIncludeする前に、`macro_stereo_merge.hlsl`を**Include**してください。



## [Shaders/temp.shader](https://github.com/r-delta-c/DeltaField-Shader-Commons/blob/main/Shaders/temp.shader)
テンプレートを目的にした、Stereo Merge、ビルボード機能を備えたUnlitなシェーダーです。

|Property|Description|
|:-------|:-|
|Culling Mode | カリングの指定をします。|
|Z Write | デプスバッファの書き込みの有効性を指定します。|
|Forced Z Scale Zero | 有効にするとモデルのZ方向(奥行き)のスケールを強制的に0にします。Particle Billboard Modeが無効な時のみ有効です。|
|Particle Billboard Mode(Feature) | 有効にするとシェーダー側のビルボードの処理を無効にします。単にビルボード描写をしない他、パーティクルシステム側でビルボードとして使用する場合を想定しています。|
|Normal Preview Mode(Feature) | 有効にするとモデルのノーマルに基づいて、モデルが色付けされるようになります。後述するMain Tex、Colorは無効になります。|
|Preview Mode(Feature) | フラグメントシェーダー内で描写を分岐するために用意されています。デフォルトでは何の効果もありません。|
|Main Tex | 任意のテクスチャをUVに基づいて描写します。|
|Color | 指定した色で描写します。アルファ値が0に近づくほどMain Texで指定したテクスチャが、1に近づくほど指定した色になります。|
|Stereo Merge Mode(Feature) | ステレオレンダリング時に左右のカメラの位置の中間を取って描写することができます。<br>`None` \| 何も平均化しません。<br>`Position` \| 座標を中間にします。左右で同じ位置に描写されるため、奥行きが分からなくなるような錯覚を受けます。<br>GrabPassを使用し、極端に景色を歪ませるような用途に対して利用すると、スレテオレンダリング時の描写の左右差を抑えることができる可能性があります。<br>`Rotation` \| 向きを中間にします。**Pimax**といった、左右のカメラで異なる向きを持つ特殊な描写環境に対して調整する目的で使用されます。<br>`Position_Rotation` \| 座標と向きを中間にします。|
# DeltaField-Shader-Commons
Copyright (c) 2025, DeltaField



## Overview | 概要
Name: DeltaField-Shader-Commons<br>
Version: <br>

汎用的なIncludeやシェーダーをまとめたUnity Packageです。<br>
VPM(を通したunitypackageファイル)からインポートすることもできます。

以下の機能を特徴としています。
* ステレオレンダリング時に参照するカメラの位置や向きの平均化(Stereo Merge)。
* ビルボード描写。

## Requirements | 環境要件
現在、以下の環境で動作を確認しています。
* Unity 2022.3
* Built-in Render Pipeline
* Unity XR Single-pass Instanced

## Installation instructions | インストール方法



## How to Use | 使い方
[こちらのドキュメンテーション](https://github.com/r-delta-c/DeltaField-Shader-Commons/blob/main/Documentation~/shader_commons.md "Documentation~/shader_commons.md")を参照してください。<br>

## Article | 参照記事
コンテンツを作成するに当たって、以下の記事を多く参考致しました。
* [そのシェーダー、本当にVR対応できてますか？　～Pimax、広視野角ヘッドセットへの対応～](https://qiita.com/RamType0/items/baf2b9d5ce0f9fc458be) / RamType0様<br>
上記の記事でVR環境上、Pimaxといった特殊な環境による技術的課題について多くの知見を学ばせてもらいました。加えてより深い関心を持つきっかけになりました。

* [【Unity, XR】左右のビューで異なるテクスチャをサンプリングするシェーダー (unity_StereoEyeIndex使用)](https://tsgcpp.hateblo.jp/entry/2020/06/23/204257) / すぎしー様<br>
[Unity の XR 向けシングルパスステレオレンダリングについて調べてみた](https://tips.hecomi.com/entry/2018/11/04/232219) / 凹様<br>
XR環境を想定した、様々な処理に関する解説、細かな内部実装について多くの知見を学ばせてもらいました。

* [[Unity] CGに使用される行列についての考察](https://qiita.com/yuji_yasuhara/items/8d63455d1d277af4c270) / Yuji Yasuhara様<br>
3Dグラフィックの描写に使用される行列の計算やその仕組みについての解説で、非常に分かりやすく理解の助けになりました。

* [そろそろShaderをやります](https://zenn.dev/kento_o) / KENTO様<br>
[LIGHT11](https://light11.hatenadiary.com/) / Haruki Yano様<br>
シェーダーの全般的な実践、解説に関する記事及びサイトで、様々な機能の知見を学ばせてもらいました。



## License | ライセンス
主に自分用に作成したものですが、これらのコンテンツは**MIT License**によって提供されます。<br>
**LICENSE.md**の内容に則ってご利用ください。

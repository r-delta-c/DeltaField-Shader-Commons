# Change Log

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [1.0.0] 2025/07/06
### Changed
- ビルボード描写を切り替える**Particle Billboard Mode(Feature)**`PropertyName: _DisableCustomBillboard`の名称を変更。<br>トグルの反転を想定挙動として取り扱います。
    - PropertyName: `_DisableCustomBillboard` → `_BillboardMode`
    - KeywordName: `_DISABLE_CUSTOM_BILLBOARD` → `_BILLBOARD_MODE`
    - `True` | ビルボード描写が有効になります。
    - `False` | ビルボード描写にはならず通常の描写になります。
## [0.2.0-exp.1] 2025/06/14
### Added
- functions_mash.hlslの追加。
- functions_random.hlslの追加。
- functions_random3d.hlslの追加。

### Changed
- temp.shaderの不要な変数の削除。



[1.0.0]: https://github.com/r-delta-c/DeltaField-Shader-Commons/compare/0.2.0-exp.1...1.0.0
[0.2.0-exp.1]: https://github.com/r-delta-c/DeltaField-Shader-Commons/compare/0.1.0-exp.1...0.2.0-exp.1


<!--
## [Unreleased]

[Unreleased]: https://github.com/r-delta-c/DeltaField-Shader-Commons/compare/0.1.0-exp.1...0.1.0-exp.1

-->
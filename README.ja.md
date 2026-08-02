# cupertino_typography

*English version: [README.md](README.md)*

Apple Human Interface Guidelines (HIG) が定義する iOS の Text Style カタログを、
Flutter の `TextStyle` としてそのまま使えるようにするパッケージです。HIG の 11
スタイルすべて(および各スタイルの強調バリアント)を static 定数として提供する
ほか、それらを Material の `TextTheme` へ橋渡しする関数も含んでいます。

![同じフィード画面を iOS 上で並べた比較画像(英語表示)。左半分は Material の既定 TextTheme、右半分は CupertinoTypography.textTheme() を適用している。](https://raw.githubusercontent.com/4armsxlr8/cupertino_typography/main/doc/material-vs-hig-feed-en.png)

*同梱の example アプリのスクリーンショット。左半分は Material 既定の
`TextTheme`、右半分は同じフィード画面に `CupertinoTypography.textTheme()`
を適用したもの(iOS 上の Flutter、英語表示)。`example/` で
`flutter run --dart-define=SHOT=feed_material` /
`SHOT=feed_hig` を実行すれば自分の手元でも再現できます。*

## 背景

iOS 上で `MaterialApp` を動かすと、フォント自体は端末の San Francisco 書体に
フォールバックしますが、サイズ・ウェイト・字間は Material 3 のタイプスケール
(`displayLarge` から `labelSmall` までの 15 ロール)に従ったままです。その結果、
「フォントは正しいのに、iOS アプリのサイズ感と強調のリズムになっていない」と
いう見た目になってしまいます。

Flutter にはこれに対応する `CupertinoTextThemeData` がありますが、これは
`CupertinoNavigationBar` や `CupertinoButton` といった**個々のウィジェット**が
実際に必要とするスタイルだけを集めた部品リストであり、HIG が定義する Text
Style カタログの一部しかカバーしていません(現行の Flutter SDK では実質 9
ロールしか公開されていません — 詳細は後述の比較表を参照)。本文中で見出しや
強調テキストを自由に組み合わせるために HIG の 11 スタイルすべてをカバーする
定義は、調査した範囲では見当たりませんでした。`cupertino_typography` はこの
隙間を埋めます。

## インストール

`pubspec.yaml` に追加します。

```yaml
dependencies:
  cupertino_typography: ^0.2.0
```

pub.dev に公開する前にローカルで試したい場合は、`path` 依存として参照できます。

```yaml
dependencies:
  cupertino_typography:
    path: ../cupertino_typography
```

## 使い方

このパッケージは 4 つの public API を公開しています。

### 1. `CupertinoTypography` — HIG 11 スタイル分の `TextStyle` 定数

`largeTitle` / `title1` / `title2` / `title3` / `headline` / `body` /
`callout` / `subheadline` / `footnote` / `caption1` / `caption2` の 11
定数と、それぞれの強調バリアントを提供します。どれでもそのまま `Text`
ウィジェットに渡せます。

```dart
import 'package:flutter/cupertino.dart';
import 'package:cupertino_typography/cupertino_typography.dart';

class ArticleHeader extends StatelessWidget {
  const ArticleHeader({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: CupertinoTypography.title1),
        const SizedBox(height: 4),
        Text(
          'Use the emphasized variant for words you want to stress in body text',
          style: CupertinoTypography.bodyEmphasized,
        ),
      ],
    );
  }
}
```

### 2. `CupertinoTypography.fontFamilyForSize()` — サイズに応じた SF フォント識別子の選択

HIG の 11 スタイルでカバーされないサイズでカスタム `TextStyle` を組み立てる
場合、本文用の `CupertinoSystemText` と見出し用の `CupertinoSystemDisplay` の
どちらを使うか自分で判断する必要がなくなります — 境界は 20pt です。

```dart
TextStyle customStyle(double fontSize) {
  return TextStyle(
    fontFamily: CupertinoTypography.fontFamilyForSize(fontSize),
    fontSize: fontSize,
    color: CupertinoColors.label,
  );
}
```

### 3. `CupertinoTypography.textTheme()` — Material `TextTheme` への橋渡し

Material 専用ウィジェットに依存しているなどの理由で `MaterialApp` を避けら
れないが、サイズとウェイトのリズムは HIG に従わせたい画面で使います。
Material `TextTheme` の 15 ロールすべてを HIG スタイルで埋めた `TextTheme`
を返し、そのマッピングには HIG の 11 スタイルすべてが使われています。

```dart
import 'package:flutter/material.dart';
import 'package:cupertino_typography/cupertino_typography.dart';

MaterialApp(
  theme: ThemeData(textTheme: CupertinoTypography.textTheme()),
  home: const HomePage(),
);
```

マッピングは次のとおりです(詳しい根拠は `CupertinoTypography.textTheme()`
の dartdoc を参照してください)。

| Material のロール | HIG スタイル |
|---|---|
| displayLarge | largeTitle |
| displayMedium | largeTitle |
| displaySmall | title1 |
| headlineLarge | title1 |
| headlineMedium | title2 |
| headlineSmall | title3 |
| titleLarge | headline |
| titleMedium | callout |
| titleSmall | subheadline |
| bodyLarge | body |
| bodyMedium | callout |
| bodySmall | footnote |
| labelLarge | subheadline |
| labelMedium | caption1 |
| labelSmall | caption2 |

`example/` フォルダには、下部のナビゲーションバーで切り替えられる 2 画面の
デモアプリが入っています。11 スタイルすべてを強調バリアントと並べて一覧表示
するギャラリーと、上記のフィード比較デモです。

### 4. `CupertinoTypography.adaptiveTextTheme()` — Apple プラットフォームでのみ HIG タイポグラフィを適用

iOS・macOS 以外もターゲットにするアプリのための `textTheme()` の派生版で
す。iOS・macOS では `textTheme()` を返し、それ以外のプラットフォームでは
`null` を返します。`ThemeData(textTheme:)` に `null` を渡すのはエラーでは
なく、「Material 組み込みの既定 `TextTheme` にフォールバックする」という
意味になるため、自前の `if` 分岐を書かなくても、そのまま `ThemeData` に渡
すだけで Apple プラットフォームでだけ HIG タイポグラフィを適用できます。

```dart
MaterialApp(
  theme: ThemeData(textTheme: CupertinoTypography.adaptiveTextTheme()),
  home: const HomePage(),
);
```

省略可能な `platform` 引数は、テストや特定のプラットフォームを強制した
いコードのために用意されています。省略した場合は `defaultTargetPlatform`
からプラットフォームを判定します。

### ダークモード対応(動的色の解決)

各スタイルの `color` は固定色ではなく、動的色である `CupertinoColors.label`
です。スタイルをそのまま `Text.style` に渡すとこの解決処理がスキップされる
ため、ダークモードでもライトモードの値(黒)のまま描画されてしまいます。先に
`BuildContext` を使って解決してください。

```dart
style.copyWith(
  color: CupertinoDynamicColor.maybeResolve(style.color, context),
)
```

## 値の出典

各スタイルの `fontSize` と `letterSpacing` は、
[Apple Human Interface Guidelines — Typography](https://developer.apple.com/design/human-interface-guidelines/typography)
ページの Typography 表にある、iOS プラットフォーム・Dynamic Type のデフォル
トサイズカテゴリ「Large」の行から取得しています。`letterSpacing` の値の出典
は [Apple design resources](https://developer.apple.com/design/resources/)
であり、これは Flutter 自身の Cupertino ウィジェット(`CupertinoTextThemeData`
のデフォルトスタイル)が根拠として引用しているのと同じ出典元です。ただし
出典元が同じであることと値が完全に一致することは別で、実際の数値は用途に
よって多少異なります。たとえば本パッケージの `largeTitle`(34pt)は
`letterSpacing: 0.37` である一方、Flutter の `navLargeTitleTextStyle`(同じ
く 34pt)は `letterSpacing: 0.38` です。値を採用する際はこの出典を参照した
上で、必要なら実機やデザインツールで見た目を確認してください。`fontFamily` には
実際のフォント名ではなく、Flutter がシステムフォントへ解決する識別子
`CupertinoSystemText` と `CupertinoSystemDisplay` を使用しています。

## 設計判断

### `height: null`

このパッケージのスタイルは、`height`(行間)を意図的に未設定(`null`)のまま
にしています。HIG の Typography 表に記載されている leading の値は、San
Francisco で組んだ英語テキストを前提としています。日本語と英語が混在する
実際のアプリでこの値を固定してしまうと、日本語フォント(ヒラギノ)の実際の
字形と噛み合わなくなります。

`height: null` のままにしておくことで、行の高さは実際に描画するフォントの
メトリクスに委ねられます。その結果、日本語テキストはヒラギノの line gap に
よっておよそ 1.5em に、欧文テキストは San Francisco によっておよそ 1.18em
になり、それぞれの言語にとって自然な行の高さになります。

### 強調ウェイト(`FontWeight.bold` では重すぎる)

iOS のテキストを強調したいとき、Flutter の `FontWeight.bold`(w700)をそのま
ま使うと iOS にしては重すぎる見た目になります。HIG の標準デザインでは、本文
系のスタイルの強調は Bold(w700)ではなく Semibold(w600)にとどめています。

このパッケージの強調バリアントは、この HIG のデザインをそのまま反映してい
ます。

| ベーススタイル | 強調時のウェイト |
|---|---|
| `largeTitle` / `title1` / `title2` | Bold (w700) |
| `title3` 以下すべて(`title3` / `headline` / `body` / `callout` / `subheadline` / `footnote` / `caption1` / `caption2`) | Semibold (w600) |

最上位の 3 つの見出しスタイル(`largeTitle` / `title1` / `title2`)だけは
意図的な例外として本当の bold を与えており、それ以外は本文に近いウェイトで
ある Semibold にとどめています。`headline` はベースのウェイトがすでに w600
のため、強調バリアントでも変化しません。

`fontSize` / `letterSpacing` / `fontFamily` / `color` / `height` /
`inherit` はベーススタイルと強調バリアントで同一であり、異なるのは
`fontWeight` だけです。

### `CupertinoTextThemeData` との違い

`CupertinoTextThemeData` は、Cupertino の個々のウィジェット(ナビゲーション
バー・ボタン・タブ・ピッカーなど)が実際に必要とするスタイルだけを集めた、
ウィジェット指向の部品リストです。現行の Flutter SDK(3.44 系で確認)では、
次の 9 ロールを公開しています。

| `CupertinoTextThemeData` の役割(全 9 種) | デフォルト値 | 用途 |
|---|---|---|
| `textStyle` | 17pt / Regular (w400) | 汎用テキスト |
| `actionTextStyle` | 17pt / Regular (w400)、色で強調 | ボーダーレスボタンのテキスト |
| `actionSmallTextStyle` | 15pt / Regular (w400)、色で強調 | 小さいボタンのテキスト |
| `tabLabelTextStyle` | 10pt / Medium (w500) | 未選択タブのラベル |
| `navTitleTextStyle` | 17pt / Semibold (w600) | 標準ナビゲーションバーのタイトル |
| `navLargeTitleTextStyle` | 34pt / Bold (w700) | ナビゲーションバーの Large Title |
| `navActionTextStyle` | 17pt / Regular (w400)、色で強調 | ナビゲーションバーのアクションテキスト |
| `pickerTextStyle` | 21pt / Regular (w400) | ピッカー |
| `dateTimePickerTextStyle` | 21pt / Regular (w400) | 日時ピッカー |

一方 `CupertinoTypography` は、特定のウィジェットの都合とは独立に、HIG の
Text Style カタログそのもの(全 11 スタイル)をカバーします。

| `CupertinoTypography` の役割(全 11 種) | 値 |
|---|---|
| `largeTitle` | 34pt / Regular (w400) |
| `title1` | 28pt / Regular (w400) |
| `title2` | 22pt / Regular (w400) |
| `title3` | 20pt / Regular (w400) |
| `headline` | 17pt / Semibold (w600) |
| `body` | 17pt / Regular (w400) |
| `callout` | 16pt / Regular (w400) |
| `subheadline` | 15pt / Regular (w400) |
| `footnote` | 13pt / Regular (w400) |
| `caption1` | 12pt / Regular (w400) |
| `caption2` | 11pt / Regular (w400) |

両者の違いをまとめると次のとおりです。

- **出発点が逆**: `CupertinoTextThemeData` は「このウィジェットにはこの
  スタイル」というウィジェット単位の割り当てです。`CupertinoTypography` は
  「HIG にはこのスタイルがある」という、ウィジェットから独立したカタログ
  そのものを表します。
- **粒度が違う**: `CupertinoTextThemeData` の 9 ロールはウィジェットが必要
  とする分しかなく、`title1` や `title3` に相当する値はそもそも存在しませ
  ん。`CupertinoTypography` は HIG の 11 スタイルを過不足なくカバーします。
- **本文中で見出しや強調を自由に組みたいなら `CupertinoTypography` が向い
  ている**: `CupertinoTextThemeData` の各スタイルは public な getter であ
  り、`CupertinoTheme.of(context).textTheme.textStyle` のように呼び出し元
  から直接参照できます。しかし保持しているのはナビゲーションバーやボタン
  といったウィジェットが必要とする 9 ロールだけなので、HIG の 11 スタイル
  のカタログとしては不完全であり、「ここは title2」「あそこは caption1」の
  ように自由に選びたいカスタム画面のレイアウトには向きません。

## ライセンス

[MIT License](LICENSE)

🤖 Generated with Claude Code

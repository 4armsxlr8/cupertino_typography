# cupertino_typography

*日本語版: [README.ja.md](README.ja.md)*

[![pub package](https://img.shields.io/pub/v/cupertino_typography.svg)](https://pub.dev/packages/cupertino_typography)

A package that exposes Apple's Human Interface Guidelines (HIG) iOS Text
Style catalog directly as Flutter `TextStyle`s. It provides all 11 HIG
styles (plus an emphasized variant of each) as static constants, along
with a function that bridges them into a Material `TextTheme`.

![A side-by-side comparison of the same feed screen on iOS, in English: the left half uses Material's default TextTheme, and the right half uses CupertinoTypography.textTheme().](https://raw.githubusercontent.com/4armsxlr8/cupertino_typography/main/doc/material-vs-hig-feed-en.png)

*A screenshot of the bundled example app: the left half uses Material's
default `TextTheme`, and the right half uses
`CupertinoTypography.textTheme()` applied to the same feed screen
(Flutter on iOS, English UI). Reproduce it yourself with
`flutter run --dart-define=SHOT=feed_material` / `SHOT=feed_hig` in
`example/`.*

## Background

When you run a `MaterialApp` on iOS, the font itself falls back to the
device's San Francisco typeface, but the size, weight, and letter spacing
still follow Material 3's type scale (the 15 roles from `displayLarge`
down to `labelSmall`). The result looks like "the font is right, but the
sizing and emphasis rhythm doesn't feel like an iOS app."

Flutter does have `CupertinoTextThemeData` for this, but it is a
widget-oriented parts list that only collects the styles actually needed
by **individual widgets** such as `CupertinoNavigationBar` or
`CupertinoButton`, and it covers only part of the Text Style catalog
defined by HIG (the current Flutter SDK effectively exposes only 9 roles
— see the comparison table below for details). As far as could be
determined through research, no definition covering all 11 HIG styles
for freely combining headings and emphasized text within body copy could
be found. `cupertino_typography` fills that gap.

## Installation

Add it to your `pubspec.yaml`.

```yaml
dependencies:
  cupertino_typography: ^0.2.0
```

If you want to try it locally before it's published to pub.dev, you can
reference it as a `path` dependency.

```yaml
dependencies:
  cupertino_typography:
    path: ../cupertino_typography
```

## Usage

This package exposes 4 public APIs.

### 1. `CupertinoTypography` — `TextStyle` constants for all 11 HIG styles

Provides the 11 constants `largeTitle` / `title1` / `title2` / `title3` /
`headline` / `body` / `callout` / `subheadline` / `footnote` / `caption1`
/ `caption2`, plus an emphasized variant of each. Any of them can be
passed directly to a `Text` widget.

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

### 2. `CupertinoTypography.fontFamilyForSize()` — picking the right SF font identifier for a given size

When building a custom `TextStyle` at a size not covered by the 11 HIG
styles, this removes the need to decide for yourself whether to use the
body-text `CupertinoSystemText` or the display-heading
`CupertinoSystemDisplay` — the boundary is 20pt.

```dart
TextStyle customStyle(double fontSize) {
  return TextStyle(
    fontFamily: CupertinoTypography.fontFamilyForSize(fontSize),
    fontSize: fontSize,
    color: CupertinoColors.label,
  );
}
```

### 3. `CupertinoTypography.textTheme()` — a bridge to Material `TextTheme`

Use this on screens where you can't avoid `MaterialApp` — for example
because you depend on Material-only widgets — but still want the sizing
and weight rhythm to follow HIG. It returns a `TextTheme` in which all 15
roles of Material's `TextTheme` are filled with HIG styles, and the
mapping draws on all 11 HIG styles.

```dart
import 'package:flutter/material.dart';
import 'package:cupertino_typography/cupertino_typography.dart';

MaterialApp(
  theme: ThemeData(textTheme: CupertinoTypography.textTheme()),
  home: const HomePage(),
);
```

The mapping is as follows (for the detailed rationale, see the dartdoc
for `CupertinoTypography.textTheme()`).

| Material role | HIG style |
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

The `example/` folder contains a demo app with two screens, switchable
from the bottom navigation bar: a gallery listing all 11 styles side by
side with their emphasized variants, and the feed comparison demo shown
above.

### 4. `CupertinoTypography.adaptiveTextTheme()` — HIG typography only on Apple platforms

A variant of `textTheme()` for apps that target more than just iOS and
macOS. It returns `textTheme()` on iOS and macOS, and `null` everywhere
else. Passing `null` to `ThemeData(textTheme:)` is not an error — it
tells Material to fall back to its own built-in default `TextTheme` — so
you can wire this straight into `ThemeData` and get HIG typography only
where it makes sense, without an `if` statement of your own.

```dart
MaterialApp(
  theme: ThemeData(textTheme: CupertinoTypography.adaptiveTextTheme()),
  home: const HomePage(),
);
```

The optional `platform` argument exists for tests and other code that
needs to force a specific platform; when omitted, the platform is read
from `defaultTargetPlatform`.

### Dark mode support (resolving dynamic colors)

Each style's `color` is not a fixed color but the dynamic color
`CupertinoColors.label`. Passing a style straight to `Text.style` skips
this resolution step, so it renders using the light-mode value (black)
even in dark mode. Resolve it first using a `BuildContext`.

```dart
style.copyWith(
  color: CupertinoDynamicColor.maybeResolve(style.color, context),
)
```

## Source of the values

Each style's `fontSize` and `letterSpacing` are taken from the row for
the iOS platform / Dynamic Type's default size category "Large" in the
Typography table on the
[Apple Human Interface Guidelines — Typography](https://developer.apple.com/design/human-interface-guidelines/typography)
page. The source for the `letterSpacing` values is
[Apple design resources](https://developer.apple.com/design/resources/),
which is the same source Flutter's own Cupertino widgets (the default
styles of `CupertinoTextThemeData`) cite as their basis. However, sharing
the same source doesn't mean the values match exactly — the actual
numbers differ somewhat depending on usage. For example, this package's
`largeTitle` (34pt) has `letterSpacing: 0.37`, while Flutter's
`navLargeTitleTextStyle` (also 34pt) has `letterSpacing: 0.38`. When
adopting these values, refer to this source and, if needed, verify the
appearance on a real device or in a design tool. For `fontFamily`, this
package uses the identifiers `CupertinoSystemText` and
`CupertinoSystemDisplay`, which Flutter resolves to the system font,
rather than an actual font name.

## Design decisions

### `height: null`

This package's styles intentionally leave `height` (line height)
unset (`null`). The leading values listed in HIG's Typography table
assume English text set in San Francisco. In a real app where Japanese
and English text are mixed, fixing this value would clash with the
actual glyph shapes of a Japanese font (Hiragino).

By leaving `height: null`, the line height is left to the metrics of
whichever font is actually rendering the text. As a result, Japanese
text ends up at roughly 1.5em from Hiragino's line gap, and Latin text
ends up at roughly 1.18em from San Francisco — a natural line height for
each language.

### Emphasis weight (`FontWeight.bold` is too heavy)

When you want to emphasize iOS text, using Flutter's `FontWeight.bold`
(w700) as-is looks too heavy for iOS. HIG's standard design keeps the
emphasis of body-oriented styles at Semibold (w600) rather than Bold
(w700).

This package's emphasized variants reflect that HIG design as-is.

| Base style | Emphasized weight |
|---|---|
| `largeTitle` / `title1` / `title2` | Bold (w700) |
| `title3` and everything below it (`title3` / `headline` / `body` / `callout` / `subheadline` / `footnote` / `caption1` / `caption2`) | Semibold (w600) |

Only the top 3 heading styles (`largeTitle` / `title1` / `title2`) are
given true bold as a deliberate exception; everything else stays at
Semibold, a weight closer to body text. `headline`'s base weight is
already w600, so it doesn't change in its emphasized variant.

`fontSize` / `letterSpacing` / `fontFamily` / `color` / `height` /
`inherit` are identical between the base style and the emphasized
variant — only `fontWeight` differs.

### Difference from `CupertinoTextThemeData`

`CupertinoTextThemeData` is a widget-oriented parts list that collects
only the styles actually needed by individual Cupertino widgets
(navigation bar, buttons, tabs, pickers, etc). The current Flutter SDK
(confirmed on the 3.44 series) exposes the following 9 roles.

| `CupertinoTextThemeData` role (9 total) | Default value | Purpose |
|---|---|---|
| `textStyle` | 17pt / Regular (w400) | General-purpose text |
| `actionTextStyle` | 17pt / Regular (w400), emphasized by color | Text for borderless buttons |
| `actionSmallTextStyle` | 15pt / Regular (w400), emphasized by color | Text for small buttons |
| `tabLabelTextStyle` | 10pt / Medium (w500) | Label for an unselected tab |
| `navTitleTextStyle` | 17pt / Semibold (w600) | Title of a standard navigation bar |
| `navLargeTitleTextStyle` | 34pt / Bold (w700) | Large Title of a navigation bar |
| `navActionTextStyle` | 17pt / Regular (w400), emphasized by color | Action text in a navigation bar |
| `pickerTextStyle` | 21pt / Regular (w400) | Picker |
| `dateTimePickerTextStyle` | 21pt / Regular (w400) | Date/time picker |

`CupertinoTypography`, on the other hand, covers the HIG Text Style
catalog itself (all 11 styles), independent of any particular widget's
needs.

| `CupertinoTypography` role (11 total) | Value |
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

The differences between the two can be summarized as follows.

- **The starting point is reversed**: `CupertinoTextThemeData` is a
  per-widget assignment — "this widget gets this style."
  `CupertinoTypography` represents the catalog itself, independent of
  any widget — "HIG has this style."
- **The granularity is different**: `CupertinoTextThemeData`'s 9 roles
  are only as many as widgets need, and values corresponding to
  `title1` or `title3` don't exist at all. `CupertinoTypography` covers
  the 11 HIG styles completely, with nothing missing and nothing extra.
- **`CupertinoTypography` is the better fit if you want to freely
  compose headings and emphasis within body text**: each
  `CupertinoTextThemeData` style is a public getter that callers can
  reference directly, e.g.
  `CupertinoTheme.of(context).textTheme.textStyle`. But since it only
  holds the 9 roles needed by widgets like the navigation bar and
  buttons, it is an incomplete catalog of the 11 HIG styles and is not
  well suited to custom screen layouts where you want to freely choose
  "this part is title2" or "that part is caption1."

## License

[MIT License](LICENSE)

🤖 Generated with Claude Code

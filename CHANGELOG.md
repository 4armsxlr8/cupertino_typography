## 0.2.0

* `CupertinoTypography.adaptiveTextTheme()`: Added a static method that returns `CupertinoTypography.textTheme()` on iOS and macOS, and `null` on every other platform, following the same `adaptive` naming idiom as widgets like `Switch.adaptive`. Accepts an optional `platform` argument for tests and other callers that need to force a specific platform.
* Added a GitHub Actions CI workflow (`.github/workflows/ci.yaml`) that runs `flutter analyze` and `flutter test` for both the root package and the `example/` app on every push and pull request against `main`.
* README / README.ja: Added a side-by-side screenshot comparing Material's default `TextTheme` against `CupertinoTypography.textTheme()` on the same screen, plus a usage example for `adaptiveTextTheme()`.

🤖 Generated with Claude Code

## 0.1.0

Initial release.

* `CupertinoTypography`: Added the 11 Apple HIG iOS Text Styles (Dynamic Type's "Large" size category) as `TextStyle` constants (`largeTitle` / `title1` / `title2` / `title3` / `headline` / `body` / `callout` / `subheadline` / `footnote` / `caption1` / `caption2`).
* `CupertinoTypography`: Added an emphasized variant of each of the above 11 styles (`largeTitleEmphasized`, etc.). Reflects the HIG design of keeping only `largeTitle` / `title1` / `title2` at Bold (w700), with everything else staying at Semibold (w600).
* `CupertinoTypography.fontFamilyForSize()`: Added a helper that returns whether `CupertinoSystemText` or `CupertinoSystemDisplay` should be used for a given font size (boundary at 20pt).
* `CupertinoTypography.textTheme()`: Added a static method that returns a `TextTheme` with the 11 HIG styles mapped onto the 15 roles of Material's `TextTheme`.

🤖 Generated with Claude Code

## 0.1.0

Initial release.

* `CupertinoTypography`: Added the 11 Apple HIG iOS Text Styles (Dynamic Type's "Large" size category) as `TextStyle` constants (`largeTitle` / `title1` / `title2` / `title3` / `headline` / `body` / `callout` / `subheadline` / `footnote` / `caption1` / `caption2`).
* `CupertinoTypography`: Added an emphasized variant of each of the above 11 styles (`largeTitleEmphasized`, etc.). Reflects the HIG design of keeping only `largeTitle` / `title1` / `title2` at Bold (w700), with everything else staying at Semibold (w600).
* `CupertinoTypography.fontFamilyForSize()`: Added a helper that returns whether `CupertinoSystemText` or `CupertinoSystemDisplay` should be used for a given font size (boundary at 20pt).
* `CupertinoTypography.textTheme()`: Added a static method that returns a `TextTheme` with the 11 HIG styles mapped onto the 15 roles of Material's `TextTheme`.

🤖 Generated with Claude Code

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// A self-contained definition of the Apple Human Interface Guidelines
/// (HIG) iOS Text Style catalog, expressed as Flutter [TextStyle]s.
///
/// `CupertinoTextThemeData` is a widget-oriented parts list that only
/// holds the styles individual widgets need, and it does not cover all 11
/// styles defined by the HIG. This class fills that gap by providing all
/// 11 HIG styles as ready-to-use constants, based on the "Large" default
/// size category of Dynamic Type.
///
/// Source: `fontSize` and `letterSpacing` come from the Typography table
/// (iOS, Large) in
/// [Apple HIG Typography](https://developer.apple.com/design/human-interface-guidelines/typography).
/// `letterSpacing` values are the conventional figures published in Apple
/// design resources.
///
/// `height` is intentionally left unset (`null`). The leading values in
/// the HIG table (22/17, etc.) assume English text set in San Francisco;
/// once Japanese text is mixed in, those fixed values stop matching the
/// actual font metrics, so this package does not adopt them. Instead,
/// line height is left to the metrics of whichever font actually renders
/// the text: for Japanese, Hiragino's line gap yields roughly 1.5em, and
/// for Latin text, San Francisco yields roughly 1.18em.
///
/// ### Why the class name matches the package name
///
/// This class is named `CupertinoTypography`, matching the package name
/// `cupertino_typography`, because it is a common convention for a
/// package's main entry-point class to share the package's name — this
/// makes the relationship obvious to readers. The Flutter SDK itself
/// follows a "Cupertino + noun" naming lineage, as seen in
/// `CupertinoColors` and `CupertinoIcons`; following that same lineage
/// signals from the name alone that this is a Cupertino-related class.
/// Material also has an analogous class for gathering typography,
/// `Typography`, and the name `CupertinoTypography` plainly expresses the
/// parallel between the two.
class CupertinoTypography {
  const CupertinoTypography._();

  /// The largest heading style. Used for things like an expanded
  /// navigation bar Large Title.
  static const largeTitle = TextStyle(
    fontFamily: 'CupertinoSystemDisplay',
    fontSize: 34,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.37,
    color: CupertinoColors.label,
    inherit: false,
  );

  /// A large heading. Used for screen titles and other content one step
  /// below [largeTitle] in emphasis.
  static const title1 = TextStyle(
    fontFamily: 'CupertinoSystemDisplay',
    fontSize: 28,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.36,
    color: CupertinoColors.label,
    inherit: false,
  );

  /// A medium heading. Used for section titles and similar content.
  static const title2 = TextStyle(
    fontFamily: 'CupertinoSystemDisplay',
    fontSize: 22,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.35,
    color: CupertinoColors.label,
    inherit: false,
  );

  /// A small heading. 20pt is the smallest size that uses the display
  /// typeface (`CupertinoSystemDisplay`).
  static const title3 = TextStyle(
    fontFamily: 'CupertinoSystemDisplay',
    fontSize: 20,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.38,
    color: CupertinoColors.label,
    inherit: false,
  );

  /// Used for list row titles and other headings you want to emphasize
  /// within body text. Semibold by default.
  static const headline = TextStyle(
    fontFamily: 'CupertinoSystemText',
    fontSize: 17,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.41,
    color: CupertinoColors.label,
    inherit: false,
  );

  /// Standard body text. The style used most often for running text in
  /// iOS apps.
  static const body = TextStyle(
    fontFamily: 'CupertinoSystemText',
    fontSize: 17,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.41,
    color: CupertinoColors.label,
    inherit: false,
  );

  /// A body style slightly smaller than [body]. Also used for things like
  /// UIKit call-to-action buttons.
  static const callout = TextStyle(
    fontFamily: 'CupertinoSystemText',
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.32,
    color: CupertinoColors.label,
    inherit: false,
  );

  /// Used for secondary headings and supplementary text.
  static const subheadline = TextStyle(
    fontFamily: 'CupertinoSystemText',
    fontSize: 15,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.24,
    color: CupertinoColors.label,
    inherit: false,
  );

  /// Footnotes and annotations. Used for text you want to present less
  /// prominently than body text.
  static const footnote = TextStyle(
    fontFamily: 'CupertinoSystemText',
    fontSize: 13,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.08,
    color: CupertinoColors.label,
    inherit: false,
  );

  /// Caption (large). Used for image captions, timestamps, and similar
  /// content.
  static const caption1 = TextStyle(
    fontFamily: 'CupertinoSystemText',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.0,
    color: CupertinoColors.label,
    inherit: false,
  );

  /// Caption (small). The smallest size among the 11 HIG styles. Used for
  /// things like badge numbers.
  static const caption2 = TextStyle(
    fontFamily: 'CupertinoSystemText',
    fontSize: 11,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.07,
    color: CupertinoColors.label,
    inherit: false,
  );

  // --- Emphasized variants ---
  //
  // When you want to emphasize an iOS text style with bold, using
  // Flutter's `FontWeight.bold` (w700) as-is looks too heavy by iOS
  // conventions. The HIG's standard design keeps emphasis on text styles
  // at Semibold (w600) rather than Bold (w700), so each style's
  // emphasized variant swaps out only `fontWeight`; every other property
  // (fontSize / letterSpacing / fontFamily / color / height / inherit)
  // stays identical to the base style.
  //
  // The exception is the three heading styles largeTitle, title1, and
  // title2 (the "Emphasized weight" column of the HIG Typography table
  // specifies Bold (w700) for them) — only the topmost heading styles are
  // allowed true bold, as a deliberate HIG exception. title3, headline,
  // and everything below stay at Semibold (w600) (headline's base weight
  // is already w600, so its emphasized variant doesn't change).

  /// The emphasized variant of [largeTitle]. Its emphasized weight is
  /// w700 (Bold).
  static const largeTitleEmphasized = TextStyle(
    fontFamily: 'CupertinoSystemDisplay',
    fontSize: 34,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.37,
    color: CupertinoColors.label,
    inherit: false,
  );

  /// The emphasized variant of [title1]. Its emphasized weight is w700
  /// (Bold).
  static const title1Emphasized = TextStyle(
    fontFamily: 'CupertinoSystemDisplay',
    fontSize: 28,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.36,
    color: CupertinoColors.label,
    inherit: false,
  );

  /// The emphasized variant of [title2]. Its emphasized weight is w700
  /// (Bold).
  static const title2Emphasized = TextStyle(
    fontFamily: 'CupertinoSystemDisplay',
    fontSize: 22,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.35,
    color: CupertinoColors.label,
    inherit: false,
  );

  /// The emphasized variant of [title3]. Its emphasized weight is w600
  /// (Semibold).
  static const title3Emphasized = TextStyle(
    fontFamily: 'CupertinoSystemDisplay',
    fontSize: 20,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.38,
    color: CupertinoColors.label,
    inherit: false,
  );

  /// The emphasized variant of [headline]. Because [headline]'s base
  /// weight is already Semibold (w600), its emphasized weight stays the
  /// same w600 and does not change.
  static const headlineEmphasized = TextStyle(
    fontFamily: 'CupertinoSystemText',
    fontSize: 17,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.41,
    color: CupertinoColors.label,
    inherit: false,
  );

  /// The emphasized variant of [body]. Its emphasized weight is w600
  /// (Semibold).
  static const bodyEmphasized = TextStyle(
    fontFamily: 'CupertinoSystemText',
    fontSize: 17,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.41,
    color: CupertinoColors.label,
    inherit: false,
  );

  /// The emphasized variant of [callout]. Its emphasized weight is w600
  /// (Semibold).
  static const calloutEmphasized = TextStyle(
    fontFamily: 'CupertinoSystemText',
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.32,
    color: CupertinoColors.label,
    inherit: false,
  );

  /// The emphasized variant of [subheadline]. Its emphasized weight is
  /// w600 (Semibold).
  static const subheadlineEmphasized = TextStyle(
    fontFamily: 'CupertinoSystemText',
    fontSize: 15,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.24,
    color: CupertinoColors.label,
    inherit: false,
  );

  /// The emphasized variant of [footnote]. Its emphasized weight is w600
  /// (Semibold).
  static const footnoteEmphasized = TextStyle(
    fontFamily: 'CupertinoSystemText',
    fontSize: 13,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.08,
    color: CupertinoColors.label,
    inherit: false,
  );

  /// The emphasized variant of [caption1]. Its emphasized weight is w600
  /// (Semibold).
  static const caption1Emphasized = TextStyle(
    fontFamily: 'CupertinoSystemText',
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.0,
    color: CupertinoColors.label,
    inherit: false,
  );

  /// The emphasized variant of [caption2]. Its emphasized weight is w600
  /// (Semibold).
  static const caption2Emphasized = TextStyle(
    fontFamily: 'CupertinoSystemText',
    fontSize: 11,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.07,
    color: CupertinoColors.label,
    inherit: false,
  );

  /// Returns the Apple system font identifier that should be used for a
  /// given [fontSize].
  ///
  /// Sizes below 20pt return the body identifier
  /// `'CupertinoSystemText'`, and sizes of 20pt or larger (including
  /// exactly 20.0) return the display identifier
  /// `'CupertinoSystemDisplay'`. Neither of these is the name of an
  /// actual font; they are Apple system font identifiers that Flutter
  /// recognizes when passed to
  /// [TextStyle.fontFamily](https://api.flutter.dev/flutter/painting/TextStyle/fontFamily.html),
  /// and which concrete font actually gets rendered is left to iOS's own
  /// font fallback mechanism.
  ///
  /// The 20pt boundary was chosen to match how the 11 HIG styles are
  /// actually assigned: [title3] (20pt) and larger use
  /// `CupertinoSystemDisplay`, while [headline] (17pt) and smaller use
  /// `CupertinoSystemText`.
  static String fontFamilyForSize(double fontSize) {
    return fontSize >= 20 ? 'CupertinoSystemDisplay' : 'CupertinoSystemText';
  }

  /// Builds a [TextTheme] that maps the 11 HIG Text Styles onto the 15
  /// roles of Material's [TextTheme].
  ///
  /// This is exposed as a static method rather than a getter so that, in
  /// the future, arguments such as an `emphasized:` flag or a color
  /// override can be added non-destructively, without breaking existing
  /// call sites. A getter cannot take arguments, so it would leave no
  /// room for that kind of extension.
  ///
  /// Example:
  ///
  /// ```dart
  /// ThemeData(textTheme: CupertinoTypography.textTheme())
  /// ```
  ///
  /// Because the HIG has only 11 styles while Material's [TextTheme] has
  /// 15, finer-grained roles, some HIG styles are necessarily assigned to
  /// more than one Material role (details below). The mapping is fixed as
  /// follows.
  ///
  /// | Material role | HIG style |
  /// |---|---|
  /// | displayLarge | [largeTitle] |
  /// | displayMedium | [largeTitle] |
  /// | displaySmall | [title1] |
  /// | headlineLarge | [title1] |
  /// | headlineMedium | [title2] |
  /// | headlineSmall | [title3] |
  /// | titleLarge | [headline] |
  /// | titleMedium | [callout] |
  /// | titleSmall | [subheadline] |
  /// | bodyLarge | [body] |
  /// | bodyMedium | [callout] |
  /// | bodySmall | [footnote] |
  /// | labelLarge | [subheadline] |
  /// | labelMedium | [caption1] |
  /// | labelSmall | [caption2] |
  ///
  /// ### Rationale for the mapping
  ///
  /// Covering Material's 15 roles with the HIG's 11 styles makes some
  /// duplication unavoidable. Rather than collapsing the entire upper
  /// band (`display*` / `headline*`) onto [largeTitle] alone, this
  /// mapping steps down through [largeTitle] → [title1] → [title2] →
  /// [title3], so that all 11 styles are actually put to use.
  ///
  /// `bodyMedium` is Material's default body role — the value that
  /// actually applies to a plain, undecorated `Text()` widget. An earlier
  /// version of this mapping assigned footnote (13pt) here, but that is
  /// too small for body text, so it was changed to callout (16pt) to
  /// match iOS's own body text conventions.
  ///
  /// `titleLarge` → [headline] can look wrong at first glance, since the
  /// size alone drops from 22pt to 17pt. But Material's `titleLarge` is
  /// primarily used for an AppBar's title, and the corresponding iOS
  /// component is the navigation bar title (17pt / Semibold). This
  /// mapping prioritizes that role correspondence over numeric closeness
  /// in size.
  ///
  /// `largeTitle` is duplicated across both `displayLarge` and
  /// `displayMedium` because the HIG has no style larger than 34pt. Once
  /// a band hits that ceiling it cannot be subdivided further, so
  /// duplication is the only structural option.
  ///
  /// As duplication absorption in the middle band, [callout] is shared
  /// between the `titleMedium` and `bodyMedium` roles, and [subheadline]
  /// is shared between the `titleSmall` and `labelLarge` roles.
  ///
  /// ### Known loss of visual information
  ///
  /// - `titleLarge` ([headline], 17pt/w600) and `bodyLarge` ([body],
  ///   17pt/w400) end up the same size. In Material's own scale,
  ///   titleLarge (22pt) is noticeably larger than bodyLarge (16pt), but
  ///   at the HIG's granularity both land in the 17pt band. The
  ///   difference in emphasis from `fontWeight` (w600 vs. w400) is
  ///   preserved, but the size difference is lost.
  /// - `titleMedium` ([callout], 16pt/w400) cannot reproduce Material's
  ///   original medium emphasis, which corresponds to roughly w500. This
  ///   is a structural limitation: none of the HIG candidates around
  ///   16pt offer a w500-equivalent option, and it cannot be avoided
  ///   without changing the value tables.
  ///
  /// Note that the emphasized variants (`largeTitleEmphasized` and so
  /// on) are not used by this automatic mapping. Call sites that need
  /// bold emphasis are expected to manually substitute the emphasized
  /// variant in place of the relevant role.
  ///
  /// Source: [Apple HIG Typography](https://developer.apple.com/design/human-interface-guidelines/typography)
  static TextTheme textTheme() {
    return const TextTheme(
      displayLarge: largeTitle,
      displayMedium: largeTitle,
      displaySmall: title1,
      headlineLarge: title1,
      headlineMedium: title2,
      headlineSmall: title3,
      titleLarge: headline,
      titleMedium: callout,
      titleSmall: subheadline,
      bodyLarge: body,
      bodyMedium: callout,
      bodySmall: footnote,
      labelLarge: subheadline,
      labelMedium: caption1,
      labelSmall: caption2,
    );
  }
}

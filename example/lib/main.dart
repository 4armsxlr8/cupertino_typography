import 'package:cupertino_typography/cupertino_typography.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const TypographyExampleApp());
}

/// Demo that lists all 11 [CupertinoTypography] styles, showing each
/// style's regular and emphasized variants side by side.
class TypographyExampleApp extends StatelessWidget {
  const TypographyExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'cupertino_typography example',
      home: TypographyGalleryPage(),
    );
  }
}

/// Sample text mixing Japanese and Latin script. Since `height` is left
/// `null`, the line height reflects whichever font actually renders the
/// glyphs (Hiragino for Japanese, SF for Latin).
const String _sampleText = 'Hello, こんにちは！Typography 123';

/// A "regular" and "emphasized" pair for one of the 11 HIG text styles.
class _StyleSample {
  const _StyleSample(this.name, this.normal, this.emphasized);

  final String name;
  final TextStyle normal;
  final TextStyle emphasized;
}

const List<_StyleSample> _samples = <_StyleSample>[
  _StyleSample(
    'largeTitle',
    CupertinoTypography.largeTitle,
    CupertinoTypography.largeTitleEmphasized,
  ),
  _StyleSample(
    'title1',
    CupertinoTypography.title1,
    CupertinoTypography.title1Emphasized,
  ),
  _StyleSample(
    'title2',
    CupertinoTypography.title2,
    CupertinoTypography.title2Emphasized,
  ),
  _StyleSample(
    'title3',
    CupertinoTypography.title3,
    CupertinoTypography.title3Emphasized,
  ),
  _StyleSample(
    'headline',
    CupertinoTypography.headline,
    CupertinoTypography.headlineEmphasized,
  ),
  _StyleSample(
    'body',
    CupertinoTypography.body,
    CupertinoTypography.bodyEmphasized,
  ),
  _StyleSample(
    'callout',
    CupertinoTypography.callout,
    CupertinoTypography.calloutEmphasized,
  ),
  _StyleSample(
    'subheadline',
    CupertinoTypography.subheadline,
    CupertinoTypography.subheadlineEmphasized,
  ),
  _StyleSample(
    'footnote',
    CupertinoTypography.footnote,
    CupertinoTypography.footnoteEmphasized,
  ),
  _StyleSample(
    'caption1',
    CupertinoTypography.caption1,
    CupertinoTypography.caption1Emphasized,
  ),
  _StyleSample(
    'caption2',
    CupertinoTypography.caption2,
    CupertinoTypography.caption2Emphasized,
  ),
];

class TypographyGalleryPage extends StatelessWidget {
  const TypographyGalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('HIG Text Styles'),
      ),
      child: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: _samples.length,
          separatorBuilder: (context, index) => const SizedBox(height: 24),
          itemBuilder: (context, index) => _StyleRow(sample: _samples[index]),
        ),
      ),
    );
  }
}

class _StyleRow extends StatelessWidget {
  const _StyleRow({required this.sample});

  final _StyleSample sample;

  static const TextStyle _labelStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: CupertinoColors.systemGrey,
  );

  static const TextStyle _captionStyle = TextStyle(
    fontSize: 11,
    color: CupertinoColors.systemGrey,
  );

  String _weightLabel(FontWeight? weight) {
    return switch (weight) {
      FontWeight.w400 => 'Regular (w400)',
      FontWeight.w600 => 'Semibold (w600)',
      FontWeight.w700 => 'Bold (w700)',
      _ => weight.toString(),
    };
  }

  String _caption(TextStyle style) {
    final fontSize = style.fontSize?.toStringAsFixed(0) ?? '?';
    return '${fontSize}pt / ${_weightLabel(style.fontWeight)}';
  }

  /// Each [CupertinoTypography] style carries `color: CupertinoColors.label`,
  /// which is an unresolved `CupertinoDynamicColor`. Passing the const style
  /// straight to `Text.style` would skip dynamic-color resolution and always
  /// render the light-mode color (black), so we resolve it explicitly
  /// against the current `BuildContext`.
  TextStyle _resolvedStyle(BuildContext context, TextStyle style) {
    return style.copyWith(
      color: CupertinoDynamicColor.maybeResolve(style.color, context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(sample.name, style: _labelStyle),
        const SizedBox(height: 6),
        Text(
          'Regular  $_sampleText',
          style: _resolvedStyle(context, sample.normal),
        ),
        const SizedBox(height: 2),
        Text(_caption(sample.normal), style: _captionStyle),
        const SizedBox(height: 8),
        Text(
          'Emphasized  $_sampleText',
          style: _resolvedStyle(context, sample.emphasized),
        ),
        const SizedBox(height: 2),
        Text(_caption(sample.emphasized), style: _captionStyle),
      ],
    );
  }
}

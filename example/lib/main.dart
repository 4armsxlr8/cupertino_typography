import 'package:flutter/material.dart';

import 'home_page.dart';
import 'shot_feed_app.dart';
import 'shot_mode.dart';

void main() {
  final shotMode = ShotMode.fromEnvironment();
  if (shotMode != null) {
    // `--dart-define=SHOT=feed_material` / `SHOT=feed_hig`: chrome-free
    // feed screenshot, see shot_mode.dart / shot_feed_app.dart.
    runApp(ShotFeedApp(useHigTypography: shotMode.useHigTypography));
  } else {
    runApp(const TypographyExampleApp());
  }
}

/// The regular, interactive example app: a [TypographyGalleryPage]
/// listing all 11 [CupertinoTypography] styles, and a
/// [FeedComparisonPage] reproducing the README's comparison screenshot,
/// switchable from [ExampleHomePage]'s bottom navigation bar.
class TypographyExampleApp extends StatelessWidget {
  const TypographyExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'cupertino_typography example',
      debugShowCheckedModeBanner: false,
      home: ExampleHomePage(),
    );
  }
}

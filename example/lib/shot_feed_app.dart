import 'package:cupertino_typography/cupertino_typography.dart';
import 'package:flutter/material.dart';

import 'feed/feed_view.dart';

/// Chrome-free app root used for `--dart-define=SHOT=feed_material` and
/// `SHOT=feed_hig` (see `shot_mode.dart`).
///
/// Shows only [FeedView], full-screen, with no toggle, no navigation bar,
/// and no other interactive UI — just the feed on a white background, so
/// a screenshot of the running app reproduces one half of the README's
/// side-by-side comparison image.
class ShotFeedApp extends StatelessWidget {
  const ShotFeedApp({super.key, required this.useHigTypography});

  /// Whether to apply `CupertinoTypography.textTheme()` (`true`) or leave
  /// Material's own default [TextTheme] in place (`false`).
  final bool useHigTypography;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: useHigTypography
          ? ThemeData(textTheme: CupertinoTypography.textTheme())
          : ThemeData(),
      home: const SafeArea(child: FeedView()),
    );
  }
}

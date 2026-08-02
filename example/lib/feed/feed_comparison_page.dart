import 'package:cupertino_typography/cupertino_typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'feed_view.dart';

/// The two [ThemeData] choices the [FeedComparisonPage] toggle switches
/// between.
enum _FeedThemeOption {
  /// Material's own built-in default [TextTheme] — the baseline this
  /// package's [CupertinoTypography.textTheme] is meant to be compared
  /// against.
  material('Material (default)'),

  /// [CupertinoTypography.textTheme()], this package's HIG-based bridge
  /// to Material's [TextTheme].
  hig('CupertinoTypography');

  const _FeedThemeOption(this.label);

  final String label;
}

/// Interactive demo that reproduces the README's side-by-side
/// screenshot: the same SNS-feed-style screen, once with Material's
/// default [TextTheme] and once with [CupertinoTypography.textTheme()].
///
/// A [SegmentedButton] switches which [ThemeData] wraps [FeedView] via a
/// plain [Theme] widget — this is the package's actual public API being
/// exercised, not a simulation of it.
class FeedComparisonPage extends StatefulWidget {
  const FeedComparisonPage({super.key});

  @override
  State<FeedComparisonPage> createState() => _FeedComparisonPageState();
}

class _FeedComparisonPageState extends State<FeedComparisonPage> {
  _FeedThemeOption _selected = _FeedThemeOption.material;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('Feed Demo')),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: SegmentedButton<_FeedThemeOption>(
                segments: _FeedThemeOption.values
                    .map(
                      (option) => ButtonSegment<_FeedThemeOption>(
                        value: option,
                        label: Text(option.label),
                      ),
                    )
                    .toList(growable: false),
                selected: <_FeedThemeOption>{_selected},
                onSelectionChanged: (selection) {
                  setState(() => _selected = selection.first);
                },
              ),
            ),
            Expanded(
              child: Theme(
                data: _selected == _FeedThemeOption.hig
                    ? ThemeData(textTheme: CupertinoTypography.textTheme())
                    : ThemeData(),
                child: const FeedView(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

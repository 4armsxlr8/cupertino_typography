// Widget test for the cupertino_typography example app.
//
// Verifies that the typography gallery renders its navigation title, shows
// the regular/emphasized sample text, and that every one of the 11 HIG
// style rows is reachable by scrolling through the list.

import 'package:cupertino_typography_example/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('renders the HIG text style gallery', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const TypographyExampleApp());
    await tester.pumpAndSettle();

    // The navigation bar title is shown.
    expect(find.text('HIG Text Styles'), findsOneWidget);

    // The first style row is visible without scrolling.
    expect(find.text('largeTitle'), findsOneWidget);
    expect(
      find.textContaining('Regular  Hello, こんにちは！Typography 123'),
      findsWidgets,
    );
    expect(
      find.textContaining('Emphasized  Hello, こんにちは！Typography 123'),
      findsWidgets,
    );

    // Every HIG style name is reachable by scrolling through the list.
    const styleNames = <String>[
      'largeTitle',
      'title1',
      'title2',
      'title3',
      'headline',
      'body',
      'callout',
      'subheadline',
      'footnote',
      'caption1',
      'caption2',
    ];
    final scrollable = find.byType(Scrollable);
    for (final name in styleNames) {
      await tester.scrollUntilVisible(
        find.text(name),
        200,
        scrollable: scrollable,
      );
      expect(find.text(name), findsOneWidget);
    }
  });
}

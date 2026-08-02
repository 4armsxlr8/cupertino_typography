// Widget test for the cupertino_typography example app.
//
// Covers both screens reachable from the example's bottom navigation bar:
// the original HIG text style gallery, and the feed comparison demo that
// reproduces the README's Material-vs-HIG screenshot.

import 'package:cupertino_typography_example/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('renders the HIG text style gallery', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const TypographyExampleApp());
    await tester.pumpAndSettle();

    // The gallery is the default tab: its navigation bar title is shown.
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

  testWidgets('renders the feed comparison demo with its theme toggle', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const TypographyExampleApp());
    await tester.pumpAndSettle();

    // Switch to the "Feed Demo" tab via the bottom navigation bar.
    await tester.tap(find.text('Feed Demo'));
    await tester.pumpAndSettle();

    expect(find.text('Feed Demo'), findsWidgets); // nav title + nav bar label

    // The Material-vs-CupertinoTypography toggle is present.
    expect(find.text('Material (default)'), findsOneWidget);
    expect(find.text('CupertinoTypography'), findsOneWidget);

    // Posts are laid out: display name, body text, and the action row.
    expect(find.text('Ava Thornton'), findsOneWidget);
    expect(
      find.textContaining('Spent the whole afternoon rereading old design'),
      findsOneWidget,
    );
    expect(
        find.textContaining('Reply 12 · Repost 34 · Like 156'), findsOneWidget);

    // Switching the toggle to CupertinoTypography keeps the feed intact.
    await tester.tap(find.text('CupertinoTypography'));
    await tester.pumpAndSettle();

    expect(find.text('Ava Thornton'), findsOneWidget);
    expect(
      find.textContaining('Spent the whole afternoon rereading old design'),
      findsOneWidget,
    );
  });
}

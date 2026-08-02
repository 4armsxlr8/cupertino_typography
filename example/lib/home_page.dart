import 'package:flutter/material.dart';

import 'feed/feed_comparison_page.dart';
import 'style_gallery_page.dart';

/// Root screen of the interactive example app.
///
/// A bottom [NavigationBar] switches between the two demos this package
/// ships:
///
/// * **Styles** — [TypographyGalleryPage], the original gallery listing
///   all 11 HIG text styles.
/// * **Feed Demo** — [FeedComparisonPage], which reproduces the README's
///   Material-vs-HIG comparison screenshot interactively.
class ExampleHomePage extends StatefulWidget {
  const ExampleHomePage({super.key});

  @override
  State<ExampleHomePage> createState() => _ExampleHomePageState();
}

class _ExampleHomePageState extends State<ExampleHomePage> {
  int _index = 0;

  static const List<Widget> _pages = <Widget>[
    TypographyGalleryPage(),
    FeedComparisonPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (value) => setState(() => _index = value),
        destinations: const <NavigationDestination>[
          NavigationDestination(
            icon: Icon(Icons.text_fields),
            label: 'Styles',
          ),
          NavigationDestination(
            icon: Icon(Icons.forum_outlined),
            label: 'Feed Demo',
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

/// A single sample post shown in the feed comparison demo
/// ([FeedComparisonPage] in `feed_comparison_page.dart`).
///
/// This is display-only sample data — there is no backing service. Its
/// only purpose is to give the demo enough realistic, multi-line English
/// text to make the difference between Material's default [TextTheme] and
/// [CupertinoTypography.textTheme] visible.
class FeedPost {
  const FeedPost({
    required this.displayName,
    required this.handle,
    required this.timestamp,
    required this.body,
    required this.replyCount,
    required this.repostCount,
    required this.likeCount,
    required this.avatarColor,
  });

  /// The poster's display name, e.g. `'Ava Thornton'`.
  final String displayName;

  /// The poster's handle, without the leading `@`.
  final String handle;

  /// A short relative timestamp, e.g. `'2h'`.
  final String timestamp;

  /// The post body. Deliberately long enough to wrap across multiple
  /// lines on a phone-width screen, so the demo actually shows how each
  /// [TextTheme] handles running text.
  final String body;

  final int replyCount;
  final int repostCount;
  final int likeCount;

  /// Background color for the placeholder circular avatar.
  final Color avatarColor;

  /// A one-or-two-letter initials fallback for the placeholder avatar,
  /// derived from [displayName] (e.g. `'Ava Thornton'` → `'AT'`).
  String get initials {
    final words = displayName.trim().split(RegExp(r'\s+'));
    final letters = words
        .where((word) => word.isNotEmpty)
        .map((word) => word[0].toUpperCase());
    return letters.take(2).join();
  }
}

/// Four sample posts used by the feed comparison demo. The bodies are
/// generic, typography-themed text — long enough to reliably wrap across
/// multiple lines regardless of which [TextTheme] is active.
const List<FeedPost> samplePosts = <FeedPost>[
  FeedPost(
    displayName: 'Ava Thornton',
    handle: 'avathornton',
    timestamp: '2h',
    body: 'Spent the whole afternoon rereading old design notes and I keep '
        'landing on the same conclusion: type is the interface. Get the '
        'rhythm of sizes and weights right and everything else on the '
        'screen feels calmer, even before you touch color or layout.',
    replyCount: 12,
    repostCount: 34,
    likeCount: 156,
    avatarColor: Colors.indigo,
  ),
  FeedPost(
    displayName: 'Marcus Webb',
    handle: 'marcuswebb',
    timestamp: '4h',
    body: 'Finally shipped the redesign of our settings screen. The biggest '
        "change nobody will notice: every heading now steps down through "
        "a consistent scale instead of picking whatever felt close "
        'enough. Small stuff, but it adds up fast once you notice it.',
    replyCount: 8,
    repostCount: 21,
    likeCount: 203,
    avatarColor: Colors.teal,
  ),
  FeedPost(
    displayName: 'Priya Raman',
    handle: 'priya_ux',
    timestamp: '6h',
    body: "Hot take: most apps don't have a color problem, they have a "
        "hierarchy problem. If your eye doesn't know where to land "
        'first, no amount of palette tweaking is going to fix that. '
        'Start with the text styles, everything else follows.',
    replyCount: 45,
    repostCount: 112,
    likeCount: 892,
    avatarColor: Colors.deepOrange,
  ),
  FeedPost(
    displayName: 'Jordan Lee',
    handle: 'jordanlee_dev',
    timestamp: '9h',
    body: 'Three days into testing on a real device and the difference '
        'between a borrowed type scale and one built for the platform is '
        'bigger than I expected. Line height, letter spacing, weight '
        'steps — it all reads as one coherent voice instead of a '
        'patchwork.',
    replyCount: 6,
    repostCount: 15,
    likeCount: 98,
    avatarColor: Colors.purple,
  ),
];

import 'package:flutter/material.dart';

import 'feed_post.dart';

/// A SNS-feed-style list of [samplePosts], rendered entirely through
/// `Theme.of(context).textTheme` roles.
///
/// This widget is deliberately theme-agnostic: it never constructs a
/// [TextStyle] itself. Whichever [TextTheme] is active in the ambient
/// [Theme] — Material's default, or [CupertinoTypography.textTheme()] —
/// is what determines how the feed looks. That makes [FeedView] reusable
/// both for the interactive comparison in `feed_comparison_page.dart` and
/// for the chrome-free screenshot hosts in `shot_feed_app.dart`.
///
/// The background is always opaque white, matching the comparison
/// screenshot in the package README.
class FeedView extends StatelessWidget {
  const FeedView({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        itemCount: samplePosts.length,
        separatorBuilder: (context, index) =>
            const Divider(height: 33, thickness: 0.5),
        itemBuilder: (context, index) =>
            _FeedPostTile(post: samplePosts[index]),
      ),
    );
  }
}

class _FeedPostTile extends StatelessWidget {
  const _FeedPostTile({required this.post});

  final FeedPost post;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    const metaColor = Colors.black54;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: post.avatarColor,
          child: Text(
            post.initials,
            style: textTheme.titleMedium?.copyWith(color: Colors.white),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Display name, handle, and timestamp.
              Row(
                children: [
                  Flexible(
                    child: Text(
                      post.displayName,
                      style: textTheme.titleMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      '@${post.handle} · ${post.timestamp}',
                      style: textTheme.labelMedium?.copyWith(color: metaColor),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              // Post body: 2-4 sentences, long enough to wrap.
              Text(post.body, style: textTheme.bodyMedium),
              const SizedBox(height: 8),
              // Reply / repost / like action row.
              Text(
                'Reply ${post.replyCount} · Repost ${post.repostCount} · '
                'Like ${post.likeCount}',
                style: textTheme.labelMedium?.copyWith(color: metaColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

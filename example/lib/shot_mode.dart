/// The `SHOT` dart-define values this example app recognizes for
/// producing chrome-free, screenshot-ready renders of the feed demo.
///
/// Launch with e.g. `flutter run --dart-define=SHOT=feed_material` or
/// `flutter run --dart-define=SHOT=feed_hig` to skip the normal
/// interactive app (tabs, toggle, navigation bars) and show only the feed
/// list, full-screen, on a white background — this is how the
/// `doc/material-vs-hig-feed-en.png` comparison screenshot in the README
/// is reproduced.
///
/// A normal `flutter run` with no `SHOT` define (or an unrecognized
/// value) launches the regular interactive example instead.
enum ShotMode {
  /// Feed screenshot using Material's default [TextTheme].
  feedMaterial(useHigTypography: false),

  /// Feed screenshot using `CupertinoTypography.textTheme()`.
  feedHig(useHigTypography: true);

  const ShotMode({required this.useHigTypography});

  /// Whether this shot uses `CupertinoTypography.textTheme()` (`true`) or
  /// Material's own default [TextTheme] (`false`).
  final bool useHigTypography;

  /// The raw `SHOT` dart-define value, read at compile time.
  static const String _value = String.fromEnvironment('SHOT');

  /// Resolves the `SHOT` dart-define to a [ShotMode], or `null` for a
  /// normal interactive launch.
  static ShotMode? fromEnvironment() {
    return switch (_value) {
      'feed_material' => ShotMode.feedMaterial,
      'feed_hig' => ShotMode.feedHig,
      _ => null,
    };
  }
}

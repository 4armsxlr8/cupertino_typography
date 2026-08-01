import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cupertino_typography/cupertino_typography.dart';

void main() {
  group('CupertinoTypography (基本11スタイル)', () {
    test('largeTitle', () {
      const style = CupertinoTypography.largeTitle;
      expect(style.fontSize, 34);
      expect(style.fontWeight, FontWeight.w400);
      expect(style.letterSpacing, 0.37);
      expect(style.fontFamily, 'CupertinoSystemDisplay');
      expect(style.height, isNull);
      expect(style.inherit, isFalse);
      expect(style.color, CupertinoColors.label);
    });

    test('title1', () {
      const style = CupertinoTypography.title1;
      expect(style.fontSize, 28);
      expect(style.fontWeight, FontWeight.w400);
      expect(style.letterSpacing, 0.36);
      expect(style.fontFamily, 'CupertinoSystemDisplay');
      expect(style.height, isNull);
      expect(style.inherit, isFalse);
      expect(style.color, CupertinoColors.label);
    });

    test('title2', () {
      const style = CupertinoTypography.title2;
      expect(style.fontSize, 22);
      expect(style.fontWeight, FontWeight.w400);
      expect(style.letterSpacing, 0.35);
      expect(style.fontFamily, 'CupertinoSystemDisplay');
      expect(style.height, isNull);
      expect(style.inherit, isFalse);
      expect(style.color, CupertinoColors.label);
    });

    test('title3', () {
      const style = CupertinoTypography.title3;
      expect(style.fontSize, 20);
      expect(style.fontWeight, FontWeight.w400);
      expect(style.letterSpacing, 0.38);
      expect(style.fontFamily, 'CupertinoSystemDisplay');
      expect(style.height, isNull);
      expect(style.inherit, isFalse);
      expect(style.color, CupertinoColors.label);
    });

    test('headline', () {
      const style = CupertinoTypography.headline;
      expect(style.fontSize, 17);
      expect(style.fontWeight, FontWeight.w600);
      expect(style.letterSpacing, -0.41);
      expect(style.fontFamily, 'CupertinoSystemText');
      expect(style.height, isNull);
      expect(style.inherit, isFalse);
      expect(style.color, CupertinoColors.label);
    });

    test('body', () {
      const style = CupertinoTypography.body;
      expect(style.fontSize, 17);
      expect(style.fontWeight, FontWeight.w400);
      expect(style.letterSpacing, -0.41);
      expect(style.fontFamily, 'CupertinoSystemText');
      expect(style.height, isNull);
      expect(style.inherit, isFalse);
      expect(style.color, CupertinoColors.label);
    });

    test('callout', () {
      const style = CupertinoTypography.callout;
      expect(style.fontSize, 16);
      expect(style.fontWeight, FontWeight.w400);
      expect(style.letterSpacing, -0.32);
      expect(style.fontFamily, 'CupertinoSystemText');
      expect(style.height, isNull);
      expect(style.inherit, isFalse);
      expect(style.color, CupertinoColors.label);
    });

    test('subheadline', () {
      const style = CupertinoTypography.subheadline;
      expect(style.fontSize, 15);
      expect(style.fontWeight, FontWeight.w400);
      expect(style.letterSpacing, -0.24);
      expect(style.fontFamily, 'CupertinoSystemText');
      expect(style.height, isNull);
      expect(style.inherit, isFalse);
      expect(style.color, CupertinoColors.label);
    });

    test('footnote', () {
      const style = CupertinoTypography.footnote;
      expect(style.fontSize, 13);
      expect(style.fontWeight, FontWeight.w400);
      expect(style.letterSpacing, -0.08);
      expect(style.fontFamily, 'CupertinoSystemText');
      expect(style.height, isNull);
      expect(style.inherit, isFalse);
      expect(style.color, CupertinoColors.label);
    });

    test('caption1', () {
      const style = CupertinoTypography.caption1;
      expect(style.fontSize, 12);
      expect(style.fontWeight, FontWeight.w400);
      expect(style.letterSpacing, 0.0);
      expect(style.fontFamily, 'CupertinoSystemText');
      expect(style.height, isNull);
      expect(style.inherit, isFalse);
      expect(style.color, CupertinoColors.label);
    });

    test('caption2', () {
      const style = CupertinoTypography.caption2;
      expect(style.fontSize, 11);
      expect(style.fontWeight, FontWeight.w400);
      expect(style.letterSpacing, 0.07);
      expect(style.fontFamily, 'CupertinoSystemText');
      expect(style.height, isNull);
      expect(style.inherit, isFalse);
      expect(style.color, CupertinoColors.label);
    });
  });

  group('CupertinoTypography (emphasized バリアント)', () {
    void expectEmphasized({
      required TextStyle base,
      required TextStyle emphasized,
      required FontWeight expectedWeight,
    }) {
      expect(emphasized.fontWeight, expectedWeight);
      expect(emphasized.fontSize, base.fontSize);
      expect(emphasized.letterSpacing, base.letterSpacing);
      expect(emphasized.fontFamily, base.fontFamily);
      expect(emphasized.height, base.height);
      expect(emphasized.inherit, base.inherit);
      expect(emphasized.color, base.color);
    }

    test('largeTitleEmphasized は w700', () {
      expectEmphasized(
        base: CupertinoTypography.largeTitle,
        emphasized: CupertinoTypography.largeTitleEmphasized,
        expectedWeight: FontWeight.w700,
      );
    });

    test('title1Emphasized は w700', () {
      expectEmphasized(
        base: CupertinoTypography.title1,
        emphasized: CupertinoTypography.title1Emphasized,
        expectedWeight: FontWeight.w700,
      );
    });

    test('title2Emphasized は w700', () {
      expectEmphasized(
        base: CupertinoTypography.title2,
        emphasized: CupertinoTypography.title2Emphasized,
        expectedWeight: FontWeight.w700,
      );
    });

    test('title3Emphasized は w600', () {
      expectEmphasized(
        base: CupertinoTypography.title3,
        emphasized: CupertinoTypography.title3Emphasized,
        expectedWeight: FontWeight.w600,
      );
    });

    test('headlineEmphasized は w600（元々 w600 なので変化なし）', () {
      expectEmphasized(
        base: CupertinoTypography.headline,
        emphasized: CupertinoTypography.headlineEmphasized,
        expectedWeight: FontWeight.w600,
      );
    });

    test('bodyEmphasized は w600', () {
      expectEmphasized(
        base: CupertinoTypography.body,
        emphasized: CupertinoTypography.bodyEmphasized,
        expectedWeight: FontWeight.w600,
      );
    });

    test('calloutEmphasized は w600', () {
      expectEmphasized(
        base: CupertinoTypography.callout,
        emphasized: CupertinoTypography.calloutEmphasized,
        expectedWeight: FontWeight.w600,
      );
    });

    test('subheadlineEmphasized は w600', () {
      expectEmphasized(
        base: CupertinoTypography.subheadline,
        emphasized: CupertinoTypography.subheadlineEmphasized,
        expectedWeight: FontWeight.w600,
      );
    });

    test('footnoteEmphasized は w600', () {
      expectEmphasized(
        base: CupertinoTypography.footnote,
        emphasized: CupertinoTypography.footnoteEmphasized,
        expectedWeight: FontWeight.w600,
      );
    });

    test('caption1Emphasized は w600', () {
      expectEmphasized(
        base: CupertinoTypography.caption1,
        emphasized: CupertinoTypography.caption1Emphasized,
        expectedWeight: FontWeight.w600,
      );
    });

    test('caption2Emphasized は w600', () {
      expectEmphasized(
        base: CupertinoTypography.caption2,
        emphasized: CupertinoTypography.caption2Emphasized,
        expectedWeight: FontWeight.w600,
      );
    });
  });

  group('CupertinoTypography.textTheme() (15 ロールの確定マッピング)', () {
    final theme = CupertinoTypography.textTheme();

    test('displayLarge/Medium は largeTitle、displaySmall は title1', () {
      expect(theme.displayLarge, CupertinoTypography.largeTitle);
      expect(theme.displayMedium, CupertinoTypography.largeTitle);
      expect(theme.displaySmall, CupertinoTypography.title1);
    });

    test(
      'headlineLarge は title1、headlineMedium は title2、headlineSmall は title3',
      () {
        expect(theme.headlineLarge, CupertinoTypography.title1);
        expect(theme.headlineMedium, CupertinoTypography.title2);
        expect(theme.headlineSmall, CupertinoTypography.title3);
      },
    );

    test(
      'titleLarge は headline、titleMedium は callout、titleSmall は subheadline',
      () {
        expect(theme.titleLarge, CupertinoTypography.headline);
        expect(theme.titleMedium, CupertinoTypography.callout);
        expect(theme.titleSmall, CupertinoTypography.subheadline);
      },
    );

    test('bodyLarge は body、bodyMedium は callout、bodySmall は footnote', () {
      expect(theme.bodyLarge, CupertinoTypography.body);
      expect(theme.bodyMedium, CupertinoTypography.callout);
      expect(theme.bodySmall, CupertinoTypography.footnote);
    });

    test(
      'labelLarge は subheadline、labelMedium は caption1、labelSmall は caption2',
      () {
        expect(theme.labelLarge, CupertinoTypography.subheadline);
        expect(theme.labelMedium, CupertinoTypography.caption1);
        expect(theme.labelSmall, CupertinoTypography.caption2);
      },
    );
  });

  group('CupertinoTypography.fontFamilyForSize (20pt 境界)', () {
    test('19.99pt は CupertinoSystemText', () {
      expect(
        CupertinoTypography.fontFamilyForSize(19.99),
        'CupertinoSystemText',
      );
    });

    test('20.0pt ちょうどは CupertinoSystemDisplay', () {
      expect(
        CupertinoTypography.fontFamilyForSize(20.0),
        'CupertinoSystemDisplay',
      );
    });

    test('20.01pt は CupertinoSystemDisplay', () {
      expect(
        CupertinoTypography.fontFamilyForSize(20.01),
        'CupertinoSystemDisplay',
      );
    });

    test('34pt は CupertinoSystemDisplay', () {
      expect(
        CupertinoTypography.fontFamilyForSize(34),
        'CupertinoSystemDisplay',
      );
    });

    test('11pt は CupertinoSystemText', () {
      expect(CupertinoTypography.fontFamilyForSize(11), 'CupertinoSystemText');
    });
  });
}

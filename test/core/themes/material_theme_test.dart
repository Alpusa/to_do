import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:to_do/core/themes/dark_schemes.dart';
import 'package:to_do/core/themes/light_schemes.dart';
import 'package:to_do/core/themes/material_theme.dart';

/// this test confirms that the corresponding topics are being created.

void main() {
  group('MaterialTheme tests', () {
    const materialTheme = MaterialTheme();

    test('light() returns valid ThemeData', () {
      final theme = materialTheme.light();
      expect(theme, isA<ThemeData>());
      expect(theme.colorScheme, LightSchemes.lightScheme());
    });

    test('lightMediumContrast() returns valid ThemeData', () {
      final theme = materialTheme.lightMediumContrast();
      expect(theme, isA<ThemeData>());
      expect(theme.colorScheme, LightSchemes.lightMediumContrastScheme());
    });

    test('lightHighContrast() returns valid ThemeData', () {
      final theme = materialTheme.lightHighContrast();
      expect(theme, isA<ThemeData>());
      expect(theme.colorScheme, LightSchemes.lightHighContrastScheme());
    });

    test('dark() returns valid ThemeData', () {
      final theme = materialTheme.dark();
      expect(theme, isA<ThemeData>());
      expect(theme.colorScheme, DarkSchemes.darkScheme());
    });

    test('darkMediumContrast() returns valid ThemeData', () {
      final theme = materialTheme.darkMediumContrast();
      expect(theme, isA<ThemeData>());
      expect(theme.colorScheme, DarkSchemes.darkMediumContrastScheme());
    });

    test('darkHighContrast() returns valid ThemeData', () {
      final theme = materialTheme.darkHighContrast();
      expect(theme, isA<ThemeData>());
      expect(theme.colorScheme, DarkSchemes.darkHighContrastScheme());
    });
  });
}

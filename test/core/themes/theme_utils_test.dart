import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:to_do/core/themes/theme_utils.dart';

void main() {
  group('ThemeUtils Tests', () {
    test('theme() creates ThemeData with the provided ColorScheme', () {
      // Define a sample ColorScheme for testing
      const colorScheme = ColorScheme(
        brightness: Brightness.light, // Specifies light mode
        primary: Colors.blue, // Primary color
        onPrimary: Colors.white, // Text color on primary background
        secondary: Colors.green, // Secondary color
        onSecondary: Colors.black, // Text color on secondary background
        error: Colors.red, // Error color
        onError: Colors.white, // Text color on background
        surface: Colors.white, // Surface color for components
        onSurface: Colors.black, // Text color on surface
      );

      // Call the theme method with the sample ColorScheme
      final themeData = ThemeUtils.theme(colorScheme);

      // Validate that the returned object is of type ThemeData
      expect(themeData, isA<ThemeData>());

      // Verify that the ThemeData contains the correct ColorScheme
      expect(themeData.colorScheme, equals(colorScheme));

      // Ensure Material 3 is enabled in the ThemeData
      expect(themeData.useMaterial3, isTrue);
    });
  });
}

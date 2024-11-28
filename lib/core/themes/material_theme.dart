import 'package:flutter/material.dart';
import 'light_schemes.dart';
import 'dark_schemes.dart';
import 'theme_utils.dart';

/// Clase para manejar temas personalizados
class MaterialTheme {
  const MaterialTheme();

  /// Tema para Light Scheme
  ThemeData light() {
    return ThemeUtils.theme(LightSchemes.lightScheme());
  }

  /// Tema para Light Medium Contrast Scheme
  ThemeData lightMediumContrast() {
    return ThemeUtils.theme(LightSchemes.lightMediumContrastScheme());
  }

  /// Tema para Light High Contrast Scheme
  ThemeData lightHighContrast() {
    return ThemeUtils.theme(LightSchemes.lightHighContrastScheme());
  }

  /// Tema para Dark Scheme
  ThemeData dark() {
    return ThemeUtils.theme(DarkSchemes.darkScheme());
  }

  /// Tema para Dark Medium Contrast Scheme
  ThemeData darkMediumContrast() {
    return ThemeUtils.theme(DarkSchemes.darkMediumContrastScheme());
  }

  /// Tema para Dark High Contrast Scheme
  ThemeData darkHighContrast() {
    return ThemeUtils.theme(DarkSchemes.darkHighContrastScheme());
  }
}

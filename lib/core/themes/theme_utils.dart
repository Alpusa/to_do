import 'package:flutter/material.dart';

/// Utilidades para temas
class ThemeUtils {
  /// Método común para crear ThemeData a partir de un ColorScheme
  static ThemeData theme(
    ColorScheme scheme,
  ) {
    return ThemeData(
      colorScheme: scheme,
      useMaterial3: true,
    );
  }
}

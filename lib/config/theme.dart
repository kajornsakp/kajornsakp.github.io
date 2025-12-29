import 'package:flutter/material.dart';
import 'package:sketchy_design_lang/sketchy_design_lang.dart';

class AppTheme {
  // Custom indigo color matching Jekyll site
  static const indigoAccent = Color(0xFF4B0082);

  static SketchyThemeData get lightTheme {
    // Start with a base theme and customize
    return SketchyThemeData.fromTheme(
      SketchyThemes.violet, // Closest to indigo
      roughness: 0.65,
    ).copyWith(
      primaryColor: indigoAccent,
      secondaryColor: const Color(0xFFFF6B35), // Warm orange
    );
  }

  static SketchyThemeData get darkTheme {
    return lightTheme; // Auto-derives dark mode
  }
}

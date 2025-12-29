import 'package:flutter/material.dart';

abstract class AppColors {
  // Primary
  static const Color primary = Color(0xFF7C3AED); // Deep Purple
  static const Color primaryLight = Color(0xFFA78BFA);
  static const Color primaryDark = Color(0xFF5B21B6);

  // Secondary
  static const Color secondary = Color(0xFF06B6D4); // Cyan
  static const Color secondaryLight = Color(0xFF22D3EE);
  static const Color secondaryDark = Color(0xFF0891B2);

  // Neutral - Light Mode
  static const Color lightBackground = Color(0xFFFFFBFE);
  static const Color lightSurface = Color(0xFFFFF7FF);
  static const Color lightOnSurface = Color(0xFF1D0033);
  static const Color lightOutline = Color(0xFFD0BCFF);

  // Neutral - Dark Mode
  static const Color darkBackground = Color(0xFF0F0313);
  static const Color darkSurface = Color(0xFF1A0D2D);
  static const Color darkOnSurface = Color(0xFFFFF7FF);
  static const Color darkOutline = Color(0xFF6E5B73);

  // Semantic
  static const Color success = Color(0xFF10B981);
  static const Color error = Color(0xFFEF4444);
  static const Color warning = Color(0xFFF59E0B);
  static const Color info = Color(0xFF3B82F6);

  // Gradient
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primary, primaryLight],
  );

  static const LinearGradient darkGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [darkSurface, darkBackground],
  );
}

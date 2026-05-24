import 'package:flutter/material.dart';

/// Custom theme tokens not covered by Material 3's ColorScheme.
/// Access via: `Theme.of(context).extension<AppExtension>()`
@immutable
class AppExtension extends ThemeExtension<AppExtension> {
  final Color starColor;
  final Color bannerGradientEnd;

  const AppExtension({
    required this.starColor,
    required this.bannerGradientEnd,
  });

  @override
  AppExtension copyWith({Color? starColor, Color? bannerGradientEnd}) =>
      AppExtension(
        starColor: starColor ?? this.starColor,
        bannerGradientEnd: bannerGradientEnd ?? this.bannerGradientEnd,
      );

  @override
  AppExtension lerp(ThemeExtension<AppExtension>? other, double t) {
    if (other is! AppExtension) return this;
    return AppExtension(
      starColor: Color.lerp(starColor, other.starColor, t)!,
      bannerGradientEnd:
          Color.lerp(bannerGradientEnd, other.bannerGradientEnd, t)!,
    );
  }
}

class AppTheme {
  static const _seedColor = Color(0xFF5B3EE8);
  static const _coral = Color(0xFFFF6B4A);
  static const _starAmber = Color(0xFFFFC107);
  static const _bannerSkyEnd = Color(0xFF4FC3F7);

  static ThemeData light() {
    final cs = ColorScheme.fromSeed(seedColor: _seedColor).copyWith(
      secondary: _coral,
      onSecondary: Colors.white,
    );
    return ThemeData(
      useMaterial3: true,
      colorScheme: cs,
      cardTheme: CardThemeData(
        color: cs.surface,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: cs.surface,
        indicatorColor: cs.primary.withValues(alpha: 0.12),
        labelTextStyle: WidgetStateProperty.all(
          const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _coral,
          foregroundColor: Colors.white,
          elevation: 0,
          padding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: cs.surfaceContainerHighest,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: cs.primary, width: 1.5),
        ),
        hintStyle: TextStyle(color: cs.onSurfaceVariant, fontSize: 14),
        prefixIconColor: cs.onSurfaceVariant,
      ),
      extensions: const [
        AppExtension(
          starColor: _starAmber,
          bannerGradientEnd: _bannerSkyEnd,
        ),
      ],
    );
  }
}

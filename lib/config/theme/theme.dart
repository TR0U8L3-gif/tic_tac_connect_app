import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AppTheme extends Equatable{
  const AppTheme({required this.color});

  final Color color;

  ThemeData get light => _buildTheme(Brightness.light);

  ThemeData get dark => _buildTheme(Brightness.dark);

  ThemeData _buildTheme(Brightness brightness) {
    final scheme =
        ColorScheme.fromSeed(seedColor: color, brightness: brightness);
    return ThemeData.from(
            colorScheme: scheme.copyWith(
              background: Color.alphaBlend(
                scheme.primary.withOpacity(0.1),
                scheme.background,
              ),
            ),
            useMaterial3: true,
    ).copyWith(
      highlightColor: scheme.surfaceVariant.withOpacity(0.8),
      hoverColor: scheme.surfaceVariant.withOpacity(0.6),
      splashColor: scheme.surfaceVariant,
    );
  }

  @override
  List<Object?> get props => [color.value];
}

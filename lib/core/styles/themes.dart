import 'package:flutter/material.dart';
import 'package:memorify/core/styles/colors.dart';

ThemeData createLightTheme() {
  final theme = ThemeData();
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Nunito',
    primaryColor: Colors.white,
    colorScheme: theme.colorScheme.copyWith(secondary: AppColors.pink),
    useMaterial3: true,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(fontSize: 36),
    ),
  );
}

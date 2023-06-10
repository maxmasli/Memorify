import 'package:flutter/material.dart';
import 'package:memorify/core/styles/colors.dart';

ThemeData createLightTheme() {
  final theme = ThemeData();
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Nunito',
    primaryColor: Colors.white,
    colorScheme: theme.colorScheme
        .copyWith(secondary: AppColors.pink, primary: Colors.black),
    useMaterial3: true,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(fontSize: 36),
      bodySmall: TextStyle(fontSize: 18),
    ),
    appBarTheme: AppBarTheme(
      color: AppColors.pink,
    ),
    tabBarTheme: TabBarTheme(
      indicatorColor: AppColors.darkPink,
      labelColor: Colors.black,
      overlayColor: MaterialStateProperty.all<Color>(
        AppColors.darkPink.withAlpha(100),
      ),
    ),
  );
}

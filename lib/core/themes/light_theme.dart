import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_app/core/themes/app_color.dart';

class LightTheme {
  static ThemeData setLightMode() => ThemeData.light(useMaterial3: true).copyWith(
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
            statusBarColor: AppColors.primaryColor,
            systemNavigationBarColor: AppColors.primaryColor,
          ),
        ),
        scaffoldBackgroundColor: Colors.white,
        colorScheme: const ColorScheme.light(
          primary: AppColors.primaryColor,
        ),
      );
}

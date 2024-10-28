import 'package:flutter/material.dart';

class AppTheme {
  Color primaryColorDark = const Color(0xFFFFA000); // Dark primary color
  Color accentColor = const Color(0xFFFFEB3B); // Accent color
  Color primaryColorLight = const Color(0xFFFFECB3); // Light primary color
  Color primaryTextColor = const Color(0xFF212121); // Primary text color
  Color primaryColor = const Color(0xFFFFC107); // Primary color
  Color secondaryTextColor = const Color(0xFF757575); // Secondary text color
  Color iconsColor = const Color(0xFF212121); // Text/icon color
  Color dividerColor = const Color(0xFFBDBDBD); // Divider color
  Color error = const Color(0xFFFF5722);

  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: primaryColor,
        onPrimary: primaryTextColor,
        secondary: accentColor,
        onSecondary: Colors.black,
        error: error,
        onError: Colors.white,
        surface: primaryColorLight,
        onSurface: primaryTextColor,
      ),
      fontFamily: 'Poppins',
      textTheme: const TextTheme(
        titleLarge: TextStyle(fontSize: 36, fontStyle: FontStyle.italic),
        bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      ),

      appBarTheme: AppBarTheme(
          backgroundColor: primaryColor,
          titleTextStyle: TextStyle(
            color: primaryTextColor,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            fontFamily: 'Poppins',
          )),
          
      iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
        iconColor: WidgetStateProperty.all(primaryTextColor),
      )));
}

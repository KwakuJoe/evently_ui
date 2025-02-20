import 'package:flutter/material.dart';

class AppThemes {
  // Light Theme
  static final lightTheme = ThemeData(
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Color(0xFF7A48FF), // You can use any color
          width: 1, // You can set the width
        ),
        borderRadius: BorderRadius.circular(8), // Rounded corners
      ),
          enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Color(0xFFE5E5E5),  // Border color when not focused and still enabled
        width: 1,
      ),
      borderRadius: BorderRadius.circular(8),
    ),
    ),
    brightness: Brightness.light,
    useMaterial3: true,
    primaryColor: const Color(0xFF7A48FF), // Primary color
    scaffoldBackgroundColor: const Color(0xFFF8F4FF),
    cardColor: const Color(0xFFF3F3F3),

    // Background color
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF7A48FF),
      secondary: Color(0xFF7A48FF),
    ),
    textTheme: const TextTheme(
      bodyLarge:
          TextStyle(fontFamily: 'Manrope', fontSize: 16, color: Colors.black),
      bodyMedium:
          TextStyle(fontFamily: 'Manrope', fontSize: 14, color: Colors.black),
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor:  Color(0xFFF8F4FF),
      titleTextStyle: TextStyle(
        fontFamily: 'Manrope',
        fontSize: 16,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  // Dark Theme
  static final darkTheme = ThemeData(
        inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Color(0xFF7A48FF), // You can use any color
          width: 1, // You can set the width
        ),
        borderRadius: BorderRadius.circular(8), // Rounded corners
      ),
          enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Color(0xFF1F1F1F),  // Border color when not focused and still enabled
        width: 1,
      ),
      borderRadius: BorderRadius.circular(8),
    ),
    ),
    brightness: Brightness.dark,
    useMaterial3: true,
    primaryColor: const Color(0xFF7A48FF),
    cardColor: const Color(0xFF101010),
    scaffoldBackgroundColor: const Color(0xFF13101B), // Background color
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF7A48FF),
      secondary: Colors.black45,
    ),
    textTheme: const TextTheme(
      bodyLarge:
          TextStyle(fontFamily: 'Manrope', fontSize: 16, color: Colors.white),
      bodyMedium:
          TextStyle(fontFamily: 'Manrope', fontSize: 14, color: Colors.white),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF13101B),
      titleTextStyle: TextStyle(
        fontFamily: 'Manrope',
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

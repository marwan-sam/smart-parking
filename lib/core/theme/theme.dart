import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Colors.white,
    primary: Colors.grey.shade300,
    secondary: Colors.black,
  ),
  switchTheme: SwitchThemeData(
    trackOutlineColor: WidgetStateProperty.resolveWith(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return null;
        }
        return const Color.fromARGB(255, 214, 214, 214);
      },
    ),
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: Colors.grey.shade900, // == background (before ver >=3.4.0 <4.0.0)
    primary: Colors.grey.shade800,
    secondary: Colors.white,
  ),
  switchTheme: SwitchThemeData(
    trackOutlineColor: WidgetStateProperty.resolveWith(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return null;
        }
        return const Color.fromARGB(255, 214, 214, 214);
      },
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
      // Customize text style for label and hint in dark mode
      hintStyle: TextStyle(color: Colors.black),
      floatingLabelStyle: TextStyle(color: Colors.black)),
);

// import 'package:flutter/material.dart';
// import 'package:smart_parking/core/helper/shared_pref_helper.dart';
// //import 'package:shared_preferences/shared_preferences.dart';
// import 'package:smart_parking/core/theme/theme.dart';

// class ThemeProvider with ChangeNotifier {
//   late ThemeData _themeData = lightMode; // Initialize with a default theme
//   static const String _themeModeKey = 'themeMode';

//   ThemeProvider() {
//     _loadThemeMode();
//   }

//   ThemeData get themeData => _themeData;

//   Future<void> _loadThemeMode() async {
//     //final SharedPreferences prefs = await SharedPreferences.getInstance();
//     final bool isDarkMode = await SharedPrefHelper.getBool(_themeModeKey);
//     _themeData = isDarkMode ? darkMode : lightMode;
//     notifyListeners();
//   }

//   Future<void> _saveThemeMode(bool isDarkMode) async {
//     //final SharedPreferences prefs = await SharedPreferences.getInstance();
//     SharedPrefHelper.setData(_themeModeKey, isDarkMode);
//   }

//   void toggleTheme() {
//     if (_themeData == lightMode) {
//       _themeData = darkMode;
//       _saveThemeMode(true);
//     } else {
//       _themeData = lightMode;
//       _saveThemeMode(false);
//     }
//     notifyListeners();
//   }
// }
import 'package:flutter/material.dart';
import 'package:smart_parking/core/helper/shared_pref_helper.dart';
import 'package:smart_parking/core/theme/theme.dart';

class ThemeProvider with ChangeNotifier {
  late ThemeData _themeData = lightMode; // Initialize with a default theme
  static const String _themeModeKey = 'themeMode';

  ThemeProvider() {
    _loadThemeMode();
  }

  ThemeData get themeData => _themeData;

  Future<void> _loadThemeMode() async {
    final bool isDarkMode = await SharedPrefHelper.getBool(_themeModeKey);
    _themeData = isDarkMode ? darkMode : lightMode;
    notifyListeners();
  }

  Future<void> _saveThemeMode(bool isDarkMode) async {
    SharedPrefHelper.setData(_themeModeKey, isDarkMode);
  }

  void toggleTheme() {
    if (_themeData == lightMode) {
      _themeData = darkMode;
      _saveThemeMode(true);
    } else {
      _themeData = lightMode;
      _saveThemeMode(false);
    }
    notifyListeners();
  }
}

import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static SharedPref instance = SharedPref._();

  SharedPref._();

  factory SharedPref() => instance;

  final String isDarkKey = "IsDark";

  static SharedPreferences? _prefs;

  init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  setIsDarkMode(bool isDarkMode) async {
    await _prefs?.setBool(isDarkKey, isDarkMode);
  }


  bool isDarkMode() {
    return _prefs?.getBool(isDarkKey) ?? true;
  }

}

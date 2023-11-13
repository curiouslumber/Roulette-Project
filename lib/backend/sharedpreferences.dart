import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static const String keyLoggedIn = 'isLoggedIn';
  static const String _keyUsername = 'username';
  static const String _keyEmail = 'email';
  static const String _keyPassword = 'password';

  static Future<void> saveUserLoginInfo(
      String username, String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(keyLoggedIn, true);
    prefs.setString(_keyUsername, username);
    prefs.setString(_keyEmail, email);
    prefs.setString(_keyPassword, password);
  }

  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(keyLoggedIn) ?? false;
  }

  static Future<String?> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyUsername);
  }

  static Future<String?> getEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyEmail);
  }

  static Future<String?> getPassword() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyPassword);
  }

  static Future<void> logoutUser() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(keyLoggedIn, false);
    prefs.remove(_keyUsername);
    prefs.remove(_keyEmail);
  }
}

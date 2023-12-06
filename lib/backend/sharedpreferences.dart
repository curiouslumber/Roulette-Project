import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static const String keyLoggedIn = 'isLoggedIn';
  static const String _keyUserId = 'userId';
  static const String _keyUsername = 'username';
  static const String _keyEmail = 'email';
  static const String _keyPassword = 'password';
  static const String _demoBalance = 'demoBalance';
  static const String playingAsGuest = 'playingAsGuest';
  static const String initialized = 'initialized';
  static const String _numberOfDemoGamesPlayed = 'numberOfDemoGamesPlayed';
  static const String _numberOfDemoGamesWon = 'numberOfDemoGamesWon';
  static const String _numberOfDemoGamesLost = 'numberOfDemoGamesLost';
  static const String _totalAmountWonInDemoGames = 'totalAmountWonInDemoGames';
  static const String _totalAmountLostInDemoGames =
      'totalAmountLostInDemoGames';

  static Future<void> saveUserLoginInfo(
      String userId, String username, String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(keyLoggedIn, true);
    prefs.setString(_keyUserId, userId);
    prefs.setString(_keyUsername, username);
    prefs.setString(_keyEmail, email);
    prefs.setString(_keyPassword, password);
  }

  static Future<void> initializeValues() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(keyLoggedIn, false);
    prefs.setString(_keyUsername, '');
    prefs.setString(_keyEmail, '');
    prefs.setString(_keyPassword, '');
    prefs.setBool(playingAsGuest, false);
    prefs.setBool(initialized, true);
    prefs.setInt(_numberOfDemoGamesPlayed, 0);
    prefs.setInt(_numberOfDemoGamesWon, 0);
    prefs.setInt(_numberOfDemoGamesLost, 0);
    prefs.setInt(_totalAmountWonInDemoGames, 0);
    prefs.setInt(_totalAmountLostInDemoGames, 0);
  }

  static Future<bool> isInitialized() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(initialized) ?? false;
  }

  static Future<void> playingAsGuestUser() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(playingAsGuest, true);
  }

  static Future<void> notPlayingAsGuestUser() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(playingAsGuest, false);
  }

  static Future<bool> isPlayingAsGuest() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(playingAsGuest) ?? false;
  }

  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(keyLoggedIn) ?? false;
  }

  static Future<String?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyUserId);
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

  static Future<void> setDemoBalance(int balance) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(_demoBalance, balance);
  }

  static Future<int?> getDemoBalance() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_demoBalance);
  }

  static Future<void> setNumberOfDemoGamesPlayed(int number) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(_numberOfDemoGamesPlayed, number);
  }

  static Future<int?> getNumberOfDemoGamesPlayed() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_numberOfDemoGamesPlayed);
  }

  static Future<void> setNumberOfDemoGamesWon(int number) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(_numberOfDemoGamesWon, number);
  }

  static Future<int?> getNumberOfDemoGamesWon() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_numberOfDemoGamesWon);
  }

  static Future<void> setNumberOfDemoGamesLost(int number) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(_numberOfDemoGamesLost, number);
  }

  static Future<int?> getNumberOfDemoGamesLost() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_numberOfDemoGamesLost);
  }

  static Future<void> setTotalAmountWonInDemoGames(int number) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(_totalAmountWonInDemoGames, number);
  }

  static Future<int?> getTotalAmountWonInDemoGames() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_totalAmountWonInDemoGames);
  }

  static Future<void> setTotalAmountLostInDemoGames(int number) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(_totalAmountLostInDemoGames, number);
  }

  static Future<int?> getTotalAmountLostInDemoGames() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_totalAmountLostInDemoGames);
  }

  static Future<void> logoutUser() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(keyLoggedIn, false);
    prefs.remove(_keyUsername);
    prefs.remove(_keyEmail);
    prefs.remove(_keyPassword);
    prefs.remove(_keyUserId);
  }
}

import 'package:get/get.dart';
import 'package:roulette_project/backend/sharedpreferences.dart';
import 'package:roulette_project/backend/user_data.dart';

class LoginHandler {
  UserData userData = Get.put(UserData());

  // Example usage in your login screen
  void loginUser(String username, String email, String password) {
    // Assume successful login
    // Save user login information
    SharedPreferencesManager.saveUserLoginInfo(username, email, password);
    // Navigate to the home screen or perform other actions
  }

// Example usage in your home screen or main application logic
  Future<bool> checkUserLoginStatus() async {
    bool isLoggedIn = await SharedPreferencesManager.isLoggedIn();

    if (isLoggedIn) {
      String? username = await SharedPreferencesManager.getUsername();
      String? email = await SharedPreferencesManager.getEmail();
      String? password = await SharedPreferencesManager.getPassword();
      print('User $username is logged in.');
      print('User $email is logged in.');
      print('User $password is logged in.');
      userData.user_name.value = username!;
      userData.user_email.value = email!;
      userData.user_password.value = password!;
      return true;
      // Navigate to the home screen or perform other actions
    } else {
      print('User is not logged in.');
      return false;
      // Navigate to the login screen or perform other actions
    }
  }

  void logout() async {
    await SharedPreferencesManager.logoutUser();
    // Navigate to the login screen or perform other actions
  }
}

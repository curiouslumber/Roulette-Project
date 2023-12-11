import 'package:get/get.dart';
import 'package:roulette_project/backend/sharedpreferences.dart';
import 'package:roulette_project/backend/userdatacontroller.dart';

class LoginHandler {
  UserData userData = Get.put(UserData());

  void loginUser(
      String userId, String username, String email, String password) {
    SharedPreferencesManager.saveUserLoginInfo(
        userId, username, email, password);
  }

  Future<bool> checkUserLoginStatus() async {
    bool isLoggedIn = await SharedPreferencesManager.isLoggedIn();

    if (isLoggedIn) {
      String? userId = await SharedPreferencesManager.getUserId();
      String? username = await SharedPreferencesManager.getUsername();
      String? email = await SharedPreferencesManager.getEmail();
      String? password = await SharedPreferencesManager.getPassword();

      userData.user_id.value = userId!;
      userData.user_name.value = username!;
      userData.user_email.value = email!;
      userData.user_password.value = password!;

      return true;
      // Navigate to the home screen or perform other actions
    } else {
      // ignore: avoid_print
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

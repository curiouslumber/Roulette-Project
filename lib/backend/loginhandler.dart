import 'package:get/get.dart';
import 'package:roulette_project/backend/requests.dart';
import 'package:roulette_project/backend/sharedpreferences.dart';
import 'package:roulette_project/backend/user_data.dart';

class LoginHandler {
  UserData userData = Get.put(UserData());

  void loginUser(String username, String email, String password) {
    SharedPreferencesManager.saveUserLoginInfo(username, email, password);
  }

  Future<bool> checkUserLoginStatus() async {
    bool isLoggedIn = await SharedPreferencesManager.isLoggedIn();

    if (isLoggedIn) {
      String? username = await SharedPreferencesManager.getUsername();
      String? email = await SharedPreferencesManager.getEmail();
      String? password = await SharedPreferencesManager.getPassword();

      userData.user_name.value = username!;
      userData.user_email.value = email!;
      userData.user_password.value = password!;

      var res = await BackendRequests().checkPassword(email);

      userData.user_id.value = res!['user_id'].toString();
      DateTime now = DateTime.now();
      var date = now.toString().split(' ')[0];
      var time = now.toString().split(' ')[1];
      time = time[0] +
          time[1] +
          time[2] +
          time[3] +
          time[4] +
          time[5] +
          time[6] +
          time[7];

      if (userData.active_user.value == false) {
        BackendRequests().makeUserActive(userData.user_id.value, date, time);
        userData.active_user.value = true;
      }

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

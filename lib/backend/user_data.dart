// ignore_for_file: non_constant_identifier_names

import 'dart:io';
import 'package:get/get.dart';

class UserData extends GetxController {
  var user_id = "".obs;
  var user_email = "".obs;
  var user_name = "".obs;
  var user_password = "".obs;
  var active_user = false.obs;

  var current_balance = 0.obs;
  var current_demo_balance = 0.obs;
  var number_of_games_played = 0.obs;
  var number_of_games_won = 0.obs;
  var number_of_games_lost = 0.obs;
  var total_amount_won = 0.obs;
  var total_amount_lost = 0.obs;
  var number_of_demo_games_played = 0.obs;
  var number_of_demo_games_won = 0.obs;
  var number_of_demo_games_lost = 0.obs;
  var total_amount_won_in_demo_games = 0.obs;
  var total_amount_lost_in_demo_games = 0.obs;

  Future<bool> checkUserConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
    return false;
  }
}

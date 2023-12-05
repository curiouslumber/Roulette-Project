import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:roulette_project/admin/admincontroller.dart';
import 'package:roulette_project/backend/private.dart';

class AdminRequests {
  final String baseUrl = Private().baseUrl;
  final AdminController adminController = Get.find();

  // Get number of games played
  Future<void> getNumberOfGamesPlayed() async {
    final String url = "$baseUrl/games";
    final Map<String, String> headers = {
      "Content-type": "application/json",
    };
    final http.Response response =
        await http.get(Uri.parse(url), headers: headers);
    final responseData = jsonDecode(response.body);

    adminController.calculateNumberOfGames(responseData);

    return;
  }
}

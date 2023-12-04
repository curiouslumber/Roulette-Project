import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:roulette_project/backend/private.dart';
import 'package:roulette_project/backend/userdatacontroller.dart';

class BackendRequests {
  final String baseUrl = Private().baseUrl;
  final UserData userData = Get.put(UserData());

  Future<void> getUser(String email) async {
    final response = await http.get(Uri.parse('$baseUrl/users/email/$email'));
    if (response.statusCode == 200) {
      // Handle successful response
      print(response.body);
    } else {
      // Handle error response
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  Future<bool> insertUsers(String name, String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/users'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'name': name,
          'email': email,
          'password': password,
          'role': 'user'
        }),
      );
      if (response.statusCode == 200) {
        // Handle successful response
        print(response.body);
        return true;
      } else {
        // Handle error response
        print('Request failed with status: ${response.statusCode}.');
        return false;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  Future<Map<String, dynamic>?> checkPassword(String email) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/users/email/$email'));
      if (response.statusCode == 200) {
        // Handle successful response
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        return responseData;
      } else {
        // Handle error response
        print('Request failed with status: ${response.statusCode}.');
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  Future<Map<String, dynamic>?> checkUserActive(String userId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/users/active/$userId'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        // Handle successful response
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        return responseData;
      } else {
        // Handle error response
        print('Request failed with status: ${response.statusCode}.');
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  Future<bool> makeUserActive(
      String userId, String lastActiveDate, String lastActiveTime) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/users/active'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'user_id': userId,
          'last_active_date': lastActiveDate,
          'last_active_time': lastActiveTime,
        }),
      );
      if (response.statusCode == 201) {
        // Handle successful response
        print(response.body);
        return true;
      } else {
        print("object");
        // Handle error response
        print('Request failed with status: ${response.statusCode}.');
        return false;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  // Update Active User
  Future<bool> updateActiveUser(
      String userId, String lastActiveDate, String lastActiveTime) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/users/active/$userId'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'last_active_date': lastActiveDate,
          'last_active_time': lastActiveTime,
        }),
      );
      if (response.statusCode == 204) {
        // Handle successful response
        print(response.body);
        return true;
      } else {
        // Handle error response
        print('Request failed with status: ${response.statusCode}.');
        return false;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  // Delete Active User before logout
  Future<bool> deleteActiveUser(String userId) async {
    try {
      final response = await http.delete(
        Uri.parse('$baseUrl/users/active/$userId'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 204) {
        // Handle successful response
        print(response.body);
        return true;
      } else {
        // Handle error response
        print('Request failed with status: ${response.statusCode}.');
        return false;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  Future<bool> createUserDashboard(String userId) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/users/dashboard'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'user_id': userId,
        }),
      );
      if (response.statusCode == 201) {
        // Handle successful response
        print(response.body);
        return true;
      } else {
        // Handle error response
        print('Request failed with status: ${response.statusCode}.');
        return false;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  Future<void> getUserDashboard(String id) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/users/dashboard/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        // Handle successful response
        final Map<String, dynamic> responseData = jsonDecode(response.body);

        userData.deposit_amount.value = responseData['deposit_amount'];
        userData.current_balance.value = responseData['current_balance'];
        userData.number_of_games_played.value =
            responseData['number_of_games_played']; // number_of_games_played
        userData.number_of_games_won.value =
            responseData['number_of_wins']; // number_of_games_won
        userData.number_of_games_lost.value =
            responseData['number_of_lossess']; // number_of_games_lost
        userData.total_amount_won.value = responseData['total_amount_won'];
        userData.total_amount_lost.value = responseData['total_amount_lost'];
      } else {
        // Handle error response
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  // Add balance to User Dashboard
  Future<bool> addBalanceToUserDashboard(
      String userId, String depositAmount, String newUserBalance) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/users/dashboard/deposit/$userId'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'deposit_amount': depositAmount,
          'current_balance': newUserBalance,
        }),
      );
      if (response.statusCode == 204) {
        // Handle successful response
        print(response.body);
        userData.deposit_amount.value = int.parse(depositAmount);
        return true;
      } else {
        // Handle error response
        print('Request failed with status: ${response.statusCode}.');
        return false;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  // Start new game
  Future<bool> startGame(String userId, String moveNum, String gameStatus,
      String last_bet_amount, String last_bet_won_lost) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/users/$userId/game'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'user_id': userId,
          'move_num': moveNum,
          'game_status': gameStatus,
          'last_bet_amount': last_bet_amount,
          'last_bet_won_lost': last_bet_won_lost,
        }),
      );
      if (response.statusCode == 201) {
        // Handle successful response
        print(response.body);
        return true;
      } else {
        // Handle error response
        print('Request failed with status: ${response.statusCode}.');
        return false;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  // Get game of user
  Future<Map<String, dynamic>?> getGameOfUser(String userId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/users/$userId/game'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        // Handle successful response
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        return responseData;
      } else {
        // Handle error response
        print('Request failed with status: ${response.statusCode}.');
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}

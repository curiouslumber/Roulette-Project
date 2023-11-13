import 'dart:convert';
import 'package:http/http.dart' as http;

class BackendRequests {
  Future<void> getUser(String email) async {
    final response = await http
        .get(Uri.parse('http://192.168.1.35:3000/users/email/$email'));
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
        Uri.parse('http://192.168.1.35:3000/users'),
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
      final response = await http
          .get(Uri.parse('http://192.168.1.35:3000/users/email/$email'));
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
        Uri.parse('http://192.168.1.35:3000/users/active'),
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

  // Delete Active User before logout
  Future<bool> deleteActiveUser(String userId) async {
    try {
      final response = await http.delete(
        Uri.parse('http://192.168.1.35:3000/users/active/$userId'),
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
        Uri.parse('http://192.168.1.35:3000/users/dashboard'),
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
}

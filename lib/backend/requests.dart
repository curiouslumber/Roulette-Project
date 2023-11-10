import 'dart:convert';
import 'package:http/http.dart' as http;

class BackendRequests {
  Future<void> getUsers() async {
    final response =
        await http.get(Uri.parse('http://192.168.1.35:3000/users'));
    if (response.statusCode == 200) {
      // Handle successful response
      print(response.body);
    } else {
      // Handle error response
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  Future<bool> insertUsers(String name, String email, String password) async {
    final response = await http.post(
      Uri.parse('http://192.168.1.35:3000/users'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'email': email,
        'password': password,
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
  }

  Future<Map<String, dynamic>?> checkPassword(String email) async {
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
  }
}

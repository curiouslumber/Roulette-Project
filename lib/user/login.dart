import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:roulette_project/backend/requests.dart';
import 'package:roulette_project/user/signup.dart';

import '../home.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.green[900],
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(25),
        decoration:
            BoxDecoration(border: Border.all(color: Colors.white, width: 1)),
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'User login',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                width: 450,
                child: TextFormField(
                  style: const TextStyle(color: Colors.white),
                  controller: email,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    hintStyle: TextStyle(color: Colors.white),
                    hintText: 'User email',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                width: 450,
                child: TextFormField(
                  style: const TextStyle(color: Colors.white),
                  controller: password,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    hintStyle: TextStyle(color: Colors.white),
                    hintText: 'Password',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(
                        255, 255, 255, 255), //background color of button
                    //border width and color
                    elevation: 3, //elevation of button
                    shape: RoundedRectangleBorder(
                        //to set border radius to button
                        borderRadius: BorderRadius.circular(30)),
                    padding:
                        const EdgeInsets.all(20) //content padding inside button
                    ),
                onPressed: () async {
                  BackendRequests backendRequests = BackendRequests();
                  var res = await backendRequests.checkPassword(email.text);

                  if (res != null) {
                    print(res['password']);
                    var bytes = utf8.encode(password.text);
                    var digest = sha256.convert(bytes);
                    var val = digest.toString();
                    if (val.compareTo(res['password']) == 0) {
                      // ignore: use_build_context_synchronously
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Home()),
                      );
                    } else {
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Password doesn't match"),
                        ),
                      );
                    }
                  } else {
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("User doesn't exist"),
                      ),
                    );
                  }
                },
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 50),
            Container(
              padding: const EdgeInsets.only(top: 10),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text(
                  'Don\'t have an account ?',
                  style: TextStyle(
                      fontSize: 14, color: Color.fromARGB(255, 255, 255, 255)),
                ),
                const SizedBox(width: 10),
                InkWell(
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUp()),
                    );
                  },
                )
              ]),
            )
          ]),
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:roulette_project/backend/requests.dart';
import 'package:roulette_project/user/login.dart';
import 'package:crypto/crypto.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

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
                'Create your account',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                width: 450,
                child: TextFormField(
                  style: const TextStyle(color: Colors.white),
                  controller: name,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    hintStyle: TextStyle(color: Colors.white),
                    hintText: 'Enter Name',
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
                  controller: email,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    hintStyle: TextStyle(color: Colors.white),
                    hintText: 'Enter Email',
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
                  obscureText: true,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    hintStyle: TextStyle(color: Colors.white),
                    hintText: 'Enter Password',
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
                  var bytes = utf8.encode(password.text);
                  var digest = sha256.convert(bytes);
                  BackendRequests backendRequests = BackendRequests();
                  var completed = await backendRequests.insertUsers(
                      name.text, email.text, digest.toString());

                  if (completed) {
                    var res = await backendRequests.checkPassword(email.text);
                    await backendRequests
                        .createUserDashboard(res!['user_id'].toString());

                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Sign Up Successful! Please Log In"),
                      ),
                    );
                    Get.to(() => Login());
                  } else {
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Sign Up not successful"),
                      ),
                    );
                  }
                },
                child: const Text(
                  'Sign Up',
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
                  'Already a user ?',
                  style: TextStyle(
                      fontSize: 14, color: Color.fromARGB(255, 255, 255, 255)),
                ),
                const SizedBox(width: 10),
                InkWell(
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  onTap: () {
                    Get.to(() => Login());
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

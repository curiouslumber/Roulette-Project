import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:roulette_project/backend/loginhandler.dart';
import 'package:roulette_project/backend/requests.dart';
import 'package:roulette_project/backend/sharedpreferences.dart';
import 'package:roulette_project/backend/userdatacontroller.dart';
import 'package:roulette_project/views/user/signup.dart';
import 'package:roulette_project/views/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final UserData userData = Get.put(UserData());
  bool visible = false;

  void changeVisibility() {
    setState(() {
      visible = !visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[900],
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(25),
        decoration:
            BoxDecoration(border: Border.all(color: Colors.white, width: 1)),
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                'Welcome to Casino Games!',
                style: TextStyle(color: Colors.white, fontSize: 16.sp),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'User login',
                style: TextStyle(color: Colors.white, fontSize: 14.sp),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                width: 450,
                child: TextFormField(
                  enableSuggestions: true,
                  keyboardType: TextInputType.emailAddress,
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
                  obscureText: visible ? false : true,
                  controller: password,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      splashColor: Colors.transparent,
                      icon: visible
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                      color: Colors.white,
                      onPressed: () {
                        changeVisibility();
                      },
                    ),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    hintStyle: const TextStyle(color: Colors.white),
                    hintText: 'Password',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            SizedBox(
              height: 50,
              width: 0.5.sw,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(
                        255, 255, 255, 255), //background color of button
                    //border width and color
                    elevation: 3, //elevation of button
                    shape: RoundedRectangleBorder(
                        //to set border radius to button
                        borderRadius: BorderRadius.circular(30)),
                    padding: const EdgeInsets.all(
                        12.0) //content padding inside button
                    ),
                onPressed: () async {
                  await userData.checkUserConnection();

                  if (userData.userConnection.value) {
                    // 1st step: check user credentials
                    // 2nd step: check if user is active on another device
                    // 3rd step: if not active, proceed to login
                    // 4th step: if active, show error message

                    if (email.text.isEmpty || password.text.isEmpty) {
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please fill all the fields"),
                        ),
                      );
                      return;
                    }
                    if ((email.text.isEmail && password.text.length >= 6) ==
                        false) {
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content:
                              Text("Please enter valid email and password"),
                        ),
                      );
                      return;
                    }

                    var data =
                        await BackendRequests().checkPassword(email.text);
                    if (data != null) {
                      var bytes = utf8.encode(password.text);
                      var digest = sha256.convert(bytes);
                      var val = digest.toString();
                      // print(val);
                      // print(data['password']);
                      if (val.compareTo(data['password']) == 0) {
                        //password matched
                        // print(data['user_id']);
                        var checkActive = await BackendRequests()
                            .checkUserActive(data['user_id'].toString());
                        if (checkActive == null) {
                          //User is not active on another device
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

                          var makeUserActive = await BackendRequests()
                              .makeUserActive(
                                  data['user_id'].toString(), date, time);

                          if (makeUserActive) {
                            print("object");
                            userData.user_id.value = data['user_id'].toString();
                            userData.user_name.value = data['name'];
                            userData.user_email.value = data['email'];
                            userData.playingAsGuest.value = false;
                            SharedPreferencesManager.notPlayingAsGuestUser();
                            LoginHandler().loginUser(data['user_id'].toString(),
                                data['name'], data['email'], data['password']);
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Signed In Successfully"),
                              ),
                            );
                            var loginCheck =
                                await LoginHandler().checkUserLoginStatus();
                            if (loginCheck) {
                              Get.offAll(() => const Home());
                              print('User is logged in.');
                            } else {
                              print('User is not logged in.');
                            }
                          } else {
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    "Something went wrong. Please try again"),
                              ),
                            );
                          }
                        } else if (checkActive['isActive'] != 0) {
                          //User is active on another device
                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("User playing on another device"),
                            ),
                          );
                        } else {
                          //User is not active on another device
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

                          var makeUserActive = await BackendRequests()
                              .makeUserActive(
                                  data['user_id'].toString(), date, time);

                          if (makeUserActive) {
                            print("object");
                            userData.user_id.value = data['user_id'].toString();
                            userData.user_name.value = data['name'];
                            userData.user_email.value = data['email'];
                            userData.playingAsGuest.value = false;
                            SharedPreferencesManager.notPlayingAsGuestUser();
                            LoginHandler().loginUser(data['user_id'].toString(),
                                data['name'], data['email'], data['password']);
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Signed In Successfully"),
                              ),
                            );
                            var loginCheck =
                                await LoginHandler().checkUserLoginStatus();
                            if (loginCheck) {
                              Get.offAll(() => const Home());
                              print('User is logged in.');
                            } else {
                              print('User is not logged in.');
                            }
                          } else {
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    "Something went wrong. Please try again"),
                              ),
                            );
                          }
                        }
                      } else {
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Incorrect Password. Please try again"),
                        ));
                      }
                    } else {
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("User not found"),
                        ),
                      );
                    }
                    return;
                  } else {
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("No internet connection"),
                      ),
                    );
                  }

                  return;
                },
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.black, fontSize: 16.sp),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don\'t have an account ?',
                          style: TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                        SizedBox(width: 2.w),
                        InkWell(
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                          onTap: () {
                            Get.to(() => const SignUp());
                          },
                        )
                      ]),
                ),
                userData.playingAsGuest.value == false
                    ? Container(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Don\'t want to login?',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 255, 255, 255)),
                              ),
                              SizedBox(width: 2.w),
                              InkWell(
                                  child: const Text(
                                    'Play as Guest',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255)),
                                  ),
                                  onTap: () async {
                                    bool check = await SharedPreferencesManager
                                        .isPlayingAsGuest();
                                    if (check) {
                                      // ignore: use_build_context_synchronously
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content:
                                              Text("Already playing as guest"),
                                        ),
                                      );
                                    } else {
                                      await SharedPreferencesManager
                                          .playingAsGuestUser();
                                      userData.playingAsGuest.value = true;
                                      Get.offAll(() => const Home());
                                    }
                                  })
                            ]),
                      )
                    : Container(),
                const SizedBox(height: 10),
              ],
            )
          ]),
        ),
      ),
    );
  }
}

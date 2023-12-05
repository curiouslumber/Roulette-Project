import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roulette_project/admin/admincontroller.dart';
import 'package:roulette_project/admin/adminrequests.dart';
import 'package:roulette_project/main.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  late AdminController adminController;
  @override
  void initState() {
    super.initState();
    adminController = Get.put(AdminController());
  }

  @override
  void dispose() {
    super.dispose();
    Get.delete();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AdminRequests().getNumberOfGamesPlayed(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            backgroundColor: Colors.green[900],
            drawer: Drawer(
              backgroundColor: Colors.green[900],
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.green[800],
                    ),
                    child: const Text(
                      'Admin Panel',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      'Switch to User Mode',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Get.offAll(() => const MyApp());
                    },
                  ),
                ],
              ),
            ),
            appBar: AppBar(
              backgroundColor: Colors.grey[900],
              title: const Text('Roulette - Admin Panel'),
              centerTitle: true,
              actions: [
                IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: () async {
                    Get.offAll(() => const AdminPage());
                  },
                )
              ],
            ),
            body: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(
                      () => Text(
                        'Number of games total played: ${adminController.numberOfGamesPlayed.value}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Number of games won: ',
                      style: TextStyle(color: Colors.white),
                    ),
                  ]),
            ),
          );
        } else {
          return Scaffold(
            backgroundColor: Colors.green[900],
            body: const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          );
        }
      },
    );
  }
}

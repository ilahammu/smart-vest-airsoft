import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/Auth_Controller.dart';

class ProfilePage extends StatelessWidget {
  final AuthController authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => authC.getProfile(),
              child: Text("Get Profile"),
            ),
            ElevatedButton(
              onPressed: () => authC.logout(),
              child: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}

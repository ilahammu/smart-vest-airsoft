import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vest_keren/app/routes/app_pages.dart';
import '../controllers/auth_controller.dart';

class LoginPage extends StatelessWidget {
  final AuthController authC = Get.find<AuthController>();
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Page")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
                controller: emailC,
                decoration: InputDecoration(labelText: "Email")),
            TextField(
                controller: passC,
                decoration: InputDecoration(labelText: "Password"),
                obscureText: true),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => authC.login(emailC.text, passC.text),
              child: Text("Login"),
            ),
            TextButton(
              onPressed: () => Get.toNamed(Routes.register),
              child: Text("Belum punya akun? Register"),
            ),
          ],
        ),
      ),
    );
  }
}

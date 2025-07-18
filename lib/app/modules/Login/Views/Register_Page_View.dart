import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/Auth_Controller.dart';

class RegisterPage extends StatelessWidget {
  final AuthController authC = Get.put(AuthController());
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register Page")),
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
              onPressed: () async {
                final success = await authC.register(emailC.text, passC.text);
                if (success) {
                  Get.defaultDialog(
                    title: "Success",
                    middleText: "Data Berhasil Ditambahkan",
                    textConfirm: "OK",
                    confirmTextColor: Colors.white,
                    onConfirm: () {
                      Get.back();
                      // fetchDataTable(currentPage); // Hapus atau sesuaikan jika tidak perlu
                    },
                  );
                } else {
                  Get.defaultDialog(
                    title: "Error",
                    middleText: "Register gagal, coba lagi.",
                    textConfirm: "OK",
                    confirmTextColor: Colors.white,
                    onConfirm: () => Get.back(),
                  );
                }
              },
              child: Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}

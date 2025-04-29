import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  final box = GetStorage();
  var isLoggedIn = false.obs;

  var devUser = {}.obs;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkLoginStatus();
    });
  }

  // **Cek Status Login**
  void checkLoginStatus() {
    // if (kDebugMode) {
    //   if (!isLoggedIn.value) {
    //     isLoggedIn.value = true;
    //     Future.microtask(() {
    //       if (Get.currentRoute != '/home') {
    //         Get.offAllNamed('/home');
    //       }
    //     });
    //   }
    //   return;
    // }

    String? token = box.read('token');
    print("Token: $token");
    if (token != null && token.isNotEmpty) {
      isLoggedIn.value = true;
    } else {
      isLoggedIn.value = false;
    }
  }

  // **Login**
  Future<void> login(String email, String password) async {
    final url = Uri.parse('http://localhost:3001/api/auth/login');
    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email, "password": password}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        String token = data['token'];

        // Simpan token ke GetStorage
        box.write('token', token);
        isLoggedIn.value = true;

        print("Token setelah login: $token"); // Debugging

        // Arahkan ke Home setelah login sukses
        Future.delayed(Duration.zero, () => Get.offAllNamed('/home'));
      } else {
        Get.snackbar("Error", "Login gagal!");
      }
    } catch (e) {
      Get.snackbar("Error", "Server error!");
    }
  }

  // **Register**
  Future<void> register(String email, String password) async {
    final url = Uri.parse('http://localhost:3001/api/auth/register');
    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email, "password": password}),
      );

      if (response.statusCode == 201) {
        Get.snackbar("Success", "User registered!");
      } else {
        Get.snackbar("Error", "Registration failed!");
      }
    } catch (e) {
      Get.snackbar("Error", "Server error!");
    }
  }

  // **Ambil Profil**
  Future<void> getProfile() async {
    final url = Uri.parse('http://localhost:3001/api/auth/profile');
    try {
      String? token = box.read('token');

      final response = await http.get(
        url,
        headers: {
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(data);
      } else {
        Get.snackbar("Error", "Unauthorized");
      }
    } catch (e) {
      Get.snackbar("Error", "Server error!");
    }
  }

  // **Logout**
  void logout() {
    box.remove('token'); // Hapus token
    isLoggedIn.value = false;
    Future.delayed(Duration.zero, () => Get.offAllNamed('/login'));
  }
}

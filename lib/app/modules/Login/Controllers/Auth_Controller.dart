import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  final box = GetStorage();
  var isLoggedIn = false.obs;

  var devUser = {}.obs;

  static const String _baseUrl = String.fromEnvironment('BASE_URL');
  static const String _loginEndpoint = String.fromEnvironment('LOGIN');
  static const String _registerEndpoint = String.fromEnvironment('REGISTER');
  static const String _profileEndpoint = String.fromEnvironment('PROFILE');

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkLoginStatus();
    });
  }

  void checkLoginStatus() {
    String? token = box.read('token');
    if (token != null && token.isNotEmpty) {
      isLoggedIn.value = true;
    } else {
      isLoggedIn.value = false;
    }
  }

  Future<void> login(String email, String password) async {
    final url = Uri.parse('$_baseUrl$_loginEndpoint');
    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email, "password": password}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        String token = data['token'];
        box.write('token', token);
        isLoggedIn.value = true;
        // Tampilkan pop up sukses selama 3 detik
        Get.defaultDialog(
          title: "Login Berhasil",
          middleText: "Selamat datang!",
          barrierDismissible: false,
        );
        await Future.delayed(const Duration(seconds: 3));
        Get.back(); // Tutup dialog
        Get.offAllNamed('/monitoring');
      } else {
        // Tampilkan pop up gagal login
        Get.defaultDialog(
          title: "Login Gagal",
          middleText: "Email atau password salah.",
          textConfirm: "OK",
          confirmTextColor: Colors.white,
          onConfirm: () => Get.back(),
        );
      }
    } catch (e) {
      Get.defaultDialog(
        title: "Error",
        middleText: "Terjadi kesalahan koneksi.",
        textConfirm: "OK",
        confirmTextColor: Colors.white,
        onConfirm: () => Get.back(),
      );
    }
  }

  Future<bool> register(String email, String password) async {
    final url = Uri.parse('$_baseUrl$_registerEndpoint');
    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email, "password": password}),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      }
    } catch (e) {}
    return false;
  }

  Future<void> getProfile() async {
    final url = Uri.parse('$_baseUrl$_profileEndpoint');
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
      }
    } catch (e) {}
  }

  void logout() {
    box.remove('token');
    isLoggedIn.value = false;
    Future.delayed(Duration.zero, () => Get.offAllNamed('/login'));
  }
}

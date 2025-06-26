import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  final box = GetStorage();
  var isLoggedIn = false.obs;
  var devUser = {}.obs;

  static const String _baseUrl = "https://api-vest.stas-rg.com";
  static const String _loginEndpoint = "/api/auth/login";
  static const String _registerEndpoint = "/api/auth/regis";
  static const String _profileEndpoint = "/api/auth/profile";

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkLoginStatus();
    });
  }

  void checkLoginStatus() {
    String? token = box.read('token');
    isLoggedIn.value = token != null && token.isNotEmpty;
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

        if (data != null && data['token'] != null) {
          String token = data['token'];
          box.write('token', token);
          isLoggedIn.value = true;

          Get.defaultDialog(
            title: "Login Berhasil",
            middleText: "Selamat datang!",
            barrierDismissible: false,
          );
          await Future.delayed(const Duration(seconds: 2));
          Get.back();
          Get.offAllNamed('/monitoring');
        } else {
          Get.defaultDialog(
            title: "Login Gagal",
            middleText:
                "Respons dari server tidak valid.", // Pesan error lebih spesifik
            textConfirm: "OK",
            confirmTextColor: Colors.white,
            onConfirm: () => Get.back(),
          );
        }
      } else {
        Get.defaultDialog(
          title: "Login Gagal",
          middleText: "Email atau password salah.",
          textConfirm: "OK",
          confirmTextColor: Colors.white,
          onConfirm: () => Get.back(),
        );
      }
    } catch (e, stackTrace) {
      print('Error: $e');
      print('StackTrace: $stackTrace');
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
      print('Register status: ${response.statusCode}');
      print('Register body: ${response.body}');
      return response.statusCode == 200 || response.statusCode == 201;
    } catch (e) {
      print('Error during registration: $e');
      return false;
    }
  }

  Future<void> getProfile() async {
    final url = Uri.parse('$_baseUrl$_profileEndpoint');
    try {
      String? token = box.read('token');
      final response = await GetConnect().get(
        url.toString(),
        headers: {
          "Authorization": "Bearer $token",
        },
      );
      if (response.statusCode == 200) {
        final data = response.body;
        print(data);
      }
    } catch (e) {
      print('Error fetching profile: $e');
      Get.defaultDialog(
        title: "Error",
        middleText: "Terjadi kesalahan saat mengambil profil.",
        textConfirm: "OK",
        confirmTextColor: Colors.white,
        onConfirm: () => Get.back(),
      );
    }
  }

  void logout() {
    box.remove('token');
    isLoggedIn.value = false;
    Future.delayed(Duration.zero, () => Get.offAllNamed('/login'));
  }
}

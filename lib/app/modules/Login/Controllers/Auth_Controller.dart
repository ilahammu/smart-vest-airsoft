import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AuthController extends GetxController {
  final box = GetStorage();
  var isLoggedIn = false.obs;

  var devUser = {}.obs;

  late String _baseUrl;
  late String _loginEndpoint;
  late String _registerEndpoint;
  late String _profileEndpoint;

  @override
  void onInit() {
    super.onInit();
    _baseUrl = dotenv.env['BASE_URL']!;
    _loginEndpoint = dotenv.env['LOGIN']!;
    _registerEndpoint = dotenv.env['REGISTER']!;
    _profileEndpoint = dotenv.env['PROFILE']!;
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
        Future.delayed(Duration.zero, () => Get.offAllNamed('/monitoring'));
      }
    } catch (e) {}
  }

  Future<void> register(String email, String password) async {
    final url = Uri.parse('$_baseUrl$_registerEndpoint');
    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email, "password": password}),
      );
    } catch (e) {}
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

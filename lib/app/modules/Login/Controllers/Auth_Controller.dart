import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  final box = GetStorage();
  var isLoggedIn = false.obs;

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus(); // Cek apakah user sudah login saat aplikasi dimulai
  }

  // **Cek Status Login**
  void checkLoginStatus() {
    String? token = box.read('token');
    if (token != null && token.isNotEmpty) {
      isLoggedIn.value = true;
      Get.offAllNamed('/profile'); // Langsung ke profile jika token ada
    } else {
      isLoggedIn.value = false;
      Get.offAllNamed('/login'); // Jika tidak ada token, kembali ke login
    }
  }

  // **Ambil Profil**
  Future<void> getProfile() async {
    final url = Uri.parse('http://localhost:3000/api/auth/profile');
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

  // **Register**
  Future<void> register(String email, String password) async {
    final url = Uri.parse('http://localhost:3000/api/auth/register');
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

  // **Login**
  Future<void> login(String email, String password) async {
    final url = Uri.parse('http://localhost:3000/api/auth/login');
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
        Get.offAllNamed('/profile'); // Arahkan ke halaman profile setelah login
      } else {
        Get.snackbar("Error", "Login gagal!");
      }
    } catch (e) {
      Get.snackbar("Error", "Server error!");
    }
  }

  // **Logout**
  void logout() {
    box.remove('token'); // Hapus token
    isLoggedIn.value = false;
    Get.offAllNamed('/login'); // Kembali ke halaman login
  }
}

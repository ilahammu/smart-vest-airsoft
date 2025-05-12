import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TambahorangController extends GetxController {
  final isLoading = false.obs;

  final Rx<String?> IdChoice = Rx<String?>(null);

  final RxList<String> players = <String>[].obs;

  final List<String> teamsDropdown = [
    "Team A",
    "Team B",
  ];

  @override
  void onInit() {
    super.onInit();
    fetchMacAddresses();
  }

  // Fetch MAC addresses that are not used
  void fetchMacAddresses() async {
    try {
      final response = await http.get(Uri.parse(
          'http://localhost:3001/api/add/esp32')); // Ganti IP jika pakai device

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);

        // Pastikan format respons sesuai dan ada key `esp32s`
        if (jsonResponse['success'] == true &&
            jsonResponse.containsKey('esp32s')) {
          List<dynamic> data = jsonResponse['esp32s'];

          // Hapus duplikasi sebelum memperbarui daftar
          final uniquePlayers =
              data.map((item) => item['id'].toString()).toSet().toList();

          print("Unique Players: $uniquePlayers"); // Debugging log

          players.value = uniquePlayers;
        } else {
          Get.snackbar('Error', 'Invalid data format from server');
        }
      } else {
        Get.snackbar('Error', 'Failed to load MAC addresses: ${response.body}');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load MAC addresses: $e');
    }
  }

  // Add a new player and refresh the MAC address list
  Future<void> addPlayer(String name, String esp32Id, selectedTeam) async {
    isLoading.value = true;

    try {
      // Ekstrak angka dari esp32Id (contoh: "ID-001" -> 1)
      int? esp32IdNumber =
          int.tryParse(esp32Id.replaceAll(RegExp(r'[^0-9]'), ''));

      if (esp32IdNumber == null) {
        Get.snackbar('Error', 'Invalid ESP32 ID format');
        return;
      }

      final requestBody = {
        "name": name,
        "esp32Id": esp32IdNumber, // Kirim angka ke backend
        "selectedTeam": selectedTeam.value
            .replaceAll(" ", ""), // Hapus spasi agar cocok dengan ENUM
      };

      print("Request Body: $requestBody");

      final response = await http.post(
        Uri.parse('http://localhost:3001/api/add/player'),
        body: json.encode(requestBody),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      print("Response: ${response.body}");

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);

        if (jsonResponse['success'] == true) {
          Get.snackbar('Success', 'Player added successfully!');
          fetchMacAddresses(); // Refresh daftar MAC address

          // Pastikan nilai yang dipilih ada di daftar
          if (!players.contains(IdChoice.value)) {
            IdChoice.value = null; // Reset jika nilai tidak ada
          }
        } else {
          Get.snackbar(
              'Error', jsonResponse['message'] ?? 'Failed to add player');
        }
      } else {
        Get.snackbar('Error', 'Failed to add player: ${response.body}');
      }
    } catch (e) {
      Get.snackbar('Error', 'An unexpected error occurred: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deletePlayer(int playerId) async {
    try {
      final response = await http.delete(
        Uri.parse('http://localhost:3001/api/delete/player/$playerId'),
      );

      if (response.statusCode == 200) {
        Get.snackbar('Success', 'Player deleted successfully!');
        fetchMacAddresses(); // Refresh daftar MAC address
      } else {
        Get.snackbar('Error', 'Failed to delete player: ${response.body}');
      }
    } catch (e) {
      Get.snackbar('Error', 'An unexpected error occurred: $e');
    }
  }
}

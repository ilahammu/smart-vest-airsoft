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

  void fetchMacAddresses() async {
    try {
      final response = await http.get(Uri.parse(
          'http://localhost:3000/api/register/esp32')); // Ganti IP jika pakai device

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);

        // Pastikan format respons sesuai dan ada key `esp32s`
        if (jsonResponse['success'] == true &&
            jsonResponse.containsKey('esp32s')) {
          List<dynamic> data = jsonResponse['esp32s'];

          players.value = data.asMap().entries.map((entry) {
            int index = entry.key + 1; // Start from 1
            String formattedIndex =
                index.toString().padLeft(3, '0'); // Pad with leading zeros
            return 'ID-$formattedIndex'; // Tampilkan hanya ID
          }).toList();
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

  Future<void> addPlayer(String name, String esp32Id, selectedTeam) async {
    isLoading.value = true;

    try {
      int? esp32IdNumber =
          int.tryParse(esp32Id.replaceAll(RegExp(r'[^0-9]'), ''));

      if (esp32IdNumber == null) {
        Get.snackbar('Error', 'Invalid ESP32 ID format');
        return;
      }

      final requestBody = {
        "name": name,
        "esp32Id": esp32IdNumber,
        "selectedTeam": selectedTeam.value
            .replaceAll(" ", ""), // Hapus spasi agar cocok dengan ENUM
      };

      print("Request Body: $requestBody");

      final response = await GetConnect().post(
        'http://localhost:3000/api/register/register-player',
        requestBody,
      );

      print("Response: ${response.body}");

      if (response.status.hasError) {
        Get.snackbar('Error', 'Failed to add player: ${response.body}');
      } else {
        Get.snackbar('Success', 'Player added successfully!');
      }
    } catch (e) {
      Get.snackbar('Error', 'An unexpected error occurred: $e');
    } finally {
      isLoading.value = false;
    }
  }
}

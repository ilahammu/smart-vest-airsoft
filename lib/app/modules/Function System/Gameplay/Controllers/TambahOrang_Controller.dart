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

          // Update players list with MAC addresses
          players.value = data.map((item) {
            return item['macAddress'] as String; // Cast to String
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

  // Add a new player and refresh the MAC address list
  Future<void> addPlayer(String name, String esp32Id, selectedTeam) async {
    isLoading.value = true;

    try {
      final requestBody = {
        "name": name,
        "esp32Id": esp32Id,
        "selectedTeam": selectedTeam.value.replaceAll(" ", ""), // Hapus spasi
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
}

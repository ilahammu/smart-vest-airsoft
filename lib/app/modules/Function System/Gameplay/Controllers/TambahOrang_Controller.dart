import 'dart:async';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TambahorangController extends GetxController {
  Timer? timer;
  final isLoading = false.obs;

  final Rx<String?> IdChoice = Rx<String?>(null);

  final RxList<Map<String, String>> players = <Map<String, String>>[].obs;

  final List<String> teamsDropdown = [
    "Team A",
    "Team B",
  ];

  // Fetch MAC addresses that are not used
  void fetchMacAddresses() async {
    isLoading.value = true; // Tandai sedang loading
    try {
      final response = await http.get(
          Uri.parse('https://l7xgct6c-3001.asse.devtunnels.ms/api/add/esp32'));

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);

        if (jsonResponse['success'] == true &&
            jsonResponse.containsKey('esp32s')) {
          List<dynamic> data = jsonResponse['esp32s'];

          final uniquePlayers = data
              .map<Map<String, String>>((item) => {
                    'id': item['id'].toString(),
                    'mac_address': item['mac_address'] as String,
                  })
              .toList();

          print("Unique Players: $uniquePlayers"); // Debug log
          players.value = uniquePlayers;
        } else {
          Get.snackbar('Error', 'Invalid data format from server');
        }
      } else {
        Get.snackbar('Error', 'Failed to load MAC addresses: ${response.body}');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load MAC addresses: $e');
    } finally {
      isLoading.value = false; // Tandai selesai loading
    }
  }

  // Add a new player and refresh the MAC address list
  Future<void> addPlayer(
      String name, String selectedId, String selectedTeam) async {
    isLoading.value = true;

    try {
      // Cari mac_address berdasarkan ID yang dipilih
      final macAddress = players.firstWhere(
        (player) => player['id'] == selectedId,
      )['mac_address'];

      final requestBody = {
        "name": name,
        "mac_address": macAddress, // Kirim mac_address ke backend
        "selectedTeam": selectedTeam.replaceAll(" ", ""), // ENUM cocok backend
      };

      print("Request Body: $requestBody");

      final response = await http.post(
        Uri.parse('https://l7xgct6c-3001.asse.devtunnels.ms/api/add/player'),
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
          IdChoice.value = null;
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

  // void startAutoRefresh() {
  //   // Timer untuk memuat ulang data setiap 5 detik
  //   timer = Timer.periodic(const Duration(seconds: 5), (Timer t) {
  //     fetchMacAddresses(); // Panggil fungsi untuk memuat ulang data
  //     print("Data refreshed at ${DateTime.now()}"); // Log waktu refresh
  //   });
  // }

  // void stopAutoRefresh() {
  //   timer?.cancel();
  //   timer = null;
  // }

  @override
  void onInit() {
    super.onInit();
    fetchMacAddresses();
  }

  // @override
  // void onClose() {
  //   stopAutoRefresh();
  //   super.onClose();
  // }
}

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TambahorangController extends GetxController {
  final isLoading = false.obs;

  final Rx<String?> TeamChoice = Rx<String?>(null);
  final Rx<String?> IdChoice = Rx<String?>(null);

  final RxList<String> players = <String>[].obs;
  final List<String> Teams = [
    "Red ",
    "Blue ",
  ];

  @override
  void onInit() {
    super.onInit();
    fetchMacAddresses();
  }

  void fetchMacAddresses() async {
    try {
      final response = await http
          .get(Uri.parse('http://localhost:3000/api/esp32/mac-addresses'));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        players.value = data.asMap().entries.map((entry) {
          int index = entry.key + 1; // Start from 1
          String formattedIndex =
              index.toString().padLeft(3, '0'); // Pad with leading zeros
          return 'ID-$formattedIndex';
        }).toList();
      } else {
        Get.snackbar('Error', 'Failed to load MAC addresses');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load MAC addresses');
    }
  }

  Future<void> addPlayer(String name, int? esp32Id) async {
    isLoading.value = true;
    try {
      final response = await GetConnect().post(
        'http://localhost:3000/api/player', // Ganti dengan URL server Anda
        {
          "name": name,
          "esp32Id": esp32Id,
        },
      );
      if (response.status.hasError) {
        Get.snackbar('Error', 'Failed to add player: ${response.statusText}');
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

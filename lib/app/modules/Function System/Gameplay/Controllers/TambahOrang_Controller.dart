import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  static const String _baseUrl = String.fromEnvironment('BASE_URL');
  static const String _addEspEndpoint = String.fromEnvironment('ADD_ESP');
  static const String _addPlayerEndpoint = String.fromEnvironment('ADD_PLAYER');

  @override
  void onInit() {
    super.onInit();
    fetchMacAddresses();
  }

  void fetchMacAddresses() async {
    isLoading.value = true;
    try {
      final response = await GetConnect().get('$_baseUrl$_addEspEndpoint');

      if (response.statusCode == 200) {
        // Tidak perlu json.decode lagi!
        Map<String, dynamic> jsonResponse = response.body;

        if (jsonResponse['success'] == true &&
            jsonResponse.containsKey('esp32s')) {
          List<dynamic> data = jsonResponse['esp32s'];

          final uniquePlayers = data
              .map<Map<String, String>>((item) => {
                    'id': item['id'].toString(),
                    'mac_address': item['mac_address'] as String,
                  })
              .toList();

          players.value = uniquePlayers;
        }
      }
    } catch (e) {
      print("Error fetching MAC addresses: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addPlayer(
      String name, String selectedId, String selectedTeam) async {
    isLoading.value = true;

    try {
      final macAddress = players.firstWhere(
        (player) => player['id'] == selectedId,
      )['mac_address'];

      final requestBody = {
        "name": name,
        "mac_address": macAddress,
        "selectedTeam": selectedTeam.replaceAll(" ", ""),
      };

      final response = await GetConnect().post(
        '$_baseUrl$_addPlayerEndpoint',
        requestBody,
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse =
            response.body; // <-- perbaiki di sini

        if (jsonResponse['success'] == true) {
          fetchMacAddresses();
          IdChoice.value = null;
          Get.defaultDialog(
            title: "Success",
            middleText: "Player berhasil ditambahkan!",
            textConfirm: "OK",
            confirmTextColor: Colors.white,
            onConfirm: () => Get.back(),
          );
        }
      }
    } catch (e) {
      print("Error adding player: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void startAutoRefresh() {
    timer = Timer.periodic(const Duration(seconds: 5), (Timer t) {
      fetchMacAddresses();
    });
  }

  void stopAutoRefresh() {
    timer?.cancel();
    timer = null;
  }

  @override
  void onClose() {
    stopAutoRefresh();
    super.onClose();
  }
}

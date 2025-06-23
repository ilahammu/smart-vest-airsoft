import 'dart:async';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class TambahorangController extends GetxController {
  Timer? timer;
  final isLoading = false.obs;

  final Rx<String?> IdChoice = Rx<String?>(null);

  final RxList<Map<String, String>> players = <Map<String, String>>[].obs;

  final List<String> teamsDropdown = [
    "Team A",
    "Team B",
  ];

  late String _baseUrl;
  late String _addEspEndpoint;
  late String _addPlayerEndpoint;

  void fetchMacAddresses() async {
    isLoading.value = true;
    try {
      final response = await GetConnect().get(
        '$_baseUrl$_addEspEndpoint',
      );

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

          players.value = uniquePlayers;
        }
      }
    } catch (e) {
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
        Map<String, dynamic> jsonResponse = json.decode(response.body);

        if (jsonResponse['success'] == true) {
          fetchMacAddresses();
          IdChoice.value = null;
        }
      }
    } catch (e) {
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
  void onInit() {
    super.onInit();
    _baseUrl = dotenv.env['BASE_URL']!;
    _addEspEndpoint = dotenv.env['ADD_ESP']!;
    _addPlayerEndpoint = dotenv.env['ADD_PLAYER']!;
    fetchMacAddresses();
  }

  @override
  void onClose() {
    stopAutoRefresh();
    super.onClose();
  }
}

import 'dart:async';
import 'package:get/get.dart';
import '../../../data/TableGameplay.dart';

class GamestartController extends GetxController {
  Timer? timer;
  Timer? statusTimer;
  final GetConnect _http = GetConnect();

  final kolomData = ['NO', 'Nama Anggota', 'HP'].obs;
  final Map<String, String> kolomMap = {
    'NO': 'no',
    'Nama Anggota': 'name',
    'HP': 'health',
  };
  final RxList<DataTableGameplay> listDataTable = <DataTableGameplay>[].obs;
  var isStartEnabled = false.obs; // 🔥 State untuk tombol Start

  // 🔥 Ambil data pemain dan cek status game
  void fetchDataTable() async {
    try {
      final response =
          await _http.get('http://localhost:3001/api/update/players');

      if (response.statusCode == 200) {
        final data = response.body['players'] as List<dynamic>;
        print('Data received from API: $data');

        listDataTable.value = data.map((item) {
          try {
            return DataTableGameplay.fromJson(item);
          } catch (e) {
            print("Error parsing player data: $e");
            return DataTableGameplay(
                no: 0,
                name: "Unknown",
                health: 100,
                selectedTeam: "Unknown",
                macAddress: "Unknown",
                statusReady: false);
          }
        }).toList();

        checkGameStatus(); // 🔥 Cek apakah game bisa dimulai
        listDataTable.refresh();
      } else {
        print('Error fetching data: ${response.statusCode}');
      }
    } catch (e) {
      print("Exception occurred while fetching data: $e");
    }
  }

  // 🔥 Cek apakah kedua tim memiliki minimal satu pemain dan semua pemain siap
  void checkGameStatus() {
    final teamA =
        listDataTable.where((p) => p.selectedTeam == "TeamA").toList();
    final teamB =
        listDataTable.where((p) => p.selectedTeam == "TeamB").toList();

    // Check if all players in both teams are ready
    final allReady =
        teamA.every((p) => p.statusReady) && teamB.every((p) => p.statusReady);

    isStartEnabled.value = teamA.isNotEmpty && teamB.isNotEmpty && allReady;
    print("Start Button Enabled: ${isStartEnabled.value}");
  }

  // 🔥 Fungsi untuk memulai game
  void startGame() {
    if (isStartEnabled.value) {
      Get.snackbar("Success", "Game Started!");
      print("Game Started!");
    } else {
      Get.snackbar("Error",
          "Both teams must have at least one player and all players must be ready!");
      print(
          "Game cannot start, teams are incomplete or not all players are ready!");
    }
  }

  // 🔥 Update player status
  void updatePlayerStatus(String macAddress, bool isReady) async {
    try {
      final response = await _http.post(
        'http://localhost:3001/api/update/update-status',
        {'mac_address': macAddress, 'status_ready': isReady ? 1 : 0},
      );

      if (response.statusCode == 200) {
        fetchDataTable(); // Refresh data after updating status
      } else {
        print('Error updating status: ${response.statusCode}');
      }
    } catch (e) {
      print("Exception occurred while updating status: $e");
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchDataTable();
    // Set up a timer to call fetchDataTable every 5 seconds
    timer = Timer.periodic(Duration(seconds: 5), (Timer t) => fetchDataTable());
    // Set up a timer to call updatePlayerStatus every 5 seconds
    statusTimer = Timer.periodic(Duration(seconds: 5), (Timer t) {
      for (var player in listDataTable) {
        updatePlayerStatus(player.macAddress, player.statusReady);
      }
    });
  }

  @override
  void onClose() {
    // Cancel the timers when the controller is disposed
    timer?.cancel();
    statusTimer?.cancel();
    super.onClose();
  }
}

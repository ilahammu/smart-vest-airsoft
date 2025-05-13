import 'dart:async';
import 'package:get/get.dart';

import '../../../../data/Table-Hitpoint-Gameplay.dart';
import '../../../../data/TableGameplay.dart';

class GamestartController extends GetxController {
  Timer? timer;
  final GetConnect _http = GetConnect();

  final Map<String, String> tabelpermainan = {
    'Nama': 'no',
    'Nama Anggota': 'name',
    'HP': 'health',
  };

  final RxList<DataTableGameplay> listDataTableGame = <DataTableGameplay>[].obs;
  final RxList<DataTableHitpoint> listDataTableHit = <DataTableHitpoint>[].obs;
  var isStartEnabled = false.obs; // 🔥 State untuk tombol Start
  var gameStarted = false.obs; // 🔥 State untuk game status

  // table player Gameplay
  // =============================================================================================
  final kolomData = ['NO', 'Nama Anggota', 'HP'].obs;
  final Map<String, String> kolomMap = {
    'NO': 'no',
    'Nama Anggota': 'name',
    'HP': 'health',
  };

  void checkGameStatus() {
    final teamA =
        listDataTableGame.where((p) => p.selectedTeam == "TeamA").toList();
    final teamB =
        listDataTableGame.where((p) => p.selectedTeam == "TeamB").toList();

    final allReady =
        teamA.every((p) => p.statusReady) && teamB.every((p) => p.statusReady);

    isStartEnabled.value = teamA.isNotEmpty && teamB.isNotEmpty && allReady;
    print("Start Button Enabled: ${isStartEnabled.value}");
  }

  void startGame() async {
    if (isStartEnabled.value) {
      Get.snackbar("Success", "Game Started!");
      print("Game Started!");

      for (var player in listDataTableGame) {
        await updateWeaponStatus(player.PlayerID, true);
        await logHealth(player.name, player.health);
      }

      gameStarted.value = true;

      fetchDataTable();

      startHealthUpdate();
    } else {
      Get.snackbar("Error",
          "Both teams must have at least one player and all players must be ready!");
      print(
          "Game cannot start, teams are incomplete or not all players are ready!");
    }
  }

  // Tabel Pemain
  void fetchDataTable() async {
    try {
      final response =
          await _http.get('http://localhost:3001/api/gameplay/players');

      if (response.statusCode == 200) {
        final data = response.body['players'] as List<dynamic>;
        print('Data received from API: $data');

        listDataTableGame.value = data.map((item) {
          try {
            return DataTableGameplay.fromJson(item);
          } catch (e) {
            print("Error parsing player data: $e");
            return DataTableGameplay(
                no: 0,
                name: "Unknown",
                health: 100,
                selectedTeam: "Unknown",
                PlayerID: "Unknown",
                statusReady: false,
                statusWeapon: false);
          }
        }).toList();

        checkGameStatus();
        listDataTableGame.refresh();
      } else {
        print('Error fetching data: ${response.statusCode}');
      }
    } catch (e) {
      print("Exception occurred while fetching data: $e");
    }
  }
// ==============================================================================================

// Logika tombol Ready Pemain
// ==============================================================================================
  void updatePlayerStatus(String macAddress, bool isReady) async {
    try {
      final response = await _http.post(
        'http://localhost:3001/api/update/status',
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

  Future<void> updateWeaponStatus(String macAddress, bool statusWeapon) async {
    try {
      final response = await _http.post(
        'http://localhost:3001/api/game_session_route/update-session-native', // Endpoint untuk memperbarui status weapon
        {'mac_address': macAddress, 'status_weapon': statusWeapon ? 1 : 0},
      );

      if (response.statusCode == 200) {
        print('Weapon status updated successfully for $macAddress');
      } else {
        print('Error updating weapon status: ${response.statusCode}');
      }
    } catch (e) {
      print("Exception occurred while updating weapon status: $e");
    }
  }
  // ==============================================================================================

  // Logika Pengurangan HP pemain
  // ==============================================================================================
  void startHealthUpdate() {
    timer = Timer.periodic(Duration(seconds: 5), (Timer t) async {
      fetchDataTable(); // Refresh data to reflect updated health
    });
  }

  Future<void> logHealth(String name, int health) async {
    try {
      final response = await _http.post(
        'http://localhost:3001/api/hitpoint/health',
        {'name': name, 'health': health},
      );

      if (response.statusCode == 200) {
        print('Health logged successfully for $name');
      } else {
        print('Error logging health: ${response.statusCode}');
      }
    } catch (e) {
      print("Exception occurred while logging health: $e");
    }
  }

  Future<void> updateHealth(String macAddress, int damage) async {
    try {
      final player =
          listDataTableGame.firstWhere((p) => p.PlayerID == macAddress);
      final newHealth = (player.health - damage)
          .clamp(0, 100); // Ensure health doesn't go below 0

      final response = await _http.post(
        'http://localhost:3001/api/update/update-health',
        {'mac_address': macAddress, 'health': newHealth},
      );

      if (response.statusCode == 200) {
        print('Health updated successfully for $macAddress');
        fetchDataTable(); // Refresh data to reflect updated health
      } else {
        print('Error updating health: ${response.statusCode}');
      }
    } catch (e) {
      print("Exception occurred while updating health: $e");
    }
  }

  void startAutoRefresh() {
    // Timer untuk memuat ulang data setiap 5 detik
    timer = Timer.periodic(const Duration(seconds: 5), (Timer t) {
      fetchDataTable(); // Panggil fungsi untuk memuat ulang data
      print("Data refreshed at ${DateTime.now()}"); // Log waktu refresh
    });
  }

  void stopAutoRefresh() {
    // Hentikan timer jika tidak diperlukan
    timer?.cancel();
    timer = null;
  }

  @override
  void onInit() {
    super.onInit();
    fetchDataTable();
    startAutoRefresh(); // Mulai timer saat controller diinisialisasi
  }

  @override
  void onClose() {
    print("TeaminfoController is being closed...");
    stopAutoRefresh(); // Hentikan timer saat controller ditutup
    super.onClose();
  }
}

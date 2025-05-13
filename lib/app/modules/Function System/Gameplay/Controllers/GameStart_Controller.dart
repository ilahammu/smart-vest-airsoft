import 'dart:async';
import 'package:get/get.dart';
import '../../../../data/TableGameplay.dart';

class GamestartController extends GetxController {
  Timer? timer;
  final GetConnect _http = GetConnect();

  final kolomData = ['NO', 'Nama Anggota', 'HP'].obs;
  final Map<String, String> kolomMap = {
    'NO': 'no',
    'Nama Anggota': 'name',
    'HP': 'health',
  };

  final Map<String, String> tabelpermainan = {
    'Nama': 'no',
    'Nama Anggota': 'name',
    'HP': 'health',
  };

  final RxList<DataTableGameplay> listDataTable = <DataTableGameplay>[].obs;
  var isStartEnabled = false.obs; // 🔥 State untuk tombol Start
  var gameStarted = false.obs; // 🔥 State untuk game status

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
                statusReady: false,
                statusWeapon: false);
          }
        }).toList();

        checkGameStatus();
        listDataTable.refresh();
      } else {
        print('Error fetching data: ${response.statusCode}');
      }
    } catch (e) {
      print("Exception occurred while fetching data: $e");
    }
  }

  void checkGameStatus() {
    final teamA =
        listDataTable.where((p) => p.selectedTeam == "TeamA").toList();
    final teamB =
        listDataTable.where((p) => p.selectedTeam == "TeamB").toList();

    final allReady =
        teamA.every((p) => p.statusReady) && teamB.every((p) => p.statusReady);

    isStartEnabled.value = teamA.isNotEmpty && teamB.isNotEmpty && allReady;
    print("Start Button Enabled: ${isStartEnabled.value}");
  }

  void startGame() async {
    if (isStartEnabled.value) {
      Get.snackbar("Success", "Game Started!");
      print("Game Started!");

      for (var player in listDataTable) {
        await updateWeaponStatus(player.macAddress, true);
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

  Future<void> logHealth(String name, int health) async {
    try {
      final response = await _http.post(
        'http://localhost:3001/api/update/log-health',
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

  void startHealthUpdate() {
    timer = Timer.periodic(Duration(seconds: 5), (Timer t) async {
      fetchDataTable(); // Refresh data to reflect updated health
    });
  }

  Future<void> updateHealth(String macAddress, int damage) async {
    try {
      final player =
          listDataTable.firstWhere((p) => p.macAddress == macAddress);
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

  Future<void> resetHealth(String playerName) async {
    try {
      final response = await _http.post(
        'http://localhost:3001/api/update/update-health',
        {'name': playerName, 'health': 100},
      );

      if (response.statusCode == 200) {
        print('Health reset successfully for $playerName');
        // Refresh the data table to reflect the updated health
        fetchDataTable();
      } else {
        print('Error resetting health: ${response.statusCode}');
      }
    } catch (e) {
      print("Exception occurred while resetting health: $e");
    }
  }

  Future<void> resetAllHealth() async {
    try {
      for (var player in listDataTable) {
        await resetHealth(player.name);
      }
      print('All players health reset successfully');
    } catch (e) {
      print("Exception occurred while resetting all players' health: $e");
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchDataTable();
    // Comment out or remove the timer setup to disable automatic refresh
    // timer = Timer.periodic(Duration(seconds: 5), (Timer t) => fetchDataTable());
  }

  @override
  void onClose() {
    // Cancel the timer when the controller is disposed
    timer?.cancel();
    super.onClose();
  }
}

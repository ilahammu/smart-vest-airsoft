import 'dart:async';
import 'package:get/get.dart';

import '../../../../data/Table-Hitpoint-Gameplay.dart';
import '../../../../data/TableGameplay.dart';

class GamestartController extends GetxController {
  Timer? playerTimer;
  Timer? hitpointTimer;
  Timer? hptimer;
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

  // Endpoint dari .env
  static const String _baseUrl = String.fromEnvironment('BASE_URL');
  static const String _gameplayPlayerEndpoint =
      String.fromEnvironment('GAMEPLAY_PLAYER');
  static const String _hitpointEndpoint = String.fromEnvironment('HITPOINT');
  static const String _gameplayStatusMacEndpoint =
      String.fromEnvironment('GAMEPLAY_STATUS_MAC');
  static const String _gameSessionEndpoint =
      String.fromEnvironment('GAMESESSION');
  static const String _gameplayCheckStatusEndpoint =
      String.fromEnvironment('GAMEPLAY_CHECK_STATUS');
  static const String _gameplayStatusEndpoint =
      String.fromEnvironment('GAMEPLAY_STATUS');
  static const String _gameplayStartEndpoint =
      String.fromEnvironment('GAMEPLAY_START');
  static const String _gameplayEndEndpoint =
      String.fromEnvironment('GAMEPLAY_END');
  static const String _gameplayResetEndpoint =
      String.fromEnvironment('GAMEPLAY_RESET');
  static const String _hitpointUpdateEndpoint =
      String.fromEnvironment('HITPOINT_UPDATE');

  @override
  void onInit() {
    super.onInit();
    fetchDataTable();
    fetchDataTableHitpoint();
    startPlayerAutoRefresh();
    fetchCheckGameStatus();
  }

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

  // Tabel Pemain
  void fetchDataTable() async {
    try {
      final response = await _http.get('$_baseUrl$_gameplayPlayerEndpoint');

      if (response.statusCode == 200) {
        final data = response.body['players'] as List<dynamic>;
        print('Data received from API: $data');

        listDataTableGame.value = data
            .map((item) {
              try {
                return DataTableGameplay.fromJson(item);
              } catch (e) {
                print("Error parsing player data: $e");
                return null;
              }
            })
            .whereType<DataTableGameplay>()
            .toList();

        checkGameStatus();
        listDataTableGame.refresh();
      } else {
        print('Error fetching data: ${response.statusCode}');
      }
    } catch (e) {
      print("Exception occurred while fetching data: $e");
    }
  }

  // Tabel Hitpoint
  void fetchDataTableHitpoint() async {
    try {
      final response = await _http.get('$_baseUrl$_hitpointEndpoint');

      if (response.statusCode == 200) {
        final data = response.body['hitpoints'] as List<dynamic>;

        print(
            'Hitpoint data received from API: ${response.body}'); // Log data hitpoint

        listDataTableHit.value = data.map((item) {
          try {
            final hitpoint = DataTableHitpoint.fromJson(item);
            print(
                "Parsed hitpoint: $hitpoint"); // Log setiap hitpoint yang berhasil di-parse
            return hitpoint;
          } catch (e) {
            print("Error parsing hitpoint data: $e");
            return DataTableHitpoint(
              name: "Unknown",
              team: "Unknown",
              hitpoint: int.tryParse("Unknown") ?? 0,
              timestamp: DateTime.now(),
            );
          }
        }).toList();

        listDataTableHit.refresh();
      } else {
        print('Error fetching hitpoint data: ${response.statusCode}');
      }
    } catch (e) {
      print("Exception occurred while fetching hitpoint data: $e");
    }
  }
  // =============================================================================================

  // Logika tombol Ready Pemain
  // =============================================================================================
  void updatePlayerStatus(String macAddress, bool isReady) async {
    try {
      final response = await _http.post(
        '$_baseUrl$_gameplayStatusMacEndpoint',
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
        '$_baseUrl$_gameSessionEndpoint', // Endpoint untuk memperbarui status weapon
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

  Future<void> fetchCheckGameStatus() async {
    try {
      final response =
          await _http.get('$_baseUrl$_gameplayCheckStatusEndpoint');
      if (response.statusCode == 200) {
        final status = response.body['game_status'];
        print('Check Game Status: $status');
        gameStarted.value = (status == 1);
      } else {
        print('Error fetching check game status: ${response.statusCode}');
      }
    } catch (e) {
      print("Exception occurred while fetching check game status: $e");
    }
  }

  Future<void> fetchGameStatus() async {
    try {
      final response = await _http.get('$_baseUrl$_gameplayStatusEndpoint');
      if (response.statusCode == 200) {
        final status = response.body['game_status'];
        gameStarted.value = (status == 1);

        // Tampilkan kemenangan hanya jika status == 2
        if (status == 2) {}
        print('Game status updated: $status');
        print('Game status fetch response: ${response.body}');
      } else {
        print('Error fetching game status: ${response.statusCode}');
      }
    } catch (e) {
      print("Exception occurred while fetching game status: $e");
    }
  }

  void startGame() async {
    if (isStartEnabled.value) {
      // Panggil endpoint backend untuk start game
      final response = await _http.post('$_baseUrl$_gameplayStartEndpoint', {});
      print('Start game response: ${response.body}');
      if (response.statusCode == 200) {
        await fetchGameStatus();

        // Update status weapon & log health untuk setiap pemain
        for (var player in listDataTableGame) {
          await updateWeaponStatus(player.mac_address, true);
        }

        // Fetch ulang data pemain & hitpoint
        fetchDataTable();
        fetchDataTableHitpoint();

        // Mulai auto-refresh hitpoint
        startHealthUpdate();
      } else {
        print('Failed to start game: ${response.statusCode}');
      }
    } else {
      print(
          "Game cannot start, teams are incomplete or not all players are ready!");
    }
  }

  Future<void> endGame() async {
    final response = await _http.post('$_baseUrl$_gameplayEndEndpoint', {});
    print('End game response: ${response.body}');
    if (response.statusCode == 200) {
      await fetchGameStatus(); // Agar status game di FE ikut update ke 2
      fetchDataTable();
      fetchDataTableHitpoint();
      gameStarted.value = false;
    } else {
      print('Failed to end game: ${response.statusCode}');
    }
  }

  Future<void> resetGame() async {
    final response = await _http.post('$_baseUrl$_gameplayResetEndpoint', {});
    print('Reset response: ${response.body}');
    if (response.statusCode == 200) {
      print('Game reset successfully');
      fetchDataTable();
      fetchDataTableHitpoint();
      await fetchGameStatus();
      stopHitpointAutoRefresh();
      gameStarted.value = false;
    } else {
      print('Failed to reset game: ${response.statusCode}');
    }
  }

  // ==============================================================================================

  // Logika Pengurangan HP pemain
  // ==============================================================================================
  void startHealthUpdate() {
    hptimer = Timer.periodic(Duration(seconds: 1), (Timer t) async {
      fetchDataTable();
      fetchDataTableHitpoint();
      await fetchCheckGameStatus();
    });
  }

  Future<void> logHealth(String macAddress, int health, int hitpoint) async {
    try {
      final response = await _http.post(
        '$_baseUrl$_hitpointUpdateEndpoint',
        {
          'mac_address': macAddress,
          'health': health,
          'hitpoint': hitpoint,
        },
      );
      if (response.statusCode == 200) {
        print('Health logged successfully for $macAddress');
      } else {
        print('Error logging health: ${response.statusCode}');
      }
    } catch (e) {
      print("Exception occurred while logging health: $e");
    }
  }

  void startPlayerAutoRefresh() {
    playerTimer = Timer.periodic(const Duration(seconds: 3), (Timer t) {
      fetchDataTable();
    });
  }

  void stopPlayerAutoRefresh() {
    playerTimer?.cancel();
    playerTimer = null;
  }

  void startHitpointAutoRefresh() {
    hitpointTimer = Timer.periodic(const Duration(seconds: 3), (Timer t) {
      fetchDataTableHitpoint();
    });
  }

  void stopHitpointAutoRefresh() {
    hitpointTimer?.cancel();
    hitpointTimer = null;
  }

  @override
  void onClose() {
    stopPlayerAutoRefresh();
    stopHitpointAutoRefresh();
    super.onClose();
  }
}

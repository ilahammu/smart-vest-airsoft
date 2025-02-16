import 'dart:async';
import 'package:get/get.dart';
import '../../../data/TableGameplay.dart';

class GamestartController extends GetxController {
  Timer? timer;
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
          await _http.get('http://localhost:3001/api/register/players');

      if (response.statusCode == 200) {
        final data = response.body['players'] as List<dynamic>;
        print('Data received from API: $data');

        listDataTable.value = data.map((item) {
          try {
            return DataTableGameplay.fromJson(item);
          } catch (e) {
            print("Error parsing player data: $e");
            return DataTableGameplay(
                no: 0, name: "Unknown", health: 100, selectedTeam: "Unknown");
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

  // 🔥 Cek apakah kedua tim memiliki minimal satu pemain
  void checkGameStatus() {
    final teamA =
        listDataTable.where((p) => p.selectedTeam == "TeamA").toList();
    final teamB =
        listDataTable.where((p) => p.selectedTeam == "TeamB").toList();

    isStartEnabled.value = teamA.isNotEmpty && teamB.isNotEmpty;
    print("Start Button Enabled: ${isStartEnabled.value}");
  }

  // 🔥 Fungsi untuk memulai game
  void startGame() {
    if (isStartEnabled.value) {
      Get.snackbar("Success", "Game Started!");
      print("Game Started!");
    } else {
      Get.snackbar("Error", "Both teams must have at least one player!");
      print("Game cannot start, teams are incomplete!");
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchDataTable();
    // Set up a timer to call fetchDataTable every 5 seconds
    timer = Timer.periodic(Duration(seconds: 5), (Timer t) => fetchDataTable());
  }

  @override
  void onClose() {
    // Cancel the timer when the controller is disposed
    timer?.cancel();
    super.onClose();
  }
}

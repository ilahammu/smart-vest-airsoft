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

  @override
  void onInit() {
    super.onInit();
    fetchDataTable(); // Panggil saat controller diinisialisasi
  }

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

        // 🔥 Debugging untuk memastikan data sudah dipisah dengan benar
        final teamA =
            listDataTable.where((p) => p.selectedTeam == "TeamA").toList();
        final teamB =
            listDataTable.where((p) => p.selectedTeam == "TeamB").toList();
        print("Team A: $teamA");
        print("Team B: $teamB");

        listDataTable.refresh(); // 🔥 Memastikan UI diperbarui
      } else {
        print('Error fetching data: ${response.statusCode}');
      }
    } catch (e) {
      print("Exception occurred while fetching data: $e");
    }
  }
}

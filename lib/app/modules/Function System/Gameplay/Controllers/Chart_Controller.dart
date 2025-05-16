import 'package:get/get.dart';

class ChartController extends GetxController {
  var playerList = <Map<String, dynamic>>[].obs;
  var selectedPlayer = Rxn<Map<String, dynamic>>();
  var hitpointLog = <Map<String, dynamic>>[].obs;
  var currentPage = 0.obs;
  static const int pageSize = 5;

  Future<void> fetchPlayers() async {
    final response = await GetConnect()
        .get('https://l7xgct6c-3001.asse.devtunnels.ms/api/add/player');
    if (response.statusCode == 200) {
      playerList.value =
          List<Map<String, dynamic>>.from(response.body['players']);
    }
  }

  Future<void> fetchHitpointLog(String name) async {
    final response = await GetConnect()
        .get('https://l7xgct6c-3001.asse.devtunnels.ms/api/hitpoint/log/$name');
    if (response.statusCode == 200) {
      hitpointLog.value = List<Map<String, dynamic>>.from(response.body['log']);
    } else {
      hitpointLog.clear();
    }
  }

  // Mapping bagian mutlak
  static const List<String> bagianLabels = [
    "Bahu Kiri",
    "Bahu Kanan",
    "Punggung Kiri",
    "Punggung Kanan",
    "Pinggang Kiri",
    "Pinggang Kanan",
    "Pusar",
    "Jantung",
  ];

  // BarChart: selalu 8 bar, label tetap, nilai sesuai hitpointLog
  List<Map<String, dynamic>> get chartData {
    // Hitung jumlah per bagian (1-8)
    List<int> counts = List.filled(8, 0);
    for (var log in hitpointLog) {
      int bagian = (log['hitpoint'] ?? 0) as int;
      if (bagian >= 1 && bagian <= 8) {
        counts[bagian - 1]++;
      }
    }
    // Hasilkan 8 bar dengan label tetap
    return List.generate(
        8,
        (i) => {
              'label': bagianLabels[i],
              'blue': counts[i],
            });
  }

  @override
  void onInit() {
    super.onInit();
    fetchPlayers();
    // chartData otomatis 8 bar dengan nilai 0 jika belum ada data
  }
}

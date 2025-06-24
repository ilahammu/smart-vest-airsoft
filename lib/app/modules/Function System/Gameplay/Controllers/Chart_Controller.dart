import 'package:get/get.dart';

class ChartController extends GetxController {
  var playerList = <Map<String, dynamic>>[].obs;
  var selectedPlayer = Rxn<Map<String, dynamic>>();
  var hitpointLog = <Map<String, dynamic>>[].obs;
  var currentPage = 0.obs;
  static const int pageSize = 5;

  static const String _baseUrl = String.fromEnvironment('BASE_URL');
  static const String _playerEndpoint = String.fromEnvironment('ADD_PLAYER');
  static const String _hitpointLogEndpoint =
      String.fromEnvironment('HITPOINT_LOG');

  @override
  void onInit() {
    super.onInit();
    fetchPlayers();
  }

  Future<void> fetchPlayers() async {
    final response = await GetConnect().get('$_baseUrl$_playerEndpoint');
    if (response.statusCode == 200) {
      playerList.value =
          List<Map<String, dynamic>>.from(response.body['players']);
    }
  }

  Future<void> fetchHitpointLog(String name) async {
    final response =
        await GetConnect().get('$_baseUrl$_hitpointLogEndpoint/$name');
    if (response.statusCode == 200) {
      hitpointLog.value = List<Map<String, dynamic>>.from(response.body['log']);
    } else {
      hitpointLog.clear();
    }
  }

  static const List<String> bagianLabels = [
    "Bahu Kiri",
    "Bahu Kanan",
    "Rusuk Kiri",
    "Rusuk Kanan",
    "Jantung",
    "Pinggang Kiri",
    "Pinggang Kanan",
    "Pusar",
  ];

  List<Map<String, dynamic>> get chartData {
    List<int> counts = List.filled(8, 0);
    for (var log in hitpointLog) {
      int bagian = (log['hitpoint'] ?? 0) as int;
      if (bagian >= 1 && bagian <= 8) {
        counts[bagian - 1]++;
      }
    }
    return List.generate(
        8,
        (i) => {
              'label': bagianLabels[i],
              'blue': counts[i],
            });
  }
}

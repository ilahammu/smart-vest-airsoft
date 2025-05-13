import 'dart:async';
import 'package:get/get.dart';
import 'package:vest_keren/app/data/TablePerson.dart';

class TeaminfoController extends GetxController {
  Timer? timer;

  final GetConnect _http = GetConnect();
  final listColumn = [
    'Nama Anggota',
  ].obs;

  final Map<String, String> columnMap = {
    'Nama Anggota': 'name',
  };

  final RxList<DataTablePerson> listDataTable = <DataTablePerson>[].obs;

//======================================================================================

  void fetchDataTable() async {
    final response = await _http.get('http://localhost:3001/api/add/player');
    if (response.statusCode == 200) {
      final data = response.body['players'] as List<dynamic>;
      print('Data received from API: $data'); // Logging data received from API
      listDataTable.value =
          data.map((item) => DataTablePerson.fromJson(item)).toList();
    } else {
      print('Error: ${response.statusCode}');
    }
  }

//======================================================================================

  Future<void> deletePlayer(int playerId) async {
    try {
      print("Deleting player with PlayerID: $playerId"); // Log nilai PlayerID

      final response = await _http.delete(
        'http://localhost:3001/api/delete/player/$playerId',
      );

      if (response.statusCode == 200) {
        Get.snackbar('Success', 'Player deleted successfully!');
        fetchDataTable(); // Refresh daftar pemain setelah penghapusan
      } else {
        Get.snackbar('Error', 'Failed to delete player: ${response.body}');
      }
    } catch (e) {
      Get.snackbar('Error', 'An unexpected error occurred: $e');
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

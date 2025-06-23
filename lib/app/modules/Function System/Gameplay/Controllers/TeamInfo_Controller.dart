import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
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

  late String _baseUrl;
  late String _addPlayerEndpoint;
  late String _deletePlayerEndpoint;

  void fetchDataTable() async {
    final response = await _http.get('$_baseUrl$_addPlayerEndpoint');
    if (response.statusCode == 200) {
      final data = response.body['players'] as List<dynamic>;
      listDataTable.value =
          data.map((item) => DataTablePerson.fromJson(item)).toList();
    }
  }

  Future<void> deletePlayer(String macAddress) async {
    try {
      final response = await _http.delete(
        '$_baseUrl$_deletePlayerEndpoint/$macAddress',
      );
      if (response.statusCode == 200) {
        fetchDataTable();
      }
    } catch (e) {}
  }

  void startAutoRefresh() {
    timer = Timer.periodic(const Duration(seconds: 5), (Timer t) {
      fetchDataTable();
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
    _addPlayerEndpoint = dotenv.env['ADD_PLAYER']!;
    _deletePlayerEndpoint = dotenv.env['DELETE_PLAYER']!;
    fetchDataTable();
    startAutoRefresh();
  }

  @override
  void onClose() {
    stopAutoRefresh();
    super.onClose();
  }
}

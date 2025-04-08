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
    final response =
        await _http.get('http://localhost:3001/api/register/players');
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

  @override
  void onInit() {
    super.onInit();
    fetchDataTable();
  }
}

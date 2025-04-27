import 'package:get/get.dart';

class ChartController extends GetxController {
  // Tipe data eksplisit: List of Map<String, dynamic>
  final RxList<Map<String, dynamic>> chartData = <Map<String, dynamic>>[].obs;

  void updateChartData(List<Map<String, dynamic>> newData) {
    chartData.value = newData;
  }

  @override
  void onInit() {
    super.onInit();
    chartData.addAll([
      {'label': 'Bahu Kiri', 'blue': 4},
      {'label': 'Bahu Kanan', 'blue': 6},
      {'label': 'Punggung\nKiri', 'blue': 8},
      {'label': 'Punggung\nKanan', 'blue': 12},
      {'label': 'Pinggang\nKiri ', 'blue': 15},
      {'label': 'Pinggang\nKanan', 'blue': 18},
      {'label': 'Jantung', 'blue': 14},
      {'label': 'Pusar', 'blue': 14},
    ]);
  }
}

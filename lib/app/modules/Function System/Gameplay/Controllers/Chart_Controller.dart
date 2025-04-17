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
      {'label': 'Bahu Kiri', 'blue': 4.0},
      {'label': 'Bahu Kanan', 'blue': 6.0},
      {'label': 'Punggung Kiri', 'blue': 10.0},
      {'label': 'Punggung Kanan', 'blue': 12.0},
      {'label': 'Pinggang Kiri ', 'blue': 15.0},
      {'label': 'Pinggang Kanan', 'blue': 18.0},
      {'label': 'Jantung', 'blue': 14.0},
      {'label': 'Pusar', 'blue': 14.0},
    ]);
  }
}

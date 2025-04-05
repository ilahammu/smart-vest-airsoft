import 'package:get/get.dart';

class MonitoringBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MonitoringBinding>(
      () => MonitoringBinding(),
    );
  }
}

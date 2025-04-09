import 'package:get/get.dart';
import 'package:vest_keren/app/modules/Function%20System/Gameplay/Controllers/Chart_Controller.dart';

class ChartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChartController>(
      () => ChartController(),
    );
  }
}

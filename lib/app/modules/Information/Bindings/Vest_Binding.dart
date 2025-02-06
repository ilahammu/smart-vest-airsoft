import 'package:get/get.dart';
import 'package:vest_keren/app/modules/Information/Controllers/Vest_Controller.dart';

class VestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VestController>(
      () => VestController(),
    );
  }
}

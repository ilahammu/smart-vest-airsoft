import 'package:get/get.dart';
import 'package:vest_keren/app/modules/Information/Controllers/Arena_Controller.dart';

class ArenaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ArenaController>(
      () => ArenaController(),
    );
  }
}

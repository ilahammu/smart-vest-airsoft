import 'package:get/get.dart';
import 'package:vest_keren/app/modules/Function%20System/Gameplay/Controllers/TeamInfo_Controller.dart';

class TeaminfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeaminfoController>(
      () => TeaminfoController(),
      fenix: true,
    );
  }
}

import 'package:get/get.dart';
import 'package:vest_keren/app/modules/Function%20System/Gameplay/Controllers/GameStart_Controller.dart';

class GamestartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GamestartController>(
      () => GamestartController(),
    );
  }
}

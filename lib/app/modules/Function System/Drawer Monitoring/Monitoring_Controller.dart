import 'package:get/get.dart';

import '../Gameplay/Controllers/TambahOrang_Controller.dart';
import '../Gameplay/Controllers/TeamInfo_Controller.dart';

class MonitoringController extends GetxController {
  var selectedIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    selectedIndex.value = 0;
  }

  void changeIndex(int index) {
    if (Get.isRegistered<TambahorangController>()) {
      Get.delete<TambahorangController>(force: true);
    }

    if (Get.isRegistered<TeaminfoController>()) {
      Get.delete<TeaminfoController>(force: true);
    }
    ;

    selectedIndex.value = index;
  }
}

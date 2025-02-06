import 'package:get/get.dart';

import '../Controllers/Settings.controller.dart';

class PengaturanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PengaturanController>(
      () => PengaturanController(),
    );
  }
}

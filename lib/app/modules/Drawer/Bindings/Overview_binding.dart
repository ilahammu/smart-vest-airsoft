import 'package:get/get.dart';

import '../Controllers/Overview_controller.dart';

class OverviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OverviewController>(
      () => OverviewController(),
    );
  }
}

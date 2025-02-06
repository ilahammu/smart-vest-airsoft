import 'package:get/get.dart';
import 'package:vest_keren/app/modules/Drawer/Controllers/About_Controller.dart';

class AboutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AboutController>(
      () => AboutController(),
    );
  }
}

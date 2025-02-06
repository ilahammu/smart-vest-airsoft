import 'package:get/get.dart';

import '../Controllers/TambahOrang_Controller.dart';

class TambahorangBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TambahorangController>(
      () => TambahorangController(),
    );
  }
}

import 'package:get/get.dart';
import 'package:vest_keren/app/modules/Information/Controllers/Weapon_Controller.dart';

class WeaponBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WeaponController>(
      () => WeaponController(),
    );
  }
}

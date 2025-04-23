import 'package:get/get.dart';

class OverviewController extends GetxController {
  final RxBool showAdditionalButtonsCard1 = false.obs;
  final RxBool showAdditionalButtonsCard2 = false.obs;

  void toggleCard1() {
    showAdditionalButtonsCard1.value = !showAdditionalButtonsCard1.value;
    showAdditionalButtonsCard2.value = false;
  }

  void toggleCard2() {
    showAdditionalButtonsCard2.value = !showAdditionalButtonsCard2.value;
    showAdditionalButtonsCard1.value = false;
  }

  @override
  void onInit() {
    super.onInit();
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // Index menu yang aktif
  HomeController() {}
  var selectedIndex = 0.obs;

  // Scroll controller untuk halaman utama
  final scrollController = ScrollController();

  // GlobalKey untuk setiap section
  final overviewKey = GlobalKey();

  @override
  void onInit() {
    super.onInit();
    selectedIndex.value = 0;
  }

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  void scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}

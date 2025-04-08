import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vest_keren/app/modules/Drawer/Controllers/Home_controller.dart';

class CustomAppBar extends StatelessWidget {
  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.home, color: Colors.white),
          SizedBox(width: 10),
          _buildNavButton("Home", 0, controller.overviewKey),
          SizedBox(width: 20),
          _buildNavButton("Information", 1, controller.settingsKey),
          SizedBox(width: 20),
          _buildNavButton("About", 2, controller.aboutKey),
        ],
      ),
    );
  }

  Widget _buildNavButton(String label, int index, GlobalKey key) {
    return Obx(() => TextButton(
          onPressed: () {
            controller.scrollToSection(key);
            controller.selectedIndex.value = index;
          },
          child: Text(
            label,
            style: TextStyle(
              color: controller.selectedIndex.value == index
                  ? Colors.yellow
                  : Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }
}

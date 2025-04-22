import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vest_keren/app/modules/Drawer/Controllers/Home_controller.dart';

class CustomAppBar extends StatelessWidget {
  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(235, 0, 0, 0),
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildNavButton("Home", 0),
          SizedBox(width: 20),
          _buildNavButton("Information", 1),
          SizedBox(width: 20),
          _buildNavButton("About", 2),
        ],
      ),
    );
  }

  Widget _buildNavButton(String label, int index) {
    return Obx(() => TextButton(
          onPressed: () {
            controller.selectedIndex.value = index; // ✅ Ganti index
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

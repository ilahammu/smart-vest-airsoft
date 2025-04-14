import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vest_keren/app/Custom_Component/List/Custom_ListTile.dart';
import 'package:vest_keren/app/modules/Function%20System/Monitoring/Monitoring_Controller.dart';

class MainDrawer extends GetView<MonitoringController> {
  final MonitoringController controller = Get.put(MonitoringController());

  @override
  Widget build(BuildContext context) {
    final double drawerWidth = 200.0; // Set the desired width for the drawer

    return Material(
      child: Container(
        width: drawerWidth,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 36, 21, 21),
              Color.fromARGB(255, 40, 36, 36),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),
            CustomListTile(
              title: ' Sistem Monitoring',
              iconLeading: Icons.monitor_heart,
              isSelected: controller.selectedIndex.value == 0,
              onClick: () {
                controller.changeIndex(0);
              },
            ),
            CustomListTile(
              title: 'Game Start',
              iconLeading: Icons.monitor_heart,
              isSelected: controller.selectedIndex.value == 1,
              onClick: () {
                controller.changeIndex(1);
              },
            ),
            CustomListTile(
              title: 'Add Player',
              iconLeading: Icons.monitor_heart,
              isSelected: controller.selectedIndex.value == 2,
              onClick: () {
                controller.changeIndex(2);
              },
            ),
            CustomListTile(
              title: 'Team Information',
              iconLeading: Icons.monitor_heart,
              isSelected: controller.selectedIndex.value == 3,
              onClick: () {
                controller.changeIndex(3);
              },
            ),
          ],
        ),
      ),
    );
  }
}

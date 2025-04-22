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
              Color.fromRGBO(13, 27, 42, 1),
              Color.fromRGBO(50, 27, 58, 1),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Obx(
          () => Column(
            children: [
              const SizedBox(height: 150),
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
                iconLeading: Icons.games,
                isSelected: controller.selectedIndex.value == 1,
                onClick: () {
                  controller.changeIndex(1);
                },
              ),
              CustomListTile(
                title: 'Add Player',
                iconLeading: Icons.people_sharp,
                isSelected: controller.selectedIndex.value == 2,
                onClick: () {
                  controller.changeIndex(2);
                },
              ),
              CustomListTile(
                title: 'Team Information',
                iconLeading: Icons.info,
                isSelected: controller.selectedIndex.value == 3,
                onClick: () {
                  controller.changeIndex(3);
                },
              ),
              Spacer(),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.asset(
                      'assets/images/logo/stas.png', // Replace with your image path
                      width: 70,
                      height: 70,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.asset(
                      'assets/images/logo/pindad.png', // Replace with your image path
                      width: 70,
                      height: 70,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

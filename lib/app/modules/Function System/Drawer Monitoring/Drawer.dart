import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:vest_keren/app/Custom_Component/List/Custom_Expantion.dart';
import 'package:vest_keren/app/Custom_Component/List/Custom_ListTile.dart';
import 'package:vest_keren/app/modules/Function%20System/Drawer%20Monitoring/Monitoring_Controller.dart';

class MainDrawer extends GetView<MonitoringController> {
  final MonitoringController controller = Get.put(MonitoringController());

  @override
  Widget build(BuildContext context) {
    final double drawerWidth = 200.0; // Set the desired width for the drawer

    return Material(
      child: Container(
        width: drawerWidth,
        color: const Color.fromARGB(255, 28, 28, 28),
        child: Obx(
          () => Column(
            children: [
              const SizedBox(height: 150),
              CustomListTile(
                title: ' Overview',
                iconLeading: Icons.monitor_heart,
                isSelected: controller.selectedIndex.value == 0,
                onClick: () {
                  controller.changeIndex(0);
                },
              ),
              CustomExpansionTile(
                  title: 'Analytics',
                  leading: Icon(
                    MdiIcons.googleAnalytics,
                    color: Colors.black,
                    size: 15,
                  ),
                  children: <Widget>[
                    CustomListTile(
                      title: ' Monitoring System',
                      iconLeading: Icons.monitor_heart,
                      isSelected: controller.selectedIndex.value == 1,
                      onClick: () {
                        controller.changeIndex(1);
                      },
                    ),
                    CustomListTile(
                      title: ' Gameplay',
                      iconLeading: Icons.monitor_heart,
                      isSelected: controller.selectedIndex.value == 2,
                      onClick: () {
                        controller.changeIndex(2);
                      },
                    ),
                    CustomListTile(
                      title: ' Add Player',
                      iconLeading: Icons.monitor_heart,
                      isSelected: controller.selectedIndex.value == 3,
                      onClick: () {
                        controller.changeIndex(3);
                      },
                    ),
                    CustomListTile(
                      title: 'Team Information',
                      iconLeading: Icons.games,
                      isSelected: controller.selectedIndex.value == 4,
                      onClick: () {
                        controller.changeIndex(4);
                      },
                    ),
                  ]),
              CustomListTile(
                title: 'Information',
                iconLeading: Icons.people_sharp,
                isSelected: controller.selectedIndex.value == 5,
                onClick: () {
                  controller.changeIndex(5);
                },
              ),
              CustomListTile(
                title: 'About',
                iconLeading: Icons.info,
                isSelected: controller.selectedIndex.value == 6,
                onClick: () {
                  controller.changeIndex(6);
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vest_keren/app/Custom_Component/List/Custom_ListTile.dart';
import 'Controllers/Home_controller.dart';

class MainDrawer extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Obx(() {
        return AnimatedContainer(
          duration: Duration(milliseconds: 250),
          width: controller.isDrawerExpanded.value ? Get.width * 0.15 : 90,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(155, 165, 132, 132),
                Colors.grey[400]!,
                Colors.grey[600]!,
              ],
              stops: [0.2, 0.5, 0.8],
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: <Widget>[
              if (controller.isDrawerExpanded.value)
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Image.asset(
                    'assets/images/logo/stas-panjang.png',
                    fit: BoxFit.contain,
                  ),
                ),
              if (!controller.isDrawerExpanded.value)
                Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/logo/stas-G.png',
                    fit: BoxFit.contain,
                  ),
                ),
              CustomListTile(
                title: 'Home',
                iconLeading: Icons.home,
                isSelected: controller.selectedIndex.value == 0,
                onClick: () {
                  controller.changeIndex(0);
                },
                isDrawerExpanded: controller.isDrawerExpanded.value,
              ),
              CustomListTile(
                title: 'Settings',
                iconLeading: Icons.settings,
                isSelected: controller.selectedIndex.value == 1,
                onClick: () {
                  controller.changeIndex(1);
                },
                isDrawerExpanded: controller.isDrawerExpanded.value,
              ),
              CustomListTile(
                title: 'About',
                iconLeading: Icons.info,
                isSelected: controller.selectedIndex.value == 2,
                onClick: () {
                  controller.changeIndex(2);
                },
                isDrawerExpanded: controller.isDrawerExpanded.value,
              ),
              Spacer(),
              Align(
                alignment: Alignment.center,
                child: IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    controller.toggleDrawer();
                  },
                  iconSize: controller.isDrawerExpanded.value ? 24 : 30,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

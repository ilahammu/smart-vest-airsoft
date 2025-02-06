import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/Home_controller.dart';
import '../Drawer.dart';

import 'Overview_view.dart';
import 'About_Views.dart';
import 'settings_view.dart';

class HomeView extends GetView<HomeController> {
  @override
  final HomeController controller = Get.put(HomeController());

  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: <Widget>[
                MainDrawer(),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: Get.width,
                    height: Get.height,
                    color: const Color.fromARGB(255, 164, 25, 25),
                    child: Obx(() {
                      switch (controller.selectedIndex.value) {
                        case 0:
                          return OverviewView();
                        case 1:
                          return PengaturanView();
                        case 2:
                          return AboutView();
                        default:
                          return Container();
                      }
                    }),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

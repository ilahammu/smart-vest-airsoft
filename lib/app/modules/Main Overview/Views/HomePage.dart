import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../AppBar.dart';
import '../Controllers/Home_controller.dart';
import 'About_Views.dart';
import 'Overview_view.dart';
import 'Information_view.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key}); // pakai const = best practice

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(), // Shared AppBar
          Expanded(
            child: Obx(() => IndexedStack(
                  index: controller.selectedIndex.value,
                  children: const [
                    OverviewView(),
                    InformationView(),
                    AboutView(),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}

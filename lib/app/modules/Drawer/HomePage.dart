import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'AppBar.dart';
import 'Controllers/Home_controller.dart';

import 'Views/Overview_view.dart';
import 'Views/About_Views.dart';
import 'Views/settings_view.dart';

class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key);

  @override
  final HomeController controller = Get.find();
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(),
          Expanded(
            child: SingleChildScrollView(
              controller: controller.scrollController,
              child: Column(
                children: [
                  OverviewView(key: controller.overviewKey),
                  PengaturanView(key: controller.settingsKey),
                  AboutView(key: controller.aboutKey),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../AppBar.dart';
import '../Controllers/Home_controller.dart';

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

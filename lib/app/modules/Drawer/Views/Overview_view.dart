import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vest_keren/app/modules/Drawer/AppBar_Shared.dart';

import '../Controllers/Overview_controller.dart';

class OverviewView extends GetView<OverviewController> {
  const OverviewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppbarShared(
      backgroundColor: Colors.transparent,
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.center,
            colors: [
              Color.fromARGB(255, 3, 0, 23),
              Color.fromARGB(255, 21, 20, 33),
              Color.fromARGB(255, 25, 24, 39),
            ],
          ),
        ),
        child: Center(
          child: TextButton(
            onPressed: () {
              Get.toNamed('/monitoring');
            },
            child: Text(
              "Get Started",
              style: TextStyle(
                backgroundColor: Colors.yellow,
                fontSize: 32,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

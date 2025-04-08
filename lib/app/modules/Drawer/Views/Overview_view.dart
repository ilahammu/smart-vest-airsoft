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
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 500,
              width: double.infinity,
              color: const Color.fromARGB(255, 38, 36, 30),
              child: Center(
                child: Text(
                  "Information",
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              height: 500,
              width: double.infinity,
              color: const Color.fromARGB(255, 109, 85, 84),
              child: Center(
                child: Text(
                  "Information",
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

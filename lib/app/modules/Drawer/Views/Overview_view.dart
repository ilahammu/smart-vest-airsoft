import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vest_keren/app/modules/Drawer/AppBar_Shared.dart';

import '../Controllers/Overview_controller.dart';

class OverviewView extends GetView<OverviewController> {
  const OverviewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppbarShared(
      backgroundColor: Colors.brown.shade900,
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Text(
              "Overview",
              style: TextStyle(
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

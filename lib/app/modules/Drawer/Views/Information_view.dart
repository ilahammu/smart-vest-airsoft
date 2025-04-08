import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vest_keren/app/modules/Drawer/AppBar_Shared.dart';

import '../Controllers/Information_controller.dart';

class InformationView extends GetView<InformationController> {
  const InformationView({Key? key}) : super(key: key); // ✅ ini benar

  @override
  Widget build(BuildContext context) {
    return AppbarShared(
      backgroundColor: Colors.brown.shade900,
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Text(
              "Information",
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

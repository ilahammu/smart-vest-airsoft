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
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topRight,
                  colors: [
                    Color.fromARGB(255, 3, 0, 23),
                    Color.fromARGB(255, 21, 20, 33),
                    Color.fromARGB(255, 25, 24, 39),
                  ],
                ),
              ),
              width: double.infinity,
              height: 500,
              child: Text(
                "Information",
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color.fromARGB(255, 3, 0, 23),
                    Color.fromARGB(255, 21, 20, 33),
                    Color.fromARGB(255, 25, 24, 39),
                  ],
                ),
              ),
              width: double.infinity,
              height: 500,
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
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 3, 0, 23),
                    Color.fromARGB(255, 21, 20, 33),
                    Color.fromARGB(255, 25, 24, 39),
                  ],
                ),
              ),
              width: double.infinity,
              height: 500,
              child: Text(
                "Information",
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

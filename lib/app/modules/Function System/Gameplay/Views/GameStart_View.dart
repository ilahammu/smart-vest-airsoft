import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vest_keren/app/modules/Function%20System/Gameplay/Controllers/GameStart_Controller.dart';
import '../../../../Custom_Component/Table/Custom_Table-Gameplay.dart';

class GamestartView extends GetView<GamestartController> {
  final GamestartController controller = Get.put(GamestartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
                  controller.gameStarted.value
                      ? "Game Started"
                      : "Game Not Started",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            Expanded(
              child: Obx(() {
                if (controller.listDataTable.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }
                return CustomDataTable(
                  dataList: controller.listDataTable,
                  gameStarted: controller.gameStarted.value,
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Obx(() => _tombolMulai(
                    controller.isStartEnabled.value
                        ? 1.0
                        : 0.5, // Pass opacity as the first argument
                    controller.isStartEnabled.value
                        ? controller.startGame
                        : null, // Pass onPressed as the second argument
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _tombolMulai(double tebal, VoidCallback? onPressed) {
  return ElevatedButton(
    onPressed: onPressed,
    child: Text(tebal.toString()),
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      textStyle: const TextStyle(fontSize: 20),
    ),
  );
}

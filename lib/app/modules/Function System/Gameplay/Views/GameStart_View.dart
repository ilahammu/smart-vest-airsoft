import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vest_keren/app/modules/Function%20System/Gameplay/Controllers/GameStart_Controller.dart';
import '../../../../Custom_Component/Button/Custom_Button_Start.dart';
import '../../../../Custom_Component/Table/Custom_DataTableGameplay.dart';

class GamestartView extends GetView<GamestartController> {
  final GamestartController controller = Get.put(GamestartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 90, 27, 206),
        title: const Text('Game Start'),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 51, 9, 63),
              Color.fromARGB(255, 83, 48, 105),
              Color.fromARGB(255, 0, 0, 0),
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
              child: Obx(() => CustomButtonStart(
                    onPressed: controller.isStartEnabled.value
                        ? controller.startGame
                        : null, // 🔥 Disable tombol jika tidak memenuhi syarat
                    opacity: controller.isStartEnabled.value ? 1.0 : 0.8,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

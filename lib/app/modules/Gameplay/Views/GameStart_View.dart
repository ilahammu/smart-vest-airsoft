import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vest_keren/app/modules/Gameplay/Controllers/GameStart_Controller.dart';
import '../../../Custom_Component/Button/Custom_Button_Start.dart';
import '../../../Custom_Component/Table/Custom_DataTableGameplay.dart';
import '../../../Custom_Component/Button/Custom_ButtonStart.dart';

class GamestartView extends GetView<GamestartController> {
  @override
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
            Expanded(
              child: Obx(() {
                if (controller.listDataTable.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }
                return CustomDataTable(dataList: controller.listDataTable);
              }),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: CustomButtonStart(
                onPressed: () {
                  print("Game Started!");
                  controller.startGame(); // Jika ada fungsi di controller
                },
                opacity: 1.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

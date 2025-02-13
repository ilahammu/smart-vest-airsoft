import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vest_keren/app/modules/Gameplay/Controllers/GameStart_Controller.dart';
import '../../../Custom_Component/Table/Custom_DataTableGameplay.dart';

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
              const Color.fromARGB(255, 51, 9, 63),
              const Color.fromARGB(255, 83, 48, 105),
              const Color.fromARGB(255, 0, 0, 0),
            ],
          ),
        ),
        child: Center(
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
              _buildStartButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStartButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[600],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text("START",
              style: TextStyle(fontSize: 18, color: Colors.black)),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
            begin: Alignment.bottomRight,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 28, 28, 28),
              Color.fromARGB(255, 29, 31, 30),
              Color.fromARGB(255, 32, 33, 34),
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
                  style: GoogleFonts.tiltWarp(
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
  return Container(
    decoration: BoxDecoration(
      color: tebal == 1.0
          ? const Color.fromARGB(255, 28, 249, 3) // Full opacity
          : const Color.fromARGB(127, 99, 101, 102)
              .withOpacity(0.4), // Faded background when not ready
      borderRadius: BorderRadius.circular(5),
    ),
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        backgroundColor: Colors.transparent,
        textStyle: const TextStyle(
            fontSize:
                24), // Transparent background to use container's background
        elevation: 0, // Remove shadow for clean appearance
      ),
      child: Text(
        'Start Game',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

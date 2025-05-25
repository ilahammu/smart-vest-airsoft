import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../Custom_Component/Table/Custom_Table-Gameplay.dart';
import '../Controllers/GameStart_Controller.dart';

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
            Expanded(
              child: Obx(() {
                if (controller.listDataTableGame.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }
                return CustomDataTableGameplay(
                    dataList: controller.listDataTableGame,
                    gameStarted: controller.gameStarted.value,
                    hitpointList: controller.listDataTableHit);
              }),
            ),
            Padding(
              padding: const EdgeInsets.all(0),
              child: Obx(() {
                if (controller.gameStarted.value) {
                  // Jika game selesai, tampilkan tombol Reset Game
                  bool teamADead = controller.listDataTableGame
                      .where((p) => p.selectedTeam == "TeamA")
                      .every((p) => p.health <= 0);
                  bool teamBDead = controller.listDataTableGame
                      .where((p) => p.selectedTeam == "TeamB")
                      .every((p) => p.health <= 0);

                  if (teamADead || teamBDead) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: ElevatedButton(
                        onPressed: () async {
                          await controller.resetGame(); // Fungsi reset game
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                        ),
                        child: Text(
                          "Reset Game",
                          style: GoogleFonts.orbitron(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    );
                  } else {
                    return const SizedBox(); // Tidak menampilkan tombol apapun
                  }
                } else {
                  // Jika game belum dimulai, tampilkan tombol Start Game
                  return _tombolMulai(
                    controller.isStartEnabled.value ? 1.0 : 0.5,
                    controller.isStartEnabled.value
                        ? controller.startGame
                        : null,
                  );
                }
              }),
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

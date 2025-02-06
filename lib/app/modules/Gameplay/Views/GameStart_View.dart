import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vest_keren/app/modules/Gameplay/Controllers/GameStart_Controller.dart';

class GamestartView extends GetView<GamestartController> {
  // Mengambil controller yang sudah di-binding
  @override
  final GamestartController controller = Get.put(GamestartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(
            255, 90, 27, 206), // Set a non-transparent background color
        title: Text('Game Start'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Menampilkan status game (apakah dimulai atau tidak)
            Obx(() {
              return Text(
                controller.isGameStarted.value
                    ? 'Game is Started!'
                    : 'Game is not Started',
                style: TextStyle(fontSize: 20),
              );
            }),

            SizedBox(height: 20),

            // Tombol untuk memulai game
            ElevatedButton(
              onPressed: () {
                controller.startGame(); // Memulai game
              },
              child: Text('Start Game'),
            ),

            SizedBox(height: 10),

            // Tombol untuk menghentikan game
            ElevatedButton(
              onPressed: () {
                controller.stopGame(); // Menghentikan game
              },
              child: Text('Stop Game'),
            ),
          ],
        ),
      ),
    );
  }
}

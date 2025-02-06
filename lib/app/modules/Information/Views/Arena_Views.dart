import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vest_keren/app/modules/Information/Controllers/Arena_Controller.dart';

class ArenaView extends GetView<ArenaController> {
  @override
  Widget build(BuildContext context) {
    final ArenaController controller = Get.put(ArenaController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Arena Mantab'),
        backgroundColor: const Color.fromARGB(255, 138, 203, 233),
      ),
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.grey[300]!,
              const Color.fromARGB(255, 126, 116, 116)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Obx(() {
            return Image.asset(
              controller.imagePath.value,
              width: 700, // Adjust width as needed
              height: 900, // Adjust height as needed
              fit: BoxFit.contain,
            );
          }),
        ),
      ),
    );
  }
}

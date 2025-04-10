import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/Chart_Controller.dart';

class ChartView extends GetView<ChartController> {
  final ChartController controller = Get.put(ChartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 90, 27, 206),
        title: const Text('Chart View'),
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
      ),
    );
  }
}

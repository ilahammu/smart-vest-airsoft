import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/Settings.controller.dart';

class PengaturanView extends GetView<PengaturanController> {
  @override
  final PengaturanController controller = Get.put(PengaturanController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(
            255, 90, 27, 206), // Set a non-transparent background color
        title: Text('PengaturanView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PengaturanView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

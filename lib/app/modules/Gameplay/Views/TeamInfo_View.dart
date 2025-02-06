import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vest_keren/app/modules/Gameplay/Bindings/TeamInfo_Binding.dart';

class TeaminfoView extends GetView<TeaminfoBinding> {
  @override
  final TeaminfoBinding controller = Get.put(TeaminfoBinding());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(
            255, 90, 27, 206), // Set a non-transparent background color
        title: Text('Team Info'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Team Info is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

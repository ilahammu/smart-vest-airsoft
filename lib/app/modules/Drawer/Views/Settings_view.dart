import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/Settings.controller.dart';

class PengaturanView extends GetView<PengaturanController> {
  const PengaturanView({Key? key}) : super(key: key); // ✅ ini benar

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key, // ✅ ini tambahan opsional, tapi aman
      height: 600,
      color: Colors.blueGrey,
      child: Center(
        child: Text('Settings', style: TextStyle(fontSize: 32)),
      ),
    );
  }
}

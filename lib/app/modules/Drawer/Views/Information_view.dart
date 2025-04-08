import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/Information_controller.dart';

class InformationView extends GetView<InformationController> {
  const InformationView({Key? key}) : super(key: key); // ✅ ini benar

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      color: Colors.blueGrey,
      child: Center(
        child: Text('Information', style: TextStyle(fontSize: 32)),
      ),
    );
  }
}

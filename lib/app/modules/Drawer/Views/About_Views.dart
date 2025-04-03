import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/About_Controller.dart';

class AboutView extends GetView<AboutController> {
  const AboutView({Key? key}) : super(key: key);
  // final AboutController controller = Get.put(AboutController());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      color: Colors.green,
      child: Center(child: Text('About Us', style: TextStyle(fontSize: 32))),
    );
  }
}

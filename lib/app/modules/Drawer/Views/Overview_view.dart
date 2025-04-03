import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/Overview_controller.dart';

class OverviewView extends GetView<OverviewController> {
  const OverviewView({Key? key}) : super(key: key);
  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      color: Colors.black,
      child: Center(
        child: Text('Overview',
            style: TextStyle(
              fontSize: 32,
              color: Colors.white,
            )),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Monitoring_Controller.dart';

class MonitoringView extends GetView<MonitoringController> {
  @override
  final MonitoringController controller = Get.put(MonitoringController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Monitoring View'),
      ),
      body: Center(
        child: Text('Monitoring is active'),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vest_keren/app/modules/Function%20System/Gameplay/Views/GameStart_View.dart';
import 'package:vest_keren/app/modules/Function%20System/Gameplay/Views/TambahOrang_View.dart';
import 'package:vest_keren/app/modules/Function%20System/Gameplay/Views/TeamInfo_View.dart';
import 'package:vest_keren/app/modules/Function%20System/Monitoring/Drawer.dart';

import '../Gameplay/Views/Chart_View.dart';
import 'Monitoring_Controller.dart';

class MonitoringView extends GetView<MonitoringController> {
  @override
  final MonitoringController controller = Get.put(MonitoringController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: <Widget>[
                MainDrawer(),
                Expanded(
                  flex: 2,
                  child: Container(
                    width: Get.width,
                    height: Get.height,
                    color: const Color(0xFFD9D9D9),
                    child: Obx(() {
                      switch (controller.selectedIndex.value) {
                        case 0:
                          return ChartView();
                        case 1:
                          return GamestartView();
                        case 2:
                          return TambahorangView();
                        case 3:
                          return TeaminfoView();
                        default:
                          return MonitoringView();
                      }
                    }),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

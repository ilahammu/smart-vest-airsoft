import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vest_keren/app/modules/Function%20System/Gameplay/Views/GameStart_View.dart';
import 'package:vest_keren/app/modules/Function%20System/Gameplay/Views/TambahOrang_View.dart';
import 'package:vest_keren/app/modules/Function%20System/Gameplay/Views/TeamInfo_View.dart';
import 'package:vest_keren/app/modules/Function%20System/Drawer%20Monitoring/Drawer.dart';
import 'package:vest_keren/app/modules/Main%20Overview/Views/About_Views.dart';
import 'package:vest_keren/app/modules/Main%20Overview/Views/Information_view.dart';
import 'package:vest_keren/app/modules/Main%20Overview/Views/Overview_view.dart';

import '../Gameplay/Views/Chart_View.dart';
import 'Monitoring_Controller.dart';

class MonitoringView extends GetView<MonitoringController> {
  @override
  final MonitoringController controller = Get.put(MonitoringController());

  @override
  Widget build(BuildContext context) {
    const double drawerWidth = 200;

    return Scaffold(
      // ─────────── PERSISTENT APPBAR ───────────
      appBar: AppBar(
        title: Text(
          'Smart Vest Monitoring',
          style: GoogleFonts.tiltWarp(
              fontWeight: FontWeight.normal,
              fontSize: 30,
              color: const Color.fromARGB(255, 0, 0, 0)),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 153, 153, 153),
        elevation: 2,
      ),

      // ─────────── BODY: SIDEBAR + KONTEN ───────────
      body: Row(
        children: [
          // Sidebar (fixed width)
          SizedBox(
            width: drawerWidth,
            child: MainDrawer(),
          ),

          // Konten (dynamic)
          Expanded(
            child: Container(
              color: const Color.fromARGB(255, 254, 254, 254),
              child: Obx(() {
                switch (controller.selectedIndex.value) {
                  case 0:
                    return OverviewView();
                  case 1:
                    return ChartView();
                  case 2:
                    return GamestartView();
                  case 3:
                    return TambahorangView();
                  case 4:
                    return TeaminfoView();
                  case 5:
                    return InformationView();
                  case 6:
                    return AboutView();
                  default:
                    return Center(child: Text('Invalid selection'));
                }
              }),
            ),
          ),
        ],
      ),
    );
  }
}

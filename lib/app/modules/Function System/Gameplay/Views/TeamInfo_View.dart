import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Custom_Component/Table/Custom_Tabel-Orang.dart';
import '../Controllers/TeamInfo_Controller.dart';

class TeaminfoView extends GetView<TeaminfoController> {
  @override
  final TeaminfoController controller = Get.put(TeaminfoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.center,
            colors: [
              Color.fromARGB(255, 3, 0, 23),
              Color.fromARGB(255, 21, 20, 33),
              Color.fromARGB(255, 25, 24, 39),
            ],
          ),
        ),
        child: SingleChildScrollView(
          // ✅ Fix Overflow
          physics: BouncingScrollPhysics(), // ✅ Scroll lebih halus
          child: Center(
            child: Obx(() {
              if (controller.listDataTable.isEmpty) {
                return CircularProgressIndicator();
              } else {
                return CustomDatatabelperson(
                  listcolumn: controller.listColumn,
                  listdata: controller.listDataTable.toList(),
                  columnMap: controller.columnMap,
                );
              }
            }),
          ),
        ),
      ),
    );
  }
}

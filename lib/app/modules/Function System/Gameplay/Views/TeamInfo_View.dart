import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Custom_Component/Table/Custom_DataTabelPerson.dart';
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
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 51, 9, 63),
              const Color.fromARGB(255, 83, 48, 105),
              const Color.fromARGB(255, 0, 0, 0),
            ],
            begin: Alignment.topLeft,
            end: Alignment.centerRight,
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

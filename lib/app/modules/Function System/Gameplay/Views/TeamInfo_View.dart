import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Custom_Component/Table/Custom_Tabel-info-Team.dart';
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
            begin: Alignment.bottomRight,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 28, 28, 28),
              Color.fromARGB(255, 29, 31, 30),
              Color.fromARGB(255, 32, 33, 34),
            ],
          ),
        ),
        child: Center(
          child: Obx(() {
            if (controller.listDataTable.isEmpty) {
              return CircularProgressIndicator();
            } else {
              return CustomDatatabelperson(
                  listcolumn: controller.listColumn,
                  listdata: controller.listDataTable.toList(),
                  columnMap: controller.columnMap,
                  onDelete: (String id) async {
                    final int playerId = int.tryParse(id) ?? 0;
                    await controller.deletePlayer(playerId);
                  });
            }
          }),
        ),
      ),
    );
  }
}

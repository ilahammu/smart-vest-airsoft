import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vest_keren/app/modules/Information/Controllers/Vest_Controller.dart';
import 'package:vest_keren/app/Custom_Component/Table/Custom_DataTableVest.dart';
import 'package:vest_keren/app/Data/TableVest.dart';

class VestView extends GetView<VestController> {
  @override
  Widget build(BuildContext context) {
    final List<String> kolomHeader = ['Nomor', 'Hitspot', 'Damage Taken'];
    final List<DataTableModel> data = [
      DataTableModel(nomor: 1, hitspot: 'Shoulder', damageTaken: '20'),
      DataTableModel(nomor: 2, hitspot: 'Chest', damageTaken: '50-80'),
      DataTableModel(nomor: 3, hitspot: 'stomach', damageTaken: '50'),
      DataTableModel(nomor: 4, hitspot: 'back', damageTaken: '40'),
      // Tambahkan data lainnya di sini
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Vest'),
        backgroundColor: const Color.fromARGB(255, 138, 203, 233),
      ),
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.grey[300]!,
              const Color.fromARGB(255, 126, 116, 116)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Obx(() {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      controller.imagePath.value,
                      width: 500, // Adjust width as needed
                      height: 350, // Adjust height as needed
                      fit: BoxFit.contain,
                    ),
                    Image.asset(
                      controller.imagePath.value,
                      width: 500, // Adjust width as needed
                      height: 350, // Adjust height as needed
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                CustomDatatablevest(
                  data: data,
                  kolomHeader: kolomHeader,
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}

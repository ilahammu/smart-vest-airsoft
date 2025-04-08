import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/TambahOrang_Controller.dart';
import '../../../../Custom_Component/Dropdown/Custom_DropdownESP.dart';
import '../../../../Custom_Component/Dropdown/Custom_Dropdwon.dart';
import '../../../../Custom_Component/Card/Custom_CardAdd.dart';
import '../../../../Custom_Component/Card/Custom_Card_text.dart';

class TambahorangView extends StatelessWidget {
  final TambahorangController controller = Get.put(TambahorangController());

  final TextEditingController nameController = TextEditingController();
  final RxString selectedEsp32Id = RxString('');
  final RxString selectedTeam = RxString('');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Orang'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 90, 27, 206),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 51, 9, 63),
              const Color.fromARGB(255, 83, 48, 105),
              const Color.fromARGB(255, 0, 0, 0),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: CustomCardAdd(
            height: Get.height * 0.8,
            width: Get.width * 0.3,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomTextCard(
                    nama: 'Nickname',
                    child: TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Masukkan Nama',
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  CustomDropdownESP(
                    selectedValue: selectedEsp32Id,
                    onChanged: (newValue) {
                      selectedEsp32Id.value = newValue!;
                    },
                    items: controller.players,
                    hintText: 'Pilih ESP32 ID',
                  ),
                  const SizedBox(height: 16),
                  CustomDropdown(
                    selectedValue: selectedTeam,
                    onChanged: (newValue) {
                      selectedTeam.value = newValue!;
                    },
                    items: controller.teamsDropdown,
                    hintText: 'Pilih Team',
                  ),
                  const SizedBox(height: 16),
                  Obx(() {
                    return Align(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                        onPressed: controller.isLoading.value
                            ? null
                            : () async {
                                final name = nameController.text.trim();
                                if (name.isEmpty) {
                                  Get.snackbar(
                                      'Error', 'Nama tidak boleh kosong');
                                  return;
                                }
                                await controller.addPlayer(
                                    name, selectedEsp32Id.value, selectedTeam);
                              },
                        child: controller.isLoading.value
                            ? const CircularProgressIndicator(
                                color: Colors.white)
                            : const Text('Tambah'),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

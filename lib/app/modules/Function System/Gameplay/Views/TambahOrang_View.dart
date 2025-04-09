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
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 51, 9, 63),
              Color.fromARGB(255, 83, 48, 105),
              Color.fromARGB(255, 0, 0, 0),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              // Tali Gantung Kiri & Kanan
              Positioned(
                top: 0,
                left: Get.width * 0.30,
                child: Container(
                  width: 10,
                  height: 50,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              Positioned(
                top: 0,
                right: Get.width * 0.3,
                child: Container(
                  width: 10,
                  height: 50,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              Positioned(
                top: 0,
                right: Get.width * 0.32,
                child: Container(
                  width: 10,
                  height: 50,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              Positioned(
                top: 0,
                left: Get.width * 0.32,
                child: Container(
                  width: 10,
                  height: 50,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),

              // Blok Add Player
              Center(
                child: CustomCardAdd(
                  height: Get.height * 0.86,
                  width: Get.width * 0.3,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Center(
                          child: Text(
                            'Add Player',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
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
                                        name,
                                        selectedEsp32Id.value,
                                        selectedTeam,
                                      );
                                    },
                              child: controller.isLoading.value
                                  ? const CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : const Text('Tambah'),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

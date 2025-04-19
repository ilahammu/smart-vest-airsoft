import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';

import 'package:vest_keren/app/modules/Drawer/AppBar_Shared.dart';

import '../Controllers/Information_controller.dart';

class InformationView extends GetView<InformationController> {
  const InformationView({Key? key}) : super(key: key); // ✅ ini benar

  @override
  Widget build(BuildContext context) {
    return AppbarShared(
      backgroundColor: Colors.brown.shade900,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.centerRight,
                  colors: [
                    Color.fromARGB(255, 3, 0, 23),
                    Color.fromARGB(255, 21, 20, 33),
                    Color.fromARGB(255, 25, 24, 39),
                  ],
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Teks di kiri
                  Expanded(
                    flex: 2,
                    child: SlideInLeft(
                      key: UniqueKey(),
                      duration: const Duration(milliseconds: 1000),
                      delay: const Duration(milliseconds: 300),
                      child: Container(
                        padding: const EdgeInsets.all(40),
                        child: Text(
                          "SmartVest adalah proyek inovatif yang dirancang untuk meningkatkan pengalaman dan keakuratan dalam simulasi latihan tempur, khususnya permainan airsoft gun. Sistem ini mengintegrasikan teknologi ESP32, sensor piezoelectric, dan protokol komunikasi ESP-NOW untuk menciptakan rompi pintar yang mampu mendeteksi dan melaporkan titik benturan peluru secara real-time.",
                          style: GoogleFonts.roboto(
                            fontSize: 26,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  // Gambar di kanan
                  Expanded(
                    flex: 1,
                    child: SlideInRight(
                      key: UniqueKey(),
                      duration: const Duration(milliseconds: 2000),
                      delay: const Duration(milliseconds: 300),
                      child: Column(
                        children: [
                          // Gambar 1
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              image: const DecorationImage(
                                image: AssetImage("assets/images/militer.jpg"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),

                          // Gambar 2
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              image: const DecorationImage(
                                image:
                                    AssetImage("assets/images/militer2.jpeg"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color.fromARGB(255, 3, 0, 23),
                    Color.fromARGB(255, 21, 20, 33),
                    Color.fromARGB(255, 25, 24, 39),
                  ],
                ),
              ),
              width: double.infinity,
              height: 500,
              child: Center(
                child: Text(
                  "Information",
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 3, 0, 23),
                    Color.fromARGB(255, 21, 20, 33),
                    Color.fromARGB(255, 25, 24, 39),
                  ],
                ),
              ),
              width: double.infinity,
              height: 500,
              child: Text(
                "Information",
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

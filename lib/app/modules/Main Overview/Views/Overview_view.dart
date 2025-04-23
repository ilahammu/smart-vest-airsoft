import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vest_keren/app/modules/Main%20Overview/AppBar_Shared.dart';

import '../Controllers/Overview_controller.dart';

class OverviewView extends GetView<OverviewController> {
  const OverviewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppbarShared(
      backgroundColor: Colors.transparent,
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/logo/orangMiliter.png"),
            fit: BoxFit.contain,
          ),
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Teks utama
              Text(
                "Welcome to Smart Vest\nMonitoring System",
                style: GoogleFonts.tiltWarp(
                  fontSize: 74,
                  color: const Color.fromARGB(255, 64, 90, 119),
                ),
              ),
              const SizedBox(height: 80),

              // Bagian bawah: teks preview dan tombol
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "System Monitoring Preview ►",
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      color: const Color.fromARGB(179, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 12),
                  TextButton(
                    onPressed: () {
                      Get.toNamed('/monitoring');
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 6, 72, 139),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                    ),
                    child: const Text(
                      "Get Started",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

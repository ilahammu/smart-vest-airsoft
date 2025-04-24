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
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/logo/orangMiliter.png"),
            fit: BoxFit.contain,
          ),
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 3, 0, 23),
              Color.fromARGB(255, 32, 31, 39),
              Color.fromARGB(255, 25, 24, 39),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Teks utama
              Container(
                padding: EdgeInsets.only(
                    bottom: 50), // Spasi agar tidak terlalu mepet
                child: Text(
                  "Welcome to Smart Vest\nMonitoring System",
                  style: GoogleFonts.tiltWarp(
                    fontSize: MediaQuery.of(context).size.width > 600
                        ? 70
                        : 40, // Responsif ukuran font
                    color: const Color.fromARGB(255, 64, 90, 119),
                  ),
                ),
              ),

              // Bagian bawah: teks preview dan tombol
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "System Monitoring Preview ►",
                    style: GoogleFonts.poppins(
                      fontSize: MediaQuery.of(context).size.width > 400
                          ? 22
                          : 14, // Responsif ukuran font
                      color: const Color.fromARGB(179, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Tombol Get Started
                  Flexible(
                    // Menggunakan Flexible agar tombol menyesuaikan ruang
                    child: TextButton(
                      onPressed: () {
                        Get.toNamed('/monitoring');
                      },
                      style: TextButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 80, 126, 171),
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width > 400
                              ? 20
                              : 12, // Responsif padding
                          vertical: MediaQuery.of(context).size.width > 400
                              ? 12
                              : 8, // Responsif padding
                        ),
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

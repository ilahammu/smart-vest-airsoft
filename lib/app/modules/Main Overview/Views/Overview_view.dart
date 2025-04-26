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
                padding: const EdgeInsets.only(bottom: 50),
                child: Text(
                  "Welcome to Smart Vest\nMonitoring System",
                  style: GoogleFonts.tiltWarp(
                    fontSize: MediaQuery.of(context).size.width > 600 ? 70 : 40,
                    color: const Color.fromARGB(255, 64, 90, 119),
                  ),
                ),
              ),

              // Responsif: row di desktop, column di mobile
              LayoutBuilder(
                builder: (context, constraints) {
                  final isMobile = constraints.maxWidth <= 500;

                  return isMobile
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "System Monitoring Preview ►",
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextButton(
                              onPressed: () {
                                Get.toNamed('/monitoring');
                              },
                              style: TextButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 27, 42, 1),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                              ),
                              child: Text(
                                "Get Started",
                                style: GoogleFonts.tiltWarp(
                                  fontSize: 14,
                                  color:
                                      const Color.fromARGB(255, 255, 214, 10),
                                ),
                              ),
                            ),
                          ],
                        )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "System Monitoring Preview ►",
                              style: GoogleFonts.poppins(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 12),
                            TextButton(
                              onPressed: () {
                                Get.toNamed('/monitoring');
                              },
                              style: TextButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 27, 42, 1),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 12),
                              ),
                              child: Text(
                                "Get Started",
                                style: GoogleFonts.tiltWarp(
                                  fontSize: 20,
                                  color:
                                      const Color.fromARGB(255, 255, 214, 10),
                                ),
                              ),
                            ),
                          ],
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

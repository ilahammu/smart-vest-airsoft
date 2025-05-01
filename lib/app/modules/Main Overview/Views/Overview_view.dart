import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vest_keren/app/modules/Main%20Overview/AppBar_Shared.dart';

class OverviewView extends StatelessWidget {
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
              Color.fromARGB(255, 28, 28, 28),
              Color.fromARGB(255, 29, 31, 30),
              Color.fromARGB(255, 32, 33, 34),
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
                  return const SizedBox(); // LayoutBuilder tetap ada, tetapi tidak menampilkan apa pun
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

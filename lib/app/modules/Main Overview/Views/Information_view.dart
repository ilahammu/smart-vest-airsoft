import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';

import 'package:vest_keren/app/modules/Main%20Overview/AppBar_Shared.dart';

class InformationView extends StatelessWidget {
  const InformationView({Key? key}) : super(key: key); // ✅ ini benar

  @override
  Widget build(BuildContext context) {
    return AppbarShared(
      backgroundColor: Colors.brown.shade900,
      child: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: FadeInDown(
                  key: UniqueKey(),
                  duration: const Duration(milliseconds: 1000),
                  delay: const Duration(milliseconds: 300),
                  child: _cardTitle(
                    "Informasi SmartVest",
                  ),
                ),
              ),

              // Informasi SmartVest
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                          style: GoogleFonts.akshar(
                            fontSize: 26,
                            color: const Color.fromARGB(175, 255, 255, 255),
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
                                image: AssetImage(
                                    "assets/images/Information/militer.jpg"),
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
                                image: AssetImage(
                                    "assets/images/Information/militer2.jpeg"),
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

              // Fitur utama
              const SizedBox(height: 50),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Judul
                    FadeInDown(
                      key: UniqueKey(),
                      duration: const Duration(milliseconds: 1000),
                      delay: const Duration(milliseconds: 300),
                      child: _cardTitle(
                        "Fitur Utama",
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Bullet points
                    FadeInUp(
                      key: UniqueKey(),
                      duration: const Duration(milliseconds: 1000),
                      delay: const Duration(milliseconds: 300),
                      child: _build_Feature(
                        "Deteksi Peluru",
                        [
                          "Menggunakan sensor piezoelectric untuk mendeteksi peluru yang mengenai rompi.",
                          "Memberikan umpan balik real-time kepada pengguna.",
                        ],
                      ),
                    ),
                    FadeInUp(
                      key: UniqueKey(),
                      duration: const Duration(milliseconds: 1000),
                      delay: const Duration(milliseconds: 600),
                      child: _build_Feature(
                        "Komunikasi ESP-NOW",
                        [
                          "Menggunakan protokol komunikasi ESP-NOW untuk mengirim data secara efisien.",
                          "Memungkinkan komunikasi antara beberapa perangkat tanpa perlu koneksi internet.",
                        ],
                      ),
                    ),
                    FadeInUp(
                      key: UniqueKey(),
                      duration: const Duration(milliseconds: 1000),
                      delay: const Duration(milliseconds: 900),
                      child: _build_Feature(
                        "Desain Ergonomis",
                        [
                          "Dirancang untuk kenyamanan dan mobilitas pengguna.",
                          "Cocok untuk berbagai jenis latihan tempur dan permainan airsoft gun.",
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Komponen utama
              const SizedBox(height: 50),
              Container(
                child: Column(
                  children: [
                    FadeInDown(
                      key: UniqueKey(),
                      duration: const Duration(milliseconds: 1000),
                      delay: const Duration(milliseconds: 300),
                      child: _cardTitle("Komponen Utama"),
                    ),
                    const SizedBox(height: 20),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _build_Komponen("Mikro ESP32 ",
                                "assets/images/Information/mikro.png"),
                            const SizedBox(width: 30),
                            _build_Komponen("Sensor Piezoelectrik",
                                "assets/images/Information/piezo.png"),
                            const SizedBox(width: 30),
                            _build_Komponen("Modul Wifi(ESP-NOW)",
                                "assets/images/Information/wifi.png"),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _build_Komponen("Tampilan Website",
                                "assets/images/Information/web.png"),
                            const SizedBox(width: 30),
                            _build_Komponen("Komponen 5",
                                "assets/images/Information/api.png"),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Tujuan proyek
              const SizedBox(height: 20),
              Container(
                child: Column(
                  children: [
                    FadeInDown(
                      key: UniqueKey(),
                      duration: const Duration(milliseconds: 1000),
                      delay: const Duration(milliseconds: 300),
                      child: _cardTitle("Tujuan Proyek"),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: _build_Tujuan([
                        "Meningkatkan realisme simulasi pertempuran untuk pelatihan atau rekreasi.",
                        "Memberikan data evaluasi tembakan yang obyektif kepada pemain atau instruktur.",
                        "Mencegah kecurangan dengan sistem hit detection otomatis.",
                      ]),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _cardTitle(String title) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(99, 16, 13, 13),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(20),
        child: Text(
          title,
          style: GoogleFonts.koHo(
            fontWeight: FontWeight.bold,
            fontSize: 50,
            color: const Color.fromARGB(255, 214, 255, 63),
          ),
        ),
      ),
    ),
  );
}

Widget _build_Feature(String title, List<String> subPoints) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0),
    child: Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color.fromARGB(30, 16, 13, 13),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "• $title",
            style: GoogleFonts.akshar(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.amberAccent,
            ),
          ),
          ...subPoints.map((point) => Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 4.0),
                child: Text(
                  "➤ $point",
                  style: GoogleFonts.akshar(
                    fontSize: 26,
                    color: const Color.fromARGB(150, 255, 255, 255),
                  ),
                ),
              )),
        ],
      ),
    ),
  );
}

Widget _build_Komponen(String name, String imagePath) {
  return Container(
    padding: const EdgeInsets.all(12),
    width: 200,
    height: 200,
    margin: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: const Color.fromARGB(76, 139, 159, 175),
      borderRadius: BorderRadius.circular(15),
    ),
    child: Column(
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: GoogleFonts.acme(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}

Widget _build_Tujuan(List<String> text) {
  return Container(
    width: Get.width * 0.8,
    height: Get.height * 0.3,
    padding: const EdgeInsets.all(40),
    decoration: BoxDecoration(
      color: const Color.fromARGB(111, 16, 13, 13),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: text
          .map((point) => Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 4.0),
                child: Text(
                  "➤ $point",
                  style: GoogleFonts.akshar(
                    fontSize: 26,
                    color: const Color.fromARGB(150, 255, 255, 255),
                  ),
                ),
              ))
          .toList(),
    ),
  );
}

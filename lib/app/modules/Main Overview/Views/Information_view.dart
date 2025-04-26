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
                    context,
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
                            fontSize: MediaQuery.of(context).size.width > 600
                                ? 26
                                : 18,
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
                            height: MediaQuery.of(context).size.width > 600
                                ? 250
                                : 150,
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
                            height: MediaQuery.of(context).size.width > 600
                                ? 250
                                : 150,
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
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: FadeInDown(
                  key: UniqueKey(),
                  duration: const Duration(milliseconds: 1000),
                  delay: const Duration(milliseconds: 300),
                  child: _cardTitle(
                    "Ftur Utama",
                    context,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Judul
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

              // Komponen utama
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: FadeInDown(
                  key: UniqueKey(),
                  duration: const Duration(milliseconds: 1000),
                  delay: const Duration(milliseconds: 300),
                  child: _cardTitle(
                    "Ftur Utama",
                    context,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              LayoutBuilder(
                builder: (context, constraints) {
                  final isDesktop = constraints.maxWidth > 1000;

                  if (isDesktop) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _build_Komponen(
                                  "Mikro ESP32",
                                  "assets/images/Information/mikro.png",
                                  context),
                              const SizedBox(width: 20),
                              _build_Komponen(
                                  "Sensor Piezoelectrik",
                                  "assets/images/Information/piezo.png",
                                  context),
                              const SizedBox(width: 20),
                              _build_Komponen(
                                  "Modul Wifi(ESP-NOW)",
                                  "assets/images/Information/wifi.png",
                                  context),
                            ],
                          ),
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _build_Komponen("Tampilan Website",
                                  "assets/images/Information/web.png", context),
                              const SizedBox(width: 20),
                              _build_Komponen("Komponen 5",
                                  "assets/images/Information/api.png", context),
                            ],
                          ),
                        ],
                      ),
                    );
                  } else {
                    // Untuk mobile & tablet
                    int crossAxisCount = constraints.maxWidth > 600 ? 3 : 2;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: GridView.count(
                        crossAxisCount: crossAxisCount,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        children: [
                          _build_Komponen("Mikro ESP32",
                              "assets/images/Information/mikro.png", context),
                          _build_Komponen("Sensor Piezoelectrik",
                              "assets/images/Information/piezo.png", context),
                          _build_Komponen("Modul Wifi(ESP-NOW)",
                              "assets/images/Information/wifi.png", context),
                          _build_Komponen("Tampilan Website",
                              "assets/images/Information/web.png", context),
                          _build_Komponen("Komponen 5",
                              "assets/images/Information/api.png", context),
                        ],
                      ),
                    );
                  }
                },
              ),

              // Tujuan proyek
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: FadeInDown(
                  key: UniqueKey(),
                  duration: const Duration(milliseconds: 1000),
                  delay: const Duration(milliseconds: 300),
                  child: _cardTitle(
                    "Ftur Utama",
                    context,
                  ),
                ),
              ),
              Column(
                children: [
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: _build_Tujuan(
                      [
                        "Meningkatkan realisme simulasi pertempuran untuk pelatihan atau rekreasi.",
                        "Memberikan data evaluasi tembakan yang obyektif kepada pemain atau instruktur.",
                        "Mencegah kecurangan dengan sistem hit detection otomatis.",
                      ],
                      context,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _cardTitle(String title, BuildContext context) {
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
            fontSize: MediaQuery.of(context).size.width > 600 ? 40 : 26,
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
      // Hapus height: 200 dan ganti dengan minHeight
      constraints: const BoxConstraints(minHeight: 200),
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

Widget _build_Komponen(String name, String imagePath, BuildContext context) {
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
          width: MediaQuery.of(context).size.width > 600 ? 120 : 100,
          height: MediaQuery.of(context).size.width > 600 ? 120 : 100,
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
            fontSize: MediaQuery.of(context).size.width > 600 ? 16 : 14,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}

Widget _build_Tujuan(List<String> text, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Container(
      constraints: const BoxConstraints(minHeight: 200),
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
                      fontSize:
                          MediaQuery.of(context).size.width > 600 ? 26 : 18,
                      color: const Color.fromARGB(150, 255, 255, 255),
                    ),
                  ),
                ))
            .toList(),
      ),
    ),
  );
}

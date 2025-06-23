import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vest_keren/app/modules/Main%20Overview/AppBar_Shared.dart';

class AboutView extends StatelessWidget {
  const AboutView({Key? key}) : super(key: key);

  final List<Map<String, String>> anggota = const [
    {
      "foto": 'assets/images/Anggota/PRI.jpeg',
      'name': 'Periyadi, S.T., M.T.',
      'role': 'Ketua Proyek'
    },
    {
      'foto': 'assets/images/Anggota/GVA.jpeg',
      'name': 'Giva Andriana Mutiara, S.T., M.T., Ph.D ',
      'role': 'Dosen'
    },
    {
      'foto': 'assets/images/Anggota/RQY.jpeg',
      'name': 'Muhammad Rizqy Alfarisi, S.ST, M.T.',
      'role': 'Dosen'
    },
    {
      'foto': 'assets/images/Anggota/bowo.jpeg',
      'name': 'Muhammad Abyan Wibowo, A.Md Kom',
      'role': 'PIC Smart Vest'
    },
    {
      'foto': 'assets/images/Anggota/raka2.jpg',
      'name': 'Raka Duta Adhira',
      'role': 'Anggota Smart Vest'
    },
    {
      'foto': 'assets/images/Anggota/Ilham2.jpg',
      'name': 'Ilham Muhijri Yosefin',
      'role': 'Anggota Smart Vest'
    },
    {
      'foto': 'assets/images/Anggota/faris2.jpg',
      'name': 'Faris Aziz Fatahillah',
      'role': 'Anggota Smart Vest'
    },
    {
      'foto': 'assets/images/Anggota/ririn.png',
      'name': 'Rinjani Afizah Wulandari',
      'role': 'Anggota Smart Vest'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return AppbarShared(
      backgroundColor: Colors.brown.shade900,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                decoration: const BoxDecoration(
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Tim Pengembang SmartVest",
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      children: anggota
                          .take(3)
                          .map((data) => _buildAnggotaCard(data))
                          .toList(),
                    ),
                    const SizedBox(height: 30),
                    Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      alignment: WrapAlignment.center,
                      children: anggota
                          .skip(3)
                          .map((data) => _buildAnggotaCard(data))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget _buildAnggotaCard(Map<String, String> data) {
  return Container(
    width: 230,
    padding: const EdgeInsets.all(26),
    decoration: BoxDecoration(
      color: Colors.brown.shade900.withOpacity(0.25),
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.6),
          blurRadius: 3,
          offset: const Offset(0, 10),
        ),
      ],
    ),
    child: Column(
      children: [
        CircleAvatar(
          radius: 60,
          backgroundColor: Colors.greenAccent,
          backgroundImage:
              data['foto'] != null ? AssetImage(data['foto']!) : null,
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 50, // Ubah sesuai kebutuhan
          child: Text(
            data['name'] ?? '',
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.tiltWarp(
              color: const Color.fromARGB(179, 255, 199, 43),
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),

        const SizedBox(height: 20),

        // Role dengan tinggi tetap
        SizedBox(
          height: 20,
          child: Text(
            data['role'] ?? '',
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.tiltWarp(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
      ],
    ),
  );
}

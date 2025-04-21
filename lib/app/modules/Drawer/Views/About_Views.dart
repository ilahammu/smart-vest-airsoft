import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vest_keren/app/modules/Drawer/AppBar_Shared.dart';

import '../Controllers/About_Controller.dart';

class AboutView extends GetView<AboutController> {
  const AboutView({Key? key}) : super(key: key);

  final List<Map<String, String>> anggota = const [
    {
      "image.asset": 'assets/images/api.png',
      'name': 'Periyadi, S.T., M.T.',
      'role': 'Ketua Proyek'
    },
    {
      'initial': 'AL',
      'name': 'Giva Andriana Mutiara, S.T., M.T., Ph.D ',
      'role': 'Backend Engineer'
    },
    {
      'initial': 'MR',
      'name': 'Muhammad Rizqy Alfarisi, S.ST, M.T.',
      'role': 'Dosen'
    },
    {
      'initial': 'FD',
      'name': 'Muhammad Abyan Wibowo',
      'role': 'PIC Smart Vest'
    },
    {'initial': 'AN', 'name': 'Raka Duta Adhira', 'role': 'Anggota Smart Vest'},
    {
      'initial': 'AN',
      'name': 'Ilham Muhijri Yosefin',
      'role': 'Anggota Smart Vest'
    },
    {
      'initial': 'AN',
      'name': 'Faris Aziz Fatahillah',
      'role': 'Anggota Smart Vest'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return AppbarShared(
      backgroundColor: Colors.brown.shade900,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topRight,
            colors: [
              Color.fromARGB(255, 3, 0, 23),
              Color.fromARGB(255, 21, 20, 33),
              Color.fromARGB(255, 25, 24, 39),
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
              spacing: 50,
              runSpacing: 20,
              alignment: WrapAlignment.center,
              children: anggota.map((data) => _buildAnggotaCard(data)).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnggotaCard(Map<String, String> data) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.brown.shade900.withOpacity(0.8),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.greenAccent,
            child: Text(
              data['Image.asset'] ?? '',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            data['name'] ?? '',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            data['role'] ?? '',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

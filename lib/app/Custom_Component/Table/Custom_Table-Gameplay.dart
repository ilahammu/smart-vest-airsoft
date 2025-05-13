import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:data_table_2/data_table_2.dart';
import '../../data/Table-Hitpoint-Gameplay.dart';
import '../../data/TableGameplay.dart';

import '../../modules/Function System/Gameplay/Controllers/GameStart_Controller.dart'; // Pastikan ini diimpor

class CustomDataTableGameplay extends StatelessWidget {
  final List<DataTableGameplay> dataList;
  final List<DataTableHitpoint> hitpointList;
  final bool gameStarted;

  const CustomDataTableGameplay({
    Key? key,
    required this.dataList,
    required this.gameStarted,
    required this.hitpointList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GamestartController controller = Get.find();

    // 🔥 Pisahkan pemain berdasarkan tim
    final teamAPlayers =
        dataList.where((p) => p.selectedTeam == "TeamA").toList();
    final teamBPlayers =
        dataList.where((p) => p.selectedTeam == "TeamB").toList();

    // 🔥 Tentukan jumlah maksimum baris untuk menjaga keseimbangan tampilan
    final maxRows = teamAPlayers.length > teamBPlayers.length
        ? teamAPlayers.length
        : teamBPlayers.length;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // 🔥 Notifikasi jika salah satu tim kalah
          if (teamAPlayers.any((p) => p.health <= 0) ||
              teamBPlayers.any((p) => p.health <= 0))
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                teamAPlayers.any((p) => p.health <= 0)
                    ? "🔥 BLUE TEAM WINS!"
                    : "🔥 RED TEAM WINS!",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

          // 🔥 Tabel Data Pemain (Akan ditampilkan jika game dimulai)
          Expanded(
            child: Offstage(
              offstage:
                  !gameStarted, // Tabel hanya muncul jika game sudah dimulai
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: const Color.fromARGB(255, 58, 56, 56),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DataTable2(
                    border: TableBorder.all(color: Colors.black, width: 3),
                    columnSpacing: 0, // 🔥 Atur jarak antar kolom
                    horizontalMargin: 0, // 🔥 Atur margin horizontal
                    minWidth: 0, // 🔥 Pastikan tabel menyesuaikan lebar layar
                    dataRowHeight: 60, // 🔥 Pastikan tinggi cukup untuk teks
                    columns: [
                      DataColumn(
                          label: _buildHeaderCell("RED TEAM", Colors.red)),
                      DataColumn(
                          label: _buildHeaderCell("Nama", Colors.redAccent)),
                      DataColumn(
                          label: _buildHeaderCell(
                              "Health Point", Colors.redAccent)),
                      DataColumn(
                          label: _buildHeaderCell("BLUE TEAM", Colors.blue)),
                      DataColumn(
                          label: _buildHeaderCell("Nama", Colors.blueAccent)),
                      DataColumn(
                          label: _buildHeaderCell(
                              "Health Point", Colors.blueAccent)),
                    ],
                    rows: [
                      for (int i = 0; i < maxRows; i++)
                        DataRow(cells: [
                          // 🔥 Kolom Team Red
                          DataCell(_buildDataCell(i < teamAPlayers.length
                              ? (i + 1).toString()
                              : "-")),
                          DataCell(_buildDataCell(i < teamAPlayers.length
                              ? teamAPlayers[i].name
                              : "-")),
                          DataCell(i < teamAPlayers.length
                              ? _buildHealthCell(teamAPlayers[i], controller)
                              : _buildDataCell("-")),

                          // 🔥 Kolom Team Blue
                          DataCell(_buildDataCell(i < teamBPlayers.length
                              ? (i + 1).toString()
                              : "-")),
                          DataCell(_buildDataCell(i < teamBPlayers.length
                              ? teamBPlayers[i].name
                              : "-")),
                          DataCell(i < teamBPlayers.length
                              ? _buildHealthCell(teamBPlayers[i], controller)
                              : _buildDataCell("-")),
                        ]),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // 🔥 Tabel untuk History Log (Dapatkan data dari hitpointLog)
          Expanded(
            child: Offstage(
              offstage: !gameStarted, // Tabel hanya muncul jika game dimulai
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: const Color.fromARGB(255, 58, 56, 56),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DataTable2(
                    border: TableBorder.all(color: Colors.black, width: 3),
                    columnSpacing: 0,
                    horizontalMargin: 0,
                    minWidth: 0,
                    dataRowHeight: 60,
                    columns: [
                      DataColumn(label: _buildHeaderCell("Nama", Colors.green)),
                      DataColumn(label: _buildHeaderCell("Team", Colors.green)),
                      DataColumn(
                          label: _buildHeaderCell("Bagian", Colors.green)),
                      DataColumn(
                          label: _buildHeaderCell("TimeStamp", Colors.green)),
                    ],
                    rows: hitpointList.map((log) {
                      return DataRow(cells: [
                        DataCell(Text(log.name)),
                        DataCell(Text(log.team.toString())),
                        DataCell(Text(log.hitpoint.toString())),
                        DataCell(Text(log.timestamp.toString())),
                      ]);
                    }).toList(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 🔥 Widget untuk Cell Header
  Widget _buildHeaderCell(String title, Color color) {
    return Container(
      color: color,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8),
      child: Text(
        title,
        style: GoogleFonts.ramabhadra(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }

  // 🔥 Widget untuk Cell Data
  Widget _buildDataCell(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      alignment: Alignment.center,
      child: Text(
        text,
        style: GoogleFonts.roboto(
          color: Colors.black,
          fontSize: 20,
        ),
        overflow: TextOverflow.ellipsis, // 🔥 Mencegah Overflow
        softWrap: false,
      ),
    );
  }

  // 🔥 Fungsi untuk Menampilkan HP dan Status Ready di dalam Tabel
  Widget _buildHealthCell(
      DataTableGameplay player, GamestartController controller) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Tampilkan health hanya jika lebih dari 0, jika 0 tampilkan background abu-abu
          if (player.health > 0)
            Text(player.health.toString(), style: _dataStyle())
          else
            const SizedBox.shrink(), // Menghilangkan angka 0

          const SizedBox(height: 5),

          // 🔥 Status Ready/Not Ready
          if (!gameStarted)
            Text(
              player.statusReady ? "Ready" : "Not Ready",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: player.statusReady ? Colors.green : Colors.white,
              ),
            ),
        ],
      ),
    );
  }

  // 🔥 Styling Data Tabel
  TextStyle _dataStyle() {
    return GoogleFonts.roboto(
      color: Colors.black,
      fontWeight: FontWeight.normal,
      fontSize: 18,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:data_table_2/data_table_2.dart';

import '../../data/Table-Hitpoint-Gameplay.dart';
import '../../data/TableGameplay.dart';
import '../../modules/Function System/Gameplay/Controllers/GameStart_Controller.dart';

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

    // Pisahkan pemain berdasarkan tim
    final teamAPlayers =
        dataList.where((p) => p.selectedTeam == "TeamA").toList();
    final teamBPlayers =
        dataList.where((p) => p.selectedTeam == "TeamB").toList();

    // Tentukan jumlah maksimum baris untuk menjaga keseimbangan tampilan
    final maxRows = teamAPlayers.length > teamBPlayers.length
        ? teamAPlayers.length
        : teamBPlayers.length;

    // Status game selesai
    bool gameFinished = teamAPlayers.any((p) => p.health <= 0) ||
        teamBPlayers.any((p) => p.health <= 0);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // 🔥 Notifikasi jika salah satu tim kalah
          if (gameFinished)
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 99, 211, 108),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                teamAPlayers.any((p) => p.health <= 0)
                    ? "BLUE TEAM VICTORY!"
                    : "RED TEAM VICTORY!",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

          // 🔥 Tabel Data Pemain (Akan ditampilkan jika game dimulai)
          Expanded(
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
                    DataColumn(label: _buildHeaderCell("TEAM A", Colors.red)),
                    DataColumn(
                        label: _buildHeaderCell("NAMA", Colors.redAccent)),
                    DataColumn(
                        label:
                            _buildHeaderCell("HEALTH POINT", Colors.redAccent)),
                    DataColumn(label: _buildHeaderCell("TEAM B", Colors.blue)),
                    DataColumn(
                        label: _buildHeaderCell("NAMA", Colors.blueAccent)),
                    DataColumn(
                        label: _buildHeaderCell(
                            "HEALTH POINT", Colors.blueAccent)),
                  ],
                  rows: [
                    for (int i = 0; i < maxRows; i++)
                      DataRow(cells: [
                        DataCell(_buildHitpointLog(i < teamAPlayers.length
                            ? (i + 1).toString()
                            : "-")),
                        DataCell(_buildHitpointLog(i < teamAPlayers.length
                            ? teamAPlayers[i].name
                            : "-")),
                        DataCell(i < teamAPlayers.length
                            ? _buildGameplayTable(teamAPlayers[i], controller)
                            : _buildHitpointLog("-")),
                        DataCell(_buildHitpointLog(i < teamBPlayers.length
                            ? (i + 1).toString()
                            : "-")),
                        DataCell(_buildHitpointLog(i < teamBPlayers.length
                            ? teamBPlayers[i].name
                            : "-")),
                        DataCell(i < teamBPlayers.length
                            ? _buildGameplayTable(teamBPlayers[i], controller)
                            : _buildHitpointLog("-")),
                      ]),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 20), // Jarak antara tabel pertama dan kedua

          // 🔥 Tabel Kedua (Hitpoint)
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
                      DataColumn(
                          label: _buildHeaderCell(
                              "Nama", const Color.fromARGB(255, 0, 0, 0))),
                      DataColumn(
                          label: _buildHeaderCell(
                              "Team", const Color.fromARGB(255, 0, 0, 0))),
                      DataColumn(
                          label: _buildHeaderCell(
                              "Bagian", const Color.fromARGB(255, 0, 0, 0))),
                      DataColumn(
                          label: _buildHeaderCell("Waktu Tembakan",
                              const Color.fromARGB(255, 0, 0, 0))),
                    ],
                    rows: hitpointList.map((log) {
                      return DataRow(cells: [
                        DataCell(
                          Center(
                            child: Text(
                              log.name,
                              style: GoogleFonts.questrial(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: Text(
                              log.team,
                              style: GoogleFonts.questrial(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: Text(
                              log.hitpointDescription.toString(),
                              style: GoogleFonts.questrial(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: Text(
                              DateFormat('HH:mm:ss').format(
                                  log.timestamp.add(Duration(hours: 7))),
                              style: GoogleFonts.questrial(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ]);
                    }).toList(),
                  ),
                ),
              ),
            ),
          ),

          // 🔥 Button Reset
          if (gameFinished)
            ElevatedButton(
              onPressed: () async {
                await controller.resetGame(); // Panggil fungsi reset game
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: const Text(
                "Reset Game",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }

  // Widget untuk Cell Header
  Widget _buildHeaderCell(String title, Color color) {
    return Container(
      color: color,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8),
      child: Text(
        title,
        style: GoogleFonts.questrial(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
    );
  }

  // Widget untuk Cell Data
  Widget _buildHitpointLog(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      alignment: Alignment.center,
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.questrial(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
          overflow: TextOverflow.ellipsis, // Mencegah Overflow
          softWrap: false,
        ),
      ),
    );
  }

  // Fungsi untuk Menampilkan HP dan Status Ready di dalam Tabel
  Widget _buildGameplayTable(
      DataTableGameplay player, GamestartController controller) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (player.health > 0)
            Text(
              player.health.toString(),
              style: _dataStyle(),
            )
          else
            Text(
              "DEFEAT",
              style: TextStyle(
                fontSize: 25, // Ukuran font
                fontWeight: FontWeight.bold, // Ketebalan teks
                color: Colors.red, // Warna teks
              ),
            ),

          const SizedBox(height: 5),

          // Status Ready/Not Ready
          if (!gameStarted)
            Text(
              player.statusReady ? "Ready" : "Not Ready",
              style: GoogleFonts.tiltPrism(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: player.statusReady ? Colors.green : Colors.white,
              ),
            ),
        ],
      ),
    );
  }

  // Styling Data Tabel
  TextStyle _dataStyle() {
    return GoogleFonts.questrial(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    );
  }

  // Fungsi Reset Game
}

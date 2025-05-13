import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../data/TableGameplay.dart';
import '../../modules/Function System/Gameplay/Controllers/GameStart_Controller.dart';
import '../../Custom_Component/Table/Custom_Tabel.dart'; // Pastikan ini diimpor

class CustomDataTable extends StatelessWidget {
  final List<DataTableGameplay> dataList;
  final bool gameStarted;

  const CustomDataTable({
    Key? key,
    required this.dataList,
    required this.gameStarted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GamestartController controller = Get.find();

    // 🔥 Pisahkan pemain berdasarkan tim
    final teamAPlayers =
        dataList.where((p) => p.selectedTeam == "TeamA").toList();
    final teamBPlayers =
        dataList.where((p) => p.selectedTeam == "TeamB").toList();

    // 🔥 Cek apakah salah satu tim sudah kalah
    final teamADead =
        teamAPlayers.isNotEmpty && teamAPlayers.every((p) => p.health <= 0);
    final teamBDead =
        teamBPlayers.isNotEmpty && teamBPlayers.every((p) => p.health <= 0);

    // 🔥 Tentukan jumlah maksimum baris untuk menjaga keseimbangan tampilan
    final maxRows = teamAPlayers.length > teamBPlayers.length
        ? teamAPlayers.length
        : teamBPlayers.length;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // 🔥 Notifikasi jika salah satu tim kalah
          if (teamADead || teamBDead)
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                teamADead ? "🔥 BLUE TEAM WINS!" : "🔥 RED TEAM WINS!",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

          // 🔥 Tabel Data Pemain
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
                  columnSpacing: 0, // 🔥 Atur jarak antar kolom
                  horizontalMargin: 0, // 🔥 Atur margin horizontal
                  minWidth: 0, // 🔥 Pastikan tabel menyesuaikan lebar layar
                  dataRowHeight: 60, // 🔥 Pastikan tinggi cukup untuk teks
                  columns: [
                    DataColumn(label: _buildHeaderCell("RED TEAM", Colors.red)),
                    DataColumn(
                        label: _buildHeaderCell("Nama", Colors.redAccent)),
                    DataColumn(
                        label:
                            _buildHeaderCell("Health Point", Colors.redAccent)),
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

          // 🔥 Tabel Dummy di bawah tabel utama
          const SizedBox(
              height: 10), // Jarak antara tabel utama dan tabel dummy
          CustomTable(
            data: [
              {
                'Nama': 'Ilham',
                'Team': 'Team A',
                'Bagian': 'Bahu Kiri',
                'TimeStamp': '12:12:43',
              },
              {
                'Nama': 'Raka',
                'Team': 'Team B',
                'Bagian': 'Punggung Kanan',
                'TimeStamp': '12:15:44',
              },
              {
                'Nama': 'Fahri',
                'Team': 'Team A',
                'Bagian': 'Pinggang Kiri',
                'TimeStamp': '12:16:12',
              },
              {
                'Nama': 'Faris',
                'Team': 'Team B',
                'Bagian': 'Jantung',
                'TimeStamp': '12:21:07',
              },
              {
                'Nama': 'Raka',
                'Team': 'Team A',
                'Bagian': 'Jantung',
                'TimeStamp': '12:23:14',
              },
            ],
            columns: ['Nama', 'Team', 'Bagian', 'TimeStamp'],
            headingColor: const Color.fromARGB(
                255, 52, 51, 51), // Provide a color for the heading
            dataRowColor: const Color.fromARGB(
                255, 147, 146, 146), // Provide a color for the data rows
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

          // 🔥 Jika pemain kehabisan darah, tampilkan DEFEAT dan background abu-abu
          if (player.health <= 0)
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: const Text(
                "DEFEAT",
                style: TextStyle(
                  fontSize: 25,
                  color: Color.fromARGB(255, 255, 0, 0),
                  fontWeight: FontWeight.bold,
                ),
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

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../data/TableGameplay.dart';

class CustomDataTable extends StatelessWidget {
  final List<DataTableGameplay> dataList;

  const CustomDataTable({
    Key? key,
    required this.dataList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 🔥 Pisahkan pemain berdasarkan tim
    final teamAPlayers =
        dataList.where((p) => p.selectedTeam == "TeamA").toList();
    final teamBPlayers =
        dataList.where((p) => p.selectedTeam == "TeamB").toList();

    // Menentukan jumlah baris maksimum untuk keseimbangan tampilan
    final maxRows = teamAPlayers.length > teamBPlayers.length
        ? teamAPlayers.length
        : teamBPlayers.length;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: const EdgeInsets.all(10),
        width: Get.width * 1,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          color: const Color.fromARGB(255, 111, 106, 106),
          borderRadius: BorderRadius.circular(10),
        ),
        child: DataTable2(
          border: TableBorder.all(color: Colors.black, width: 3),
          columnSpacing: 0,
          horizontalMargin: 0,
          minWidth: 600,
          columns: [
            DataColumn(
              label: Container(
                color: Colors.red,
                alignment: Alignment.center,
                padding: EdgeInsets.all(8),
                child: Text(
                  "RED TEAM",
                  style: GoogleFonts.ramabhadra(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
            ),
            DataColumn(label: Container(color: Colors.red)),
            DataColumn(label: Container(color: Colors.red)),
            DataColumn(
              label: Container(
                color: Colors.blue,
                alignment: Alignment.center,
                padding: EdgeInsets.all(8),
                child: Text(
                  "BLUE TEAM",
                  style: GoogleFonts.ramabhadra(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
            ),
            DataColumn(label: Container(color: Colors.blue)),
            DataColumn(label: Container(color: Colors.blue)),
          ],
          rows: [
            DataRow(cells: [
              DataCell(Container(
                  color: Colors.red[200],
                  child: Center(child: Text("NO", style: _headerStyle())))),
              DataCell(Container(
                  color: Colors.red[200],
                  child: Center(child: Text("Nama", style: _headerStyle())))),
              DataCell(Container(
                  color: Colors.red[200],
                  child: Center(
                      child: Text("Health Point", style: _headerStyle())))),
              DataCell(Container(
                  color: Colors.blue[200],
                  child: Center(child: Text("NO", style: _headerStyle())))),
              DataCell(Container(
                  color: Colors.blue[200],
                  child: Center(child: Text("Nama", style: _headerStyle())))),
              DataCell(Container(
                  color: Colors.blue[200],
                  child: Center(
                      child: Text("Health Point", style: _headerStyle())))),
            ]),
            for (int i = 0; i < maxRows; i++)
              DataRow(cells: [
                DataCell(Container(
                    color: const Color.fromARGB(255, 196, 19, 36),
                    child: Center(
                        child: Text(
                            i < teamAPlayers.length ? (i + 1).toString() : "-",
                            style: _dataStyle())))),
                DataCell(Container(
                    color: const Color.fromARGB(255, 196, 19, 36),
                    child: Center(
                        child: Text(
                            i < teamAPlayers.length
                                ? teamAPlayers[i].name
                                : "-",
                            style: _dataStyle())))),
                DataCell(Container(
                    color: const Color.fromARGB(255, 196, 19, 36),
                    child: Center(
                        child: i < teamAPlayers.length
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    teamAPlayers[i].health.toString(),
                                    style: _dataStyle(),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    teamAPlayers[i].statusReady
                                        ? "Ready"
                                        : "Not Ready",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: teamAPlayers[i].statusReady
                                          ? Colors.green
                                          : const Color.fromARGB(
                                              255, 255, 255, 255),
                                    ),
                                  ),
                                ],
                              )
                            : Text("-", style: _dataStyle())))),
                DataCell(Container(
                    color: const Color.fromARGB(255, 62, 149, 220),
                    child: Center(
                        child: Text(
                            i < teamBPlayers.length ? (i + 1).toString() : "-",
                            style: _dataStyle())))),
                DataCell(Container(
                    color: const Color.fromARGB(255, 62, 149, 220),
                    child: Center(
                        child: Text(
                            i < teamBPlayers.length
                                ? teamBPlayers[i].name
                                : "-",
                            style: _dataStyle())))),
                DataCell(Container(
                    color: const Color.fromARGB(255, 62, 149, 220),
                    child: Center(
                        child: i < teamBPlayers.length
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    teamBPlayers[i].health.toString(),
                                    style: _dataStyle(),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    teamBPlayers[i].statusReady
                                        ? "Ready"
                                        : "Not Ready",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: teamBPlayers[i].statusReady
                                          ? Colors.green
                                          : const Color.fromARGB(
                                              255, 255, 255, 255),
                                    ),
                                  ),
                                ],
                              )
                            : Text("-", style: _dataStyle())))),
              ]),
          ],
        ),
      ),
    );
  }

  // 🔥 Styling Header
  TextStyle _headerStyle() {
    return GoogleFonts.ramabhadra(
        color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20);
  }

  // 🔥 Styling Data
  TextStyle _dataStyle() {
    return GoogleFonts.roboto(
        color: Colors.black, fontWeight: FontWeight.normal, fontSize: 18);
  }
}

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../data/TableGameplay.dart';

class CustomDataTable extends StatelessWidget {
  final List<DataTableGameplay> dataList;

  const CustomDataTable({Key? key, required this.dataList}) : super(key: key);

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
        width: Get.width * 0.8,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: DataTable2(
          border: TableBorder.all(color: Colors.black, width: 1),
          headingRowHeight: 40,
          dataRowHeight: 50,
          columnSpacing: 12,
          horizontalMargin: 12,
          minWidth: 600,
          columns: [
            // 🔴 RED TEAM Header (Menggunakan colspan dengan fake column)
            DataColumn(
                label: Container(
              color: Colors.red[300],
              alignment: Alignment.center,
              padding: EdgeInsets.all(8),
              child: Text(
                "RED TEAM",
                style: GoogleFonts.ramabhadra(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            )),
            DataColumn(label: Container(color: Colors.red[300])),
            DataColumn(label: Container(color: Colors.red[300])),
            // 🔵 BLUE TEAM Header
            DataColumn(
                label: Container(
              color: Colors.blue[300],
              alignment: Alignment.center,
              padding: EdgeInsets.all(8),
              child: Text(
                "BLUE TEAM",
                style: GoogleFonts.ramabhadra(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            )),
            DataColumn(label: Container(color: Colors.blue[300])),
            DataColumn(label: Container(color: Colors.blue[300])),
          ],
          rows: [
            // 🟡 NO, Nama, HP Header untuk masing-masing tim
            DataRow(cells: [
              DataCell(Container(
                  color: Colors.red[200],
                  child: Center(child: Text("NO", style: _headerStyle())))),
              DataCell(Container(
                  color: Colors.red[200],
                  child: Center(child: Text("Nama", style: _headerStyle())))),
              DataCell(Container(
                  color: Colors.red[200],
                  child: Center(child: Text("HP", style: _headerStyle())))),
              DataCell(Container(
                  color: Colors.blue[200],
                  child: Center(child: Text("NO", style: _headerStyle())))),
              DataCell(Container(
                  color: Colors.blue[200],
                  child: Center(child: Text("Nama", style: _headerStyle())))),
              DataCell(Container(
                  color: Colors.blue[200],
                  child: Center(child: Text("HP", style: _headerStyle())))),
            ]),
            // 🔄 Iterasi daftar pemain berdasarkan jumlah maksimum baris
            for (int i = 0; i < maxRows; i++)
              DataRow(cells: [
                // Data Team A
                DataCell(Container(
                    color: Colors.red[100],
                    child: Center(
                        child: Text(
                            i < teamAPlayers.length ? (i + 1).toString() : "-",
                            style: _dataStyle())))),
                DataCell(Container(
                    color: Colors.red[100],
                    child: Center(
                        child: Text(
                            i < teamAPlayers.length
                                ? teamAPlayers[i].name
                                : "-",
                            style: _dataStyle())))),
                DataCell(Container(
                    color: Colors.red[100],
                    child: Center(
                        child: Text(
                            i < teamAPlayers.length
                                ? teamAPlayers[i].health.toString()
                                : "-",
                            style: _dataStyle())))),
                // Data Team B
                DataCell(Container(
                    color: Colors.blue[100],
                    child: Center(
                        child: Text(
                            i < teamBPlayers.length ? (i + 1).toString() : "-",
                            style: _dataStyle())))),
                DataCell(Container(
                    color: Colors.blue[100],
                    child: Center(
                        child: Text(
                            i < teamBPlayers.length
                                ? teamBPlayers[i].name
                                : "-",
                            style: _dataStyle())))),
                DataCell(Container(
                    color: Colors.blue[100],
                    child: Center(
                        child: Text(
                            i < teamBPlayers.length
                                ? teamBPlayers[i].health.toString()
                                : "-",
                            style: _dataStyle())))),
              ]),
          ],
        ),
      ),
    );
  }

  // 🔥 Styling Header
  TextStyle _headerStyle() {
    return GoogleFonts.ramabhadra(
        color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14);
  }

  // 🔥 Styling Data
  TextStyle _dataStyle() {
    return GoogleFonts.roboto(
        color: Colors.black, fontWeight: FontWeight.normal, fontSize: 13);
  }
}

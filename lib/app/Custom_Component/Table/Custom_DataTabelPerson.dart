import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../data/TablePerson.dart';

class CustomDatatabelperson extends StatelessWidget {
  final List<String> listcolumn;
  final List<DataTablePerson> listdata;
  final Map<String, String> columnMap;

  const CustomDatatabelperson({
    super.key,
    required this.listcolumn,
    required this.listdata,
    required this.columnMap,
  });

  @override
  Widget build(BuildContext context) {
    // Filter data berdasarkan tim
    final teamAData = listdata.where((data) => data.team == 'TeamA').toList();
    final teamBData = listdata.where((data) => data.team == 'TeamB').toList();

    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(
            right: 50.0), // Adjust the padding to move the tables to the left
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Tabel untuk Team A
            Column(
              children: [
                Text(
                  'Team A',
                  style: GoogleFonts.padauk(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
                _buildDataTable(teamAData),
              ],
            ),
            SizedBox(height: 10), // Add space between the tables
            // Tabel untuk Team B
            Column(
              children: [
                Text(
                  'Team B',
                  style: GoogleFonts.padauk(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
                _buildDataTable(teamBData),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataTable(List<DataTablePerson> data) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(65),
          right: Radius.circular(65),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Container(
            padding: EdgeInsets.all(25),
            width: Get.width * 0.45,
            height: Get.height * 0.4,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black38),
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 31, 88, 87),
                  Color.fromARGB(255, 72, 163, 160),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(65),
            ),
            child: DataTable2(
              border: TableBorder.all(
                color: Colors.black,
                width: 2,
              ), // Menghilangkan semua border
              showBottomBorder: false, // Menghilangkan garis bawah header
              dividerThickness: 0, // Menghilangkan garis antar baris
              columns: listcolumn
                  .map(
                    (header) => DataColumn(
                      label: Center(
                        child: Text(
                          header,
                          style: GoogleFonts.kumbhSans(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
              rows: data.map((data) {
                return DataRow(
                  cells: listcolumn.map((header) {
                    final dbColumn = columnMap[header] ?? header;
                    return DataCell(
                      Text((data.toJson()[dbColumn] ?? 'Kosong').toString()),
                    );
                  }).toList(),
                );
              }).toList(),
            )),
      ),
    );
  }
}

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

    return LayoutBuilder(
      builder: (context, constraints) {
        // Jika lebar layar lebih kecil dari 600px, gunakan Column untuk responsivitas
        if (constraints.maxWidth < 600) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Tabel untuk Team A
                _buildTeamSection('Team A', teamAData),
                SizedBox(height: 20), // Space between teams
                // Tabel untuk Team B
                _buildTeamSection('Team B', teamBData),
              ],
            ),
          );
        } else {
          // Jika lebar layar lebih besar, gunakan Row untuk menampilkan tabel berdampingan
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Tabel untuk Team A
              _buildTeamSection('Team A', teamAData),
              SizedBox(width: 20), // Add space between tables
              // Tabel untuk Team B
              _buildTeamSection('Team B', teamBData),
            ],
          );
        }
      },
    );
  }

  Widget _buildTeamSection(String teamName, List<DataTablePerson> data) {
    return Column(
      children: [
        Text(
          teamName,
          style: GoogleFonts.padauk(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
        _buildDataTable(data),
      ],
    );
  }

  Widget _buildDataTable(List<DataTablePerson> data) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(15),
          right: Radius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Container(
          padding: EdgeInsets.all(25),
          width: Get.width * 0.4, // Set width to 40% of screen width
          height: Get.height * 0.85, // Set height to 35% of screen height
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
            borderRadius: BorderRadius.circular(10),
          ),
          child: DataTable2(
            border: TableBorder.all(
              color: Colors.black,
              width: 3,
            ),
            showBottomBorder: false,
            dividerThickness: 0,
            columns: listcolumn
                .map(
                  (header) => DataColumn(
                    label: Center(
                      child: Text(
                        header,
                        style: GoogleFonts.kumbhSans(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
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
          ),
        ),
      ),
    );
  }
}

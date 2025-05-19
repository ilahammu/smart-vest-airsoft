import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../data/TablePerson.dart';

class CustomDatatabelperson extends StatelessWidget {
  final List<String> listcolumn;
  final List<DataTablePerson> listdata;
  final Map<String, String> columnMap;
  final Function(String) onDelete; // Callback untuk delete

  const CustomDatatabelperson({
    super.key,
    required this.listcolumn,
    required this.listdata,
    required this.columnMap,
    required this.onDelete, // Menerima callback onDelete
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
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Tabel untuk Team A
              _buildTeamSection('Team A', teamAData),
              SizedBox(height: 20), // Space between teams
              // Tabel untuk Team B
              _buildTeamSection('Team B', teamBData),
            ],
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
          height: Get.height * 0.85, // Set height to 85% of screen height
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
            columns: [
              DataColumn(
                label: Center(
                  child: Text(
                    'Nama Pemain',
                    style: GoogleFonts.kumbhSans(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
            rows: data.map((data) {
              return DataRow(
                cells: [
                  DataCell(
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            data.name,
                            style: GoogleFonts.kumbhSans(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete,
                              color: const Color.fromARGB(255, 0, 0, 0)),
                          onPressed: () {
                            print(
                                "Deleting player with PlayerID: ${data.macAddress}");
                            onDelete(data.macAddress
                                .toString()); // Panggil fungsi onDelete dengan id
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

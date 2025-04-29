import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTable extends StatelessWidget {
  final List<Map<String, String>> data;
  final List<String> columns;
  final Color? headingColor;
  final Color? dataRowColor;

  CustomTable({
    required this.data,
    required this.columns,
    required this.headingColor,
    required this.dataRowColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 107, 142, 35), // Semi transparan putih
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(8),
      child: DataTable(
        columnSpacing: Get.width * 0.2,
        horizontalMargin: Get.width * 0.05,
        headingRowColor: MaterialStateProperty.all(headingColor),
        headingTextStyle: TextStyle(
          color: Colors.amberAccent,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        dataRowColor: MaterialStateProperty.all(dataRowColor),
        dataTextStyle: TextStyle(
          fontSize: 18,
        ),
        columns: columns
            .map((column) => DataColumn(
                  label: Text(
                    column,
                    style: GoogleFonts.jaldi(color: Colors.white),
                  ),
                ))
            .toList(),
        rows: data
            .map(
              (row) => DataRow(
                cells: row.values
                    .map(
                      (value) => DataCell(
                        Text(
                          value,
                          style: GoogleFonts.jaldi(color: Colors.white),
                        ),
                      ),
                    )
                    .toList(),
              ),
            )
            .toList(),
      ),
    );
  }
}

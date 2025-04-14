import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vest_keren/app/Custom_Component/Table/dataTable.dart';

class CustomTableChart extends StatelessWidget {
  final List<String> columnHeaders;
  final List<DataTableModelChart> dataList;

  const CustomTableChart({
    Key? key,
    required this.columnHeaders,
    required this.dataList,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: Container(
        padding: const EdgeInsets.all(10),
        width: Get.width,
        height: Get.height * 0.45,
        decoration: BoxDecoration(
          border: Border.all(color: Color.fromARGB(255, 142, 149, 141)),
          color: Color.fromARGB(255, 224, 223, 223),
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              blurRadius: 10,
              spreadRadius: 0.5,
              offset: Offset(3, 2),
            ),
          ],
        ),
        child: DataTable2(
          border: TableBorder.all(
              color: Color.fromARGB(255, 140, 146, 140),
              borderRadius: BorderRadius.circular(5),
              width: 3),
          headingRowColor: MaterialStateColor.resolveWith(
              (states) => Color.fromARGB(255, 183, 182, 182)),
          headingTextStyle: GoogleFonts.ramabhadra(
            color: Color.fromARGB(255, 124, 120, 120),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          columnSpacing: 12,
          horizontalMargin: 12,
          minWidth: 600,
          columns: columnHeaders
              .map(
                (header) => DataColumn(
                  label: Center(
                    child: Text(
                      header,
                      style: GoogleFonts.ramabhadra(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.w500,
                          fontSize: 13),
                    ),
                  ),
                ),
              )
              .toList(),
          rows: dataList.map((data) {
            return DataRow(
                cells: columnHeaders.map((header) {
              return DataCell(
                  Text((data.data[header] ?? 'Default Value').toString()));
            }).toList());
          }).toList(),
        ),
      ),
    );
  }
}

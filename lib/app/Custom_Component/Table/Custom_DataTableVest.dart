import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vest_keren/app/Data/TableVest.dart';

class CustomDatatablevest extends StatelessWidget {
  final List<String> kolomHeader;
  final List<DataTableModel> data;

  const CustomDatatablevest({
    Key? key,
    required this.data,
    required this.kolomHeader,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: kolomHeader
              .map((header) => DataColumn(
                    label: Text(
                      header,
                      style: GoogleFonts.nunito(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ))
              .toList(),
          rows: data
              .map((row) => DataRow(
                    cells: [
                      DataCell(Text(row.nomor.toString())),
                      DataCell(Text(row.hitspot)),
                      DataCell(Text(row.damageTaken)),
                    ],
                  ))
              .toList(),
        ),
      ),
    );
  }
}

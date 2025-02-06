import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vest_keren/app/Data/TableGampelay..dart';

class CustomDatatabelperson extends StatelessWidget {
  final List<String> listcolumn;
  final List<DataTablePerson> listdata;

  const CustomDatatabelperson({
    super.key,
    required this.listcolumn,
    required this.listdata,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(
        left: Radius.circular(5),
      )),
      child: Container(
        padding: EdgeInsets.all(5),
        width: Get.width * 0.2,
        height: Get.height * 0.5,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black38),
          color: Colors.red,
          borderRadius: BorderRadius.circular(9),
        ),
        child: DataTable2(
            border: TableBorder.all(),
            columns: listcolumn
                .map(
                  (kepala) => DataColumn(
                    label: Center(
                      child: Text(
                        kepala,
                        style: GoogleFonts.devonshire(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
            rows: listdata.map((data) {
              return DataRow(
                  cells: listcolumn.map((kepala) {
                return DataCell(
                    Text((data.data[kepala] ?? 'Kosong').toString()));
              }).toList());
            }).toList()),
      ),
    );
  }
}

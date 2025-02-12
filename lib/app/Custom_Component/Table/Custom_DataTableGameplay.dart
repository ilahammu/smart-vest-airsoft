import 'package:flutter/material.dart';

import '../../data/TableGameplay.dart';

class CustomDatatablegameplay extends StatelessWidget {
  final List<String> listcolumn;
  final List<DataTableGameplay> listdata;
  final Map<String, String> columnMap;

  const CustomDatatablegameplay({
    Key? key,
    required this.listcolumn,
    required this.listdata,
    required this.columnMap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(); // or any other widget
  }
}

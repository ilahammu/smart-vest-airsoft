import 'package:flutter/material.dart';
import '../../data/TableGameplay.dart';

class CustomDatatablegameplay extends StatelessWidget {
  final List<DataTableGameplay> listdata;

  const CustomDatatablegameplay({
    Key? key,
    required this.listdata,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final teamAPlayers =
        listdata.where((p) => p.selectedTeam == "TeamA").toList();
    final teamBPlayers =
        listdata.where((p) => p.selectedTeam == "TeamB").toList();

    final maxRows = teamAPlayers.length > teamBPlayers.length
        ? teamAPlayers.length
        : teamBPlayers.length;

    return Expanded(
      child: Column(
        children: [
          Container(
            color: Colors.grey[600],
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text("RED TEAM",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                SizedBox(width: 50),
                Text("BLUE TEAM",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: DataTable(
                columnSpacing: 30,
                headingRowHeight: 40,
                dataRowHeight: 50,
                border: TableBorder.all(color: Colors.black, width: 1),
                columns: const [
                  DataColumn(
                      label: Text("NO",
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text("Nama",
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text("HP",
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text("NO",
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text("Nama",
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text("HP",
                          style: TextStyle(fontWeight: FontWeight.bold))),
                ],
                rows: List.generate(
                  maxRows,
                  (index) {
                    final playerA = index < teamAPlayers.length
                        ? teamAPlayers[index]
                        : null;
                    final playerB = index < teamBPlayers.length
                        ? teamBPlayers[index]
                        : null;

                    return DataRow(cells: [
                      DataCell(
                          Text(playerA != null ? (index + 1).toString() : "-")),
                      DataCell(Text(playerA != null ? playerA.name : "-")),
                      DataCell(Text(
                          playerA != null ? playerA.health.toString() : "-")),
                      DataCell(
                          Text(playerB != null ? (index + 1).toString() : "-")),
                      DataCell(Text(playerB != null ? playerB.name : "-")),
                      DataCell(Text(
                          playerB != null ? playerB.health.toString() : "-")),
                    ]);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

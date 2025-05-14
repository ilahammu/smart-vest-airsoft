import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../Custom_Component/Dropdown/Custom_DropdownPersonel.dart';
import '../Controllers/Chart_Controller.dart';

class ChartView extends GetView<ChartController> {
  final ChartController controller = Get.put(ChartController());
  final styleName = GoogleFonts.tiltWarp(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 28, 28, 28),
              Color.fromARGB(255, 29, 31, 30),
              Color.fromARGB(255, 32, 33, 34),
            ],
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool isMobile = constraints.maxWidth < 600;

            Widget content = Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Dropdown & Info Box
                  SizedBox(
                    width: isMobile ? constraints.maxWidth : 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Dropdown pemain
                        Obx(() => CustomDropdownPersonel(
                              selectedValue: controller.selectedPlayer,
                              hintText: "Pilih Pemain",
                              items: controller.playerList,
                              onChanged: (player) {
                                controller.selectedPlayer.value = player;
                                controller.fetchHitpointLog(player?['name']);
                              },
                            )),
                        const SizedBox(height: 10),
                        // Info Box
                        Obx(() {
                          final player = controller.selectedPlayer.value;
                          if (player == null) return const SizedBox();
                          return _buildInfoBox(
                            player['name'],
                            player['selectedTeam'] ?? '-',
                            player['id']?.toString() ?? '-',
                          );
                        }),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  // Chart and Table Section
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // BarChart Section
                        Container(
                          height: 250,
                          child: _buildBarChart(context),
                        ),
                        const SizedBox(height: 30),
                        // Tabel riwayat hitpoint
                        Expanded(
                          child: Obx(() => SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child:
                                    _buildHitpointTable(controller.hitpointLog),
                              )),
                        ),
                        const SizedBox(height: 15),
                        // Navigation Buttons (opsional)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildButton('⇚ Previous', () {}),
                            const SizedBox(width: 20),
                            _buildButton('Next ⇛', () {}),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );

            if (isMobile) {
              return SingleChildScrollView(child: content);
            } else {
              return content;
            }
          },
        ),
      ),
    );
  }

  // Info Box Widget
  Widget _buildInfoBox(
    String name,
    String team,
    String id,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 150,
          height: 50,
          decoration: BoxDecoration(
            color: const Color.fromARGB(236, 20, 19, 19),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Row(
              children: [
                const Icon(Icons.arrow_drop_down,
                    color: Color.fromARGB(255, 213, 255, 63), size: 40),
                Text(name,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          width: 200,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 47, 79, 79),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                backgroundColor: Color.fromARGB(255, 86, 209, 51),
                radius: 50,
              ),
              const SizedBox(height: 10),
              Text('Name:',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
              Text(name,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600)),
              const SizedBox(height: 10),
              Text('Team:',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
              Text(team,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600)),
              const SizedBox(height: 10),
              Text('ID:',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
              Text(id,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ],
    );
  }

  // BarChart Widget
  Widget _buildBarChart(BuildContext context) {
    return Obx(() => SizedBox(
          height: 200,
          child: BarChart(
            BarChartData(
              maxY: 50,
              minY: 0,
              groupsSpace: 12,
              barGroups: List.generate(controller.chartData.length, (index) {
                final data = controller.chartData[index];
                return BarChartGroupData(
                  x: index,
                  barRods: [
                    BarChartRodData(
                      toY: (data['blue'] as num).toDouble(),
                      color: const Color.fromARGB(255, 58, 58, 58),
                      width: 30,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ],
                );
              }),
              titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 10,
                    getTitlesWidget: (value, meta) => Text(
                      value.toInt().toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      if (value.toInt() < controller.chartData.length) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Text(
                            controller.chartData[value.toInt()]['label']
                                    ?.toString() ??
                                '',
                            style: GoogleFonts.jaldi(
                                color: Colors.white, fontSize: 19),
                            overflow: TextOverflow.visible,
                          ),
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                ),
                rightTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
                topTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
              ),
              borderData: FlBorderData(show: false),
              gridData: FlGridData(
                show: true,
                drawVerticalLine: false,
                getDrawingHorizontalLine: (value) => FlLine(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  strokeWidth: 5,
                ),
              ),
            ),
          ),
        ));
  }

  // Tabel riwayat hitpoint
  Widget _buildHitpointTable(List<Map<String, dynamic>> log) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const [
          DataColumn(label: Text('No')),
          DataColumn(label: Text('Bagian Mana')),
          DataColumn(label: Text('Timestamp')),
        ],
        rows: log.asMap().entries.map((entry) {
          final i = entry.key;
          final item = entry.value;
          return DataRow(cells: [
            DataCell(Text('${i + 1}')),
            DataCell(Text(item['hitpoint']?.toString() ?? '-')),
            DataCell(Text(item['timestamp']?.toString() ?? '-')),
          ]);
        }).toList(),
      ),
    );
  }

  // Button Widget
  Widget _buildButton(String title, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 112, 107, 107),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        title,
        style: GoogleFonts.heptaSlab(
          fontSize: 22,
          color: const Color.fromARGB(255, 0, 0, 0),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

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

  // Mapping bagian
  String getBagianName(int bagian) {
    switch (bagian) {
      case 1:
        return "Bahu Kiri";
      case 2:
        return "Bahu Kanan";
      case 3:
        return "Rusuk Kiri";
      case 4:
        return "Rusuk Kanan";
      case 5:
        return "Jantung";
      case 6:
        return "Pinggang Kiri";
      case 7:
        return "Pinggang Kanan";
      case 8:
        return "Pusar";
      default:
        return "-";
    }
  }

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
                        CustomDropdownPersonel(
                          selectedValue: controller.selectedPlayer,
                          hintText: "Pilih Pemain",
                          items: controller.playerList,
                          onChanged: (player) {
                            controller.selectedPlayer.value = player;
                            controller.fetchHitpointLog(player?['name']);
                          },
                        ),
                        const SizedBox(height: 20),
                        // Info Box
                        Obx(() {
                          final player = controller.selectedPlayer.value;
                          if (player == null) return const SizedBox();
                          return _buildInfoBox(
                            player['name'],
                            player['selectedTeam'] ?? '-',
                            player['displayId']?.toString() ?? '-',
                          );
                        }),
                      ],
                    ),
                  ),
                  // Chart and Table Section
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // BarChart Section
                        Container(
                          height: 250,
                          width: double.infinity,
                          child: _buildBarChart(context),
                        ),
                        const SizedBox(height: 30),
                        // Tabel riwayat hitpoint
                        SizedBox(
                          width: double.infinity,
                          child: Obx(() {
                            return Container(
                              child:
                                  _buildHitpointTable(controller.hitpointLog),
                            );
                          }),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Obx(() => _buildButton(
                                  '⇚ Previous',
                                  controller.currentPage.value > 0
                                      ? () => controller.currentPage.value--
                                      : null,
                                )),
                            const SizedBox(width: 20),
                            Obx(() => _buildButton(
                                  'Next ⇛',
                                  ((controller.currentPage.value + 1) *
                                              ChartController.pageSize <
                                          controller.hitpointLog.length)
                                      ? () => controller.currentPage.value++
                                      : null,
                                )),
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
        const SizedBox(height: 10),
        Container(
          width: 260,
          height: 600,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 73, 79, 79),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                backgroundColor: Color.fromARGB(255, 135, 141, 133),
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
    return Obx(() {
      // Selalu tampilkan 8 bar, walau chartData kosong
      List<Map<String, dynamic>> data = controller.chartData.isNotEmpty
          ? controller.chartData
          : List.generate(
              8,
              (i) => {
                    'label': getBagianName(i + 1),
                    'blue': 0,
                  });
      return SizedBox(
        height: 200,
        child: BarChart(
          BarChartData(
            maxY: 50,
            minY: 0,
            groupsSpace: 12,
            barGroups: List.generate(data.length, (index) {
              final d = data[index];
              return BarChartGroupData(
                x: index,
                barRods: [
                  BarChartRodData(
                    toY: (d['blue'] as num).toDouble(),
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
                    style: GoogleFonts.tiltNeon(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    if (value.toInt() < data.length) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            top: 4, bottom: 4, left: 10, right: 10),
                        child: Text(
                          data[value.toInt()]['label']?.toString() ?? '',
                          style: GoogleFonts.tiltNeon(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
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
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
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
      );
    });
  }

  // Tabel riwayat hitpoint
  Widget _buildHitpointTable(List<Map<String, dynamic>> log) {
    final headerStyle = GoogleFonts.heptaSlab(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    final cellStyle = GoogleFonts.tiltNeon(
      color: Colors.white,
      fontSize: 15,
    );

    final int page = controller.currentPage.value;
    final int pageSize = ChartController.pageSize;
    final int start = page * pageSize;
    final int end =
        (start + pageSize) > log.length ? log.length : (start + pageSize);
    final List<Map<String, dynamic>> pageData = log.sublist(start, end);

    if (log.isEmpty) {
      return DataTable(
        columns: [
          DataColumn(label: Text('No', style: headerStyle)),
          DataColumn(label: Text('Bagian Mana', style: headerStyle)),
          DataColumn(label: Text('Timestamp', style: headerStyle)),
        ],
        rows: [],
        dataRowColor: MaterialStatePropertyAll(Color(0xFF232323)),
        headingRowColor: MaterialStatePropertyAll(Color(0xFF2E2E2E)),
        dividerThickness: 0.5,
      );
    }
    return DataTable(
      columns: [
        DataColumn(label: Text('No', style: headerStyle)),
        DataColumn(label: Text('Bagian Mana', style: headerStyle)),
        DataColumn(label: Text('Timestamp', style: headerStyle)),
      ],
      rows: pageData.asMap().entries.map((entry) {
        final i = entry.key;
        final item = entry.value;
        return DataRow(
          cells: [
            DataCell(Text('${start + i + 1}', style: cellStyle)),
            DataCell(Text(
                getBagianName(int.tryParse(item['hitpoint'].toString()) ?? 0),
                style: cellStyle)),
            DataCell(
              Text(
                (() {
                  final raw = item['timestamp'];
                  if (raw == null) return '-';
                  try {
                    final dt =
                        DateTime.parse(raw).add(const Duration(hours: 7));
                    // Format sesuai kebutuhan, misal: yyyy-MM-dd HH:mm:ss
                    return "${dt.year}-${dt.month.toString().padLeft(2, '0')}-${dt.day.toString().padLeft(2, '0')}\n"
                        "${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}:${dt.second.toString().padLeft(2, '0')}";
                  } catch (e) {
                    return raw.toString();
                  }
                })(),
                style: cellStyle,
              ),
            ),
          ],
        );
      }).toList(),
      dataRowColor: MaterialStatePropertyAll(Color(0xFF232323)),
      headingRowColor: MaterialStatePropertyAll(Color(0xFF2E2E2E)),
      dividerThickness: 0.5,
    );
  }

  // Button Widget
  Widget _buildButton(String title, VoidCallback? onPressed) {
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

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:vest_keren/app/Custom_Component/Table/Custom_Tabel.dart';
import '../Controllers/chart_controller.dart';

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
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(235, 0, 0, 0),
        title: Text('Chart View', style: styleName),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.center,
            colors: [
              Color.fromARGB(255, 3, 0, 23),
              Color.fromARGB(255, 21, 20, 33),
              Color.fromARGB(255, 25, 24, 39),
            ],
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool redminote11 = constraints.maxWidth < 600;

            Widget content = Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center, // Align to top
                children: [
                  // Info Box
                  _buildInfoBox('Gerald', 'Team A', '001'),
                  const SizedBox(
                      width: 20), // Add space between card and other widgets

                  // Chart and Table Section
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // BarChart Section
                        Container(
                          height: 250, // Height of the BarChart
                          child: _buildBarChart(context),
                        ),
                        const SizedBox(height: 50),
                        // CustomTable
                        CustomTable(
                          data: [
                            {
                              'No': '1',
                              'Bagian': 'Bahu Kiri',
                              'Timestamp': '2023-10-01 12:05:00'
                            },
                            {
                              'No': '2',
                              'Bagian': 'Punggung Kanan',
                              'Timestamp': '2023-10-01 12:06:00'
                            },
                            {
                              'No': '3',
                              'Bagian': 'Pinggang Kiri',
                              'Timestamp': '2023-10-01 12:07:00'
                            },
                            {
                              'No': '4',
                              'Bagian': 'Jantung',
                              'Timestamp': '2023-10-01 12:08:00'
                            },
                            {
                              'No': '5',
                              'Bagian': 'Pusar',
                              'Timestamp': '2023-10-01 12:09:00'
                            },
                          ],
                          columns: [
                            'No',
                            'Bagian',
                            'Timestamp',
                          ],
                        ),
                        const SizedBox(height: 15),
                        // Navigation Buttons
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

            // If on mobile, make it scrollable
            if (redminote11) {
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
              children: const [
                Icon(Icons.arrow_drop_down,
                    color: Color.fromARGB(255, 213, 255, 63), size: 40),
                Text("Gerald",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          width: Get.width * 0.15,
          height: Get.height * 0.75,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color.fromARGB(169, 15, 15, 14),
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
              // Name Text with contrast and clear styling
              Text(
                'Name:',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                name,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              // Team Text with contrast and clear styling
              Text(
                'Team:',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                team,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              // ID Text with contrast and clear styling
              Text(
                'ID:',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                id,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // BarChart Widget
  Widget _buildBarChart(BuildContext context) {
    final ChartController controller = Get.find();
    return Obx(() => SizedBox(
          height: 200,
          child: BarChart(
            BarChartData(
              maxY: 20,
              minY: 0,
              groupsSpace: 12, // Adjust the space between bars
              barGroups: List.generate(controller.chartData.length, (index) {
                final data = controller.chartData[index];
                return BarChartGroupData(
                  x: index,
                  barRods: [
                    BarChartRodData(
                      toY: (data['blue'] as num).toDouble(),
                      color: Colors.cyanAccent,
                      width: 30, // Keep the bar width at 30
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ],
                );
              }),
              titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 5,
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
                          padding: const EdgeInsets.only(
                            top: 6, // Adjust top padding
                          ),
                          child: Text(
                            controller.chartData[value.toInt()]['label']
                                    ?.toString() ??
                                '',
                            style: GoogleFonts.jaldi(
                                color: Colors.white,
                                fontSize: 19), // Keep font size at 19
                            overflow: TextOverflow.visible, // Handle overflow
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
                  color: Colors.white12,
                  strokeWidth: 5,
                ),
              ),
            ),
          ),
        ));
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

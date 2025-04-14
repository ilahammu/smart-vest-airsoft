// chart_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import '../Controllers/chart_controller.dart';

class ChartView extends GetView<ChartController> {
  final ChartController controller = Get.put(ChartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 90, 27, 206),
        title: const Text('Chart View'),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 51, 9, 63),
              Color.fromARGB(255, 83, 48, 105),
              Color.fromARGB(255, 0, 0, 0),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    // Info Box
                    Container(
                      width: 250,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple[300],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          CircleAvatar(
                            backgroundColor: Colors.red,
                            radius: 50,
                          ),
                          SizedBox(height: 10),
                          Text('Name: A',
                              style: TextStyle(color: Colors.white)),
                          SizedBox(height: 10),
                          Text('Team: A / B',
                              style: TextStyle(color: Colors.white)),
                          SizedBox(height: 10),
                          Text('ID: 001',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    // Chart Section
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: Obx(() => BarChart(
                                  BarChartData(
                                    titlesData: FlTitlesData(show: false),
                                    barGroups: List.generate(
                                        controller.chartData.length, (index) {
                                      return BarChartGroupData(
                                          x: index,
                                          barRods: [
                                            BarChartRodData(
                                              toY: controller.chartData[index]
                                                  .toDouble(),
                                              width: 15,
                                              color: Colors.amber,
                                            ),
                                          ]);
                                    }),
                                  ),
                                )),
                          ),
                          SizedBox(height: 20),
                          Expanded(
                            child: Container(
                              color: Colors.deepPurple[600],
                              child: Center(
                                  child: Text('Line Chart Placeholder',
                                      style: TextStyle(color: Colors.white))),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Table Section
              Expanded(
                child: Container(
                  color: Colors.white.withOpacity(0.1),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columns: const [
                        DataColumn(label: Text('Name')),
                        DataColumn(label: Text('Team')),
                        DataColumn(label: Text('Hit')),
                      ],
                      rows: const [
                        DataRow(cells: [
                          DataCell(Text('A')),
                          DataCell(Text('A')),
                          DataCell(Text('3')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('B')),
                          DataCell(Text('B')),
                          DataCell(Text('5')),
                        ]),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _tableInfo(String kolom) {
  return Container(
    padding: const EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.1),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Text(
      kolom,
      style: const TextStyle(color: Colors.white, fontSize: 16),
    ),
  );
}

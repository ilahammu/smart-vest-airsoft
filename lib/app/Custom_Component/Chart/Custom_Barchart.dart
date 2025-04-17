import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../modules/Function System/Gameplay/Controllers/chart_controller.dart';

class CustomBarChart extends StatelessWidget {
  final ChartController controller = Get.find();

  CustomBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => SizedBox(
          height: 200, // ✅ Ukuran tetap agar tidak error layout
          child: BarChart(
            BarChartData(
              maxY: 20,
              minY: 0,
              groupsSpace: 15,
              barGroups: List.generate(controller.chartData.length, (index) {
                final data = controller.chartData[index];
                return BarChartGroupData(
                  x: index,
                  barRods: [
                    BarChartRodData(
                      toY: (data['blue'] as num).toDouble(),
                      color: Colors.cyanAccent,
                      width: 50,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ],
                );
              }),
              titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 4,
                    getTitlesWidget: (value, meta) {
                      return Text(
                        value.toInt().toString(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12),
                      );
                    },
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
                            style: const TextStyle(
                                color: Colors.white, fontSize: 12),
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
                  strokeWidth: 1,
                ),
              ),
            ),
          ),
        ));
  }
}

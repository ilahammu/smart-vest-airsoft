import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../Data/chart.dart';

class CustomBarchartHorizontal extends StatelessWidget {
  final List<Chart> datalist;

  CustomBarchartHorizontal({
    required this.datalist,
  });

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: datalist
            .map((data) => data.value)
            .reduce((a, b) => a > b ? a : b)
            .toDouble(),
        barTouchData: BarTouchData(enabled: false),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (double value, TitleMeta meta) {
                return Text(
                  datalist[value.toInt()].label,
                  style: const TextStyle(color: Colors.black, fontSize: 10),
                );
              },
              reservedSize: 16,
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
        ),
        borderData: FlBorderData(show: false),
        barGroups: datalist.asMap().entries.map((entry) {
          int index = entry.key;
          Chart data = entry.value;
          return BarChartGroupData(
            x: index,
            barRods: [
              BarChartRodData(
                fromY: 0,
                toY: data.value,
                color: Colors.blue,
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}

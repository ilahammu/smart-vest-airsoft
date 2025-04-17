import 'package:flutter/material.dart';

class CustomBarChart extends StatelessWidget {
  final String label;
  final double value;

  CustomBarChart({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(label),
          SizedBox(height: 5),
          Container(
            width: 20,
            height: value * 10, // Scale the height based on value
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextCard extends StatelessWidget {
  final String? nama;
  final double? width;
  final double? height;
  final Color? color;
  final Widget child; // Change to accept any Widget

  const CustomTextCard({
    key,
    this.nama,
    this.width,
    this.height,
    this.color,
    required this.child, // Update constructor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              nama!,
              style: GoogleFonts.aBeeZee(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            child, // Display the child widget
          ],
        ),
      ),
    );
  }
}

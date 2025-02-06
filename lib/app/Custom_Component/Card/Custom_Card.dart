import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCard extends StatelessWidget {
  final String? title;
  final double? width;
  final double? height;
  final bool iscolumn;
  final Color? color;
  final List<Widget> children;

  const CustomCard({
    super.key,
    this.title,
    this.width,
    this.height,
    required this.iscolumn,
    this.color = Colors.white, // Default color is white
    required this.children,
  });

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
      child: iscolumn
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            )
          : Center(
              child: Text(
                title!,
                style: GoogleFonts.aBeeZee(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
    );
  }
}

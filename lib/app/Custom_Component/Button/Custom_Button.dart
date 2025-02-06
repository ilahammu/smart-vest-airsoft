import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color fgColor;
  final Color textColor;
  final double width;
  final double height;
  final double fontSize;
  final FontWeight fontWeight;
  final Function()? onPressed;
  final IconData? icon;
  final bool isIconOnly;
  final double opacity;

  const CustomButton({
    Key? key,
    required this.text,
    required this.bgColor,
    required this.fgColor,
    required this.textColor,
    required this.width,
    required this.height,
    required this.fontSize,
    required this.fontWeight,
    required this.onPressed,
    this.icon,
    this.isIconOnly = false,
    this.opacity = 1.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: SizedBox(
        width: isIconOnly ? height : width,
        height: height,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            elevation: 2,
            backgroundColor: bgColor,
            foregroundColor: fgColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: isIconOnly
              ? Center(child: Icon(icon, color: textColor))
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (icon != null) Icon(icon, color: textColor),
                    if (icon != null) SizedBox(width: 8),
                    Text(
                      text,
                      style: GoogleFonts.ramabhadra(
                        color: textColor,
                        fontSize: fontSize,
                        fontWeight: fontWeight,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

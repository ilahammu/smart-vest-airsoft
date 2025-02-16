import 'package:flutter/material.dart';
import 'package:vest_keren/app/Custom_Component/Button/Custom_Button.dart';

class CustomButtonStart extends StatelessWidget {
  final VoidCallback? onPressed;
  final double opacity;

  const CustomButtonStart({
    Key? key,
    required this.onPressed,
    required this.opacity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: "Start Game",
      bgColor: Colors.grey[600]!,
      fgColor: Colors.white,
      textColor: Colors.white,
      width: 200,
      height: 50,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      onPressed: onPressed,
      icon: null,
      isIconOnly: false,
      opacity: opacity,
    );
  }
}

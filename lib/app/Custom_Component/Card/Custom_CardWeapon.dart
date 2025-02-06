import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vest_keren/app/modules/Information/Controllers/Weapon_Controller.dart';

class CustomCardweapon extends StatelessWidget {
  final String? name;
  final String? type;
  final String? shotType;
  final double accuracy;
  final double firerate;
  final double magazine;
  final String? description;
  final double width; // Add width parameter
  final double height; // Add height parameter

  CustomCardweapon({
    super.key,
    this.name,
    this.type,
    this.shotType,
    required this.accuracy,
    required this.firerate,
    required this.magazine,
    this.description,
    required this.width, // Initialize width parameter
    required this.height, // Initialize height parameter
  });

  @override
  Widget build(BuildContext context) {
    final WeaponController controller = Get.find();

    return Container(
      width: width, // Use the width parameter
      height: height, // Use the height parameter
      decoration: BoxDecoration(
        color: Colors.white,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name!,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18, // Adjust font size as needed
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              shotType!,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14, // Adjust font size as needed
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              controller.getAccuracy({
                'accuracy': accuracy,
              }),
              style: TextStyle(
                color: Colors.black,
                fontSize: 14, // Adjust font size as needed
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              controller.getMagazine({
                'magazine': magazine,
              }),
              style: TextStyle(
                color: Colors.black,
                fontSize: 14, // Adjust font size as needed
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              controller.getFireRate({
                'firerate': firerate,
              }),
              style: TextStyle(
                color: Colors.black,
                fontSize: 14, // Adjust font size as needed
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              description!,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14, // Adjust font size as needed
              ),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

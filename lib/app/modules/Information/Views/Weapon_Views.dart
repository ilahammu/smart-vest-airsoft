import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vest_keren/app/modules/Information/Controllers/Weapon_Controller.dart';
import '../../../Custom_Component/Card/Custom_CardWeapon.dart';

class WeaponView extends GetView<WeaponController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weapon', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 59, 30, 30),
      ),
      backgroundColor: Colors.grey,
      body: Center(
        child: Obx(() {
          var groupedWeapons = controller.groupedWeapons;
          return ListView.builder(
            itemCount: groupedWeapons.keys.length,
            itemBuilder: (context, index) {
              var type = groupedWeapons.keys.elementAt(index);
              var weapons = groupedWeapons[type]!;
              return Column(
                children: [
                  Stack(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.zero, // Set corners to 90 degrees
                        ),
                        margin: EdgeInsets.only(bottom: 90),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Text(
                                type,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            ...weapons.map((weapon) {
                              return Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        weapon['image'] ??
                                            'assets/images/default.png',
                                        width: 300, // Adjust width as needed
                                        height: 250, // Adjust height as needed
                                        fit: BoxFit.contain,
                                      ),
                                      SizedBox(width: 100),
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: CustomCardweapon(
                                          name: weapon['name'] ?? 'Unknown',
                                          type: weapon['type'] ?? 'Unknown',
                                          shotType:
                                              weapon['shotType'] ?? 'Unknown',
                                          magazine:
                                              weapon['magazine'] ?? 'Unknown',
                                          accuracy:
                                              weapon['accuracy'] ?? 'Unknown',
                                          firerate:
                                              weapon['firerate'] ?? 'Unknown',
                                          description: weapon['description'] ??
                                              'No description available',
                                          width: 500, // Set the desired width
                                          height: 200, // Set the desired height
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                      height: 20), // Add margin between cards
                                ],
                              );
                            }).toList(),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: -10, // Adjust position as needed
                        left: 150, // Adjust position as needed
                        child: Container(
                          width: 10, // Adjust width as needed
                          height: 100, // Adjust height as needed
                          color: Colors.black,
                        ),
                      ),
                      Positioned(
                        bottom: -10, // Adjust position as needed
                        left: 170, // Adjust position as needed
                        child: Container(
                          width: 10, // Adjust width as needed
                          height: 100, // Adjust height as needed
                          color: Colors.black,
                        ),
                      ),
                      Positioned(
                        bottom: -10, // Adjust position as needed
                        right: 150, // Adjust position as needed
                        child: Container(
                          width: 10, // Adjust width as needed
                          height: 100, // Adjust height as needed
                          color: Colors.black,
                        ),
                      ),
                      Positioned(
                        bottom: -10, // Adjust position as needed
                        right: 170, // Adjust position as needed
                        child: Container(
                          width: 10, // Adjust width as needed
                          height: 100, // Adjust height as needed
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          );
        }),
      ),
    );
  }
}

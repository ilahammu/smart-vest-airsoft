import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Custom_Component/Button/Custom_Button.dart';
import '../../../Custom_Component/Card/Custom_Card.dart';
import '../Controllers/Home_controller.dart';
import '../Controllers/Overview_controller.dart';

class OverviewView extends GetView<OverviewController> {
  @override
  final OverviewController controller = Get.put(OverviewController());
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(
            255, 90, 27, 206), // Set a non-transparent background color
        title: Text('OverviewView'),
        // centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.lightBlue,
              Colors.purple[400]!,
              Colors.blue[900]!,
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 5), // Add top margin
                decoration: BoxDecoration(
                  color:
                      const Color.fromARGB(0, 126, 9, 139), // Background color
                  borderRadius: BorderRadius.circular(1), // Rounded corners
                ),
                child: Text(
                  'Smart Vest',
                  style: GoogleFonts.pixelifySans(
                      fontSize: 55,
                      color: const Color.fromARGB(255, 157, 204, 86),
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CustomCard(
                      iscolumn: true,
                      width: Get.width * 0.3, // 30% of screen width
                      height: Get.height * 0.75, // 75% of screen height
                      color: const Color.fromARGB(255, 65, 96, 132),
                      children: [
                        Obx(() {
                          return Center(
                            child: Container(
                              decoration: BoxDecoration(
                                color: controller
                                        .showAdditionalButtonsCard1.value
                                    ? const Color.fromARGB(0, 244, 67, 54)
                                    : const Color.fromARGB(255, 10, 162, 192),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: IconButton(
                                onPressed: controller.toggleCard1,
                                icon:
                                    controller.showAdditionalButtonsCard1.value
                                        ? Icon(Icons.arrow_back)
                                        : Text(
                                            'Play',
                                            style: GoogleFonts.nunito(
                                              color: Colors.white,
                                              fontSize: 50,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                color: Colors.white,
                                iconSize: 30,
                              ),
                            ),
                          );
                        }),
                        Obx(() {
                          return AnimatedOpacity(
                            opacity: controller.showAdditionalButtonsCard1.value
                                ? 1.0
                                : 0.0,
                            duration: Duration(milliseconds: 500),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomButton(
                                  onPressed: () {
                                    homeController.navigateTo('/gamestart');
                                  },
                                  text: 'Game Start',
                                  bgColor: Colors.blue,
                                  fgColor: Colors.white,
                                  textColor: Colors.white,
                                  width: Get.width * 0.25,
                                  height: 50,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                SizedBox(height: 20),
                                CustomButton(
                                  onPressed: () {
                                    homeController.navigateTo('/teaminfo');
                                  },
                                  text: 'Team Info',
                                  bgColor: Colors.blue,
                                  fgColor: Colors.white,
                                  textColor: Colors.white,
                                  width: Get.width * 0.25,
                                  height: 50,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                SizedBox(height: 20),
                                CustomButton(
                                  onPressed: () {
                                    homeController.navigateTo('/tambahorang');
                                  },
                                  text: 'Add Player',
                                  bgColor: Colors.blue,
                                  fgColor: Colors.white,
                                  textColor: Colors.white,
                                  width: Get.width * 0.25,
                                  height: 50,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                          );
                        }),
                      ],
                    ),
                    CustomCard(
                      iscolumn: true,
                      width: Get.width * 0.3, // 30% of screen width
                      height: Get.height * 0.75, // 75% of screen height
                      color: const Color.fromARGB(255, 65, 96, 132),
                      children: [
                        Obx(() {
                          return Center(
                            child: Container(
                              decoration: BoxDecoration(
                                color: controller
                                        .showAdditionalButtonsCard2.value
                                    ? const Color.fromARGB(0, 181, 39, 29)
                                    : const Color.fromARGB(255, 10, 162, 192),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: IconButton(
                                onPressed: controller.toggleCard2,
                                icon:
                                    controller.showAdditionalButtonsCard2.value
                                        ? Icon(Icons.arrow_back)
                                        : Text(
                                            'Information',
                                            style: GoogleFonts.nunito(
                                              color: Colors.white,
                                              fontSize: 50,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                color: Colors.white,
                                iconSize: 30,
                              ),
                            ),
                          );
                        }),
                        Obx(() {
                          return AnimatedOpacity(
                            opacity: controller.showAdditionalButtonsCard2.value
                                ? 1.0
                                : 0.0,
                            duration: Duration(milliseconds: 300),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomButton(
                                  onPressed: () {
                                    homeController.navigateTo('/vest');
                                  },
                                  text: 'Vest Information',
                                  bgColor: Colors.blue,
                                  fgColor: Colors.white,
                                  textColor: Colors.white,
                                  width: Get.width * 0.25,
                                  height: 50,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                SizedBox(height: 20),
                                CustomButton(
                                  onPressed: () {
                                    homeController.navigateTo('/weapon');
                                  },
                                  text: 'Weapon Information',
                                  bgColor: Colors.blue,
                                  fgColor: Colors.white,
                                  textColor: Colors.white,
                                  width: Get.width * 0.25,
                                  height: 50,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                SizedBox(height: 20),
                                CustomButton(
                                  onPressed: () {
                                    homeController.navigateTo('/arena');
                                  },
                                  text: 'Arena Information',
                                  bgColor: Colors.blue,
                                  fgColor: Colors.white,
                                  textColor: Colors.white,
                                  width: Get.width * 0.25,
                                  height: 50,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                          );
                        }),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

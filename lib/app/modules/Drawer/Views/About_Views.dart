import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:vest_keren/app/modules/Drawer/Controllers/About_Controller.dart';

class AboutView extends GetView<AboutController> {
  // final AboutController controller = Get.put(AboutController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(
            255, 90, 27, 206), // Set a non-transparent background color
        title: Text('AboutView'),
        // centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/ngawur.jpg', // Ganti dengan path gambar Anda
              width: 500,
              height: 500,
            ),
            SizedBox(height: 20),
            Text('Project Nguawor',
                style: GoogleFonts.aBeeZee(
                  fontSize: 54,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
          ],
        ),
      ),
    );
  }
}

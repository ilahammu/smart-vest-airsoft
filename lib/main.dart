import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:vest_keren/app/modules/Drawer/Views/Home_view.dart';
import 'package:vest_keren/app/modules/Login/Views/Login_Page_View.dart';

import 'app/routes/app_pages.dart';
import 'app/modules/Login/Bindings/Auth_Bindings.dart';
import 'app/modules/Login/Controllers/Auth_Controller.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

// void main() async {
//   await GetStorage.init();
//   final box = GetStorage();
//   box.erase(); // Hapus semua data sebelum aplikasi dimulai
//   runApp(MyApp());
// }

class MyApp extends StatelessWidget {
  final AuthController authC = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialBinding: AuthBinding(),
      home: Obx(() => authC.isLoggedIn.value ? HomeView() : LoginPage()),
      getPages: AppPages.routes,
    );
  }
}

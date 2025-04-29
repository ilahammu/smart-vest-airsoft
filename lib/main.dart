import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';
import 'app/modules/Login/Bindings/Auth_Bindings.dart';
import 'app/modules/Login/Controllers/Auth_Controller.dart';

void main() async {
  await GetStorage.init();

  // Get.put(AuthController());

  // // Auto login
  // final AuthController authC = Get.put(AuthController());
  // if (kDebugMode) {
  //   print("🚀 DEV MODE ACTIVE — auto login bypass enabled");
  //   authC.isLoggedIn.value = true; // ✅ fake login
  // }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // final AuthController authC = Get.find<AuthController>();
  final AuthController authC = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    final initial = Routes.login;

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Smart Vest App",
      initialBinding: AuthBinding(),
      getPages: AppPages.routes,
      initialRoute: initial,
    );
  }
}

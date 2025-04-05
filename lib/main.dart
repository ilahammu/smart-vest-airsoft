import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';
import 'app/modules/Login/Bindings/Auth_Bindings.dart';
import 'app/modules/Login/Controllers/Auth_Controller.dart';
import 'app/modules/Login/Views/Login_Page_View.dart';
import 'app/modules/Drawer/Bindings/Home_binding.dart';
import 'app/modules/Drawer/HomePage.dart';

void main() async {
  await GetStorage.init();

  // Auto-login saat development
  final AuthController authC = Get.put(AuthController());
  if (kDebugMode) {
    print("🚀 DEV MODE ACTIVE — auto login bypass enabled");
    authC.isLoggedIn.value = true; // ✅ fake login
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AuthController authC = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    final initial = kDebugMode
        ? Routes.home
        : (authC.isLoggedIn.value ? Routes.home : Routes.login);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Smart Vest App",
      initialBinding: AuthBinding(),
      getPages: AppPages.routes,
      initialRoute: initial,
    );
  }
}

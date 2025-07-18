import 'package:get/get.dart';

// Autentikasi
import '../modules/Login/Bindings/Auth_Bindings.dart';
import 'package:vest_keren/app/modules/Login/Views/Login_Page_View.dart';
import 'package:vest_keren/app/modules/Login/Views/Profile_Page_View.dart';
import 'package:vest_keren/app/modules/Login/Views/Register_Page_View.dart';

// HomeView
import '../modules/Main Overview/Bindings/Home_binding.dart';
// Overview
import '../modules/Main Overview/Views/Overview_view.dart';
// About
import '../modules/Main Overview/Views/About_Views.dart';
// Information
import '../modules/Main Overview/Views/Information_view.dart';

// Sistem Monitoring
import '../modules/Function System/Gameplay/Bindings/Chart_Binding.dart';
import '../modules/Function System/Gameplay/Views/Chart_View.dart';
// Gamestart
import '../modules/Function System/Gameplay/Bindings/GameStart_Binding.dart';
import '../modules/Function System/Gameplay/Views/GameStart_View.dart';
// Team Info
import '../modules/Function System/Gameplay/Bindings/TeamInfo_Binding.dart';
import '../modules/Function System/Gameplay/Views/TeamInfo_View.dart';
// Tambah Orang
import '../modules/Function System/Gameplay/Views/TambahOrang_View.dart';
import '../modules/Function System/Gameplay/Bindings/TambahOrang_Binding.dart';
// Monitoring
import '../modules/Function System/Drawer Monitoring/Monitoring_Binding.dart';
import '../modules/Function System/Drawer Monitoring/Monitoring_View.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.home;

  static final routes = [
    // Login & Register
    GetPage(
      name: _Paths.login,
      page: () => LoginPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.register,
      page: () => RegisterPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.profile,
      page: () => ProfilePage(),
      binding: AuthBinding(),
    ),

    // Tampilan Utama
    GetPage(
      name: _Paths.home,
      page: () =>
          OverviewView(), // Replace with the appropriate widget for the home page
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.overview,
      page: () => OverviewView(),
    ),
    GetPage(
      name: _Paths.information,
      page: () => InformationView(),
    ),
    GetPage(
      name: _Paths.about,
      page: () => AboutView(),
    ),

    // Game Start
    GetPage(
      name: _Paths.chart,
      page: () => ChartView(),
      binding: ChartBinding(),
    ),
    GetPage(
      name: _Paths.gamestart,
      page: () => GamestartView(),
      binding: GamestartBinding(),
    ),
    GetPage(
      name: _Paths.teaminfo,
      page: () => TeaminfoView(),
      binding: TeaminfoBinding(),
    ),
    GetPage(
      name: _Paths.tambahorang,
      page: () => TambahorangView(),
      binding: TambahorangBinding(),
    ),
    GetPage(
      name: _Paths.monitoring,
      page: () => MonitoringView(),
      binding: MonitoringBinding(),
    ),
  ];
}

import 'package:get/get.dart';

// HomeView
import '../modules/Drawer/Bindings/Home_binding.dart';
import '../modules/Drawer/Views/Home_view.dart';
// Overview
import '../modules/Drawer/Bindings/Overview_binding.dart';
import '../modules/Drawer/Views/Overview_view.dart';
// About
import '../modules/Drawer/Bindings/About_Binding.dart';
import '../modules/Drawer/Views/About_Views.dart';
// Settings
import '../modules/Drawer/Bindings/Settings_binding.dart';
import '../modules/Drawer/Views/settings_view.dart';
// Gamestart
import 'package:vest_keren/app/modules/Gameplay/Bindings/GameStart_Binding.dart';
import 'package:vest_keren/app/modules/Gameplay/Views/GameStart_View.dart';
// Team Info
import 'package:vest_keren/app/modules/Gameplay/Bindings/TeamInfo_Binding.dart';
import 'package:vest_keren/app/modules/Gameplay/Views/TeamInfo_View.dart';
// Tambah Orang
import '../modules/Gameplay/Bindings/TambahOrang_Binding.dart';
import '../modules/Gameplay/Views/TambahOrang_View.dart';
// Arena
import '../modules/Information/Bindings/Arena_Binding.dart';
import '../modules/Information/Views/Arena_Views.dart';
// Vest
import '../modules/Information/Bindings/Vest_Binding.dart';
import '../modules/Information/Views/Vest_Views.dart';
// Weapons
import '../modules/Information/Bindings/Weapon_Binding.dart';
import '../modules/Information/Views/Weapon_Views.dart';
// Autentikasi
import '../modules/Login/Bindings/Auth_Bindings.dart';
import 'package:vest_keren/app/modules/Login/Views/Login_Page_View.dart';
import 'package:vest_keren/app/modules/Login/Views/Profile_Page_View.dart';
import 'package:vest_keren/app/modules/Login/Views/Register_Page_View.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.home;

  static final routes = [
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
    GetPage(
      name: _Paths.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.overview,
      page: () => OverviewView(),
      binding: OverviewBinding(),
    ),
    GetPage(
      name: _Paths.settings,
      page: () => PengaturanView(),
      binding: PengaturanBinding(),
    ),
    GetPage(
      name: _Paths.about,
      page: () => AboutView(),
      binding: AboutBinding(),
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
      name: _Paths.arena,
      page: () => ArenaView(),
      binding: ArenaBinding(),
    ),
    GetPage(
      name: _Paths.vest,
      page: () => VestView(),
      binding: VestBinding(),
    ),
    GetPage(
      name: _Paths.weapon,
      page: () => WeaponView(),
      binding: WeaponBinding(),
    ),
  ];
}

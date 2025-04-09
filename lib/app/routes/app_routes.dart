// ignore_for_file: constant_identifier_names

part of 'app_pages.dart';
// DO NOT EDIT. This is code generated via package:get_cli/get_cli.dart

abstract class Routes {
  Routes._();
  // login
  static const login = _Paths.login;
  static const register = _Paths.register;
  static const profile = _Paths.profile;

  // home
  static const home = _Paths.home;
  static const overview = _Paths.overview;
  static const about = _Paths.about;
  static const information = _Paths.information;

  // system function
  static const chart = _Paths.chart;
  static const gamestart = _Paths.gamestart;
  static const teaminfo = _Paths.teaminfo;
  static const tambahorang = _Paths.tambahorang;
  static const monitoring = _Paths.monitoring;
}

abstract class _Paths {
  _Paths._();
  //  login & register
  static const login = '/login';
  static const register = '/register';
  static const profile = '/profile';

  // tampilan utama
  static const home = '/home';
  static const overview = '/overview';
  static const information = '/information';
  static const about = '/about';

  // system function
  static const chart = '/chart';
  static const gamestart = '/gamestart';
  static const teaminfo = '/teaminfo';
  static const tambahorang = '/tambahorang';
  static const monitoring = '/monitoring';
}

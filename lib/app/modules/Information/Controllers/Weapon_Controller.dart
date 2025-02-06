import 'package:get/get.dart';

class WeaponController extends GetxController {
  Map<String, List<Map<String, dynamic>>> get groupedWeapons {
    Map<String, List<Map<String, dynamic>>> grouped = {};
    for (var weapon in weapons) {
      if (!grouped.containsKey(weapon['type'])) {
        grouped[weapon['type'] as String] = [];
      }
      grouped[weapon['type']]!.add(weapon);
    }
    return grouped;
  }

  var weapons = [
    // Handgun
    {
      'name': 'Pistol',
      'image': 'assets/images/senjata/pistol.png',
      'type': 'Handgun',
      'shotType': 'Semi-Automatic',
      'accuracy': 7.2,
      'firerate': 3.0,
      'magazine': 12.0,
      'description': 'A standard issue sidearm.'
    },
    {
      'name': 'Glock 17',
      'image': 'assets/images/senjata/glock17.png',
      'type': 'Handgun',
      'shotType': 'Semi-Automatic',
      'accuracy': 7.2,
      'firerate': 3.0,
      'magazine': 15.0,
      'description': 'A standard issue sidearm.'
    },
    // Assault Rifle
    {
      'name': 'AK-47',
      'image': 'assets/images/senjata/ak47.png',
      'type': 'Assault Rifle',
      'shotType': 'Automatic',
      'accuracy': 7.2,
      'firerate': 7.0,
      'magazine': 25.0,
      'description': 'A popular assault rifle known for its reliability.'
    },
    {
      'name': 'M416',
      'image': 'assets/images/senjata/m416.png',
      'type': 'Assault Rifle',
      'shotType': 'Automatic',
      'accuracy': 7.2,
      'firerate': 7.0,
      'magazine': 35.0,
      'description': 'A popular assault rifle known for its reliability.'
    },
    // Shotgun
    {
      'name': 'Shotgun',
      'image': 'assets/images/senjata/shotgun.png',
      'type': 'Shotgun',
      'shotType': 'Pump-Action',
      'accuracy': 7.2,
      'firerate': 1.0,
      'magazine': 8.0,
      'description': 'A powerful close-range weapon.'
    },
    {
      'name': 'Double Barrel',
      'image': 'assets/images/senjata/double_barrel.png',
      'type': 'Shotgun',
      'shotType': 'Pump-Action',
      'accuracy': 7.2,
      'firerate': 1.0,
      'magazine': 2.0,
      'description': 'A powerful close-range weapon.'
    },
  ].obs;

  @override
  void onInit() {
    super.onInit();
  }

  String getAccuracy(Map<String, dynamic> weapon) {
    return '${weapon['accuracy']}%';
  }

  String getFireRate(Map<String, dynamic> weapon) {
    return '${weapon['firerate']}/sec';
  }

  String getMagazine(Map<String, dynamic> weapon) {
    return '${weapon['magazine']} rounds';
  }
}

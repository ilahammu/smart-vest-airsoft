class DataTableGameplay {
  int health;
  final int no;
  final String name;
  final int hitpoint; // Tambahkan ini
  final String selectedTeam;
  final String mac_address;
  bool statusReady;
  bool statusWeapon;

  DataTableGameplay({
    required this.no,
    required this.name,
    required this.health,
    required this.selectedTeam,
    required this.mac_address,
    required this.statusReady,
    required this.statusWeapon,
    required this.hitpoint, // Tambahkan ini
  });

  factory DataTableGameplay.fromJson(Map<String, dynamic> json) {
    return DataTableGameplay(
      no: json['no'] ?? 0,
      name: json['name'] ?? 'Unknown',
      health: json['health'] ?? 100,
      selectedTeam: json['selectedTeam'] ?? 'Unknown',
      mac_address: json['mac_address'] ?? 'Unknown',
      statusReady: json['statusReady'] ?? false,
      statusWeapon: json['statusWeapon'] ?? false,
      hitpoint: json['hitpoint'] ?? 0, // Tambahkan ini
    );
  }
}

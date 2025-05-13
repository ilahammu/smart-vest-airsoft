class DataTableGameplay {
  final int no;
  final String name;
  final int health;
  final String selectedTeam;
  final String PlayerID;
  final bool statusReady;
  final bool statusWeapon; // Tambahkan atribut statusWeapon

  DataTableGameplay({
    required this.no,
    required this.name,
    required this.health,
    required this.selectedTeam,
    required this.PlayerID,
    required this.statusReady,
    required this.statusWeapon, // Tambahkan atribut statusWeapon
  });

  factory DataTableGameplay.fromJson(Map<String, dynamic> json) {
    return DataTableGameplay(
      no: json['no'] ?? 0,
      name: json['name'] ?? 'Unknown',
      health: json['health'] ?? 100,
      selectedTeam: json['selectedTeam'] ?? 'Unknown',
      PlayerID: json['PlayerID'] ?? 'Unknown',
      statusReady: json['statusReady'] ?? false,
      statusWeapon:
          json['statusWeapon'] ?? false, // Tambahkan atribut statusWeapon
    );
  }
}

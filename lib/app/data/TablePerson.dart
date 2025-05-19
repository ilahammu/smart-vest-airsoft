class DataTablePerson {
  final String name;
  final String team;
  final String macAddress; // Properti untuk menyimpan mac_address

  DataTablePerson({
    required this.name,
    required this.team,
    required this.macAddress,
  });

  factory DataTablePerson.fromJson(Map<String, dynamic> json) {
    return DataTablePerson(
      name: json['name'] ?? 'Unknown',
      team: json['selectedTeam'] ?? 'Unknown',
      macAddress: json['mac_address'] ?? '', // Ambil mac_address dari API
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'team': team,
      'mac_address': macAddress,
    };
  }
}

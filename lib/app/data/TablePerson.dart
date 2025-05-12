class DataTablePerson {
  final String name;
  final String team;
  final int playerId; // Properti untuk menyimpan PlayerID

  DataTablePerson({
    required this.name,
    required this.team,
    required this.playerId,
  });

  factory DataTablePerson.fromJson(Map<String, dynamic> json) {
    return DataTablePerson(
      name: json['name'] ?? 'Unknown',
      team: json['selectedTeam'] ?? 'Unknown',
      playerId: json['PlayerID'] ?? 0, // Pastikan PlayerID diambil dari API
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'team': team,
      'PlayerID': playerId,
    };
  }
}

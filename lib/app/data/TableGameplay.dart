class DataTableGameplay {
  final int no;
  final String name;
  final int health;
  final String selectedTeam;

  DataTableGameplay({
    required this.no,
    required this.name,
    required this.health,
    required this.selectedTeam,
  });

  factory DataTableGameplay.fromJson(Map<String, dynamic> json) {
    return DataTableGameplay(
      no: json['no'] ?? 0,
      name: json['name'] ?? "Unknown",
      health: json['health'] ?? 100,
      selectedTeam: json['selectedTeam'] ?? "Unknown",
    );
  }
}

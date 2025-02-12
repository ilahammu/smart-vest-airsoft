class DataTableGameplay {
  final String name;
  final String team;
  final String HP;

  DataTableGameplay({
    required this.name,
    required this.team,
    required this.HP,
  });

  factory DataTableGameplay.fromJson(Map<String, dynamic> json) {
    return DataTableGameplay(
      name: json['name'] ?? 'Unknown', // Provide default value if null
      team: json['selectedTeam'] ?? 'Unknown', // Provide default value if null
      HP: json['health'] ?? 'Unknown', // Provide default value if null
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'team': team,
      'health': HP,
    };
  }
}

class DataTablePerson {
  final String name;
  final String team;

  DataTablePerson({
    required this.name,
    required this.team,
  });

  factory DataTablePerson.fromJson(Map<String, dynamic> json) {
    return DataTablePerson(
      name: json['name'] ?? 'Unknown', // Provide default value if null
      team: json['selectedTeam'] ?? 'Unknown', // Provide default value if null
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'team': team,
    };
  }
}

class DataTableHitpoint {
  final String name;
  final String team;
  final String hitpoint;
  final DateTime timestamp;

  DataTableHitpoint({
    required this.name,
    required this.team,
    required this.hitpoint,
    required this.timestamp,
  });

  factory DataTableHitpoint.fromJson(Map<String, dynamic> json) {
    return DataTableHitpoint(
      name: json['name'] ?? 'Unknown',
      team: json['selectedTeam'] ?? 'Unknown',
      hitpoint: json['hitpoint'] ?? 'Unknown',
      timestamp: json['timestamp'] ?? 'Unknown',
    );
  }
}

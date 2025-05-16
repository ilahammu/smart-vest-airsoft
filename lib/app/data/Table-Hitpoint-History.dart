class DataTableHitpointHistory {
  final int id;
  final int hitpoint;
  final DateTime timestamp;

  DataTableHitpointHistory({
    required this.id,
    required this.hitpoint,
    required this.timestamp,
  });

  factory DataTableHitpointHistory.fromJson(Map<String, dynamic> json) {
    return DataTableHitpointHistory(
      id: json['id'] ?? 0, // Pastikan default adalah 0
      hitpoint: json['hitpoint'] ?? 0, // Pastikan default adalah 0
      timestamp: json.containsKey('timestamp') && json['timestamp'] != null
          ? DateTime.parse(json['timestamp'])
          : DateTime.now(),
    );
  }

  // 🔥 Fungsi untuk mengonversi hitpoint menjadi deskripsi
  String get hitpointDescription {
    switch (hitpoint) {
      case 1:
        return "Bahu Kiri";
      case 2:
        return "Bahu Kanan";
      case 3:
        return "Rusuk Kiri";
      case 4:
        return "Rusuk Kanan";
      case 5:
        return "Jantung";
      case 6:
        return "Pingganng Kiri";
      case 7:
        return "Pinggang Kanan";
      case 8:
        return "Pusar";
      default:
        return "Unknown";
    }
  }
}

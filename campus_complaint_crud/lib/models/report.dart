class Report {
  final int id;
  final String title;
  final String location;
  final String status;
  final String? description;
  final String? reporter;
  final DateTime createdAt;

  Report({
    required this.id,
    required this.title,
    required this.location,
    required this.description,
    required this.status,
    required this.reporter,
    required this.createdAt,
  });

  Report copyWith({
    int? id,
    String? title,
    String? location,
    String? description,
    String? status,
    String? reporter,
    DateTime? createdAt,
  }) {
    return Report(
      id: id ?? this.id,
      title: title ?? this.title,
      location: location ?? this.location,
      description: description ?? this.description,
      status: status ?? this.status,
      reporter: reporter ?? this.reporter,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

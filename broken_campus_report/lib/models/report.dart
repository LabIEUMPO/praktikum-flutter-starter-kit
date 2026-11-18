class Report {
  final int id;
  final String title;
  final String location;
  final String status;
  String? description;
  String? reporter;
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
}

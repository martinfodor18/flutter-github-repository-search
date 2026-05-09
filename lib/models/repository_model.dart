class RepositoryModel {
  final String name;
  final String? description;
  final DateTime updatedAt;

  RepositoryModel({
    required this.name,
    this.description,
    required this.updatedAt,
  });

  factory RepositoryModel.fromJson(Map<String, dynamic> json) {
    return RepositoryModel(
      name: json['name'],
      description: json['description'],
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}

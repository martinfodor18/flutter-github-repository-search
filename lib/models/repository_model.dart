class RepositoryModel {
  final String name;
  final String? description;

  final String ownerName;
  final String ownerAvatarUrl;
  final String ownerProfileUrl;

  final String repositoryUrl;

  final int forksCount;

  final DateTime createdAt;
  final DateTime updatedAt;

  RepositoryModel({
    required this.name,
    this.description,

    required this.ownerName,
    required this.ownerAvatarUrl,
    required this.ownerProfileUrl,

    required this.repositoryUrl,

    required this.forksCount,

    required this.createdAt,
    required this.updatedAt,
  });

  factory RepositoryModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return RepositoryModel(
      name: json['name'],

      description: json['description'],

      ownerName: json['owner']['login'],

      ownerAvatarUrl:
      json['owner']['avatar_url'],

      ownerProfileUrl:
      json['owner']['html_url'],

      repositoryUrl: json['html_url'],

      forksCount: json['forks_count'],

      createdAt: DateTime.parse(
        json['created_at'],
      ),

      updatedAt: DateTime.parse(
        json['updated_at'],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,

      'owner': {
        'login': ownerName,
        'avatar_url': ownerAvatarUrl,
        'html_url': ownerProfileUrl,
      },

      'html_url': repositoryUrl,

      'forks_count': forksCount,

      'created_at':
      createdAt.toIso8601String(),

      'updated_at':
      updatedAt.toIso8601String(),
    };
  }
}
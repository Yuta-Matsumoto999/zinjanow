class UserResponseModel {
  final String id;
  final String name;
  final String email;
  final String role;
  final String? icon;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserResponseModel({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    this.icon,
    required this.createdAt,
    required this.updatedAt
  });

  factory UserResponseModel.fromJson(Map<String, dynamic> json) {
    return UserResponseModel(
      id: json["id"],
      name: json["username"],
      email: json["email"], 
      role: json["role"],
      icon: json["icon"],
      createdAt: DateTime.parse(json["created_at"]), 
      updatedAt: DateTime.parse(json["updated_at"])
    );
  }
}
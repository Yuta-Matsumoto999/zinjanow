class User {
  final String name;
  final String email;
  final String? icon;

  User({
    required this.name,
    required this.email,
    this.icon
  });
}
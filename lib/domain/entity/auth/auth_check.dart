class AuthCheck {
  final bool isAuth;
  final String? name;
  final String? message;

  AuthCheck({
    required this.isAuth,
    this.name,
    this.message
  });
}
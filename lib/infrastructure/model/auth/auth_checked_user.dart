class AuthCheckedUser {
  final bool isAuth;
  final String? name;
  final String? message;

  AuthCheckedUser({
    required this.isAuth,
    this.name,
    this.message
  });
}
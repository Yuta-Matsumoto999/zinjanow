class AuthCheckedUser {
  final bool isAuth;
  final String? message;

  AuthCheckedUser({
    required this.isAuth,
    this.message
  });
}
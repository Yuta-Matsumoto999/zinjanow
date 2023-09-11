class AuthCheckResponseModel {
  final bool isAuth;
  final String? message;

  AuthCheckResponseModel({
    required this.isAuth,
    this.message
  });
}
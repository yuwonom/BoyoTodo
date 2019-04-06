class LoginFailedException implements Exception {
  final String message;

  const LoginFailedException(this.message);

  String toString() => "LoginFailedException : $message";
}
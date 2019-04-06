import 'package:boyo_todo/features/login/dtos.dart';
import 'package:boyo_todo/utility/action_exception.dart';
import 'package:meta/meta.dart';

@immutable
class InitiateLogin {
  const InitiateLogin();

  @override
  String toString() => "InitiateLogin";
}

@immutable
class LoginSuccessful {
  const LoginSuccessful(this.user);

  final UserDto user;

  @override
  String toString() => "LoginSuccessful";
}

@immutable
class LoginFailed {
  const LoginFailed(this.exception) : assert(exception != null);

  final ActionException exception;

  @override
  String toString() => "LoginFailed";
}

@immutable
class Logout {
  const Logout();

  @override
  String toString() => "Logout";
}

@immutable
class SaveUserInfo {
  const SaveUserInfo(this.user);

  final UserDto user;

  @override
  String toString() => "SaveUserInfo";
}

@immutable
class LoadUserInfo {
  const LoadUserInfo();

  @override
  String toString() => "LoadUserInfo";
}

@immutable
class LoadUserInfoSuccessful {
  const LoadUserInfoSuccessful(this.user);

  final UserDto user;

  @override
  String toString() => "LoadUserInfoSuccessful";
}

@immutable
class DeleteUserInfo {
  const DeleteUserInfo();

  @override
  String toString() => "DeleteUserInfo";
}
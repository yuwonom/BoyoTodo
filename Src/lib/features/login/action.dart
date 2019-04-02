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
class LogInSuccessful {
  const LogInSuccessful(this.user, {this.onSuccessCallback});

  final UserDto user;
  final Function onSuccessCallback;

  @override
  String toString() => "LoginSuccessful";
}

@immutable
class LogInFailed {
  const LogInFailed({this.exception}) : assert(exception != null);

  final ActionException exception;

  @override
  String toString() => "LoginFailed";
}

@immutable
class LogOut {
  const LogOut();

  @override
  String toString() => "LogOut";
}
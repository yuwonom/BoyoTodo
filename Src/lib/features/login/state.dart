import 'package:boyo_todo/features/login/dtos.dart';
import 'package:boyo_todo/utility/action_exception.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'state.g.dart';

abstract class LoginState implements Built<LoginState, LoginStateBuilder> {
  factory LoginState([void updates(LoginStateBuilder b)]) = _$LoginState;
  factory LoginState.initial() => _$LoginState._(isBusy: false);
  LoginState._();

  bool get isBusy;

  @nullable
  UserDto get user;
  @nullable
  ActionException get exception;

  static Serializer<LoginState> get serializer => _$loginStateSerializer;
}

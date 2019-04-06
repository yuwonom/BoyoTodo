import 'package:boyo_todo/features/login/state.dart';

class LoginViewModel {
  final LoginState _state;

  LoginViewModel(this._state);

  bool get isBusy => _state.isBusy;

  bool get hasException => _state.exception != null;
}
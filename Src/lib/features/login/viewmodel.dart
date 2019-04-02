import 'package:boyo_todo/features/login/state.dart';

class LogInViewModel {
  final LoginState _state;

  LogInViewModel(this._state);

  bool get isBusy => _state.isBusy;
}
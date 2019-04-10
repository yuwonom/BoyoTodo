import 'package:boyo_todo/features/login/state.dart';

class NavigationViewModel {
  final LoginState _loginState;

  NavigationViewModel(this._loginState);

  String get name => _loginState.user != null ? _loginState.user.name.split(" ")[0] : "";
}
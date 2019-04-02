import 'package:boyo_todo/features/login/action.dart';
import 'package:boyo_todo/state.dart';
import 'package:redux/redux.dart';

import 'package:boyo_todo/features/login/api.dart' as login;

List<Middleware<AppState>> getMiddleware(login.Api api) => [
      ApiIntegration(api).getMiddlewareBindings(),
    ].expand((x) => x).toList();

class ApiIntegration {
  final login.Api api;

  ApiIntegration(this.api) : assert(api != null);

  List<Middleware<AppState>> getMiddlewareBindings() => [
        TypedMiddleware<AppState, InitiateLogin>(_initiateLogin),
      ];

  void _initiateLogin(Store<AppState> store, InitiateLogin action, NextDispatcher next) {
    next(action);
  }
}
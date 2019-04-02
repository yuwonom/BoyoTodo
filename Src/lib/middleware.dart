import 'package:boyo_todo/globals.dart';
import 'package:boyo_todo/state.dart';
import 'package:redux/redux.dart';

import 'package:boyo_todo/features/login/middleware.dart' as login;

List<Middleware<AppState>> getMiddleware(
  Apis apis,
) => [
    login.getMiddleware(apis.loginApi),
  ].expand((x) => x).toList();
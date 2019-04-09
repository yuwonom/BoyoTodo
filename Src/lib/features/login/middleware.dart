import 'dart:convert';
import 'dart:io';

import 'package:boyo_todo/features/login/action.dart';
import 'package:boyo_todo/features/login/dtos.dart';
import 'package:boyo_todo/features/login/ui.dart';
import 'package:boyo_todo/features/navigation/ui.dart';
import 'package:boyo_todo/state.dart';
import 'package:boyo_todo/utility/action_exception.dart';
import 'package:boyo_todo/utility/serialization.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:redux/redux.dart';

import 'package:boyo_todo/features/login/api.dart' as login;

List<Middleware<AppState>> getMiddleware(login.Api api, GlobalKey<NavigatorState> navigatorKey) => [
      ApiIntegration(api).getMiddlewareBindings(),
      Routing(navigatorKey).getMiddlewareBindings(),
      LocalStorage().getMiddlewareBindings(),
    ].expand((x) => x).toList();

class ApiIntegration {
  final login.Api api;

  ApiIntegration(this.api) : assert(api != null);

  List<Middleware<AppState>> getMiddlewareBindings() => [
        TypedMiddleware<AppState, InitiateLogin>(_handleLogin),
        TypedMiddleware<AppState, LoginSuccessful>(_loginSuccessful),
        TypedMiddleware<AppState, Logout>(_handleLogout),
      ];

  void _handleLogin(Store<AppState> store, InitiateLogin action, NextDispatcher next) {
    Future<void> _initiateLogin(Store<AppState> store, InitiateLogin action) async {
      try {
        final user = await api.logIn();
        await api.validateUser(user);
        store.dispatch(LoginSuccessful(user));
      } on Exception catch (exception) {
        store.dispatch(LoginFailed(ActionException(exception, action)));
      }
    }

    _initiateLogin(store, action);
    next(action);
  }

  void _loginSuccessful(Store<AppState> store, LoginSuccessful action, NextDispatcher next) {
    store.dispatch(SaveUserInfo(action.user));
    next(action);
  }

  void _handleLogout(Store<AppState> store, Logout action, NextDispatcher next) {
    Future<void> _logout(Store<AppState> store, Logout action) async {
      await api.logOut();
      store.dispatch(DeleteUserInfo());
    }

    _logout(store, action);
    next(action);
  }
}

class Routing {
  final GlobalKey<NavigatorState> navigatorKey;

  const Routing(this.navigatorKey);

  List<Middleware<AppState>> getMiddlewareBindings() => [
        TypedMiddleware<AppState, LoginSuccessful>(_routeAction),
        TypedMiddleware<AppState, LoadUserInfoSuccessful>(_routeAction),
        TypedMiddleware<AppState, DeleteUserInfo>(_routeAction),
      ];
  
  NavigatorState get _navigatorState => navigatorKey.currentState;

  void _routeAction(Store<AppState> store, dynamic action, NextDispatcher next) {
    next(action);

    final nextPageInfo = _getNextPageInfo(store);
    final route = new MaterialPageRoute<Null>(builder: (BuildContext context) => nextPageInfo.page);

    if (nextPageInfo.replaceRoot) {
      _navigatorState.pushAndRemoveUntil<Null>(route, (Route<dynamic> route) => false);
    } else {
      _navigatorState.push<Null>(route);
    }
  }

  _NextPageInfo _getNextPageInfo(Store<AppState> store) {
    final user = store.state.login.user;

    if (user == null) {
      return _NextPageInfo(page: Login(), replaceRoot: true);
    } else {
      return _NextPageInfo(page: Navigation(), replaceRoot: true);
    }
  }
}

class _NextPageInfo {
  _NextPageInfo({this.page, this.replaceRoot});

  final Widget page;
  final bool replaceRoot;
}

class LocalStorage {
  LocalStorage();

  List<Middleware<AppState>> getMiddlewareBindings() => [
        TypedMiddleware<AppState, SaveUserInfo>(_handleSave),
        TypedMiddleware<AppState, LoadUserInfo>(_handleLoad),
        TypedMiddleware<AppState, DeleteUserInfo>(_handleDelete),
      ];

  Future<File> _getFile() async {
    final fileName = "userDto.json";
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/$fileName');
  }

  void _handleSave(Store<AppState> store, SaveUserInfo action, NextDispatcher next) async {
    Future<void> _saveUserInfo(Store<AppState> store, SaveUserInfo action) async {
      final file = await _getFile();
      file.writeAsString(jsonEncode(serializers.serialize(action.user)));
    }

    _saveUserInfo(store, action);
    next(action);
  }

  void _handleLoad(Store<AppState> store, LoadUserInfo action, NextDispatcher next) async {
    Future<void> _loadUserInfo(Store<AppState> store, LoadUserInfo action) async {
      final file = await _getFile();
      if (await file.exists()) {
        final contents = await file.readAsString();
        final user = serializers.deserialize(jsonDecode(contents)) as UserDto;
        store.dispatch(LoadUserInfoSuccessful(user));
      }
    }

    _loadUserInfo(store, action);
    next(action);
  }

  void _handleDelete(Store<AppState> store, DeleteUserInfo action, NextDispatcher next) async {
    Future<void> _deleteUserInfo(Store<AppState> store, DeleteUserInfo action) async {
      final file = await _getFile();
      if (await file.exists()) {
        file.delete();
      }
    }

    _deleteUserInfo(store, action);
    next(action);
  }
}
import 'package:boyo_todo/features/login/ui.dart';
import 'package:boyo_todo/globals.dart';
import 'package:boyo_todo/middleware.dart';
import 'package:boyo_todo/reducers.dart';
import 'package:boyo_todo/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:boyo_todo/features/login/api.dart' as login;
import 'package:boyo_todo/globals.dart' as globals;

ApplicationInformation createApplicationInformation(Apis apis, NavigatorObserver navigatorObserver) {
  final appKey = GlobalKey(debugLabel: "app");
  final navigatorKey = GlobalKey<NavigatorState>(debugLabel: "navigator");

  // Do not use this to navigate to tabs of TopLevelWidget, use NavigateMainTo action instead.
  final routes = <String, WidgetBuilder>{};

  final materialApp = MaterialApp(
    title: "Boyo Todo",
    key: appKey,
    home: Login(),
    navigatorKey: navigatorKey,
    navigatorObservers: [navigatorObserver],
    routes: routes,
  );

  final middleware = getMiddleware(apis, navigatorKey);

  final store = Store<AppState>(
    appStateReducer,
    initialState: AppState.initial(),
    middleware: middleware,
  );

  final storeProvider = StoreProvider<AppState>(
    store: store,
    child: materialApp,
  );

  return ApplicationInformation(apis, storeProvider, navigatorKey, store);
}

login.Api _loginApi;
login.Api getLoginApi() => _loginApi ??= globals.disconnected ? login.Disconnected() : login.Connected();

class CompositeNavigatorObserver extends NavigatorObserver {
  final List<NavigatorObserver> _observers;

  CompositeNavigatorObserver() : _observers = <NavigatorObserver>[];

  void addObserver(NavigatorObserver observer) => _observers.add(observer);

  @override
  void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {
    for (var observer in _observers) {
      observer.didPush(route, previousRoute);
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {
    for (var observer in _observers) {
      observer.didPop(route, previousRoute);
    }
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic> previousRoute) {
    for (var observer in _observers) {
      observer.didRemove(route, previousRoute);
    }
  }

  @override
  void didReplace({Route<dynamic> oldRoute, Route<dynamic> newRoute}) {
    for (var observer in _observers) {
      observer.didReplace(oldRoute: oldRoute, newRoute: newRoute);
    }
  }
}
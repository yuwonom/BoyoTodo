import 'package:boyo_todo/state.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import 'package:boyo_todo/features/login/api.dart' as login;

export 'package:boyo_todo/globals.g.dart';

// Contains information about the currently active application.
ApplicationInformation applicationInformation;

/// Encapsulates APIs from all features.
class Apis {
  final login.Api loginApi;

  const Apis(this.loginApi);
}

/// Encapsulates all "global" pieces of state for an application run.
class ApplicationInformation {
  final Apis apis;
  final Widget applicationWidget;
  final GlobalKey scaffoldKey;
  final Store<AppState> store;

  ApplicationInformation(this.apis, this.applicationWidget, this.scaffoldKey, this.store);
}

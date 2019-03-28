import 'package:boyo_todo/composition.dart';
import 'package:boyo_todo/globals.dart' as globals;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  
  final apis = globals.Apis();
  final navigatorObserver = CompositeNavigatorObserver();

  final applicationInformation = createApplicationInformation(apis, navigatorObserver);

  globals.applicationInformation = applicationInformation;

  runApp(applicationInformation.applicationWidget);
}
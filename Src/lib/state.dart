import 'package:boyo_todo/features/login/state.dart';
import 'package:boyo_todo/features/notebook/state.dart';
import 'package:built_value/built_value.dart';

part 'state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  factory AppState([void updates(AppStateBuilder b)]) = _$AppState;

  factory AppState.initial() => new _$AppState._(
    login: LoginState.initial(),
    notebook: NotebookState.initial(),
  );

  AppState._();

  LoginState get login;
  NotebookState get notebook;
}
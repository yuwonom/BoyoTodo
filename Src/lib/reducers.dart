import 'package:boyo_todo/features/login/reducers.dart';
import 'package:boyo_todo/state.dart';
import 'package:redux/redux.dart';

final Reducer<AppState> appStateReducer = combineReducers([TypedReducer<AppState, dynamic>(_childStateReducer)]);

AppState _childStateReducer(AppState state, dynamic action) => state.rebuild((b) => b
  ..login.replace(loginStateReducer(state.login, action)));
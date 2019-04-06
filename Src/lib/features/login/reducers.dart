import 'package:boyo_todo/features/login/action.dart';
import 'package:boyo_todo/features/login/state.dart';
import 'package:redux/redux.dart';

final Reducer<LoginState> loginStateReducer = combineReducers([
  TypedReducer<LoginState, InitiateLogin>(_initiateLoginReducer),
  TypedReducer<LoginState, LoginSuccessful>(_logInSuccessful),
  TypedReducer<LoginState, LoginFailed>(_logInFailed),
  TypedReducer<LoginState, Logout>(_logOut),
  TypedReducer<LoginState, LoadUserInfoSuccessful>(_loadUserInfoSuccessfulReducer),
]);

LoginState _initiateLoginReducer(LoginState state, InitiateLogin action) => state.rebuild((b) => b
  ..isBusy = true
  ..user = null
  ..exception = null);

LoginState _logInSuccessful(LoginState state, LoginSuccessful action) => state.rebuild((b) => b
  ..isBusy = false
  ..user.replace(action.user)
  ..exception = null);

LoginState _logInFailed(LoginState state, LoginFailed action) => state.rebuild((b) => b
  ..isBusy = false
  ..user = null
  ..exception = action.exception);

LoginState _logOut(LoginState state, Logout action) => state.rebuild((b) => b
  ..isBusy = false
  ..user = null
  ..exception = null);

LoginState _loadUserInfoSuccessfulReducer(LoginState state, LoadUserInfoSuccessful action) => state.rebuild((b) => b
  ..isBusy = false
  ..user.replace(action.user)
  ..exception = null);
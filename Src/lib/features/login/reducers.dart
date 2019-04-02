import 'package:boyo_todo/features/login/action.dart';
import 'package:boyo_todo/features/login/state.dart';
import 'package:redux/redux.dart';

final Reducer<LoginState> logInStateReducer = combineReducers([
  TypedReducer<LoginState, InitiateLogin>(_initiateLoginReducer),
  TypedReducer<LoginState, LogInSuccessful>(_logInSuccessful),
  TypedReducer<LoginState, LogInFailed>(_logInFailed),
  TypedReducer<LoginState, LogOut>(_logOut),
]);

LoginState _initiateLoginReducer(LoginState state, InitiateLogin action) => state.rebuild((b) => b
  ..isBusy = true
  ..user = null
  ..exception = null);

LoginState _logInSuccessful(LoginState state, LogInSuccessful action) => state.rebuild((b) => b
  ..isBusy = false
  ..user.replace(action.user)
  ..exception = null);

LoginState _logInFailed(LoginState state, LogInFailed action) => state.rebuild((b) => b
  ..isBusy = false
  ..user = null
  ..exception = action.exception);

LoginState _logOut(LoginState state, LogOut action) => state.rebuild((b) => b
  ..isBusy = false
  ..user = null
  ..exception = null);
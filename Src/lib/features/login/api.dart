import 'package:boyo_todo/features/login/dtos.dart';
import 'package:boyo_todo/utility/disconnected.dart';
import 'package:http/http.dart' as http;

abstract class Api {
  Future<UserDto> logIn();

  Future<void> logOut();
}

class Connected extends Api {
  //static final facebookLogin = FacebookLogin();

  @override
  Future<UserDto> logIn() async {
    return UserDto();
  }

  Future<void> logOut() async {
    //await facebookLogin.logOut();
  }
}

class Disconnected extends Api with DisconnectedMixin{
  final random = DisconnectedMixin.random;
  final bool _includeRandomErrors;
  final bool _includeRandomDelays;

  Disconnected({bool includeRandomErrors = false, bool includeRandomDelays = false})
      : _includeRandomErrors = includeRandomErrors,
        _includeRandomDelays = includeRandomDelays;

  @override
  Future<UserDto> logIn() async {
    await randomDelay();
    await randomError();
    return generateRandomUser();
  }

  Future<void> logOut() async {
    // Do nothing
  }

  UserDto generateRandomUser() => UserDto((b) => b
    ..uid = "Lady Margery"
    ..name = "Lady Margery"
    ..email = "whatever");

  @override
  bool get includeRandomErrors => _includeRandomErrors;

  @override
  bool get includeRandomDelays => _includeRandomDelays;
}
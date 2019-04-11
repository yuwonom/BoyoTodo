import 'dart:convert';

import 'package:boyo_todo/features/login/dtos.dart';
import 'package:boyo_todo/features/login/exception.dart';
import 'package:boyo_todo/utility/disconnected.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;

abstract class Api {
  Future<UserDto> logIn();

  Future<void> logOut();

  Future<void> validateUser(UserDto user);
}

class Connected extends Api {
  static final facebookLogin = FacebookLogin();

  @override
  Future<UserDto> logIn() async {
    final result = await facebookLogin.logInWithReadPermissions(['email']);
   
    if (result.status == FacebookLoginStatus.cancelledByUser || result.status == FacebookLoginStatus.error) {
      throw LoginFailedException(result.errorMessage);
    }

    final token = result.accessToken.token;
    final graphResponse = await http.get('https://graph.facebook.com/v2.12/me?fields=name,email&access_token=$token');
    final profile = jsonDecode(graphResponse.body);

    return UserDto((b) => b
      ..uid = profile["id"]
      ..name = profile["name"]
      ..email = profile["email"]);
  }

  Future<void> logOut() async {
    await facebookLogin.logOut();
  }

  Future<void> validateUser(UserDto user) async {
    // TODO: hook endpoint
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
    await randomDelay();
  }

  Future<void> validateUser(UserDto user) async {
    await randomDelay();
  }

  UserDto generateRandomUser() => UserDto((b) => b
    ..uid = "Boyo"
    ..name = "Boyo"
    ..email = "boyo@gmail.com");

  @override
  bool get includeRandomErrors => _includeRandomErrors;

  @override
  bool get includeRandomDelays => _includeRandomDelays;
}
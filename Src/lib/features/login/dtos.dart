import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'dtos.g.dart';

abstract class UserDto implements Built<UserDto, UserDtoBuilder> {
  factory UserDto([void updates(UserDtoBuilder b)]) = _$UserDto;
  UserDto._();

  String get uid;
  String get name;
  String get email;

  static Serializer<UserDto> get serializer => _$userDtoSerializer;
}

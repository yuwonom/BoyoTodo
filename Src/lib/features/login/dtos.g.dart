// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dtos.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserDto> _$userDtoSerializer = new _$UserDtoSerializer();

class _$UserDtoSerializer implements StructuredSerializer<UserDto> {
  @override
  final Iterable<Type> types = const [UserDto, _$UserDto];
  @override
  final String wireName = 'UserDto';

  @override
  Iterable serialize(Serializers serializers, UserDto object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'uid',
      serializers.serialize(object.uid, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'email',
      serializers.serialize(object.email,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  UserDto deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserDtoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$UserDto extends UserDto {
  @override
  final String uid;
  @override
  final String name;
  @override
  final String email;

  factory _$UserDto([void updates(UserDtoBuilder b)]) =>
      (new UserDtoBuilder()..update(updates)).build();

  _$UserDto._({this.uid, this.name, this.email}) : super._() {
    if (uid == null) {
      throw new BuiltValueNullFieldError('UserDto', 'uid');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('UserDto', 'name');
    }
    if (email == null) {
      throw new BuiltValueNullFieldError('UserDto', 'email');
    }
  }

  @override
  UserDto rebuild(void updates(UserDtoBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  UserDtoBuilder toBuilder() => new UserDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserDto &&
        uid == other.uid &&
        name == other.name &&
        email == other.email;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, uid.hashCode), name.hashCode), email.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserDto')
          ..add('uid', uid)
          ..add('name', name)
          ..add('email', email))
        .toString();
  }
}

class UserDtoBuilder implements Builder<UserDto, UserDtoBuilder> {
  _$UserDto _$v;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  UserDtoBuilder();

  UserDtoBuilder get _$this {
    if (_$v != null) {
      _uid = _$v.uid;
      _name = _$v.name;
      _email = _$v.email;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserDto other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UserDto;
  }

  @override
  void update(void updates(UserDtoBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$UserDto build() {
    final _$result = _$v ?? new _$UserDto._(uid: uid, name: name, email: email);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

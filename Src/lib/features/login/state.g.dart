// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LoginState> _$loginStateSerializer = new _$LoginStateSerializer();

class _$LoginStateSerializer implements StructuredSerializer<LoginState> {
  @override
  final Iterable<Type> types = const [LoginState, _$LoginState];
  @override
  final String wireName = 'LoginState';

  @override
  Iterable serialize(Serializers serializers, LoginState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'isBusy',
      serializers.serialize(object.isBusy, specifiedType: const FullType(bool)),
    ];
    if (object.user != null) {
      result
        ..add('user')
        ..add(serializers.serialize(object.user,
            specifiedType: const FullType(UserDto)));
    }
    if (object.exception != null) {
      result
        ..add('exception')
        ..add(serializers.serialize(object.exception,
            specifiedType: const FullType(ActionException)));
    }

    return result;
  }

  @override
  LoginState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LoginStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'isBusy':
          result.isBusy = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'user':
          result.user.replace(serializers.deserialize(value,
              specifiedType: const FullType(UserDto)) as UserDto);
          break;
        case 'exception':
          result.exception = serializers.deserialize(value,
                  specifiedType: const FullType(ActionException))
              as ActionException;
          break;
      }
    }

    return result.build();
  }
}

class _$LoginState extends LoginState {
  @override
  final bool isBusy;
  @override
  final UserDto user;
  @override
  final ActionException exception;

  factory _$LoginState([void updates(LoginStateBuilder b)]) =>
      (new LoginStateBuilder()..update(updates)).build();

  _$LoginState._({this.isBusy, this.user, this.exception}) : super._() {
    if (isBusy == null) {
      throw new BuiltValueNullFieldError('LoginState', 'isBusy');
    }
  }

  @override
  LoginState rebuild(void updates(LoginStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginStateBuilder toBuilder() => new LoginStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginState &&
        isBusy == other.isBusy &&
        user == other.user &&
        exception == other.exception;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, isBusy.hashCode), user.hashCode), exception.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LoginState')
          ..add('isBusy', isBusy)
          ..add('user', user)
          ..add('exception', exception))
        .toString();
  }
}

class LoginStateBuilder implements Builder<LoginState, LoginStateBuilder> {
  _$LoginState _$v;

  bool _isBusy;
  bool get isBusy => _$this._isBusy;
  set isBusy(bool isBusy) => _$this._isBusy = isBusy;

  UserDtoBuilder _user;
  UserDtoBuilder get user => _$this._user ??= new UserDtoBuilder();
  set user(UserDtoBuilder user) => _$this._user = user;

  ActionException _exception;
  ActionException get exception => _$this._exception;
  set exception(ActionException exception) => _$this._exception = exception;

  LoginStateBuilder();

  LoginStateBuilder get _$this {
    if (_$v != null) {
      _isBusy = _$v.isBusy;
      _user = _$v.user?.toBuilder();
      _exception = _$v.exception;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LoginState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LoginState;
  }

  @override
  void update(void updates(LoginStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$LoginState build() {
    _$LoginState _$result;
    try {
      _$result = _$v ??
          new _$LoginState._(
              isBusy: isBusy, user: _user?.build(), exception: exception);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'user';
        _user?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'LoginState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

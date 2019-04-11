// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<NotebookState> _$notebookStateSerializer =
    new _$NotebookStateSerializer();

class _$NotebookStateSerializer implements StructuredSerializer<NotebookState> {
  @override
  final Iterable<Type> types = const [NotebookState, _$NotebookState];
  @override
  final String wireName = 'NotebookState';

  @override
  Iterable serialize(Serializers serializers, NotebookState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'isBusy',
      serializers.serialize(object.isBusy, specifiedType: const FullType(bool)),
      'notebooks',
      serializers.serialize(object.notebooks,
          specifiedType:
              const FullType(List, const [const FullType(NotebookDto)])),
    ];
    if (object.selectedNotebook != null) {
      result
        ..add('selectedNotebook')
        ..add(serializers.serialize(object.selectedNotebook,
            specifiedType: const FullType(NotebookDto)));
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
  NotebookState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NotebookStateBuilder();

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
        case 'notebooks':
          result.notebooks = serializers.deserialize(value,
                  specifiedType:
                      const FullType(List, const [const FullType(NotebookDto)]))
              as List<NotebookDto>;
          break;
        case 'selectedNotebook':
          result.selectedNotebook.replace(serializers.deserialize(value,
              specifiedType: const FullType(NotebookDto)) as NotebookDto);
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

class _$NotebookState extends NotebookState {
  @override
  final bool isBusy;
  @override
  final List<NotebookDto> notebooks;
  @override
  final NotebookDto selectedNotebook;
  @override
  final ActionException exception;

  factory _$NotebookState([void updates(NotebookStateBuilder b)]) =>
      (new NotebookStateBuilder()..update(updates)).build();

  _$NotebookState._(
      {this.isBusy, this.notebooks, this.selectedNotebook, this.exception})
      : super._() {
    if (isBusy == null) {
      throw new BuiltValueNullFieldError('NotebookState', 'isBusy');
    }
    if (notebooks == null) {
      throw new BuiltValueNullFieldError('NotebookState', 'notebooks');
    }
  }

  @override
  NotebookState rebuild(void updates(NotebookStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  NotebookStateBuilder toBuilder() => new NotebookStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotebookState &&
        isBusy == other.isBusy &&
        notebooks == other.notebooks &&
        selectedNotebook == other.selectedNotebook &&
        exception == other.exception;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, isBusy.hashCode), notebooks.hashCode),
            selectedNotebook.hashCode),
        exception.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NotebookState')
          ..add('isBusy', isBusy)
          ..add('notebooks', notebooks)
          ..add('selectedNotebook', selectedNotebook)
          ..add('exception', exception))
        .toString();
  }
}

class NotebookStateBuilder
    implements Builder<NotebookState, NotebookStateBuilder> {
  _$NotebookState _$v;

  bool _isBusy;
  bool get isBusy => _$this._isBusy;
  set isBusy(bool isBusy) => _$this._isBusy = isBusy;

  List<NotebookDto> _notebooks;
  List<NotebookDto> get notebooks => _$this._notebooks;
  set notebooks(List<NotebookDto> notebooks) => _$this._notebooks = notebooks;

  NotebookDtoBuilder _selectedNotebook;
  NotebookDtoBuilder get selectedNotebook =>
      _$this._selectedNotebook ??= new NotebookDtoBuilder();
  set selectedNotebook(NotebookDtoBuilder selectedNotebook) =>
      _$this._selectedNotebook = selectedNotebook;

  ActionException _exception;
  ActionException get exception => _$this._exception;
  set exception(ActionException exception) => _$this._exception = exception;

  NotebookStateBuilder();

  NotebookStateBuilder get _$this {
    if (_$v != null) {
      _isBusy = _$v.isBusy;
      _notebooks = _$v.notebooks;
      _selectedNotebook = _$v.selectedNotebook?.toBuilder();
      _exception = _$v.exception;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NotebookState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$NotebookState;
  }

  @override
  void update(void updates(NotebookStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$NotebookState build() {
    _$NotebookState _$result;
    try {
      _$result = _$v ??
          new _$NotebookState._(
              isBusy: isBusy,
              notebooks: notebooks,
              selectedNotebook: _selectedNotebook?.build(),
              exception: exception);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'selectedNotebook';
        _selectedNotebook?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'NotebookState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

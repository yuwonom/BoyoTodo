// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dtos.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<NotebookDto> _$notebookDtoSerializer = new _$NotebookDtoSerializer();
Serializer<ItemListDto> _$itemListDtoSerializer = new _$ItemListDtoSerializer();
Serializer<ItemDto> _$itemDtoSerializer = new _$ItemDtoSerializer();

class _$NotebookDtoSerializer implements StructuredSerializer<NotebookDto> {
  @override
  final Iterable<Type> types = const [NotebookDto, _$NotebookDto];
  @override
  final String wireName = 'NotebookDto';

  @override
  Iterable serialize(Serializers serializers, NotebookDto object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'createdAt',
      serializers.serialize(object.createdAt,
          specifiedType: const FullType(DateDto)),
      'listCount',
      serializers.serialize(object.listCount,
          specifiedType: const FullType(int)),
      'completedListCount',
      serializers.serialize(object.completedListCount,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  NotebookDto deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NotebookDtoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'createdAt':
          result.createdAt.replace(serializers.deserialize(value,
              specifiedType: const FullType(DateDto)) as DateDto);
          break;
        case 'listCount':
          result.listCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'completedListCount':
          result.completedListCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$ItemListDtoSerializer implements StructuredSerializer<ItemListDto> {
  @override
  final Iterable<Type> types = const [ItemListDto, _$ItemListDto];
  @override
  final String wireName = 'ItemListDto';

  @override
  Iterable serialize(Serializers serializers, ItemListDto object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'items',
      serializers.serialize(object.items,
          specifiedType:
              const FullType(BuiltList, const [const FullType(ItemDto)])),
    ];

    return result;
  }

  @override
  ItemListDto deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ItemListDtoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'items':
          result.items.replace(serializers.deserialize(value,
              specifiedType: const FullType(
                  BuiltList, const [const FullType(ItemDto)])) as BuiltList);
          break;
      }
    }

    return result.build();
  }
}

class _$ItemDtoSerializer implements StructuredSerializer<ItemDto> {
  @override
  final Iterable<Type> types = const [ItemDto, _$ItemDto];
  @override
  final String wireName = 'ItemDto';

  @override
  Iterable serialize(Serializers serializers, ItemDto object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'caption',
      serializers.serialize(object.caption,
          specifiedType: const FullType(String)),
      'completed',
      serializers.serialize(object.completed,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  ItemDto deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ItemDtoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'caption':
          result.caption = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'completed':
          result.completed = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$NotebookDto extends NotebookDto {
  @override
  final String id;
  @override
  final String title;
  @override
  final DateDto createdAt;
  @override
  final int listCount;
  @override
  final int completedListCount;

  factory _$NotebookDto([void updates(NotebookDtoBuilder b)]) =>
      (new NotebookDtoBuilder()..update(updates)).build();

  _$NotebookDto._(
      {this.id,
      this.title,
      this.createdAt,
      this.listCount,
      this.completedListCount})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('NotebookDto', 'id');
    }
    if (title == null) {
      throw new BuiltValueNullFieldError('NotebookDto', 'title');
    }
    if (createdAt == null) {
      throw new BuiltValueNullFieldError('NotebookDto', 'createdAt');
    }
    if (listCount == null) {
      throw new BuiltValueNullFieldError('NotebookDto', 'listCount');
    }
    if (completedListCount == null) {
      throw new BuiltValueNullFieldError('NotebookDto', 'completedListCount');
    }
  }

  @override
  NotebookDto rebuild(void updates(NotebookDtoBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  NotebookDtoBuilder toBuilder() => new NotebookDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotebookDto &&
        id == other.id &&
        title == other.title &&
        createdAt == other.createdAt &&
        listCount == other.listCount &&
        completedListCount == other.completedListCount;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, id.hashCode), title.hashCode), createdAt.hashCode),
            listCount.hashCode),
        completedListCount.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NotebookDto')
          ..add('id', id)
          ..add('title', title)
          ..add('createdAt', createdAt)
          ..add('listCount', listCount)
          ..add('completedListCount', completedListCount))
        .toString();
  }
}

class NotebookDtoBuilder implements Builder<NotebookDto, NotebookDtoBuilder> {
  _$NotebookDto _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  DateDtoBuilder _createdAt;
  DateDtoBuilder get createdAt => _$this._createdAt ??= new DateDtoBuilder();
  set createdAt(DateDtoBuilder createdAt) => _$this._createdAt = createdAt;

  int _listCount;
  int get listCount => _$this._listCount;
  set listCount(int listCount) => _$this._listCount = listCount;

  int _completedListCount;
  int get completedListCount => _$this._completedListCount;
  set completedListCount(int completedListCount) =>
      _$this._completedListCount = completedListCount;

  NotebookDtoBuilder();

  NotebookDtoBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _title = _$v.title;
      _createdAt = _$v.createdAt?.toBuilder();
      _listCount = _$v.listCount;
      _completedListCount = _$v.completedListCount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NotebookDto other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$NotebookDto;
  }

  @override
  void update(void updates(NotebookDtoBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$NotebookDto build() {
    _$NotebookDto _$result;
    try {
      _$result = _$v ??
          new _$NotebookDto._(
              id: id,
              title: title,
              createdAt: createdAt.build(),
              listCount: listCount,
              completedListCount: completedListCount);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'createdAt';
        createdAt.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'NotebookDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ItemListDto extends ItemListDto {
  @override
  final String id;
  @override
  final String name;
  @override
  final BuiltList<ItemDto> items;

  factory _$ItemListDto([void updates(ItemListDtoBuilder b)]) =>
      (new ItemListDtoBuilder()..update(updates)).build();

  _$ItemListDto._({this.id, this.name, this.items}) : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('ItemListDto', 'id');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('ItemListDto', 'name');
    }
    if (items == null) {
      throw new BuiltValueNullFieldError('ItemListDto', 'items');
    }
  }

  @override
  ItemListDto rebuild(void updates(ItemListDtoBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ItemListDtoBuilder toBuilder() => new ItemListDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ItemListDto &&
        id == other.id &&
        name == other.name &&
        items == other.items;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, id.hashCode), name.hashCode), items.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ItemListDto')
          ..add('id', id)
          ..add('name', name)
          ..add('items', items))
        .toString();
  }
}

class ItemListDtoBuilder implements Builder<ItemListDto, ItemListDtoBuilder> {
  _$ItemListDto _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  ListBuilder<ItemDto> _items;
  ListBuilder<ItemDto> get items =>
      _$this._items ??= new ListBuilder<ItemDto>();
  set items(ListBuilder<ItemDto> items) => _$this._items = items;

  ItemListDtoBuilder();

  ItemListDtoBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _name = _$v.name;
      _items = _$v.items?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ItemListDto other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ItemListDto;
  }

  @override
  void update(void updates(ItemListDtoBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$ItemListDto build() {
    _$ItemListDto _$result;
    try {
      _$result =
          _$v ?? new _$ItemListDto._(id: id, name: name, items: items.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ItemListDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ItemDto extends ItemDto {
  @override
  final String caption;
  @override
  final bool completed;

  factory _$ItemDto([void updates(ItemDtoBuilder b)]) =>
      (new ItemDtoBuilder()..update(updates)).build();

  _$ItemDto._({this.caption, this.completed}) : super._() {
    if (caption == null) {
      throw new BuiltValueNullFieldError('ItemDto', 'caption');
    }
    if (completed == null) {
      throw new BuiltValueNullFieldError('ItemDto', 'completed');
    }
  }

  @override
  ItemDto rebuild(void updates(ItemDtoBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ItemDtoBuilder toBuilder() => new ItemDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ItemDto &&
        caption == other.caption &&
        completed == other.completed;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, caption.hashCode), completed.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ItemDto')
          ..add('caption', caption)
          ..add('completed', completed))
        .toString();
  }
}

class ItemDtoBuilder implements Builder<ItemDto, ItemDtoBuilder> {
  _$ItemDto _$v;

  String _caption;
  String get caption => _$this._caption;
  set caption(String caption) => _$this._caption = caption;

  bool _completed;
  bool get completed => _$this._completed;
  set completed(bool completed) => _$this._completed = completed;

  ItemDtoBuilder();

  ItemDtoBuilder get _$this {
    if (_$v != null) {
      _caption = _$v.caption;
      _completed = _$v.completed;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ItemDto other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ItemDto;
  }

  @override
  void update(void updates(ItemDtoBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$ItemDto build() {
    final _$result =
        _$v ?? new _$ItemDto._(caption: caption, completed: completed);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

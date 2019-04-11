import 'package:boyo_todo/dtos.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'dtos.g.dart';

abstract class NotebookDto implements Built<NotebookDto, NotebookDtoBuilder> {
  factory NotebookDto([void updates(NotebookDtoBuilder b)]) = _$NotebookDto;
  NotebookDto._();

  String get id;
  String get title;
  DateDto get createdAt;
  int get listCount;
  int get completedListCount;

  static Serializer<NotebookDto> get serializer => _$notebookDtoSerializer;
}

abstract class ItemListDto implements Built<ItemListDto, ItemListDtoBuilder> {
  factory ItemListDto([void updates(ItemListDtoBuilder b)]) = _$ItemListDto;
  ItemListDto._();

  String get id;
  String get name;
  BuiltList<ItemDto> get items;

  static Serializer<ItemListDto> get serializer => _$itemListDtoSerializer;
}

abstract class ItemDto implements Built<ItemDto, ItemDtoBuilder> {
  factory ItemDto([void updates(ItemDtoBuilder b)]) = _$ItemDto;
  ItemDto._();

  String get caption;
  bool get completed;

  static Serializer<ItemDto> get serializer => _$itemDtoSerializer;
}

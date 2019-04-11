import 'package:boyo_todo/dtos.dart';
import 'package:boyo_todo/features/notebook/dtos.dart';
import 'package:boyo_todo/utility/disconnected.dart';
import 'package:built_collection/built_collection.dart';

abstract class Api {
  Future<List<NotebookDto>> getNotebooks(String userId);

  Future<List<ItemListDto>> getLists(String notebookId);
}

class Connected extends Api {
  @override
  Future<List<NotebookDto>> getNotebooks(String userId) async {
    // TODO: implement getNotebooks
    return null;
  }

  @override
  Future<List<ItemListDto>> getLists(String notebookId) async {
    // TODO: implement getLists
    return null;
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
  Future<List<NotebookDto>> getNotebooks(String userId) async {
    await randomDelay();
    await randomError();

    return generateRandomNotebooks();
  }

  @override
  Future<List<ItemListDto>> getLists(String notebookId) async {
    await randomDelay();
    await randomError();

    return generateRandomLists();
  }

  List<NotebookDto> generateRandomNotebooks() {
    final notebookTitles = <String>[
      "Notebook A",
      "Notebook B",
      "Notebook C",
      "Notebook D",
      "Notebook E",
      "Notebook F",
      "Notebook G",
      "Notebook H",
      "Notebook I",
      "Notebook J",
    ];

    NotebookDtoBuilder generateRandomNotebook() => NotebookDtoBuilder()
      ..id = random.nextInt(100).toString()
      ..title = notebookTitles[random.nextInt(notebookTitles.length)]
      ..createdAt.replace(DateDto.fromDateTime(DateTime.now().add(Duration(days: -1 * random.nextInt(365 * 2)))))
      ..listCount = random.nextInt(5)
      ..completedListCount = random.nextInt(5);

    final notebookCount = random.nextInt(10);
    final notebooks = List.generate(notebookCount, (_) => generateRandomNotebook().build());

    return notebooks;
  }
      
  List<ItemListDto> generateRandomLists() { 
    final items = <BuiltList<ItemDto>>[
      BuiltList([
        (ItemDtoBuilder()
            ..caption = "Bacon")
          .build(),
        (ItemDtoBuilder()
            ..caption = "Pancake")
          .build(),
        (ItemDtoBuilder()
            ..caption = "Tiramisu")
          .build(),
      ]),
      BuiltList([
        (ItemDtoBuilder()
            ..caption = "Potato")
          .build(),
        (ItemDtoBuilder()
            ..caption = "Dishwasher Tab")
          .build(),
        (ItemDtoBuilder()
            ..caption = "Banana")
          .build(),
      ]),
      BuiltList([
        (ItemDtoBuilder()
            ..caption = "Run a marathon")
          .build(),
        (ItemDtoBuilder()
            ..caption = "Finish 3 books")
          .build(),
        (ItemDtoBuilder()
            ..caption = "Exercise daily")
          .build(),
      ]),
      BuiltList([
        (ItemDtoBuilder()
            ..caption = "Write 2000 words essay")
          .build(),
        (ItemDtoBuilder()
            ..caption = "Create portfolio")
          .build(),
        (ItemDtoBuilder()
            ..caption = "Apply for extension")
          .build(),
      ]),
      BuiltList([
        (ItemDtoBuilder()
            ..caption = "Skydive")
          .build(),
        (ItemDtoBuilder()
            ..caption = "Go to Silicon Valley")
          .build(),
        (ItemDtoBuilder()
            ..caption = "Pioneer Lifegroup")
          .build(),
      ]),
    ];

    final lists = <ItemListDto>[
      (ItemListDtoBuilder()
          ..id = "1"
          ..name = "Desserts"
          ..items.replace(items[0]))
        .build(),
      (ItemListDtoBuilder()
          ..id = "2"
          ..name = "Shopping List"
          ..items.replace(items[1]))
        .build(),
      (ItemListDtoBuilder()
          ..id = "3"
          ..name = "New Year's Resolution"
          ..items.replace(items[2]))
        .build(),
      (ItemListDtoBuilder()
          ..id = "4"
          ..name = "Assignments"
          ..items.replace(items[3]))
        .build(),
      (ItemListDtoBuilder()
          ..id = "5"
          ..name = "Bucket List"
          ..items.replace(items[4]))
        .build(),
    ];

    return lists
      ..shuffle()
      ..take(random.nextInt(lists.length))
      ..forEach((list) => list.items.forEach((item) => item.rebuild((b) => b
            ..completed = random.nextInt(2) == 1)));
  }
  
  @override
  bool get includeRandomErrors => _includeRandomErrors;

  @override
  bool get includeRandomDelays => _includeRandomDelays;
}
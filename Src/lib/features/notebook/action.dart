import 'package:boyo_todo/features/notebook/dtos.dart';
import 'package:boyo_todo/utility/action_exception.dart';
import 'package:meta/meta.dart';

@immutable
class GetNotebooks {
  const GetNotebooks();

  @override
  String toString() => "GetNotebooks";
}

@immutable
class GetNotebooksSuccessful {
  const GetNotebooksSuccessful(this.notebooks) : assert(notebooks != null);

  final List<NotebookDto> notebooks;

  @override
  String toString() => "GetNotebooksSuccessful";
}

@immutable
class GetNotebooksFailed {
  const GetNotebooksFailed(this.exception) : assert(exception != null);

  final ActionException exception;

  @override
  String toString() => "GetNotebooksFailed";
}
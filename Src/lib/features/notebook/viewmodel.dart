import 'package:boyo_todo/features/notebook/dtos.dart';
import 'package:boyo_todo/features/notebook/state.dart';

class NotebookViewModel {
  final NotebookState _state;

  NotebookViewModel(this._state);

  bool get isBusy => _state.isBusy;

  bool get hasException => _state.exception != null;

  NotebookDto get selectedNotebook => _state.selectedNotebook;

  List<NotebookDto> get notebooks => _state.notebooks;

  List<ItemListDto> get itemLists => _state.itemLists;
}
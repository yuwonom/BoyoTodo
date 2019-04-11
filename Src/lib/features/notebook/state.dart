import 'package:boyo_todo/features/notebook/dtos.dart';
import 'package:boyo_todo/utility/action_exception.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'state.g.dart';

abstract class NotebookState implements Built<NotebookState, NotebookStateBuilder> {
  factory NotebookState([void updates(NotebookStateBuilder b)]) = _$NotebookState;
  factory NotebookState.initial() => _$NotebookState._(
    isBusy: false,
    notebooks: List(0),
  );
  NotebookState._();

  bool get isBusy;

  List<NotebookDto> get notebooks;
  @nullable
  NotebookDto get selectedNotebook;
  @nullable
  ActionException get exception;

  static Serializer<NotebookState> get serializer => _$notebookStateSerializer;
}

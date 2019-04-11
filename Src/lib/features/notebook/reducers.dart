import 'package:boyo_todo/features/notebook/action.dart';
import 'package:boyo_todo/features/notebook/state.dart';
import 'package:redux/redux.dart';

final Reducer<NotebookState> notebookStateReducer = combineReducers([
  TypedReducer<NotebookState, GetNotebooks>(_getNotebooksReducer),
  TypedReducer<NotebookState, GetNotebooksSuccessful>(_getNotebooksSuccessful),
  TypedReducer<NotebookState, GetNotebooksFailed>(_getNotebooksFailed),
]);

NotebookState _getNotebooksReducer(NotebookState state, GetNotebooks action) => state.rebuild((b) => b
  ..isBusy = true
  ..notebooks = List()
  ..exception = null);

NotebookState _getNotebooksSuccessful(NotebookState state, GetNotebooksSuccessful action) => state.rebuild((b) => b
  ..isBusy = false
  ..notebooks = action.notebooks
  ..exception = null);

NotebookState _getNotebooksFailed(NotebookState state, GetNotebooksFailed action) => state.rebuild((b) => b
  ..isBusy = false
  ..notebooks = List()
  ..exception = action.exception);
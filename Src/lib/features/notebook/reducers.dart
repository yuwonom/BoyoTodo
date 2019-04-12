import 'package:boyo_todo/features/notebook/action.dart';
import 'package:boyo_todo/features/notebook/state.dart';
import 'package:redux/redux.dart';

final Reducer<NotebookState> notebookStateReducer = combineReducers([
  TypedReducer<NotebookState, GetNotebooks>(_getNotebooksReducer),
  TypedReducer<NotebookState, GetNotebooksSuccessful>(_getNotebooksSuccessfulReducer),
  TypedReducer<NotebookState, GetNotebooksFailed>(_getNotebooksFailedReducer),
  TypedReducer<NotebookState, SelectNotebook>(_selectNotebookReducer),
  TypedReducer<NotebookState, DeselectNotebook>(_deselectNotebookReducer),
]);

NotebookState _getNotebooksReducer(NotebookState state, GetNotebooks action) => state.rebuild((b) => b
  ..isBusy = true
  ..notebooks = List()
  ..exception = null);

NotebookState _getNotebooksSuccessfulReducer(NotebookState state, GetNotebooksSuccessful action) => state.rebuild((b) => b
  ..isBusy = false
  ..notebooks = action.notebooks
  ..exception = null);

NotebookState _getNotebooksFailedReducer(NotebookState state, GetNotebooksFailed action) => state.rebuild((b) => b
  ..isBusy = false
  ..notebooks = List()
  ..exception = action.exception);

NotebookState _selectNotebookReducer(NotebookState state, SelectNotebook action) => state.rebuild((b) => b
  ..selectedNotebook.replace(action.notebook));

NotebookState _deselectNotebookReducer(NotebookState state, DeselectNotebook action) => state.rebuild((b) => b
  ..selectedNotebook = null);
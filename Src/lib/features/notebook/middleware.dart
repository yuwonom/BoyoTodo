import 'package:boyo_todo/features/notebook/action.dart';
import 'package:boyo_todo/features/notebook/api.dart' as notebook;
import 'package:boyo_todo/state.dart';
import 'package:boyo_todo/utility/action_exception.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> getMiddleware(notebook.Api api) => [
      ApiIntegration(api).getMiddlewareBindings(),
    ].expand((x) => x).toList();

class ApiIntegration {
  final notebook.Api api;

  ApiIntegration(this.api) : assert(api != null);

  List<Middleware<AppState>> getMiddlewareBindings() => [
        TypedMiddleware<AppState, GetNotebooks>(_handleGetNotebooks),
      ];

  void _handleGetNotebooks(Store<AppState> store, GetNotebooks action, NextDispatcher next) {
    Future<void> _initiateLogin(Store<AppState> store, GetNotebooks action) async {
      try {
        final notebooks = await api.getNotebooks(store.state.login.user.uid);
        store.dispatch(GetNotebooksSuccessful(notebooks));
      } on Exception catch (exception) {
        store.dispatch(GetNotebooksFailed(ActionException(exception, action)));
      }
    }

    _initiateLogin(store, action);
    next(action);
  }
}
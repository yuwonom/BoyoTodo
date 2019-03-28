import 'package:boyo_todo/state.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> getMiddleware() =>
  []
  .expand((x) => x).toList();
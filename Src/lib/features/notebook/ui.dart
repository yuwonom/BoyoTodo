import 'package:boyo_todo/features/login/action.dart';
import 'package:boyo_todo/features/notebook/viewmodel.dart';
import 'package:boyo_todo/state.dart';
import 'package:boyo_todo/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class Notebook extends StatelessWidget {
  const Notebook({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => StoreConnector<AppState, NotebookViewModel>(
      converter: (Store<AppState> store) => NotebookViewModel(),
      builder: (BuildContext context, NotebookViewModel viewModel) => _buildPage(context, StoreProvider.of(context), viewModel));

  Widget _buildPage(BuildContext context, Store<AppState> store, NotebookViewModel viewModel) {
    final hello = Text(
      "Hello,\n${store.state.login.user?.name ?? ""}",
      style: AppTextStyles.header1.copyWith(color: AppColors.white),
      textAlign: TextAlign.center,
    );

    final logout = MaterialButton(
      shape: AppSize.bezel,
      color: Color(0xFF4267b2),
      onPressed: () => store.dispatch(Logout()),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Text("Logout", style: AppTextStyles.button.copyWith(color: AppColors.white)),
      ),
    );

    final structure = Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          hello,
          logout,
        ],
      ),
    );

    return structure;
  }
}
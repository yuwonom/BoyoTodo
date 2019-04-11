import 'package:boyo_todo/features/notebook/action.dart';
import 'package:boyo_todo/features/notebook/dtos.dart';
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
      onInit: (Store<AppState> store) => store.dispatch(GetNotebooks()),
      converter: (Store<AppState> store) => NotebookViewModel(store.state.notebook),
      builder: (BuildContext context, NotebookViewModel viewModel) => _buildPage(context, StoreProvider.of(context), viewModel));

  Widget _buildPage(BuildContext context, Store<AppState> store, NotebookViewModel viewModel) {
    List<Widget> notebooks = [];
    viewModel.notebooks.forEach((notebook) {
      final notebookCell = _createNotebookCell(context, store, notebook);
      notebooks.add(notebookCell);
    });

    final page = ListView(
      children: notebooks,
    );

    return page;
  }

  Widget _createNotebookCell(BuildContext context, Store<AppState> store, NotebookDto notebook) {
    final title = Text(
      notebook.title,
      style: AppTextStyles.header2.copyWith(color: AppColors.black, fontWeight: FontWeight.bold),
      textAlign: TextAlign.left,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );

    final time = Text(
      notebook.createdAt.toPast(),
      style: AppTextStyles.body3.copyWith(color: AppColors.lightGray),
      textAlign: TextAlign.right,
    );

    final lists = Text(
      notebook.listCount > 0 ? "${notebook.listCount} Lists" : "Empty",
      style: notebook.listCount > 0
        ? AppTextStyles.body2.copyWith(color: AppColors.darkGray)
        : AppTextStyles.body2.copyWith(color: AppColors.lightGray, fontStyle: FontStyle.italic),
      textAlign: TextAlign.left,
    );

    final completed = Text(
      "${notebook.completedListCount} Completed Lists",
      style: AppTextStyles.body2.copyWith(color: AppColors.green),
      textAlign: TextAlign.right,
    );

    final container = Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                title,
                time,
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                lists,
                notebook.completedListCount > 0
                  ? completed
                  : Container(),
              ],
            ),
          ),
        ],
      ),
    );

    return RaisedButton(
      color: AppColors.white,
      shape: BeveledRectangleBorder(),
      elevation: 1.0,
      highlightElevation: 1.0,
      onPressed: (){},
      child: container,
    );
  }
}
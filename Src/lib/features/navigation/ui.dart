import 'package:boyo_todo/features/login/action.dart';
import 'package:boyo_todo/features/navigation/viewmodel.dart';
import 'package:boyo_todo/features/notebook/ui.dart';
import 'package:boyo_todo/state.dart';
import 'package:boyo_todo/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key key}) : super(key: key);

  @override
  NavigationState createState() => NavigationState();
}

class NavigationState extends State<Navigation> {
  Widget _activeBody;

  @override
  initState() {
    super.initState();
    _activeBody = Notebook();
  }

  @override
  Widget build(BuildContext context) => StoreConnector<AppState, NavigationViewModel>(
      converter: (Store<AppState> store) => NavigationViewModel(store.state.login),
      builder: (BuildContext context, NavigationViewModel viewModel) => _buildPage(context, StoreProvider.of(context), viewModel));

  Widget _buildPage(BuildContext context, Store<AppState> store, NavigationViewModel viewModel) {
    final hi = Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
      child: Row(
        children: <Widget>[
          Text(
            "Hi, ", 
            style: AppTextStyles.header2.copyWith(
              color: AppColors.lightGray,
              fontWeight: FontWeight.w300,
            ),
          ),
          Text(
            viewModel.name,
            style: AppTextStyles.header2.copyWith(
              color: AppColors.lightGray,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );

    final drawer = Drawer(
      child: Material(
        color: AppColors.black,
        child: ListView(
          children: <Widget>[
            hi,
            ListTile(
              title: Text("Notebooks", style: AppTextStyles.header2.copyWith(color: AppColors.white, fontWeight: FontWeight.w300)),
              onTap: () {
                setState(() => _activeBody = Notebook());
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text("Log out", style: AppTextStyles.header2.copyWith(color: AppColors.white, fontWeight: FontWeight.w300)),
              onTap: () => store.dispatch(Logout()),
            ),
          ],
        ),
      ),
    );
  
    return Theme(
      data: AppTheme.main,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          brightness: Brightness.dark,
          backgroundColor: AppColors.black,
          iconTheme: IconThemeData(color: AppColors.white),
        ),
        backgroundColor: AppColors.black,
        drawer: drawer,
        body: _activeBody,
      ),
    );
  }
}
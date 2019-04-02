import 'package:boyo_todo/features/login/viewmodel.dart';
import 'package:boyo_todo/state.dart';
import 'package:boyo_todo/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class Login extends StatelessWidget {
  const Login({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => StoreConnector<AppState, LogInViewModel>(
      converter: (Store<AppState> store) => LogInViewModel(store.state.login),
      builder: (BuildContext context, LogInViewModel viewModel) => _buildPage(context, StoreProvider.of(context), viewModel));

  Widget _buildPage(BuildContext context, Store<AppState> store, LogInViewModel viewModel) {
    final logo = Container(
      height: 256.0,
      width: 256.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/boyo_todo_large.svg"),
        ),
      ),
    );

    final header = Expanded(
      flex: 3,
      child: Center(
        child: logo,
      ),
    );

    final button = MaterialButton(
      shape: AppSize.bezel,
      color: Color(0xFF4267b2),
      onPressed: (){},
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
          children: <Widget>[
            Container(
              color: AppColors.lightGray,
              height: 24.0,
              width: 24.0,
            ),
            Expanded(
              child: Center(
                child: Text("Login with Facebook", style: AppTextStyles.button.copyWith(color: AppColors.white)),
              ),
            ),
          ],
        ),
      ),
    );

    final body = Expanded(
      flex: 1,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 48.0), 
            child: button,
          ),
        ],
      ),
    );

    final structure = Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          header,
          body,
        ],
      ),
    );

    return Theme(
      data: AppTheme.main,
      child: Scaffold(
        backgroundColor: AppColors.black,
        body: Container(
          child: structure,
        ),
      ),
    );
  }
}

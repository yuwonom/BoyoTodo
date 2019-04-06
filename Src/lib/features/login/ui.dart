import 'package:boyo_todo/features/login/action.dart';
import 'package:boyo_todo/features/login/viewmodel.dart';
import 'package:boyo_todo/state.dart';
import 'package:boyo_todo/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class Login extends StatelessWidget {
  const Login({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => StoreConnector<AppState, LoginViewModel>(
      onInit: (Store<AppState> store) => store.dispatch(LoadUserInfo()),
      converter: (Store<AppState> store) => LoginViewModel(store.state.login),
      builder: (BuildContext context, LoginViewModel viewModel) => _buildPage(context, StoreProvider.of(context), viewModel));

  Widget _buildPage(BuildContext context, Store<AppState> store, LoginViewModel viewModel) {
    final logo = Container(
      height: 256.0,
      width: 256.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AppAssets.boyoTodoLogo,
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
      onPressed: () {
        if (viewModel.isBusy) {
          return;
        }
        store.dispatch(InitiateLogin());
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
          children: <Widget>[
            Container(
              height: 24.0,
              width: 24.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AppAssets.facebookIcon,
                ),
              ),
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

    final loading = CircularProgressIndicator(
      backgroundColor: AppColors.white,
      strokeWidth: 3.0,
    );

    final error = Text(
      "Oops! Something went wrong.",
      style: AppTextStyles.caption.copyWith(color: AppColors.red),
      textAlign: TextAlign.center,
    );

    final body = Expanded(
      flex: 1,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 64.0), 
            child: button,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: viewModel.isBusy
            ? loading
            : viewModel.hasException
              ? error
              : Container(),
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

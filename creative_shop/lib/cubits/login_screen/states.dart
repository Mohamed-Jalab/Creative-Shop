import 'package:creative_shop/models/sign_up_model.dart';


abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginVisiblePasswordState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  SignUpModel model;
  LoginSuccessState(this.model);
}

class LoginErorrState extends LoginStates {
  String error;
  LoginErorrState(this.error);
}


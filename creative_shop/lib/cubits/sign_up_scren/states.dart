
abstract class SignUpStates {}

class SignUpInitialState extends SignUpStates {}

class SignUpLoadingState extends SignUpStates {}

class SignUpVisiblePasswordState extends SignUpStates {}

class SignUpSccessState extends SignUpStates {
  // SignUpModel model;
  // SignUpSccessState(this.model);
}

class SignUpErorrState extends SignUpStates {
  String error;
  SignUpErorrState(this.error);
}

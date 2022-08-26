abstract class AppStates {}

class InitialAppstate extends AppStates {}

class ChangePasswordVisability extends AppStates {}

class LoadingState extends AppStates {}

class UserLoginSuccessState extends AppStates {}

class UserLoginErrorState extends AppStates {
  final String error;
  UserLoginErrorState({required this.error});
}

class UserRegisterSuccessState extends AppStates {}

class UserRegisterErrorState extends AppStates {
  final String error;
  UserRegisterErrorState({required this.error});
}

class UserCreateSuccessState extends AppStates {}

class UserCreateErrorState extends AppStates {
  final String error;
  UserCreateErrorState({required this.error});
}

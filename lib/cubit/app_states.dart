abstract class AppStates {}

class InitialAppstate extends AppStates {}

class ChangePasswordVisability extends AppStates {}

class LoadingState extends AppStates {}

class UserLoginSuccessState extends AppStates {}

class UserLoginErrorState extends AppStates {
  final String error;
  UserLoginErrorState({required this.error});
}

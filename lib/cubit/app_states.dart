abstract class AppStates {}

class InitialAppstate extends AppStates {}

class ChangePasswordVisability extends AppStates {}

class ChangeNavigationBarScreen extends AppStates {}

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

class UserGetDetailsSuccessState extends AppStates {}

class UserGetDetailsErrorState extends AppStates {
  final String error;
  UserGetDetailsErrorState({required this.error});
}

class GetImageSuccessState extends AppStates {}

class GetImageErrorState extends AppStates {
  final String error;
  GetImageErrorState({required this.error});
}

class UploadImageSuccessState extends AppStates {}

class UploadImageErrorState extends AppStates {
  final String error;
  UploadImageErrorState({required this.error});
}

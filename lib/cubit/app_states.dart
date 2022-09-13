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

class UpdateDataSuccessState extends AppStates {}

class UpdateDataErrorState extends AppStates {
  final String error;
  UpdateDataErrorState({required this.error});
}

class DeleteImageState extends AppStates {}

class GetPostSuccessState extends AppStates {}

class GetPostErrorstate extends AppStates {
  final String error;
  GetPostErrorstate({required this.error});
}

class LikePostSuccessState extends AppStates {}

class LikePostErrorstate extends AppStates {
  final String error;
  LikePostErrorstate({required this.error});
}

class CommentPostSuccessState extends AppStates {}

class CommentPostErrorstate extends AppStates {
  final String error;
  CommentPostErrorstate({required this.error});
}

class RefreshPostLoadingState extends AppStates {}

class RefreshPostSuccessState extends AppStates {}

class RefreshPostErrorstate extends AppStates {
  final String error;
  RefreshPostErrorstate({required this.error});
}

class GetAllUsersSuccessState extends AppStates {}

class GetAllUsersErrorstate extends AppStates {
  final String error;
  GetAllUsersErrorstate({required this.error});
}

class SendMessageSuccessState extends AppStates {}

class SendMessageErrorstate extends AppStates {
  final String error;
  SendMessageErrorstate({required this.error});
}

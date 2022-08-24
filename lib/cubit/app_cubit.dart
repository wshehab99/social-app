import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/cubit/app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialAppstate());
  bool passwordVisabilty = false;
  bool confpasswordVisabilty = false;
  void changePasswordVisablity() {
    passwordVisabilty = !passwordVisabilty;
    emit(ChangePasswordVisability());
  }

  void changeConfPasswordVisablity() {
    confpasswordVisabilty = !confpasswordVisabilty;
    emit(ChangePasswordVisability());
  }

  Future<void> login(String email, String password) async {
    emit(LoadingState());
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user!.uid);
      print(value.user!.email);
      emit(UserLoginSuccessState());
    }).catchError((error) {
      emit(UserLoginErrorState(error: error.toString()));
    });
  }

  Future<void> register(String email, String password) async {
    emit(LoadingState());
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user!.uid);
      print(value.user!.email);
      emit(UserLoginSuccessState());
    }).catchError((error) {
      emit(UserLoginErrorState(error: error.toString()));
    });
  }

  void back() {
    emit(InitialAppstate());
  }
}

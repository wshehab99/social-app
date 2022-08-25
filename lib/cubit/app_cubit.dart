import 'package:cloud_firestore/cloud_firestore.dart';
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

  Future<void> register({
    required String email,
    required String password,
    required String phone,
    required String name,
  }) async {
    emit(LoadingState());
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user!.uid);
      print(value.user!.email);
      createUser(
          email: email, name: name, phone: phone, userId: value.user!.uid);
      emit(UserRegisterSuccessState());
    }).catchError((error) {
      emit(UserRegisterErrorState(error: error.toString()));
    });
  }

  Future<void> createUser({
    required String email,
    required String name,
    required String phone,
    required String userId,
  }) async {
    emit(LoadingState());
    await FirebaseFirestore.instance.collection('users').doc(userId).set({
      'name': name,
      'email': email,
      'phone': phone,
      'userId': userId,
    }).then((value) {
      emit(UserCreateSuccessState());
    }).catchError((error) {
      emit(UserCreateErrorState(error: error.toString()));
    });
  }

  void back() {
    emit(InitialAppstate());
  }
}

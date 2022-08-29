import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/cubit/app_states.dart';
import 'package:social_media_app/models/user_model.dart';
import 'package:social_media_app/shared/local/cache_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialAppstate());
  bool passwordVisabilty = false;
  bool confpasswordVisabilty = false;
  int currentIndex = 0;
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
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .catchError((error) {
      emit(UserLoginErrorState(error: error.toString()));
    });
    print(user.user!.uid);
    print(user.user!.email);
    await CacheHelper.saveData(key: "userId", value: user.user!.uid);
    emit(UserLoginSuccessState());
  }

  Future<void> register({
    required String email,
    required String password,
    required String phone,
    required String name,
  }) async {
    emit(LoadingState());
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .catchError((error) {
      emit(UserRegisterErrorState(error: error.toString()));
    });
    print(user.user!.uid);
    print(user.user!.email);
    await createUser(
        email: email, name: name, phone: phone, userId: user.user!.uid);
    await CacheHelper.saveData(key: 'userId', value: user.user!.uid);
    emit(UserRegisterSuccessState());
  }

  Future<void> createUser({
    required String email,
    required String name,
    required String phone,
    required String userId,
  }) async {
    emit(LoadingState());
    UserModel user = UserModel(
      name: name,
      phone: phone,
      email: email,
      userId: userId,
    );

    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .set(
          user.toJson(user: user),
        )
        .then((value) {
      emit(UserCreateSuccessState());
    }).catchError((error) {
      emit(UserCreateErrorState(error: error.toString()));
    });
  }

  UserModel? userModel;
  Future getUserDetails(String userId) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .get()
        .then((value) {
      userModel = UserModel.fromJson(json: value.data()!);
      print(value.data());
    }).catchError((error) {});
  }

  Future<void> verfiyEmail() async {
    await FirebaseAuth.instance.currentUser!
        .sendEmailVerification()
        .then((value) {
      emit(state);
      print(FirebaseAuth.instance.currentUser!.emailVerified);
    }).catchError((error) {});
  }

  void cahngeCurrentIndex(int index) {
    currentIndex = index;
    emit(ChangeNavigationBarScreen());
  }
}

import 'dart:io';
import "package:firebase_storage/firebase_storage.dart";
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_media_app/cubit/app_states.dart';
import 'package:social_media_app/models/message_model.dart';
import 'package:social_media_app/models/user_model.dart';
import 'package:social_media_app/shared/local/cache_helper.dart';

import '../models/post_model.dart';

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
      email: email,
      name: name,
      phone: phone,
      userId: user.user!.uid,
    );
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
          UserModel.toJson(user: user),
        )
        .then((value) {
      emit(UserCreateSuccessState());
    }).catchError((error) {
      emit(UserCreateErrorState(error: error.toString()));
    });
  }

  UserModel? userModel;

  Future getUserDetails(String userId) async {
    emit(LoadingState());
    await FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .get()
        .then((value) {
      userModel = UserModel.fromJson(json: value.data()!);
      emit(UserGetDetailsSuccessState());
    }).catchError((error) {
      emit(UserGetDetailsErrorState(error: error.toString()));
    });
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

  final ImagePicker picker = ImagePicker();
  File? profileImage;
  File? coverImage;
  File? postImage;
  Future<void> pickImage({required String type}) async {
    await picker.pickImage(source: ImageSource.gallery).then((value) {
      if (value != null) {
        if (type == "cover") {
          coverImage = File(value.path);
        } else if (type == "profile") {
          profileImage = File(value.path);
        } else {
          postImage = File(value.path);
        }

        emit(GetImageSuccessState());
      }
    }).catchError((error) {
      emit(GetImageErrorState(error: error.toString()));
    });
  }

  Future<String> uploadImage({
    required String uId,
    required String type,
  }) async {
    File? file;
    if (type == "profile") {
      file = File(profileImage!.path);
    }
    if (type == "cover") {
      file = File(coverImage!.path);
    }
    if (type == "post") {
      file = postImage;
    }
    TaskSnapshot value = await FirebaseStorage.instance
        .ref()
        .child("users/$type/$uId/${Uri.file(file!.path).pathSegments.last}")
        .putFile(file)
        .catchError((error) {
      print(error.toString());
      emit(UploadImageErrorState(error: error.toString()));
    });
    emit(UploadImageSuccessState());
    return await value.ref.getDownloadURL();
  }

  Future<void> updateData(
      {required Map<String, dynamic> data, required String userId}) async {
    emit(LoadingState());
    if (profileImage != null) {
      await uploadImage(
        uId: userModel!.userId!,
        type: "profile",
      ).then((value) {
        data.addAll({
          'imageUrl': value,
        });
      });
    } else {
      data.addAll({
        'imageUrl': userModel!.imageUrl,
      });
    }
    if (coverImage != null) {
      await uploadImage(
        uId: userModel!.userId!,
        type: "cover",
      ).then((value) {
        data.addAll({
          "coverImage": value,
        });
      });
    } else {
      data.addAll({
        "coverImage": userModel!.coverImage,
      });
    }
    await FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .set(data)
        .then((value) {
      emit(UpdateDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(UpdateDataErrorState(error: error.toString()));
    });
  }

  Future createPost({required text, required userId}) async {
    emit(LoadingState());
    String? imageUrl;
    if (postImage != null) {
      imageUrl = await uploadImage(uId: userId, type: "post");
    }
    PostModel post = PostModel(
      author: userModel!,
      date: DateTime.now().toString(),
      text: text ?? "",
      imageUrl: imageUrl ?? "",
    );
    Map<String, dynamic> data = PostModel.toJson(post: post);
    await FirebaseFirestore.instance
        .collection('posts')
        .add(data)
        .then((value) {
      data.addAll({"postId": value.id});
      FirebaseFirestore.instance
          .collection("posts")
          .doc(value.id)
          .set(data)
          .then((value) {
        emit(UserCreateSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(UserCreateErrorState(error: error.toString()));
      });
    }).catchError((error) {
      emit(UserCreateErrorState(error: error.toString()));
    });
  }

  List<PostModel> posts = [];
  void deleteImage() {
    postImage = null;
    emit(DeleteImageState());
  }

  Future getPosts() async {
    posts = [];
    FirebaseFirestore.instance
        .collection("posts")
        .orderBy('date')
        .get()
        .then((value) {
      for (QueryDocumentSnapshot<Map<String, dynamic>> element in value.docs) {
        FirebaseFirestore.instance
            .collection("posts")
            .doc(element.id)
            .collection("likes")
            .get()
            .then((likeValue) {
          FirebaseFirestore.instance
              .collection("posts")
              .doc(element.id)
              .collection("likes")
              .get()
              .then((commentValue) {
            Map<String, dynamic> json = element.data();
            json.addAll({
              "likesNo": likeValue.docs.length,
              "commentsNo": commentValue.docs.length,
            });
            posts.add(PostModel.fromJson(json: json));
            emit(GetPostSuccessState());
          });
        });
      }
    }).catchError((error) {
      emit(GetPostErrorstate(error: error));
    });
  }

  Future likePost({required String postId}) async {
    FirebaseFirestore.instance
        .collection("posts")
        .doc(postId)
        .collection("likes")
        .doc(userModel!.userId!)
        .set({
      "like": true,
    }).then((value) {
      emit(LikePostSuccessState());
    }).catchError((error) {
      emit(LikePostErrorstate(error: error));
    });
  }

  Future commentPost({required String postId, required String comment}) async {
    FirebaseFirestore.instance
        .collection("posts")
        .doc(postId)
        .collection("comments")
        .add({
      "comment": comment,
      'commentAuthor': userModel!.userId!,
    }).then((value) {
      emit(CommentPostSuccessState());
    }).catchError((error) {
      emit(CommentPostErrorstate(error: error));
    });
  }

  Future refreshPost({required String postId}) async {
    emit(RefreshPostLoadingState());
    await FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .get()
        .then((value) {
      FirebaseFirestore.instance
          .collection("posts")
          .doc(postId)
          .collection("likes")
          .get()
          .then((likeValue) {
        FirebaseFirestore.instance
            .collection("posts")
            .doc(postId)
            .collection("comments")
            .get()
            .then((commentValue) {
          int postIndex = posts.indexWhere((element) {
            return postId == element.postId!;
          });
          Map<String, dynamic> json = value.data()!;
          json.addAll({
            "likesNo": likeValue.docs.length,
            "commentsNo": commentValue.docs.length,
          });
          posts[postIndex] = PostModel.fromJson(json: json);
          emit(RefreshPostSuccessState());
        });
      });
    }).catchError((error) {
      emit(RefreshPostErrorstate(error: error));
    });
  }

  List<UserModel> users = [];
  Future getAllUsers({required String userId}) async {
    emit(LoadingState());
    users = [];
    FirebaseFirestore.instance.collection("users").get().then((value) {
      value.docs.forEach((element) {
        if (element.data()['userId'] != userId) {
          users.add(UserModel.fromJson(json: element.data()));
        }
      });
      emit(GetAllUsersSuccessState());
    }).catchError((error) {
      emit(GetAllUsersErrorstate(error: error));
    });
  }

  List<MessageModel> messages = [];
  Future getMessages({
    required String userId,
    required String recieverId,
  }) async {
    emit(LoadingState());

    FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .collection("chats")
        .doc(recieverId)
        .collection("messages")
        .orderBy("date")
        .snapshots()
        .listen((event) {
      messages = [];
      event.docs.forEach((element) {
        messages.add(MessageModel.fromJson(json: element.data()));
        emit(GetAllUsersSuccessState());
      });
    });
  }

  Future sendMessage({required MessageModel message}) async {
    FirebaseFirestore.instance
        .collection("users")
        .doc(message.senderId)
        .collection("chats")
        .doc(message.recieverId)
        .collection("messages")
        .add(MessageModel.toMap(message: message))
        .then((value) {
      FirebaseFirestore.instance
          .collection("users")
          .doc(message.recieverId)
          .collection("chats")
          .doc(message.senderId)
          .collection("messages")
          .add(MessageModel.toMap(message: message))
          .then((value) {
        emit(SendMessageSuccessState());
      });
    }).catchError((error) {
      emit(SendMessageErrorstate(error: error));
    });
  }

  Future getComments({required String postId}) async {
    FirebaseFirestore.instance
        .collection("posts")
        .doc(postId)
        .collection("comments")
        .doc()
        .get()
        .then((value) {
      print(value.id);
    }).catchError((error) {});
  }
}

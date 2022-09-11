import 'package:social_media_app/models/user_model.dart';

class PostModel {
  UserModel? author;
  String? imageUrl;
  String? date;
  String? text;
  String? postId;
  int? likeNo;
  int? commentNo;
  static Map<String, dynamic> toJson({required PostModel post}) {
    return {
      'author': UserModel.toJson(user: post.author!),
      'date': post.date,
      'imageUrl': post.imageUrl,
      'text': post.text,
    };
  }

  PostModel.fromJson({required Map<String, dynamic> json}) {
    author = UserModel.fromJson(json: json['author']);

    date = json['date'];
    imageUrl = json['imageUrl'];
    text = json['text'];
    postId = json['postId'];
    likeNo = json['likesNo'];
//    commentNo = json['commentNo'];
  }

  PostModel({
    required this.author,
    required this.date,
    required this.imageUrl,
    required this.text,
  });
}

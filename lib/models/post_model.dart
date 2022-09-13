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
    DateTime postDate = DateTime.parse(json['date']);
    DateTime now = DateTime.now();
    if (postDate.day == now.day) {
      if (postDate.hour == now.hour) {
        date = "${now.minute - postDate.minute} min";
      } else {
        date = "${now.hour - postDate.hour} h";
      }
    } else {
      date = json['date'].toString().substring(0, 11);
    }

    imageUrl = json['imageUrl'];
    text = json['text'];
    postId = json['postId'];
    likeNo = json['likesNo'];
    commentNo = json['commentsNo'];
  }

  PostModel({
    required this.author,
    required this.date,
    required this.imageUrl,
    required this.text,
  });
}

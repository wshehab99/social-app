import 'package:social_media_app/models/user_model.dart';

class CommentModel {
  UserModel? author;
  String? text;
  CommentModel.fromJson({required Map<String, dynamic> json}) {
    author = UserModel.fromJson(json: json[author]);
    text = json["comment"];
  }
}

import 'package:flutter/material.dart';
import 'package:social_media_app/layout/screens/chat_details.dart';

import '../../models/user_model.dart';

class ChatTitle extends StatelessWidget {
  const ChatTitle({super.key, required this.userModel, required this.userId});
  final UserModel? userModel;
  final String? userId;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatDetails(
              user: userModel,
              userId: userId,
            ),
          ),
        );
      },
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(userModel!.imageUrl!),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            userModel!.name!,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          const SizedBox(
            width: 5,
          ),
          Icon(
            Icons.check_circle,
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}

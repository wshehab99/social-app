import 'package:flutter/material.dart';
import 'package:social_media_app/models/message_model.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({super.key, required this.isMine, required this.message});
  final bool isMine;
  final MessageModel? message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMine
          ? AlignmentDirectional.bottomStart
          : AlignmentDirectional.bottomEnd,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomLeft: isMine ? Radius.zero : Radius.circular(15),
            bottomRight: isMine ? Radius.circular(15) : Radius.zero,
          ),
          color: isMine ? Colors.deepPurple : Colors.blue,
        ),
        child: Text(message!.message!),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:social_media_app/layout/widgets/shop_text_button.dart';

class CommentTextField extends StatelessWidget {
  const CommentTextField({
    Key? key,
    required this.controller,
    required this.postComment,
  }) : super(key: key);
  final TextEditingController? controller;
  final void Function()? postComment;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(
        height: 1,
      ),
      decoration: InputDecoration(
          suffixIconColor: Colors.blue,
          suffixIcon: SocialAppTextButton(
            text: "Post",
            onPressed: postComment,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          hintStyle: Theme.of(context).textTheme.caption!.copyWith(
                fontSize: 14,
                height: 1,
              ),
          constraints: const BoxConstraints(
            minHeight: 15,
            maxHeight: 35,
          ),
          hintText: 'type a comment',
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(35))),
    );
  }
}

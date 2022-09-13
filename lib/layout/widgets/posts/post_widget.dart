import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/cubit/app_cubit.dart';
import 'package:social_media_app/cubit/app_states.dart';
import 'package:social_media_app/layout/widgets/posts/app_icon_button.dart';
import 'package:social_media_app/models/post_model.dart';

import 'comment_text_field.dart';
import 'like_button.dart';

class PostWidget extends StatelessWidget {
  PostWidget({
    Key? key,
    required this.post,
  }) : super(key: key);
  final PostModel? post;
  final TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = context.read<AppCubit>();
        return Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 5,
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(
                        post!.author!.imageUrl!,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              post!.author!.name!,
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
                        Text(
                          post!.date!,
                          style: Theme.of(context).textTheme.caption,
                        )
                      ],
                    ),
                    const Spacer(),
                    AppIconButton(
                      onPressed: () {},
                      icon: Icons.more_horiz,
                      iconSize: 20,
                    ),
                  ],
                ),
                const Divider(),
                if (post!.text!.isNotEmpty)
                  Text(
                    post!.text!,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 16,
                          height: 1.1,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                const SizedBox(
                  height: 5,
                ),
                if (post!.imageUrl!.isNotEmpty)
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              post!.imageUrl!,
                            ))),
                  ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.favorite_border,
                        color: Colors.red,
                        size: 15,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        post!.likeNo.toString(),
                        style: Theme.of(context).textTheme.caption,
                      ),
                      const Spacer(),
                      Icon(
                        Icons.comment_outlined,
                        color: Colors.amber[300],
                        size: 15,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        post!.commentNo!.toString(),
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InteractButton(
                      onPressed: () {
                        cubit.likePost(postId: post!.postId!).then((value) {
                          cubit.refreshPost(postId: post!.postId!);
                        });
                      },
                      icon: Icons.favorite_border,
                      caption: "Like",
                    ),
                    InteractButton(
                      onPressed: () {},
                      icon: Icons.comment_outlined,
                      caption: "Comment",
                      color: Colors.amber[300],
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundImage: NetworkImage(cubit.userModel!.imageUrl!),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: CommentTextField(
                        controller: commentController,
                        postComment: () {
                          cubit
                              .commentPost(
                            postId: post!.postId!,
                            comment: commentController.text,
                          )
                              .then((value) {
                            cubit.refreshPost(postId: post!.postId!);
                          });
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

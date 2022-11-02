import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/cubit/app_cubit.dart';
import 'package:social_media_app/cubit/app_states.dart';
import 'package:social_media_app/layout/widgets/comment.dart';
import 'package:social_media_app/layout/widgets/posts/post_widget.dart';

import '../../models/post_model.dart';

class PostDetails extends StatelessWidget {
  const PostDetails({super.key, required this.post, required this.userId});
  final PostModel? post;
  final String? userId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => AppCubit()
          ..getUserDetails(userId!)
          ..getComments(postId: post!.postId!),
        child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is LoadingState)
              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: LinearProgressIndicator(),
                ),
              );
            return Column(
              children: [
                PostWidget(
                  post: post,
                ),
                SizedBox(
                  height: 15,
                ),
                CommentWidget(),
                CommentWidget(),
                CommentWidget(),
              ],
            );
          },
        ),
      ),
    );
  }
}

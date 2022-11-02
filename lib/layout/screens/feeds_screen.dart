import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/cubit/app_cubit.dart';
import 'package:social_media_app/cubit/app_states.dart';
import 'package:social_media_app/layout/screens/post_details.dart';
import 'package:social_media_app/layout/widgets/posts/post_widget.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = context.read<AppCubit>();
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  reverse: true,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PostDetails(
                            post: cubit.posts[index],
                            userId: cubit.userModel!.userId,
                          ),
                        ),
                      );
                    },
                    child: PostWidget(
                      post: cubit.posts[index],
                    ),
                  ),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                  itemCount: cubit.posts.length,
                ),
              ],
            ),
          );
        });
  }
}

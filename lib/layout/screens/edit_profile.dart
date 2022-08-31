import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/cubit/app_cubit.dart';
import 'package:social_media_app/cubit/app_states.dart';
import 'package:social_media_app/layout/widgets/shop_text_button.dart';

import '../widgets/profile/cover_image.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({
    Key? key,
    required this.userId,
  }) : super(key: key);
  final String? userId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getUserDetails(userId!),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = context.read<AppCubit>();

          return Scaffold(
            appBar: AppBar(
              title: const Text(
                "Edit Profile",
              ),
              actions: [
                SocialAppTextButton(
                    text: "Update",
                    onPressed: () {
                      cubit.uploadImage(
                          uId: cubit.userModel!.userId!, type: "profile");
                    }),
              ],
            ),
            body: (state is LoadingState)
                ? const Center(
                    child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35.0),
                    child: LinearProgressIndicator(),
                  ))
                : Column(
                    children: [
                      CoverAndProfileImage(
                        user: cubit.userModel!,
                        isEditProfile: true,
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}

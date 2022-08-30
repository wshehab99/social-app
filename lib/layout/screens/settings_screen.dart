import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/cubit/app_cubit.dart';
import 'package:social_media_app/cubit/app_states.dart';
import 'package:social_media_app/layout/screens/edit_profile.dart';
import 'package:social_media_app/layout/widgets/profile/cover_image.dart';
import 'package:social_media_app/layout/widgets/profile/post_photo_row_widget.dart';
import 'package:social_media_app/layout/widgets/social_app_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = context.read<AppCubit>();
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
          ),
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              CoverAndProfileImage(
                user: cubit.userModel,
              ),
              const SizedBox(
                height: 55,
              ),
              Text(
                cubit.userModel!.name!,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                cubit.userModel!.userBio!,
                style: Theme.of(context).textTheme.caption,
              ),
              const SizedBox(
                height: 10,
              ),
              SocialAppButton(
                text: "Edit Profile",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditProfileScreen(
                                userId: cubit.userModel!.userId!,
                              )));
                },
                height: 35,
                fontSize: 20,
              ),
              const SizedBox(
                height: 5,
              ),
              const PostPhotoRow(),
            ],
          ),
        );
      },
    );
  }
}

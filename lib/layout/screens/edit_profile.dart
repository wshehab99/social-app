import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/cubit/app_cubit.dart';
import 'package:social_media_app/cubit/app_states.dart';
import 'package:social_media_app/layout/screens/home_screen.dart';
import 'package:social_media_app/layout/widgets/shop_text_button.dart';
import 'package:social_media_app/layout/widgets/social_app_text_field.dart';

import '../widgets/profile/cover_image.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({
    Key? key,
    required this.userId,
  }) : super(key: key);
  final String? userId;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getUserDetails(userId!),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          if (state is UpdateDataSuccessState) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          AppCubit cubit = context.read<AppCubit>();
          if (state is! LoadingState) {
            nameController.text = cubit.userModel!.name!;
            bioController.text = cubit.userModel!.userBio!;
          }
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                "Edit Profile",
              ),
              actions: [
                SocialAppTextButton(
                    text: "Update",
                    onPressed: (state is LoadingState)
                        ? null
                        : () {
                            Map<String, dynamic> data = {
                              "email": cubit.userModel!.email,
                              "isEmailVerified":
                                  cubit.userModel!.isEmailVerified,
                              "name": nameController.text,
                              "phone": cubit.userModel!.phone,
                              "userBio": bioController.text,
                              "userId": cubit.userModel!.userId,
                            };
                            cubit.updateData(
                              data: data,
                              userId: cubit.userModel!.userId!,
                            );
                          }),
              ],
            ),
            body: (state is LoadingState)
                ? const Center(
                    child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35.0),
                    child: LinearProgressIndicator(),
                  ))
                : SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Form(
                      key: formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            CoverAndProfileImage(
                              user: cubit.userModel!,
                              isEditProfile: true,
                            ),
                            const SizedBox(
                              height: 60,
                            ),
                            SocialAppTextField(
                              controller: nameController,
                              label: "name",
                              prefix: const Icon(Icons.person),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SocialAppTextField(
                              controller: bioController,
                              prefix: const Icon(Icons.info_outline),
                              label: "Bio",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
}

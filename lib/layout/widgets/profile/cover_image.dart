import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/cubit/app_cubit.dart';
import 'package:social_media_app/cubit/app_states.dart';
import 'package:social_media_app/layout/widgets/posts/app_icon_button.dart';
import 'package:social_media_app/models/user_model.dart';

class CoverAndProfileImage extends StatelessWidget {
  const CoverAndProfileImage({
    Key? key,
    required this.user,
    this.isEditProfile = false,
  }) : super(key: key);

  final bool? isEditProfile;

  final UserModel? user;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = context.read<AppCubit>();
        return Stack(
          alignment: AlignmentDirectional.bottomCenter,
          clipBehavior: Clip.none,
          children: [
            Align(
              alignment: AlignmentDirectional.topCenter,
              child: Container(
                height: 200,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                ),
                child: cubit.coverImage == null
                    ? Image(
                        image: NetworkImage(
                          user!.coverImage!,
                        ),
                        fit: BoxFit.cover,
                      )
                    : Image(
                        image: FileImage(cubit.coverImage!),
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            Positioned(
              top: 145,
              child: CircleAvatar(
                radius: 55,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                child: Container(
                  height: 100,
                  width: 100,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: cubit.profileImage == null
                      ? Image(
                          image: NetworkImage(user!.imageUrl!),
                          fit: BoxFit.cover,
                        )
                      : Image(
                          image: FileImage(
                            cubit.profileImage!,
                          ),
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            ),
            Positioned(
              top: 5,
              right: 5,
              child: isEditProfile!
                  ? CircleAvatar(
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      child: AppIconButton(
                        onPressed: () {
                          cubit.pickImage(type: "cover");
                        },
                        icon: Icons.edit,
                      ),
                    )
                  : const SizedBox(),
            ),
            Positioned(
              top: 180,
              right: MediaQuery.of(context).size.width * 0.33,
              child: isEditProfile!
                  ? CircleAvatar(
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      child: AppIconButton(
                        onPressed: () {
                          cubit.pickImage(type: "profile");
                        },
                        icon: Icons.camera_alt_outlined,
                      ),
                    )
                  : const SizedBox(),
            ),
          ],
        );
      },
    );
  }
}

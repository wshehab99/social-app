import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/cubit/app_cubit.dart';
import 'package:social_media_app/cubit/app_states.dart';
import 'package:social_media_app/layout/widgets/posts/app_icon_button.dart';
import 'package:social_media_app/layout/widgets/shop_text_button.dart';

class NewPostScreen extends StatelessWidget {
  NewPostScreen({super.key});
  final TextEditingController postController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: ((context, state) {
        if (state is UserCreateSuccessState) {
          Navigator.pop(context);
        }
      }),
      builder: ((context, state) {
        AppCubit cubit = context.read<AppCubit>();
        if (state is LoadingState) {
          return Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.25),
              child: const LinearProgressIndicator(),
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: const Text("NewPost"),
            actions: [
              SocialAppTextButton(
                  text: "POST",
                  onPressed: () {
                    if (postController.text.isNotEmpty ||
                        cubit.postImage != null) {
                      cubit.createPost(
                        text: postController.text,
                        userId: cubit.userModel!.userId!,
                      );
                    }
                  })
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(
                          cubit.userModel!.imageUrl!,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Text(
                                cubit.userModel!.name!,
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
                            "Public",
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                    ],
                  ),
                  TextFormField(
                    controller: postController,
                    maxLines: cubit.postImage != null ? 5 : 15,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "What is on your mind...",
                      hintStyle: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(fontSize: 16),
                    ),
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(),
                  ),
                  if (cubit.postImage != null)
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Image(image: FileImage(cubit.postImage!)),
                        AppIconButton(
                          onPressed: () {
                            cubit.deleteImage();
                          },
                          icon: Icons.delete,
                        ),
                      ],
                    ),
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            cubit.pickImage(type: "post");
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.image),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                cubit.postImage == null
                                    ? "Add Photo"
                                    : "Edeit Photo",
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: () {},
                          child: const Text("# Tags"),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/cubit/app_cubit.dart';
import 'package:social_media_app/cubit/app_states.dart';
import 'package:social_media_app/layout/widgets/message_widget.dart';
import 'package:social_media_app/layout/widgets/posts/app_icon_button.dart';
import 'package:social_media_app/models/message_model.dart';
import 'package:social_media_app/models/user_model.dart';

class ChatDetails extends StatelessWidget {
  ChatDetails({super.key, required this.user, required this.userId});
  final UserModel? user;
  final String? userId;
  final TextEditingController messageController = TextEditingController();
  final ScrollController listController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()
        ..getMessages(
          userId: userId!,
          recieverId: user!.userId!,
        ),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          listController.animateTo(
            500,
            duration: const Duration(milliseconds: 200),
            curve: Curves.bounceInOut,
          );
          AppCubit cubit = context.read<AppCubit>();
          return Scaffold(
            appBar: AppBar(
                leadingWidth: 30,
                title: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        user!.imageUrl!,
                      ),
                      radius: 25,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(user!.name!)
                  ],
                )),
            body: Padding(
              padding: const EdgeInsets.only(
                bottom: 50,
                left: 10,
                top: 10,
                right: 10,
              ),
              child: ListView.separated(
                controller: listController,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return MessageWidget(
                    isMine: cubit.messages[index].senderId == userId,
                    message: cubit.messages[index],
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 5,
                ),
                itemCount: cubit.messages.length,
              ),
            ),
            bottomSheet: Row(
              children: [
                Expanded(
                    child: TextFormField(
                  controller: messageController,
                  style: Theme.of(context).textTheme.bodyText2,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ))),
                )),
                AppIconButton(
                  onPressed: () {
                    if (messageController.text.isNotEmpty) {
                      cubit
                          .sendMessage(
                        message: MessageModel(
                          message: messageController.text,
                          date: DateTime.now().toString(),
                          recieverId: user!.userId!,
                          senderId: userId,
                        ),
                      )
                          .then((value) {
                        messageController.clear();
                      });
                    }
                  },
                  icon: Icons.send,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

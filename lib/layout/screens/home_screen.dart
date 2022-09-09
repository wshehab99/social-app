import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/cubit/app_cubit.dart';
import 'package:social_media_app/cubit/app_states.dart';
import 'package:social_media_app/layout/screens/chats_screen.dart';
import 'package:social_media_app/layout/screens/feeds_screen.dart';
import 'package:social_media_app/layout/screens/new_post.dart';
import 'package:social_media_app/layout/screens/notifications_screen.dart';
import 'package:social_media_app/layout/screens/settings_screen.dart';
import 'package:social_media_app/layout/widgets/posts/app_icon_button.dart';
import 'package:social_media_app/layout/widgets/nav_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final List<Widget> screens = [
    const FeedsScreen(),
    const ChatsScreen(),
    const NotificationsScreen(),
    const SettingsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: ((context, state) {}),
      builder: ((context, state) {
        AppCubit cubit = context.read<AppCubit>();
        return Scaffold(
          bottomNavigationBar: NavBarWidget(
            onTap: (index) {
              cubit.cahngeCurrentIndex(index);
            },
            index: cubit.currentIndex,
          ),
          appBar: AppBar(
            title: const Text('News Feed'),
            iconTheme: Theme.of(context).iconTheme,
            actions: [
              AppIconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: ((context) => AppCubit()
                          ..getUserDetails(cubit.userModel!.userId!)),
                        child: NewPostScreen(),
                      ),
                    ),
                  );
                },
                icon: Icons.add,
                iconSize: 30,
              ),
              AppIconButton(
                onPressed: () {},
                icon: Icons.notifications_active,
                iconSize: 30,
              ),
              AppIconButton(
                onPressed: () {},
                icon: Icons.search,
                iconSize: 30,
              ),
            ],
          ),
          body: screens[cubit.currentIndex],
        );
      }),
    );
  }
}

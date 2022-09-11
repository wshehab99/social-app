import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/cubit/app_cubit.dart';
import 'package:social_media_app/layout/screens/home_screen.dart';
import 'package:social_media_app/my_bloc_observer.dart';

import 'package:social_media_app/shared/constant.dart';
import 'package:social_media_app/shared/local/cache_helper.dart';

import 'layout/screens/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();

  String userId = await CacheHelper.getData(key: 'userId') ?? "";
  runApp(SocialApp(userId: userId));
}

class SocialApp extends StatelessWidget {
  const SocialApp({
    Key? key,
    this.userId,
  }) : super(key: key);
  final String? userId;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social App',
      theme: lightThem,
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: userId!.isNotEmpty
          ? BlocProvider(
              create: ((context) => AppCubit()
                ..getUserDetails(userId!)
                ..getPosts()),
              child: HomeScreen())
          : LoginScreen(),
    );
  }
}

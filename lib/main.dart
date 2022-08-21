import 'package:flutter/material.dart';

import 'package:social_media_app/shared/constant.dart';

import 'layout/screens/login_screen.dart';

void main() {
  runApp(const SocialApp());
}

class SocialApp extends StatelessWidget {
  const SocialApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social App',
      theme: lightThem,
      darkTheme: darkTheme,
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

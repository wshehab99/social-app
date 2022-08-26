import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/cubit/app_cubit.dart';
import 'package:social_media_app/cubit/app_states.dart';

import 'package:social_media_app/layout/widgets/verify_email_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Feed'),
      ),
      body: BlocConsumer<AppCubit, AppStates>(
        listener: ((context, state) {}),
        builder: ((context, state) {
          return Column(children: const [
            VerifyEmail(),
          ]);
        }),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/cubit/app_cubit.dart';
import 'package:social_media_app/cubit/app_states.dart';
import 'package:social_media_app/layout/screens/home_screen.dart';
import 'package:social_media_app/layout/screens/register_screen.dart';
import 'package:social_media_app/layout/widgets/shop_text_button.dart';
import 'package:social_media_app/shared/local/cache_helper.dart';
import '../widgets/app_alert_dialog.dart';
import '../widgets/social_app_button.dart';
import '../widgets/social_app_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Social Media App",
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      body: Center(
        child: BlocProvider(
          create: (context) => AppCubit(),
          child: BlocConsumer<AppCubit, AppStates>(
            listener: ((context, state) async {
              if (state is UserLoginErrorState) {
                showDialog(
                    context: context,
                    builder: (context) => AppAlertDialog(
                          text: state.error,
                        ));
              } else if (state is UserLoginSuccessState) {
                await CacheHelper.getData(key: "userId").then((value) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BlocProvider(
                              create: (context) => AppCubit()
                                ..getUserDetails(value)
                                ..getPosts()
                                ..getAllUsers(userId: value),
                              child: HomeScreen())));
                });
              }
            }),
            builder: (context, state) {
              AppCubit cubit = context.read<AppCubit>();
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "LOGIN",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "login to our platform to chat with friends",
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SocialAppTextField(
                          controller: emailController,
                          label: "Email Address",
                          prefix: const Icon(Icons.email_outlined),
                          type: TextInputType.emailAddress,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Email address must not be empty';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SocialAppTextField(
                          controller: passwordController,
                          label: "Email Address",
                          prefix: const Icon(Icons.lock),
                          type: TextInputType.visiblePassword,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'password must not be empty';
                            }
                            return null;
                          },
                          isPassword: !cubit.passwordVisabilty,
                          suffix: IconButton(
                            icon: cubit.passwordVisabilty
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                            onPressed: () {
                              cubit.changePasswordVisablity();
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        (state is LoadingState)
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : SocialAppButton(
                                text: "LOGIN",
                                onPressed: () {
                                  cubit.login(emailController.text,
                                      passwordController.text);
                                }),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an account?",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
                            SocialAppTextButton(
                                text: "register now",
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RegisterScreen()));
                                }),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

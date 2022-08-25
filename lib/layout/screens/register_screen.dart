import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/cubit/app_cubit.dart';
import 'package:social_media_app/cubit/app_states.dart';
import 'package:social_media_app/layout/widgets/app_alert_dialog.dart';
import 'package:social_media_app/layout/widgets/social_app_button.dart';
import 'package:social_media_app/layout/widgets/social_app_text_field.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cnofPasswordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: BlocProvider(
            create: ((context) => AppCubit()),
            child: BlocConsumer<AppCubit, AppStates>(
              listener: ((context, state) {
                if (state is UserLoginErrorState) {
                  showDialog(
                      context: context,
                      builder: (context) => AppAlertDialog(text: state.error));
                }
              }),
              builder: ((context, state) {
                AppCubit cubit = context.read<AppCubit>();
                return SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Register",
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Register to our platform to chat with friends",
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          SocialAppTextField(
                            type: TextInputType.name,
                            label: 'name',
                            prefix: const Icon(Icons.person),
                            controller: nameController,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'please enter your name';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SocialAppTextField(
                            type: TextInputType.emailAddress,
                            label: 'E-mail',
                            prefix: const Icon(Icons.email_outlined),
                            controller: emailController,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'please enter your e-mail address';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SocialAppTextField(
                            type: TextInputType.phone,
                            label: 'Phone Number',
                            prefix: const Icon(Icons.phone),
                            controller: phoneController,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'please enter your phone number';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SocialAppTextField(
                            type: TextInputType.emailAddress,
                            label: 'Password',
                            prefix: const Icon(Icons.lock),
                            controller: passwordController,
                            isPassword: !cubit.passwordVisabilty,
                            suffix: IconButton(
                                onPressed: () {
                                  cubit.changePasswordVisablity();
                                },
                                icon: cubit.passwordVisabilty
                                    ? const Icon(Icons.visibility)
                                    : const Icon(Icons.visibility_off)),
                            validate: (value) {
                              if (value!.isEmpty || value.length < 8) {
                                return 'Password is too short';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SocialAppTextField(
                            type: TextInputType.emailAddress,
                            label: 'Confirm Password',
                            prefix: const Icon(Icons.lock),
                            controller: cnofPasswordController,
                            isPassword: !cubit.confpasswordVisabilty,
                            suffix: IconButton(
                                onPressed: () {
                                  cubit.changeConfPasswordVisablity();
                                },
                                icon: cubit.confpasswordVisabilty
                                    ? const Icon(Icons.visibility)
                                    : const Icon(Icons.visibility_off)),
                            validate: (value) {
                              if (value!.isEmpty || value.length < 8) {
                                return 'Password is too short';
                              } else if (cnofPasswordController.text !=
                                  passwordController.text) {
                                return 'Password not valid';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          (state is LoadingState)
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : SocialAppButton(
                                  text: "REGISTER",
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      cubit.register(
                                        name: nameController.text,
                                        email: emailController.text,
                                        password: passwordController.text,
                                        phone: phoneController.text,
                                      );
                                    }
                                  }),
                          const SizedBox(
                            height: 20,
                          ),
                        ]),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}

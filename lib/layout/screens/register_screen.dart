import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
          child: SingleChildScrollView(
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
                      "Register to our platform to browse hot offers",
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
                      suffix: IconButton(
                          onPressed: () {}, icon: const Icon(Icons.visibility)),
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
                      suffix: IconButton(
                          onPressed: () {}, icon: const Icon(Icons.visibility)),
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
                    SocialAppButton(
                        text: "REGISTER",
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            register(
                              emailController.text,
                              passwordController.text,
                            );
                          }
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> register(String email, String password) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user!.uid);
      print(value.user!.email);
    });
  }
}

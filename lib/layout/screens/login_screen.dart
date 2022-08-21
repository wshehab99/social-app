import 'package:flutter/material.dart';

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
        child: SingleChildScrollView(
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
                    "login to our platform to browse hot offers",
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
                    isPassword: true,
                    suffix: IconButton(
                      icon: const Icon(Icons.visibility),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SocialAppButton(text: "LOGIN", onPressed: () {})
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

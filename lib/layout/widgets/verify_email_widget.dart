import 'package:flutter/material.dart';
import 'package:social_media_app/layout/widgets/shop_text_button.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({Key? key, required this.onPressed}) : super(key: key);
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      color: Colors.amber[200],
      child: Row(
        children: [
          const Icon(Icons.info_outline),
          const SizedBox(
            width: 15,
          ),
          Text(
            "Verify your email",
            style: Theme.of(context).textTheme.bodyText2,
          ),
          const Spacer(),
          SocialAppTextButton(
            onPressed: onPressed,
            text: 'send',
          ),
        ],
      ),
    );
  }
}

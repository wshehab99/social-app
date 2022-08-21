import 'package:flutter/material.dart';

class SocialAppTextButton extends StatelessWidget {
  const SocialAppTextButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);
  final String? text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text!,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}

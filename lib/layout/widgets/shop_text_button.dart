import 'package:flutter/material.dart';

class SocialAppTextButton extends StatelessWidget {
  const SocialAppTextButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.fontSize = 18,
    this.fontWeight = FontWeight.bold,
  }) : super(key: key);
  final String? text;
  final void Function()? onPressed;
  final FontWeight? fontWeight;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text!,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}

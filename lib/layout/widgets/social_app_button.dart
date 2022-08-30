import 'package:flutter/material.dart';

class SocialAppButton extends StatelessWidget {
  const SocialAppButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.height = 45,
    this.fontSize = 22,
  }) : super(key: key);
  final String? text;
  final void Function()? onPressed;
  final double? height;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text!, style: TextStyle(fontSize: fontSize)),
      ),
    );
  }
}

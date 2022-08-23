import 'package:flutter/material.dart';

class AppLoadingDialog extends StatelessWidget {
  const AppLoadingDialog({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      backgroundColor: Colors.transparent,
      content: const Center(child: CircularProgressIndicator()),
    );
  }
}

import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    this.iconSize = 30,
  }) : super(key: key);
  final void Function()? onPressed;
  final IconData? icon;
  final double? iconSize;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
      ),
      iconSize: iconSize,
      constraints:
          BoxConstraints(minHeight: iconSize! + 5, minWidth: iconSize! + 5),
      padding: EdgeInsets.zero,
    );
  }
}

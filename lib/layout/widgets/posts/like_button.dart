import 'package:flutter/material.dart';

class InteractButton extends StatelessWidget {
  const InteractButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    required this.caption,
    this.color = Colors.red,
  }) : super(key: key);
  final void Function()? onPressed;
  final IconData? icon;
  final String? caption;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        children: [
          Icon(
            icon,
            color: color,
            size: 30,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            caption!,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                ),
          ),
        ],
      ),
    );
  }
}

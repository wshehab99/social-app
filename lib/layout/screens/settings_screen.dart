import 'package:flutter/material.dart';
import 'package:social_media_app/layout/widgets/profile/cover_image.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [CoverImage()],
    );
  }
}

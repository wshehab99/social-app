import 'package:flutter/material.dart';
import 'package:social_media_app/layout/widgets/posts/post_widget.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => const PostWidget(),
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: 15,
          ),
        ],
      ),
    );
  }
}

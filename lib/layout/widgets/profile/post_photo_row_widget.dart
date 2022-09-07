import 'package:flutter/material.dart';

import '../shop_text_button.dart';

class PostPhotoRow extends StatelessWidget {
  const PostPhotoRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SocialAppTextButton(
            onPressed: () {},
            text: "Posts",
            fontSize: 16,
            fontColor: Theme.of(context).textTheme.bodyText2!.color,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: SocialAppTextButton(
            onPressed: () {},
            text: "Photos",
            fontSize: 16,
            fontColor: Theme.of(context).textTheme.bodyText2!.color,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: SocialAppTextButton(
            onPressed: () {},
            text: "Followers",
            fontSize: 16,
            fontColor: Theme.of(context).textTheme.bodyText2!.color,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: SocialAppTextButton(
            onPressed: () {},
            text: "Following",
            fontSize: 16,
            fontColor: Theme.of(context).textTheme.bodyText2!.color,
          ),
        ),
      ],
    );
  }
}

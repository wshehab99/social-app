import 'package:flutter/material.dart';
import 'package:social_media_app/layout/widgets/posts/app_icon_button.dart';

import 'posts/comment_text_field.dart';
import 'posts/like_button.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 5,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(
                    'https://img.freepik.com/premium-photo/arab-man-red-background_21730-4107.jpg?w=740',
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Waleed Bin Shehab",
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.check_circle,
                          color: Theme.of(context).primaryColor,
                        ),
                      ],
                    ),
                    Text(
                      "August 28, 2022",
                      style: Theme.of(context).textTheme.caption,
                    )
                  ],
                ),
                const Spacer(),
                AppIconButton(
                  onPressed: () {},
                  icon: Icons.more_horiz,
                  iconSize: 20,
                ),
              ],
            ),
            const Divider(),
            Text(
              "Generating random paragraphs can be an excellent way for writers to get their creative flow going at the beginning of the day. The writer has no idea what topic the random paragraph will be about when it appears. This forces the writer to use creativity to complete one of three common writing challenges.",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 16,
                    height: 1.1,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        "https://img.freepik.com/free-psd/instagram-white-mobile-phone-mockup-with-3d-icons_106244-1723.jpg?w=740&t=st=1661659598~exp=1661660198~hmac=7bf15535e545d8df9f595d0b2de44fdc8944b8b7852048e9a06cbd768f17cfc0",
                      ))),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                children: [
                  const Icon(
                    Icons.favorite_border,
                    color: Colors.red,
                    size: 15,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "208 likes",
                    style: Theme.of(context).textTheme.caption,
                  ),
                  const Spacer(),
                  Icon(
                    Icons.comment_outlined,
                    color: Colors.amber[300],
                    size: 15,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "54 comments",
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InteractButton(
                  onPressed: () {},
                  icon: Icons.favorite_border,
                  caption: "Like",
                ),
                InteractButton(
                  onPressed: () {},
                  icon: Icons.comment_outlined,
                  caption: "Comment",
                  color: Colors.amber[300],
                ),
              ],
            ),
            const Divider(),
            Row(
              children: [
                const CircleAvatar(
                  radius: 15,
                  backgroundImage: NetworkImage(
                    'https://img.freepik.com/premium-photo/arab-man-red-background_21730-4107.jpg?w=740',
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: CommentTextField(
                    controller: TextEditingController(),
                    postComment: () {},
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

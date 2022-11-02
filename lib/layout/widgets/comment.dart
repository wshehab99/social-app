import 'package:flutter/material.dart';

class CommentWidget extends StatelessWidget {
  const CommentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor.withOpacity(0.3),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 17,
              backgroundImage: NetworkImage(
                "https://imageio.forbes.com/specials-images/imageserve/5d35eacaf1176b0008974b54/2020-Chevrolet-Corvette-Stingray/0x0.jpg?format=jpg&crop=4560,2565,x790,y784,safe&width=960",
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
                      " post!.author!.name!",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 14),
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
                  "post!.date!",
                  style: Theme.of(context).textTheme.button,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

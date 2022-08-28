import 'package:flutter/material.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Stack(
              alignment: Alignment.bottomRight,
              children: const [
                Image(
                  image: NetworkImage(
                    "https://img.freepik.com/free-psd/instagram-white-mobile-phone-mockup-with-3d-icons_106244-1723.jpg?w=740&t=st=1661659598~exp=1661660198~hmac=7bf15535e545d8df9f595d0b2de44fdc8944b8b7852048e9a06cbd768f17cfc0",
                  ),
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Communicate with your friends"),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 10,
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
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.more_horiz,
                        ),
                        iconSize: 20.0,
                        padding: EdgeInsets.zero,
                        constraints:
                            const BoxConstraints(minWidth: 20, minHeight: 10),
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
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

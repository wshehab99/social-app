import 'package:flutter/material.dart';

class NavBarWidget extends StatelessWidget {
  const NavBarWidget({
    Key? key,
    required this.onTap,
    this.index = 0,
  }) : super(key: key);
  final void Function(int)? onTap;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            label: "Home",
            activeIcon: Icon(Icons.home)),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat_outlined),
          label: "Chats",
          activeIcon: Icon(Icons.chat),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          label: "Favorite",
          activeIcon: Icon(Icons.favorite),
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.settings),
          label: 'Settings',
          icon: Icon(Icons.settings_outlined),
        ),
      ],
    );
  }
}

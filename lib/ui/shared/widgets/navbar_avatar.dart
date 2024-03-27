import 'package:flutter/material.dart';

class NavbarAvatar extends StatelessWidget {
  const NavbarAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: SizedBox(
        width: 30,
        height: 30,
        child: Image.network('https://pbs.twimg.com/profile_images/1771329193042751488/gcJyO9TY_400x400.jpg'),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class BackgroundTwitter extends StatelessWidget {
  const BackgroundTwitter({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: builBox(),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          child: const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 80),
              child: Image(image: AssetImage('twitter-white-logo.png')),
            ),
          ),
        ),
    ));
  }

  BoxDecoration builBox() {
    return const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('twitter-bg.png'),
          fit: BoxFit.cover
          )

      );
  }
}

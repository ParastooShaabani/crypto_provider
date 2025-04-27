import 'package:flutter/material.dart';

class HomePageView extends StatelessWidget {
  PageController controller;

  HomePageView({super.key, required this.controller});

  var images = [
    'images/user_type.png',
    'images/user_type.png',
    'images/user_type.png',
    'images/user_type.png',
  ];

  @override
  Widget build(BuildContext context) {
    return PageView(
      allowImplicitScrolling: true,
      controller: controller,
      children: [
        myPages(images[0]),
        myPages(images[1]),
        myPages(images[2]),
        myPages(images[3]),
      ],
    );
  }

  Widget myPages(String image) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      child: Image(image: AssetImage(image), fit: BoxFit.contain),
    );
  }
}

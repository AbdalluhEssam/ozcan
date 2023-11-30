import 'package:flutter/material.dart';

class Image_user_in_stories_home extends StatelessWidget {
  final String photo;

  const Image_user_in_stories_home({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Image(
        image: AssetImage(photo), fit: BoxFit.contain,
        width: MediaQuery.of(context).size.width * 0.13,
        height: MediaQuery.of(context).size.height * 0.08,
        //color: Colors.white,
      ),
    );
  }
}

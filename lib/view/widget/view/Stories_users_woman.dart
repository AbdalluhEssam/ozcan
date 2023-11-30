import 'package:flutter/material.dart';

class Image_user_in_stories extends StatelessWidget {
  final String photo;

  const Image_user_in_stories({super.key, required this.photo});

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

class Stories_user extends StatelessWidget {
  final String photo;

  const Stories_user({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          //color: Colors.purple,
          image: DecorationImage(image: AssetImage(photo), fit: BoxFit.fill)),
    );
  }
}

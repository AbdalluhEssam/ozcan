import 'package:flutter/material.dart';
import '../../../Constants.dart';
import 'Stories_users_woman.dart';

class Details_user_woman extends StatelessWidget {
  final void Function()? ontap;
  final String name_user;
  final String image_user;

  const Details_user_woman(
      {super.key,
      required this.name_user,
      required this.image_user,
      this.ontap});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            //color: Colors.pink,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "$name_user",
                  style: Main_font1,
                ),
                Image_user_in_stories(
                  photo: image_user,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

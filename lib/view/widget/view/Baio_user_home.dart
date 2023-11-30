import 'package:flutter/material.dart';
import '../../../Constants.dart';

class Baio_user_home extends StatelessWidget {
  final String name_user;
  final String Biao_user;

  const Baio_user_home(
      {super.key, required this.name_user, required this.Biao_user});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.25,
              height: MediaQuery.of(context).size.height * 0.03,
              //color: Colors.red,
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Text(
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  "$Biao_user",
                  style: Second_font,
                ),
              ),
            ),
          ],
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.25,
          height: MediaQuery.of(context).size.height * 0.03,
          //color: Colors.red,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Text(
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              "$name_user",
              style: Third_font_home,
            ),
          ),
        ),
      ],
    );
  }
}

class Photo_user_home extends StatelessWidget {
  final String user_photo;

  const Photo_user_home({super.key, required this.user_photo});

  @override
  Widget build(BuildContext context) {
    return Image(
      width: MediaQuery.of(context).size.width * 0.08,
      height: MediaQuery.of(context).size.height * 0.045,
      image: AssetImage("images/8.png"),
      fit: BoxFit.contain,
    );
  }
}
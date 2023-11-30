import 'package:flutter/material.dart';

const Main_font =
    TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18);

const Second_font =
    TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14);

const Third_font = TextStyle(
    color: Color(0xffA659A9), fontWeight: FontWeight.bold, fontSize: 14);

const Fourth_font =
    TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14);

const Main_font1 =
    TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16);

const Main_font2 = TextStyle(
    color: Color(0xffA659A9), fontWeight: FontWeight.bold, fontSize: 16);

const Third_font_men = TextStyle(
    color: Color(0xff3E5FBE), fontWeight: FontWeight.bold, fontSize: 14);

const Main_font2_men = TextStyle(
    color: Color(0xff3E5FBE), fontWeight: FontWeight.bold, fontSize: 16);

const Third_font_home =
    TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14);

const Main_font2_home =
    TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 16);

class Small_space extends StatelessWidget {
  const Small_space({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.02,
      //color: Colors.pink,
    );
  }
}

class Big_space extends StatelessWidget {
  const Big_space({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.05,
      //color: Colors.pink,
    );
  }
}

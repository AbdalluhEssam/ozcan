import 'package:flutter/material.dart';

const descripation_font =
    TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 13);

class descripation extends StatelessWidget {
  final String text;

  const descripation({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      "$text",
      style: descripation_font,
    );
  }
}

import 'package:flutter/material.dart';
import '../../../Constants.dart';

class Message_container_for_Russell_home extends StatelessWidget {
  final String text;
  final String photo;

  const Message_container_for_Russell_home(
      {super.key, required this.text, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.12,
                height: MediaQuery.of(context).size.height * 0.055,
                child: Image(
                  image: AssetImage(photo),
                  fit: BoxFit.contain,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.015,
                height: MediaQuery.of(context).size.height * 0.02,
                //color: Colors.black,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 18, right: 18),
                  child: Center(
                      child: Text(
                    "$text",
                    style: Fourth_font,
                    textAlign: TextAlign.center,
                  )),
                ),
              ),
            ],
          ),
          Container(
            //color: Colors.red,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.08,
          ),
        ],
      ),
    );
  }
}

class Message_container_for_Receive_home extends StatelessWidget {
  final String text;
  final String photo;

  const Message_container_for_Receive_home(
      {super.key, required this.text, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 18, right: 18),
                  child: Center(
                      child: Text(
                    "$text",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                    textAlign: TextAlign.center,
                  )),
                ),
              ),

              Image(
                image: AssetImage(photo),
                fit: BoxFit.fill,
                height: 80,
              ),
            ],
          ),
          Container(
            //color: Colors.red,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.08,
          ),
        ],
      ),
    );
  }
}

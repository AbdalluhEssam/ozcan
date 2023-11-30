import 'package:flutter/material.dart';
import 'package:ozcan/Constants.dart';
import 'package:share/share.dart';

class Icons_images_home extends StatelessWidget {
  final void Function()? ontap;
  final String photo;

  const Icons_images_home({super.key, required this.photo, this.ontap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.14,
      height: MediaQuery.of(context).size.height * 0.1,
      //color: Colors.green,
      child: IconButton(
        onPressed: ontap,
        icon: Image(
          image: AssetImage(photo),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class Icons_images1_home extends StatelessWidget {
  final void Function()? ontap;
  final String photo;

  const Icons_images1_home({super.key, required this.photo, this.ontap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.14,
      height: MediaQuery.of(context).size.height * 0.06,
      //color: Colors.green,
      child: IconButton(
        onPressed: ontap,
        icon: Image(
          image: AssetImage(photo),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class Image_user_home extends StatelessWidget {
  final void Function()? ontap;
  final String photo;

  const Image_user_home({super.key, required this.photo, this.ontap});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.14,
        height: MediaQuery.of(context).size.height * 0.07,
        child: IconButton(
          onPressed: ontap,
          icon: Image(
            image: AssetImage(photo),
            fit: BoxFit.contain,
          ),
        ));
  }
}


class Form_field_home extends StatelessWidget {
  final String photo1;

  final void Function()? ontap1;
  final String photo2;

  final void Function()? ontap2;
  final String text;

  const Form_field_home(
      {super.key,
      required this.text,
      required this.photo1,
      this.ontap1,
      required this.photo2,
      this.ontap2});

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.12,
      child: Container(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.065,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: ontap1,
                          icon: Image(
                            width: MediaQuery.of(context).size.width * 0.05,
                            height: MediaQuery.of(context).size.height * 0.1,
                            image: AssetImage(photo1),
                            fit: BoxFit.contain,
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.65,
                          height: MediaQuery.of(context).size.height * 0.06,
                          //color: Colors.black,
                          child: TextFormField(
                            textAlign: TextAlign.end,
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            toolbarOptions: ToolbarOptions(
                                selectAll: true,
                                copy: true,
                                cut: true,
                                paste: true),
                            enabled: true,
                            focusNode: FocusNode(canRequestFocus: true),
                            cursorColor: Colors.white,
                            cursorHeight: 20,
                            cursorWidth: 3,
                            decoration: InputDecoration(
                                enabled: true,
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                                border: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.grey)),
                                focusColor: Color(0xfff7901e),
                                hintText: ("...$text"),
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                )),
                          ),
                        ),
                        IconButton(
                          onPressed: ontap2,
                          icon: Image(
                            width: MediaQuery.of(context).size.width * 0.05,
                            height: MediaQuery.of(context).size.height * 0.1,
                            image: AssetImage(photo2),
                            fit: BoxFit.contain,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Posts_ozcan_home extends StatelessWidget {
  final String photo;
  final String text1;
  final String url;
  final void Function()? send;
  final void Function()? save;
  // final void Function()? share;
  final void Function()? comment;
  final void Function()? like;

  const Posts_ozcan_home(
      {super.key,
      required this.photo,
      required this.text1,
      this.send,
      this.save,
      // this.share,
      this.comment,
      this.like, required this.url});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Container(
        decoration: BoxDecoration(
            //color: Colors.red,
            borderRadius: BorderRadius.circular(15),
            boxShadow:  List.filled(2, BoxShadow(color: Colors.black, blurRadius: 2))),
        width: MediaQuery.of(context).size.width * 0.9,
        //height: MediaQuery.of(context).size.height * 0.67,
        //color: Colors.green,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  topLeft: Radius.circular(15),
                ),
                image:
                    DecorationImage(image: AssetImage(photo), fit: BoxFit.fill),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.08,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(0),
                  bottomLeft: Radius.circular(0),
                ),
                color: Colors.grey,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: send,
                      icon: Image(
                        width: MediaQuery.of(context).size.width * 0.05,
                        height: MediaQuery.of(context).size.height * 0.1,
                        image: AssetImage("images/20.png"),
                        fit: BoxFit.contain,
                        color: Colors.black,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "تواصل معنا الان",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              //height: MediaQuery.of(context).size.height * 0.14,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  color: Colors.white),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.14,
                        height: MediaQuery.of(context).size.height * 0.06,
                        //color: Colors.green,
                        child: IconButton(
                          onPressed: save,
                          icon: Image(
                            image: AssetImage("images/14.png"),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Spacer(),

                      Container(
                        width: MediaQuery.of(context).size.width * 0.14,
                        height: MediaQuery.of(context).size.height * 0.06,
                        //color: Colors.green,
                        child: IconButton(
                          onPressed: (){
                            Share.share('check out our product $url');
                          },
                          icon: Image(
                            image: AssetImage("images/15.png"),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),

                      Container(
                        width: MediaQuery.of(context).size.width * 0.14,
                        height: MediaQuery.of(context).size.height * 0.06,
                        //color: Colors.green,
                        child: IconButton(
                          onPressed: comment,
                          icon: Image(
                            image: AssetImage("images/12.png"),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),

                      Container(
                        width: MediaQuery.of(context).size.width * 0.14,
                        height: MediaQuery.of(context).size.height * 0.06,
                        //color: Colors.green,
                        child: IconButton(
                          onPressed: like,
                          icon: Image(
                            image: AssetImage("images/13.png"),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),

                      // Icons_images1_men(
                      //   photo: 'images/14.png',
                      //   ontap: () {},
                      // ),
                      // Spacer(),
                      // Icons_images1_men(
                      //   photo: 'images/15.png',
                      //   ontap: () {},
                      // ),
                      // Icons_images1_men(
                      //   photo: 'images/12.png',
                      //   ontap: () {},
                      // ),
                      // Icons_images1_men(
                      //   photo: 'images/13.png',
                      //   ontap: () {},
                      // ),
                    ],
                  ),
                  Small_space(),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          textAlign: TextAlign.right,
                          "$text1",
                          style: Second_font,
                        ),
                      ],
                    ),
                  ),
                  Small_space(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

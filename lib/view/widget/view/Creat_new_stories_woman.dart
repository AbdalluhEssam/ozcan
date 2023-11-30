import 'package:flutter/material.dart';

class Show_text extends StatelessWidget {
  final String text;

  const Show_text({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.2,
        decoration: BoxDecoration(
            color: Color(0xffF7F7F7),
            borderRadius: BorderRadius.circular(15),
            boxShadow: List.filled(
              2,
              BoxShadow(
                blurRadius: 3,
                color: Colors.black,
              ),
            )),
        child: TextFormField(
          textAlign: TextAlign.end,
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
              fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
          toolbarOptions: ToolbarOptions(
              selectAll: true, copy: true, cut: true, paste: true),
          enabled: true,
          focusNode: FocusNode(canRequestFocus: true),
          cursorColor: Colors.white,
          cursorHeight: 20,
          cursorWidth: 3,
          decoration: InputDecoration(
              enabled: true,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  strokeAlign: 5,
                  color: Color(0xffF7F7F7),
                ),
              ),
              border: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                      width: 2, strokeAlign: 5, color: Color(0xffF7F7F7))),
              focusColor: Color(0xffF7F7F7),
              hintText: ("$text"),
              hintStyle: TextStyle(
                color: Colors.black,
              )),
        ),
      ),
    );
  }
}

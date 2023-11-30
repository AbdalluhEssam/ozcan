import 'package:flutter/material.dart';
import 'package:ozcan/Constants.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.search),
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Small_space(),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.053,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      //color: Colors.green,

                      border: Border.all(width: 1.5, color: Colors.black)),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Icon(Icons.search),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.83,
                        height: MediaQuery.of(context).size.height * 0.053,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          //color: Colors.red,
                        ),
                        child: TextFormField(
                          textAlign: TextAlign.end,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          toolbarOptions: ToolbarOptions(
                              selectAll: true,
                              copy: true,
                              cut: true,
                              paste: true),
                          enabled: true,
                          focusNode: FocusNode(canRequestFocus: true),
                          cursorColor: Colors.black,
                          cursorHeight: 20,
                          cursorWidth: 3,
                          decoration: InputDecoration(
                              //enabled: true,
                              //isDense: true,
                              // icon: Padding(
                              //   padding: const EdgeInsets.only(left: 10),
                              //   child: Icon(
                              //     Icons.search,
                              //     color: Colors.black,
                              //     size: 25,
                              //   ),
                              // ),
                              isDense: true,
                              enabled: true,
                              //filled: true,
                              //alignLabelWithHint: true,
                              //isCollapsed: true,

                              focusedBorder: UnderlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              border: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.white)),
                              focusColor: Colors.white,
                              hintText: ("  ...ابحث هنا  "),
                              hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

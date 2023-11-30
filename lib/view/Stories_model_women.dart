import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

enum MediaType {
  image,
  video,
}

class Store {
  final String photo;
  final MediaType media;
  final Duration duration;

  const Store({
    required this.photo,
    required this.media,
    required this.duration,
  });
}

// import 'dart:async';
// import 'package:flutter/material.dart';
//
// class Stories_woman extends StatefulWidget {
//
//   //final StoryData story;
//   const Stories_woman({
//     super.key,
//   });
//
//   @override
//   State<Stories_woman> createState() => _Stories_womanState();
// }
//
// class _Stories_womanState extends State<Stories_woman> {
//   double percent = 0.0;
//   late Timer _timer;
//
//   void startTimer() {
//     _timer = Timer.periodic(Duration(milliseconds: 5), (timer) {
//       setState(() {
//         percent += 0.001;
//         if (percent > 1) {
//           _timer.cancel();
//           Navigator.pop(context);
//         }
//       });
//     });
//   }
//
//   @override
//   void initState() {

//     startTimer();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//
//           Container(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height * 0.7,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15),
//                 //color: Colors.purple,
//                 image: DecorationImage(image: AssetImage(""),fit: BoxFit.fill)
//             ),
//
//           ),
//
//           // Container(
//           //   width: double.infinity,
//           //   height: double.infinity,
//           //   decoration: BoxDecoration(
//           //       image: DecorationImage(
//           //     image: AssetImage("images/44.png"),
//           //     fit: BoxFit.cover,
//           //   ),),
//           // ),
//           Padding(
//             padding: EdgeInsets.symmetric(vertical: 36.0, horizontal: 8.0),
//             child: Column(
//               children: [
//                 LinearProgressIndicator(
//                   color: Colors.white,
//                   backgroundColor: Colors.blue,
//                   value: percent,
//                 ),
//                 SizedBox(
//                   height: 8.0,
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

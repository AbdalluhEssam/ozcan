import 'package:flutter/material.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';

class ZoomImage extends StatefulWidget {
  final String image;
  const ZoomImage({super.key, required this.image});

  @override
  State<ZoomImage> createState() => _ZoomImageState();
}

class _ZoomImageState extends State<ZoomImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("عرض الصورة"),),
      body: Center(
        child: InstaImageViewer(
          child: Image(
            image: Image.network(widget.image).image,
          ),
        ),
      ),
    );
  }
}

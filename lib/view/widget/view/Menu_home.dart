import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ozcan/Constants.dart';

class ItemList extends StatelessWidget {
  final void Function()? onPressed;
  final String image;
  final String name;
  final String size;
  final String quantity;
  final String price;

  const ItemList({
    super.key,
    required this.image,
    required this.name,
    required this.size,
    required this.quantity,
    required this.price,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        onTap: onPressed,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            width: 130,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xffECECEC),
            ),
            child: Center(
              child: Image(
                width: 120,
                height: 100,
                image: CachedNetworkImageProvider(image),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                "$name",
                style: Second_font,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "الكمية  = $quantity ",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                  Container(
                    width: 3,
                    height: 10,
                    color: Colors.grey,
                  ),
                  Text(
                    "  المقاس = $size ",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ],
              ),
              Text(
                "$price \$",
                style: Main_font1,
              ),
            ],
          ),
          SizedBox()
        ]),
      ),
    );
  }
}

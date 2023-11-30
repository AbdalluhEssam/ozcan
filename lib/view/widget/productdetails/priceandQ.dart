import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
class PriceAndCountItems extends StatelessWidget {
    final void Function()? onAdd;
    final void Function()? onDelete;
    final String? count;
    final String? price;
    final String? itemsDescount;
    final String? itemsPriceDiscount;
  const PriceAndCountItems ({Key? key,required this.onAdd,required this.onDelete,required this.count, required this.price,required this.itemsDescount,required this.itemsPriceDiscount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Row(
          children: [
            IconButton(
                onPressed: onAdd,
                icon: const Icon(
                  Icons.add,
                  color: AppColor.secoundColor,
                )),
            Container(
              alignment: Alignment.center,
              width: 50,
              padding: const EdgeInsets.only(bottom: 3),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColor.primaryColor)
              ),
              child: Text(count!,style: const TextStyle(fontSize: 20, height: 1.3),),
            ),
            IconButton(
                onPressed: onDelete,
                padding: const EdgeInsets.only(bottom: 12),
                icon: const Icon(
                  Icons.minimize_outlined,
                  color: AppColor.secoundColor,
                )),
          ],
        ),
        const Spacer(),
        itemsDescount != "0"
            ? Column(
          children: [
            Text(
              "$itemsPriceDiscount EG",
              style: const TextStyle(
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
            Text(
              "$price EG",
              style: const TextStyle(
                  decoration: TextDecoration.lineThrough,
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,height: 0.9),
            ),

          ],
        )
            : Text(
          "$price EG",
          style: const TextStyle(
              color: AppColor.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 22),
        ),

      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../../core/constant/appcolors.dart';

class PriceAndCount extends StatelessWidget {
  const PriceAndCount(
      {super.key,
      this.onadd,
      this.onremove,
      required this.count,
      required this.price});
  final void Function()? onadd;
  final void Function()? onremove;
  final String count;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            IconButton(
                onPressed: onadd,
                icon: Icon(
                  Icons.add,
                  size: 30,
                )),
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(bottom: 10),
              width: 60,
              decoration: BoxDecoration(border: Border.all()),
              child: Text(
                count,
                style: TextStyle(fontSize: 30, height: 1.1),
              ),
            ),
            IconButton(
                onPressed: onremove,
                icon: Icon(
                  Icons.remove,
                  size: 50,
                )),
          ],
        ),
        Spacer(),
        Text(
          "${price}\$",
          style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 30,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

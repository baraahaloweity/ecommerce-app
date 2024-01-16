import 'package:flutter/material.dart';

import '../../../core/constant/appcolors.dart';

class CardDeliveryType extends StatelessWidget {
  const CardDeliveryType(
      {super.key,
      required this.imagename,
      required this.title,
      required this.isactive});
  final String imagename;
  final String title;
  final bool isactive;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: isactive == true ? AppColors.primaryColor : Colors.white,
            border: Border.all(width: 1, color: AppColors.primaryColor)),
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          children: [
            Image.asset(
              imagename,
              width: 70,
              height: 75,
              color: isactive == true ? Colors.white : null,
            ),
            Text(
              title,
              style: TextStyle(
                  color:
                      isactive == true ? Colors.white : AppColors.primaryColor,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            )
          ],
        ));
  }
}

import 'package:flutter/material.dart';

import '../../../core/constant/appcolors.dart';

class CardPaymentMethod extends StatelessWidget {
  const CardPaymentMethod(
      {super.key, required this.title, required this.isactive});
  final String title;
  final bool isactive;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      margin: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color:
              isactive == true ? AppColors.primaryColor : AppColors.thirdColor,
          border: Border.all(
              width: 2,
              color: isactive == true
                  ? AppColors.primaryColor
                  : AppColors.thirdColor),
          borderRadius: BorderRadius.circular(20)),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 18,
            color: isactive == true ? Colors.white : AppColors.primaryColor,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}

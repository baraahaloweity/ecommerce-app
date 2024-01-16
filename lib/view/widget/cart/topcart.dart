import 'package:flutter/material.dart';

import '../../../core/constant/appcolors.dart';

class TopCart extends StatelessWidget {
  const TopCart({super.key, required this.massage});
  final String massage;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 8, top: 8),
      margin: EdgeInsetsDirectional.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: AppColors.thirdColor, borderRadius: BorderRadius.circular(50)),
      child: Text(
        massage,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 17,
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}

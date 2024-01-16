import 'package:flutter/material.dart';

import '../../../core/constant/appcolors.dart';

class CustomTitleHome extends StatelessWidget {
  const CustomTitleHome({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Text(title,
          style: const TextStyle(
              fontSize: 20,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold)),
    );
  }
}

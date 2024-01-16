import 'package:flutter/material.dart';

import '../../../core/constant/appcolors.dart';

class QuestionTitle extends StatelessWidget {
  const QuestionTitle({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 16,
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}

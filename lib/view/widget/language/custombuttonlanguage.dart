import 'package:flutter/material.dart';

import '../../../core/constant/appcolors.dart';

class CustomButtonLanguage extends StatelessWidget {
  const CustomButtonLanguage(
      {super.key, required this.textlanguage, this.onPressed});
  final String textlanguage;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      width: double.infinity,
      child: MaterialButton(
        color: AppColors.primaryColor,
        onPressed: onPressed,
        child: Text(
          textlanguage,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

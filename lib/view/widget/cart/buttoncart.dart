import 'package:flutter/material.dart';

import '../../../core/constant/appcolors.dart';

class ButtonCart extends StatelessWidget {
  const ButtonCart({super.key, required this.textlanguage, this.onPressed});
  final String textlanguage;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      //  padding: const EdgeInsets.symmetric(horizontal: 20),
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

import 'package:flutter/material.dart';

import '../../../core/constant/appcolors.dart';

class ButtonCheckout extends StatelessWidget {
  const ButtonCheckout({super.key, required this.title, this.onpressedcheck});
  final String title;
  final void Function()? onpressedcheck;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: MaterialButton(
          onPressed: onpressedcheck,
          child: Text(
            title,
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          color: AppColors.primaryColor,
        ));
  }
}

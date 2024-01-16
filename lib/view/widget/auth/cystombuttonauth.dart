import 'package:final_ecommerce/core/constant/appcolors.dart';
import 'package:flutter/material.dart';

class CustomButtomAuth extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  const CustomButtomAuth({super.key, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.symmetric(vertical: 13),
        onPressed: onPressed,
        color: AppColors.primaryColor,
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

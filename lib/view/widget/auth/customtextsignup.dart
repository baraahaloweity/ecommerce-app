import 'package:flutter/material.dart';

import '../../../core/constant/appcolors.dart';

class CustomTextSignup extends StatelessWidget {
  const CustomTextSignup(
      {super.key, required this.textone, required this.texttwo, this.ontap});
  final String textone;
  final String texttwo;
  final void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(textone),
        InkWell(
          onTap: ontap,
          child: Text(
            texttwo,
            style: TextStyle(
                color: AppColors.primaryColor, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}

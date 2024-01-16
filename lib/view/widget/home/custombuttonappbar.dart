import 'package:final_ecommerce/core/constant/appcolors.dart';
import 'package:flutter/material.dart';

class CustomButtonAppBar extends StatelessWidget {
  const CustomButtonAppBar(
      {super.key,
      required this.title,
      required this.iconData,
      this.onpressed,
      required this.active});
  final String title;
  final IconData iconData;
  final void Function()? onpressed;
  final bool? active;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      // minWidth: 20, // Set the width
      // height: 20,

      onPressed: onpressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData,
            color: active == true ? AppColors.primaryColor : AppColors.grey2,
          ),
          Text(
            title,
            style: TextStyle(
                color:
                    active == true ? AppColors.primaryColor : AppColors.grey2),
          ),
        ],
      ),
    );
  }
}

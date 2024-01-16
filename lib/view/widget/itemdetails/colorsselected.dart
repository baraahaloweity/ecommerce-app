import 'package:final_ecommerce/controller/itemdetails_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/appcolors.dart';

class ColorsSelected extends GetView<ItemDetailsControllerImp> {
  const ColorsSelected({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          controller.colors.length,
          (index) => Container(
              height: 50,
              width: 80,
              margin: EdgeInsets.symmetric(horizontal: 5),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: controller.colors[index]["active"] == "1"
                      ? AppColors.fourthColor
                      : Colors.white,
                  border: Border.all(color: AppColors.fourthColor),
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                controller.colors[index]["name"],
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: controller.colors[index]["active"] == "1"
                        ? Colors.white
                        : AppColors.fourthColor),
              )),
        ),
      ],
    );
  }
}

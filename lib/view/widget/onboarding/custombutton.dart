import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/onboarding_controller.dart';
import '../../../core/constant/appcolors.dart';

class CustomButton extends GetView<onBoardingControllerImp> {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      height: 40,
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 0),
        onPressed: () {
          controller.onPageChaned();
        },
        textColor: Colors.white,
        color: AppColors.primaryColor,
        child: const Text("Continue"),
      ),
    );
  }
}

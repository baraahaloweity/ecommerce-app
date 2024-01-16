import 'package:final_ecommerce/core/constant/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/onboarding_controller.dart';
import '../widget/onboarding/custombutton.dart';
import '../widget/onboarding/customlist.dart';
import '../widget/onboarding/custompageview.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(onBoardingControllerImp());
    return const Scaffold(
        backgroundColor: AppColors.backgroundcolor,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: CustomPageView(),
              ),
              Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      CustomList(),
                      Spacer(
                        flex: 2,
                      ),
                      CustomButton(),
                    ],
                  ))
            ],
          ),
        ));
  }
}

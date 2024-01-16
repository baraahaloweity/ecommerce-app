import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/onboarding_controller.dart';

import '../../../core/constant/appcolors.dart';
import '../../../data/datasource/static/static.dart';

class CustomPageView extends GetView<onBoardingControllerImp> {
  const CustomPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        itemCount: onBoardingList.length,
        onPageChanged: (val) {
          controller.next(val);
        },
        itemBuilder: ((context, index) => Column(
              children: [
                Image.asset(
                  onBoardingList[index].image!,
                  // width: 200,
                  height: Get.width / 1.3,
                  fit: BoxFit.fill,
                ),
                const SizedBox(
                  height: 80,
                ),
                Text(onBoardingList[index].title!,
                    style:
                        //Theme.of(context).textTheme.headlineLarge,
                        TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor)),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(onBoardingList[index].body!,
                      textAlign: TextAlign.center,
                      style:
                          //Theme.of(context).textTheme.bodyLarge
                          TextStyle(
                              color: AppColors.grey, height: 2, fontSize: 17)),
                ),
              ],
            )));
  }
}

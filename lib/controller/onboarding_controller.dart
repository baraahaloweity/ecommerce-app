import 'package:final_ecommerce/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constant/routes.dart';
import '../data/datasource/static/static.dart';

abstract class OnBoardingController extends GetxController {
  next(int index);
  onPageChaned();
}

class onBoardingControllerImp extends OnBoardingController {
  int currentPage = 0;
  late PageController pageController;
  MyServices myServices = Get.find();
  @override
  next(int index) {
    currentPage = index;
    update();
  }

  @override
  onPageChaned() {
    currentPage++;
    if (currentPage > onBoardingList.length - 1) {
      myServices.sharedPreferences.setString("step", "1");
      Get.offAndToNamed(Approutes.login);
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    }
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}

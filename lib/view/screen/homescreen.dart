import 'dart:io';

import 'package:final_ecommerce/controller/homescreen_controller.dart';
import 'package:final_ecommerce/core/constant/appcolors.dart';
import 'package:final_ecommerce/view/widget/home/custombottomappbar.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Scaffold(
            floatingActionButton: FloatingActionButton(
              shape: const CircleBorder(),
              backgroundColor: AppColors.primaryColor,
              onPressed: () {
                controller.gotocart();
              },
              child: const Icon(Icons.shopping_basket_outlined),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: const CustomBottomAppBar(),
            body: WillPopScope(
              child: controller.Pages.elementAt(controller.currentPage),
              onWillPop: () {
                Get.defaultDialog(
                    title: "wraning",
                    titleStyle: TextStyle(color: AppColors.primaryColor),
                    middleText: "are you sure want to exit",
                    cancelTextColor: AppColors.primaryColor,
                    confirmTextColor: AppColors.primaryColor,
                    buttonColor: AppColors.thirdColor,
                    onCancel: () {},
                    onConfirm: () {
                      exit(0);
                    });
                return Future.value(false);
              },
            )));
  }
}

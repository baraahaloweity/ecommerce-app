import 'package:final_ecommerce/controller/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/appcolors.dart';

class CustomCardHome extends GetView<HomePageControllerImp> {
  const CustomCardHome({super.key, required this.title, required this.body});
  final String title;
  final String body;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            height: 150,
            child: ListTile(
              title: Text(
                title,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              subtitle: Text(
                body,
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.primaryColor),
          ),
          Positioned(
            top: -20,
            right: controller.lang == "en" ? -20 : null,
            left: controller.lang == "ar" ? -20 : null,
            child: Container(
              height: 160,
              width: 160,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(160),
                  color: AppColors.secoundColor),
            ),
          )
        ],
      ),
    );
  }
}

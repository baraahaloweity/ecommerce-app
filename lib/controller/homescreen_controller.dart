import 'package:final_ecommerce/core/constant/routes.dart';
import 'package:final_ecommerce/view/screen/home_page.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/screen/offers.dart';
import '../view/screen/settings.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int i);
}

class HomeScreenControllerImp extends HomeScreenController {
  //MyCartController myCartController = Get.put(MyCartController());
  List<Widget> Pages = [
    HomePage(),
    Settings(),
    Offers(),
    const Column(
      children: [
        Center(
          child: Text("4"),
        )
      ],
    )
  ];
  int currentPage = 0;
  List titleHomePage = ["home", "settinge", "offers", "notif"];
  List appIcon = [
    Icons.home,
    Icons.settings,
    Icons.local_offer,
    Icons.notifications
  ];
  @override
  changePage(int i) {
    currentPage = i;
    update();
  }

  gotocart() {
    Get.toNamed(Approutes.cart);
  }

  @override
  void onInit() {
    super.onInit();
  }
}

import 'package:final_ecommerce/controller/search_controller.dart';
import 'package:final_ecommerce/core/constant/routes.dart';
import 'package:final_ecommerce/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handling.dart';
import '../data/datasource/dynamic/home_data.dart';

abstract class HomePageController extends SearchControllerImp {
  initialData();
  getData();
  goToItems(List categories, int selectedcat, String categoriesid);
}

class HomePageControllerImp extends HomePageController {
  MyServices myServices = Get.find();
  String? name;
  String? lang;
  HomeData homeData = HomeData(Get.find());
  List categories = [];
  List items = [];
  List settings = [];
  String hometitle = "";
  String homebody = "";
  String deliverydate = "";

  StatusRequest statusRequest = StatusRequest.none;

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    print(response);
    statusRequest = handlingRequset(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        settings.addAll(response['settings']["data"]);
        categories.addAll(response['categories']["data"]);
        print("_______________________________________________");
        items.addAll(response['items']["data"]);
        print(items);
        hometitle = settings[0]['settings_hometitle'];
        homebody = settings[0]['settings_homebody'];
        deliverydate = settings[0]['settings_deliverydate'];
        myServices.sharedPreferences.setString("deliverydate", deliverydate);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  initialData() {
    name = myServices.sharedPreferences.getString("name");
    lang = myServices.sharedPreferences.getString("lang");
  }

  @override
  void onInit() {
    getData();
    initialData();
    search = TextEditingController();
    super.onInit();
  }

  @override
  goToItems(categories, selectedcat, categoriesid) {
    Get.toNamed(Approutes.items, arguments: {
      "categories": categories,
      "selectedcat": selectedcat,
      "categoriesid": categoriesid
    });
    print(selectedcat);
  }
}

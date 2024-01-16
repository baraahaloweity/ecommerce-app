import 'package:final_ecommerce/controller/search_controller.dart';
import 'package:final_ecommerce/core/constant/routes.dart';
import 'package:final_ecommerce/core/services/services.dart';
import 'package:final_ecommerce/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handling.dart';
import '../data/datasource/dynamic/items_data.dart';

abstract class ItemsController extends GetxController {
  initalData();
  changeItem(int val, String cat);
  goToItemDetails(ItemsModel itemsModel);
}

class ItemsControllerImp extends SearchControllerImp {
  List categories = [];
  int? selectedCat;
  String? categoriesid;
  ItemsData itemsData = ItemsData(Get.find());
  List data = [];
  MyServices myServices = Get.find();
  String deliverydate = "";

  IconData? iconactive;
  IconData? icondisactive;
  StatusRequest statusRequest = StatusRequest.none;
  getData(String categoriesId) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await itemsData.getData(
        categoriesId, myServices.sharedPreferences.getString("id")!);
    print(response);
    statusRequest = handlingRequset(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  initalData() {
    categories = Get.arguments["categories"];
    selectedCat = Get.arguments["selectedcat"];
    categoriesid = Get.arguments["categoriesid"];
    deliverydate = myServices.sharedPreferences.getString("deliverydate")!;
  }

  // itemsActivate(IconData iconactive, IconData icondisactive) {
  //   ItemsModel? itemsModel;
  //   itemsModel!.favorite == "0";
  //   if (itemsModel.favorite == "0") {
  //     itemsModel.favorite == "1";
  //     return iconactive;
  //   } else {
  //     //itemsModel.favorite=="0"
  //     return icondisactive;
  //   }
  // }

  @override
  void onInit() {
    initalData();
    //itemsActivate(iconactive!, icondisactive!);
    getData(categoriesid!);
    search = TextEditingController();
    super.onInit();
  }

  changeItem(val, cat) {
    selectedCat = val;
    getData(cat);
    update();
  }

  @override
  goToItemDetails(itemsModel) {
    Get.toNamed(Approutes.itemdetails, arguments: {"itemsmodel": itemsModel});
  }
}

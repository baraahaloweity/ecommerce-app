import 'package:final_ecommerce/controller/search_controller.dart';

import 'package:final_ecommerce/core/services/services.dart';
import 'package:final_ecommerce/data/datasource/dynamic/offers_data.dart';
import 'package:final_ecommerce/data/model/items_model.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handling.dart';

abstract class OffersController extends GetxController {}

class OffersControllerImp extends SearchControllerImp {
  OffersData offersData = OffersData(Get.find());
  List<ItemsModel> data = [];
  MyServices myServices = Get.find();

  IconData? iconactive;
  IconData? icondisactive;
  StatusRequest statusRequest = StatusRequest.none;
  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await offersData.getData();
    print(response);
    statusRequest = handlingRequset(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();

    super.onInit();
  }
}

import 'package:final_ecommerce/controller/search_controller.dart';
import 'package:final_ecommerce/data/model/myfavorite_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handling.dart';
import '../core/services/services.dart';
import '../data/datasource/dynamic/myfavorite_data.dart';

abstract class MyFavoriteController extends GetxController {}

class MyFavoriteControllerImp extends SearchControllerImp {
  MyFavoriteData myFavoriteData = MyFavoriteData(Get.find());
  List<MyFavoriteModel> myfavorite = [];
  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await myFavoriteData
        .myfavorite(myServices.sharedPreferences.getString("id")!);
    print(response);
    statusRequest = handlingRequset(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List responsedata = response['data'];
        myfavorite.addAll(responsedata.map((e) => MyFavoriteModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deletefromFav(String favoritemodel) {
    //var response =
    myFavoriteData.deletemyfavorite(favoritemodel);

    myfavorite.removeWhere((element) => element.favoriteId == favoritemodel);
    update();
  }

  @override
  void onInit() {
    getData();
    search = TextEditingController();

    super.onInit();
  }
}

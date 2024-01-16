import 'package:final_ecommerce/data/datasource/dynamic/search_data.dart';
import 'package:final_ecommerce/data/model/items_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/constant/routes.dart';
import '../core/functions/handling.dart';

abstract class SearchController extends GetxController {}

class SearchControllerImp extends SearchController {
  TextEditingController? search;
  bool isSearch = false;

  SearchData searchData = SearchData(Get.find());

  List<ItemsModel> itemssearch = [];
  StatusRequest statusRequest = StatusRequest.none;

  getDataSearch() async {
    statusRequest = StatusRequest.loading;
    var response = await searchData.getData(search!.text);
    print(response);
    statusRequest = handlingRequset(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List responsedata = response["data"];
        itemssearch..clear();
        itemssearch.addAll(responsedata.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  checksearch(Value) {
    if (Value == "") {
      statusRequest = StatusRequest.none;
      isSearch = false;
    }
    update();
  }

  onsearch() {
    isSearch = true;
    getDataSearch();
    update();
  }

  goToItemDetails(itemsModel) {
    Get.toNamed(Approutes.itemdetails, arguments: {"itemsmodel": itemsModel});
  }

  @override
  void onInit() {
    search = TextEditingController();

    super.onInit();
  }
}

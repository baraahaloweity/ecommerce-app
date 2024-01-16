import 'package:final_ecommerce/data/datasource/dynamic/mycart.dart';

import 'package:final_ecommerce/data/model/items_model.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handling.dart';
import '../core/services/services.dart';

abstract class ItemDetailsController extends GetxController {
  initalData();
}

class ItemDetailsControllerImp extends ItemDetailsController {
  late ItemsModel itemsModel;
  MyServices myServices = Get.find();
  MyCartData myCartData = MyCartData(Get.find());

  List colors = [
    {"name": "black", "id": 1, "active": "0"},
    {"name": "white", "id": 2, "active": "0"},
    {"name": "yallow", "id": 3, "active": "1"}
  ];
  var countitem;
  StatusRequest statusRequest = StatusRequest.none;
  @override
  initalData() async {
    statusRequest = StatusRequest.loading;
    itemsModel = Get.arguments["itemsmodel"];
    countitem = await countitems(itemsModel.itemsId!);
    statusRequest = StatusRequest.success;

    update();
  }

  addCart(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await myCartData.addcart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print(response);
    statusRequest = handlingRequset(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        // Get.snackbar("success", "add success to cart");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteCart(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await myCartData.deletecart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print(response);
    statusRequest = handlingRequset(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        // Get.snackbar("success", "delete success from cart");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  countitems(String itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await myCartData.countitems(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print(response);
    statusRequest = handlingRequset(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        int countitems = 0;
        countitems = int.parse(response['data']);
        print("============================================");
        print("$countitems");
        return countitems;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  add() {
    addCart(itemsModel.itemsId!);
    countitem++;
    update();
  }

  delete() {
    if (countitem > 0) {
      deleteCart(itemsModel.itemsId!);
      countitem--;
      update();
    }
  }

  @override
  void onInit() {
    initalData();

    super.onInit();
  }
}

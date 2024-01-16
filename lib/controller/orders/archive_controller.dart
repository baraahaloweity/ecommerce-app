import 'package:final_ecommerce/controller/search_controller.dart';

import 'package:final_ecommerce/core/services/services.dart';
import 'package:final_ecommerce/data/datasource/dynamic/orders/archiveorder_data.dart';
import 'package:final_ecommerce/data/datasource/dynamic/rating_data.dart';

import 'package:final_ecommerce/data/model/pending_model.dart';

import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handling.dart';

abstract class ArchiveController extends GetxController {}

class ArchiveControllerImp extends SearchControllerImp {
  ArchiveOrderData archiveOrderData = ArchiveOrderData(Get.find());
  RatingData ratingData = RatingData(Get.find());
  List<PendingModel> data = [];
  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;
  getorders() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await archiveOrderData
        .getorder(myServices.sharedPreferences.getString("id")!);
    print(response);
    statusRequest = handlingRequset(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => PendingModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  ratingorders(String id, String comment, double rating) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await ratingData.getData(id, comment, rating.toString());
    print(response);
    statusRequest = handlingRequset(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        print("success");
        getorders();
        // List listdata = response['data'];
        // data.addAll(listdata.map((e) => PendingModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  typeDeliveryorder(String val) {
    if (val == "0") {
      return "delivery";
    } else {
      return "delivery thru";
    }
  }

  paymentMethodorder(String val) {
    if (val == "0") {
      return "cash";
    } else {
      return "payment cards";
    }
  }

  statusorder(String val) {
    if (val == "0") {
      return "wait";
    } else if (val == "1") {
      return "prepare";
    } else if (val == "2") {
      return "reseve";
    } else if (val == "3") {
      return "in the way";
    } else {
      return "done";
    }
  }

  @override
  void onInit() {
    getorders();
    super.onInit();
  }
}

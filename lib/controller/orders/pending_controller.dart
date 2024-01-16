import 'package:final_ecommerce/controller/search_controller.dart';

import 'package:final_ecommerce/core/services/services.dart';
import 'package:final_ecommerce/data/datasource/dynamic/orders/pending_data.dart';

import 'package:final_ecommerce/data/model/pending_model.dart';

import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handling.dart';

abstract class PendingController extends GetxController {}

class PendingControllerImp extends SearchControllerImp {
  PendingData pendingData = PendingData(Get.find());
  List<PendingModel> data = [];
  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;
  getorders() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await pendingData
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

  deleteorders(String orderid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await pendingData.deleteorder(orderid);
    print(response);
    statusRequest = handlingRequset(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        refreshorder();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  refreshorder() {
    getorders();
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

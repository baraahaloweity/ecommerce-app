import 'package:final_ecommerce/controller/search_controller.dart';
import 'package:final_ecommerce/data/datasource/dynamic/orders/detailsordes_data.dart';

import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handling.dart';
import '../../core/services/services.dart';
import '../../data/model/detailorder_model.dart';
import '../../data/model/pending_model.dart';

abstract class DetailsController extends GetxController {}

class DetailsControllerImp extends SearchControllerImp {
  late PendingModel orderModel;

  DetailsOrderData detailsOrderData = DetailsOrderData(Get.find());
  List<DetailsOrderModel> data = [];
  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;
  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await detailsOrderData.getorder(orderModel.ordersId!);
    print(response);
    statusRequest = handlingRequset(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => DetailsOrderModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    orderModel = Get.arguments["order_details"];
    getData();

    super.onInit();
  }
}

import 'package:final_ecommerce/core/class/statusrequest.dart';

import 'package:final_ecommerce/core/services/services.dart';
import 'package:final_ecommerce/data/datasource/dynamic/address_data.dart';

import 'package:final_ecommerce/data/model/address_model.dart';

import 'package:get/get.dart';

import '../../core/functions/handling.dart';

abstract class AddressViewController extends GetxController {}

class AddressViewControllerImp extends AddressViewController {
  StatusRequest statusRequest = StatusRequest.none;
  AddressData addressData = AddressData(Get.find());
  MyServices myServices = Get.find();

  List<AddressModel> data = [];

  viewaddress() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.viewaddress(
      myServices.sharedPreferences.getString("id")!,
    );
    print(response);
    statusRequest = handlingRequset(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List dataresponse = response['data'];
        data.addAll(dataresponse.map((e) => AddressModel.fromJson(e)));
        if (data.isEmpty) {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      print("not valid");
    }
  }

  deleteaddress(String addressid) {
    addressData.deleteaddress(addressid);
    data.removeWhere((element) => element.addressId == addressid);
    update();
  }

  @override
  void onInit() {
    viewaddress();

    super.onInit();
  }
}

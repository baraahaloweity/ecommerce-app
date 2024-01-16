import 'package:final_ecommerce/core/class/statusrequest.dart';
import 'package:final_ecommerce/core/constant/routes.dart';
import 'package:final_ecommerce/core/services/services.dart';
import 'package:final_ecommerce/data/datasource/dynamic/address_data.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/functions/handling.dart';

abstract class AddAddressController extends GetxController {}

class AddAddressControllerImp extends AddAddressController {
  late TextEditingController name;
  late TextEditingController city;
  late TextEditingController street;
  StatusRequest statusRequest = StatusRequest.none;
  AddressData addressData = AddressData(Get.find());
  MyServices myServices = Get.find();

  List data = [];

  addAddress() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.addAddress(
        myServices.sharedPreferences.getString("id")!,
        name.text,
        city.text,
        street.text);
    print(response);
    statusRequest = handlingRequset(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        //data.addAll(response['data']);
        Get.offNamed(Approutes.homepage);
      }
      update();
    } else {
      print("not valid");
    }
  }

  @override
  void onInit() {
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    name.dispose();
    city.dispose();
    street.dispose();
    super.dispose();
  }
}

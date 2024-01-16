import 'package:final_ecommerce/core/class/statusrequest.dart';
import 'package:final_ecommerce/core/constant/routes.dart';
import 'package:final_ecommerce/data/datasource/dynamic/forgetpassword/checkemail_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/functions/handling.dart';

abstract class ForgetPasswordController extends GetxController {
  forgetPassword();
  gotoverificationcode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  late TextEditingController email;
  StatusRequest statusRequest = StatusRequest.none;
  CheckEmailData checkEmailData = CheckEmailData(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  @override
  forgetPassword() {}

  @override
  gotoverificationcode() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await checkEmailData.getData(email.text);
      print(response);
      statusRequest = handlingRequset(response);
      if (StatusRequest.success == statusRequest) {
        if (response["status"] == "success") {
          //data.addAll(response['data']);
          Get.toNamed(Approutes.verificationcode,
              arguments: {"email": email.text});
        } else {
          Get.defaultDialog(
              title: "error", middleText: "email or password not correct");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  @override
  void onInit() {
    email = TextEditingController();

    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();

    super.dispose();
  }
}

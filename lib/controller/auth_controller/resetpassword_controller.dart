import 'package:final_ecommerce/core/constant/routes.dart';
import 'package:final_ecommerce/data/datasource/dynamic/forgetpassword/resetpassword_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handling.dart';

abstract class ResetPasswordController extends GetxController {
  resetPassword();
  goToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  late TextEditingController password;
  late TextEditingController rePassword;
  bool isShowPassword = true;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  StatusRequest statusRequest = StatusRequest.none;
  String? email;

  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());

  @override
  resetPassword() {}

  @override
  goToSuccessResetPassword() async {
    var formdata = formstate.currentState;
    if (password.text != rePassword.text) {
      return Get.defaultDialog(
          title: "ُWarning", middleText: "password not match");
    }
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await resetPasswordData.getData(email!, rePassword.text);
      print(response);
      statusRequest = handlingRequset(response);
      if (StatusRequest.success == statusRequest) {
        if (response["status"] == "success") {
          //data.addAll(response['data']);
          Get.toNamed(Approutes.successresetpassword);
        } else {
          Get.defaultDialog(title: "ُWarning", middleText: "try again");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    password = TextEditingController();
    rePassword = TextEditingController();

    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    rePassword.dispose();
    super.dispose();
  }
}

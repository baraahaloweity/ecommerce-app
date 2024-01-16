import 'package:final_ecommerce/core/class/statusrequest.dart';
import 'package:final_ecommerce/core/constant/routes.dart';
import 'package:final_ecommerce/data/datasource/dynamic/auth/signup_data.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/functions/handling.dart';

abstract class SignUpController extends GetxController {
  Signup();
  toLogin();
}

class SignUpControllerImp extends SignUpController {
  late TextEditingController email;
  late TextEditingController name;
  late TextEditingController phone;
  late TextEditingController password;
  StatusRequest statusRequest = StatusRequest.none;
  SignUpData signUpData = SignUpData(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  bool isShowPassword = true;
  List data = [];

  @override
  Signup() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signUpData.getData(
          name.text, email.text, phone.text, password.text);
      print(response);
      statusRequest = handlingRequset(response);
      if (StatusRequest.success == statusRequest) {
        if (response["status"] == "success") {
          //data.addAll(response['data']);
          Get.offNamed(Approutes.verificationcodesignup, arguments: {
            "email": email.text,
          });
        } else {
          Get.defaultDialog(
              title: "error", middleText: "email or phoone has been exit");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      print("not valid");
    }
  }

  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  @override
  toLogin() {
    Get.offNamed(Approutes.login);
  }

  @override
  void onInit() {
    email = TextEditingController();
    name = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    name.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }
}

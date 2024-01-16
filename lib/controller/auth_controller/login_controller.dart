import 'package:final_ecommerce/core/class/statusrequest.dart';
import 'package:final_ecommerce/core/constant/routes.dart';
import 'package:final_ecommerce/core/services/services.dart';
import 'package:final_ecommerce/data/datasource/dynamic/auth/login_data.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/functions/handling.dart';

abstract class LoginController extends GetxController {
  // ignore: non_constant_identifier_names
  Login();
  toSignUp();
  toForgetPasswork();
}

class LoginControllerImp extends LoginController {
  late TextEditingController email;
  late TextEditingController password;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  bool isShowPassword = true;
  StatusRequest statusRequest = StatusRequest.none;
  LoginData loginData = LoginData(Get.find());
  MyServices myServices = Get.find();
  @override
  Login() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.getData(email.text, password.text);
      print(response);
      statusRequest = handlingRequset(response);
      if (StatusRequest.success == statusRequest) {
        if (response["status"] == "success") {
          if (response["data"]["users_approve"] == "1") {
            myServices.sharedPreferences
                .setString("id", response["data"]["users_id"]);
            myServices.sharedPreferences
                .setString("name", response["data"]["users_name"]);
            myServices.sharedPreferences
                .setString("email", response["data"]["users_email"]);
            myServices.sharedPreferences
                .setString("phone", response["data"]["users_phone"]);
            myServices.sharedPreferences.setString("step", "2");
            Get.offNamed(Approutes.homepage);
          } else {
            Get.offNamed(Approutes.verificationcodesignup, arguments: {
              "email": email.text,
            });
          }
        } else {
          Get.defaultDialog(
              title: "error", middleText: "email or password not correct");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      print("Form is not valid");
    }
  }

  @override
  toSignUp() {
    Get.offNamed(Approutes.signup);
  }

  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  @override
  void onInit() {
    // FirebaseMessaging.instance.getToken().then((value) {
    //   print(value);
    //   String? token = value;
    // });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  void dispose() {
    email.dispose();

    password.dispose();
    super.dispose();
  }

  @override
  toForgetPasswork() {}
}

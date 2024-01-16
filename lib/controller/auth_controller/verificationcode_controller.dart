import 'package:final_ecommerce/core/constant/routes.dart';
import 'package:final_ecommerce/data/datasource/dynamic/forgetpassword/verfiycode_data.dart';

import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';

import '../../core/functions/handling.dart';

abstract class VerificationCodeController extends GetxController {
  checkCode();
  gotoresetpassword(String verfiyCode);
}

class VerificationCodeControllerImp extends VerificationCodeController {
  StatusRequest statusRequest = StatusRequest.none;
  String? email;

  VerfiycodeData verfiycodeData = VerfiycodeData(Get.find());
  @override
  gotoresetpassword(verfiyCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verfiycodeData.getData(email!, verfiyCode);
    print(response);
    statusRequest = handlingRequset(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        //data.addAll(response['data']);
        Get.toNamed(Approutes.resetpassword, arguments: {"email": email});
      } else {
        Get.defaultDialog(
            title: "ُWarning", middleText: "Verify Code Not Correct");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  @override
  checkCode() {}
}

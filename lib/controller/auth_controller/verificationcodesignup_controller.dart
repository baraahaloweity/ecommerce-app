import 'package:final_ecommerce/core/class/statusrequest.dart';
import 'package:final_ecommerce/core/constant/routes.dart';

import 'package:get/get.dart';

import '../../core/functions/handling.dart';
import '../../data/datasource/dynamic/auth/verfiycode.dart';

abstract class VerificationCodeSignUpController extends GetxController {
  checkCode();
  gotoSuccessfully(String verfiyCodeSignUp);
}

class VerificationCodeSignUpControllerImp
    extends VerificationCodeSignUpController {
  StatusRequest statusRequest = StatusRequest.none;
  String? email;

  VerFiyData verFiyData = VerFiyData(Get.find());
  @override
  checkCode() {}
  @override
  gotoSuccessfully(verfiyCodeSignUp) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verFiyData.getData(email!, verfiyCodeSignUp);
    print(response);
    statusRequest = handlingRequset(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        //data.addAll(response['data']);
        Get.offNamed(Approutes.successSignup);
      } else {
        Get.defaultDialog(
            title: "ُWarning", middleText: "Verify Code Not Correct");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  reSend() {
    verFiyData.resend(email!);
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    // TODO: implement onInit
    super.onInit();
  }
}

import 'package:final_ecommerce/core/constant/routes.dart';
import 'package:final_ecommerce/core/services/services.dart';
import 'package:get/get.dart';

abstract class SettingsController extends GetxController {
  logout();
}

class SettingsControllerImp extends SettingsController {
  MyServices myServices = Get.find();
  @override
  logout() {
    myServices.sharedPreferences.clear();
    Get.offAllNamed(Approutes.login);
  }
}

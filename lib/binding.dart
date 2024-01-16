import 'package:final_ecommerce/controller/auth_controller/signup_controller.dart';
import 'package:final_ecommerce/core/class/crud.dart';
import 'package:get/get.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
    Get.lazyPut(() => SignUpControllerImp(), fenix: true);
  }
}

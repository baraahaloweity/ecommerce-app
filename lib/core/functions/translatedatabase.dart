import 'package:final_ecommerce/core/services/services.dart';
import 'package:get/get.dart';

translateDataBase(columnar, Columnen) {
  MyServices myServices = Get.find();
  if (myServices.sharedPreferences.getString("lang") == "ar") {
    return columnar;
  } else {
    return Columnen;
  }
}

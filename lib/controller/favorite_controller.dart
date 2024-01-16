import 'package:final_ecommerce/data/model/items_model.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handling.dart';
import '../core/services/services.dart';
import '../data/datasource/dynamic/favorite_data.dart';

class FavoriteController extends GetxController {
  Map isFavorite = {};
  MyServices myServices = Get.find();
  FavoriteData favoriteData = FavoriteData(Get.find());
  late ItemsModel itemsModel;

  StatusRequest statusRequest = StatusRequest.none;
  favorite(idItems, isfavoriite) {
    isFavorite[idItems] = isfavoriite;
    update();
  }

  addFavorite(String itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.addfevorite(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print(response);
    statusRequest = handlingRequset(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        Get.snackbar("success", "add success to favorite");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  delFavorite(String itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.delfevorite(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print(response);
    statusRequest = handlingRequset(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        Get.snackbar("success", "delete success to favorite");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}

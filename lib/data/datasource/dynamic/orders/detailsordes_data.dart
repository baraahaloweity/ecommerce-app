import 'package:final_ecommerce/core/class/crud.dart';
import 'package:final_ecommerce/linkapi.dart';

class DetailsOrderData {
  Crud crud;
  DetailsOrderData(this.crud);
  getorder(String ordersid) async {
    var response =
        await crud.postData(AppLinkApi.detailsorder, {"id": ordersid});

    return response.fold((l) => l, (r) => r);
  }
}

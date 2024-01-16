import 'package:final_ecommerce/core/class/crud.dart';
import 'package:final_ecommerce/linkapi.dart';

class OffersData {
  Crud crud;
  OffersData(this.crud);
  getData() async {
    var response = await crud.postData(AppLinkApi.offer, {});

    return response.fold((l) => l, (r) => r);
  }
}

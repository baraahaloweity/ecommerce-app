import 'package:final_ecommerce/core/class/crud.dart';
import 'package:final_ecommerce/linkapi.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);
  getData() async {
    var response = await crud.postData(AppLinkApi.home, {});

    return response.fold((l) => l, (r) => r);
  }
}

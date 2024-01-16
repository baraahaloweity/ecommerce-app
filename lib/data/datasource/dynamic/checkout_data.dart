import 'package:final_ecommerce/core/class/crud.dart';
import 'package:final_ecommerce/linkapi.dart';

class CheckOutData {
  Crud crud;
  CheckOutData(this.crud);
  checkout(Map data) async {
    var response = await crud.postData(AppLinkApi.checkout, data);

    return response.fold((l) => l, (r) => r);
  }
}

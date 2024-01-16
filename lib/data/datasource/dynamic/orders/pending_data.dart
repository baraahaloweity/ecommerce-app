import 'package:final_ecommerce/core/class/crud.dart';
import 'package:final_ecommerce/linkapi.dart';

class PendingData {
  Crud crud;
  PendingData(this.crud);
  getorder(String userid) async {
    var response =
        await crud.postData(AppLinkApi.pendingorder, {"usersid": userid});

    return response.fold((l) => l, (r) => r);
  }

  deleteorder(String orderid) async {
    var response = await crud.postData(AppLinkApi.deleteordes, {"id": orderid});

    return response.fold((l) => l, (r) => r);
  }
}

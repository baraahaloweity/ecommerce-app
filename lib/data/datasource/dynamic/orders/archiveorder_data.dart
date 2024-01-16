import 'package:final_ecommerce/core/class/crud.dart';
import 'package:final_ecommerce/linkapi.dart';

class ArchiveOrderData {
  Crud crud;
  ArchiveOrderData(this.crud);
  getorder(String userid) async {
    var response =
        await crud.postData(AppLinkApi.archiveordes, {"usersid": userid});

    return response.fold((l) => l, (r) => r);
  }
}

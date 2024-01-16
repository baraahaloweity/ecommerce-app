import 'package:final_ecommerce/core/class/crud.dart';
import 'package:final_ecommerce/linkapi.dart';

class FavoriteData {
  Crud crud;
  FavoriteData(this.crud);
  addfevorite(String userid, String itemsid) async {
    var response = await crud
        .postData(AppLinkApi.addfev, {"usersid": userid, "itemsid": itemsid});

    return response.fold((l) => l, (r) => r);
  }

  delfevorite(String userid, String itemsid) async {
    var response = await crud.postData(
        AppLinkApi.deletefev, {"usersid": userid, "itemsid": itemsid});

    return response.fold((l) => l, (r) => r);
  }
}

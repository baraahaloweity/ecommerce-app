import 'package:final_ecommerce/core/class/crud.dart';
import 'package:final_ecommerce/linkapi.dart';

class MyFavoriteData {
  Crud crud;
  MyFavoriteData(this.crud);
  myfavorite(String userid) async {
    var response = await crud.postData(AppLinkApi.myfavorite, {"id": userid});

    return response.fold((l) => l, (r) => r);
  }

  deletemyfavorite(String favoriteid) async {
    var response =
        await crud.postData(AppLinkApi.deletefromfevorite, {"id": favoriteid});

    return response.fold((l) => l, (r) => r);
  }
}

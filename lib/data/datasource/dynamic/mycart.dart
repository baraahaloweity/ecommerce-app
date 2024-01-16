import 'package:final_ecommerce/core/class/crud.dart';
import 'package:final_ecommerce/linkapi.dart';

class MyCartData {
  Crud crud;
  MyCartData(this.crud);
  addcart(String userid, String itemsid) async {
    var response = await crud.postData(
        AppLinkApi.addtocart, {"usersid": userid, "itemsid": itemsid});

    return response.fold((l) => l, (r) => r);
  }

  deletecart(String userid, String itemsid) async {
    var response = await crud.postData(
        AppLinkApi.deletefromcart, {"usersid": userid, "itemsid": itemsid});

    return response.fold((l) => l, (r) => r);
  }

  countitems(String userid, String itemsid) async {
    var response = await crud.postData(
        AppLinkApi.countitemsincart, {"usersid": userid, "itemsid": itemsid});

    return response.fold((l) => l, (r) => r);
  }

  viewcart(String userid) async {
    var response =
        await crud.postData(AppLinkApi.viewcart, {"usersid": userid});

    return response.fold((l) => l, (r) => r);
  }

  couponCode(String namecoupon) async {
    var response =
        await crud.postData(AppLinkApi.coupon, {"couponname": namecoupon});

    return response.fold((l) => l, (r) => r);
  }
}

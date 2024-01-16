import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class AddressData {
  Crud crud;
  AddressData(this.crud);
  addAddress(String usersid, String name, String city, String street) async {
    var response = await crud.postData(AppLinkApi.addaddress,
        {"usersid": usersid, "name": name, "city": city, "street": street});

    return response.fold((l) => l, (r) => r);
  }

  viewaddress(String usersid) async {
    var response =
        await crud.postData(AppLinkApi.viewaddress, {"usersid": usersid});

    return response.fold((l) => l, (r) => r);
  }

  deleteaddress(String addressid) async {
    var response =
        await crud.postData(AppLinkApi.deleteaddress, {"addressid": addressid});

    return response.fold((l) => l, (r) => r);
  }
}

import 'package:final_ecommerce/core/class/crud.dart';

import '../../../../linkapi.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);
  getData(String email, String password) async {
    var response = await crud
        .postData(AppLinkApi.login, {"email": email, "password": password});

    return response.fold((l) => l, (r) => r);
  }
}

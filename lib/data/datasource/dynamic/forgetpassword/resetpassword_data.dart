import 'package:final_ecommerce/core/class/crud.dart';

import '../../../../linkapi.dart';

class ResetPasswordData {
  Crud crud;
  ResetPasswordData(this.crud);
  getData(String email, String password) async {
    var response = await crud.postData(AppLinkApi.resetpassword, {
      "email": email,
      "password": password,
    });

    return response.fold((l) => l, (r) => r);
  }
}

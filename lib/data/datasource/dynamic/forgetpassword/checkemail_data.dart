import 'package:final_ecommerce/core/class/crud.dart';

import '../../../../linkapi.dart';

class CheckEmailData {
  Crud crud;
  CheckEmailData(this.crud);
  getData(String email) async {
    var response = await crud.postData(AppLinkApi.checkemail, {
      "email": email,
    });

    return response.fold((l) => l, (r) => r);
  }
}

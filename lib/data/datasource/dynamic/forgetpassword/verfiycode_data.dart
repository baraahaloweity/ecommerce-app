import 'package:final_ecommerce/core/class/crud.dart';

import '../../../../linkapi.dart';

class VerfiycodeData {
  Crud crud;
  VerfiycodeData(this.crud);
  getData(String email, String verfiycode) async {
    var response = await crud.postData(AppLinkApi.verfiycode, {
      "email": email,
      "verification": verfiycode,
    });

    return response.fold((l) => l, (r) => r);
  }
}

import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class VerFiyData {
  Crud crud;
  VerFiyData(this.crud);
  getData(String email, String verfiycode) async {
    var response = await crud.postData(AppLinkApi.verification, {
      "email": email,
      "verification": verfiycode,
    });

    return response.fold((l) => l, (r) => r);
  }

  resend(String email) async {
    var response = await crud.postData(AppLinkApi.resend, {
      "email": email,
    });

    return response.fold((l) => l, (r) => r);
  }
}

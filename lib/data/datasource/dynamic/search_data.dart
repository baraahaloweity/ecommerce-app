import 'package:final_ecommerce/core/class/crud.dart';
import 'package:final_ecommerce/linkapi.dart';

class SearchData {
  Crud crud;
  SearchData(this.crud);
  getData(String search) async {
    var response = await crud.postData(AppLinkApi.search, {"search": search});

    return response.fold((l) => l, (r) => r);
  }
}

import 'package:final_ecommerce/core/class/crud.dart';
import 'package:final_ecommerce/linkapi.dart';

class RatingData {
  Crud crud;
  RatingData(this.crud);
  getData(String id, String comment, String rating) async {
    var response = await crud.postData(
        AppLinkApi.rating, {"id": id, "comment": comment, "rating": rating});

    return response.fold((l) => l, (r) => r);
  }
}

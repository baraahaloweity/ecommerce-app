import 'package:final_ecommerce/core/class/statusrequest.dart';

handlingRequset(response) {
  if (response is StatusRequest) {
    return response;
  } else {
    return StatusRequest.success;
  }
}

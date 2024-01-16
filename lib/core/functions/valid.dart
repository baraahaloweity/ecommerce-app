import 'package:get/get.dart';

ValidInput(String val, int min, int max, String type) {
  if (type == "name") {
    if (!GetUtils.isUsername(val)) {
      return "username not valid";
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "Email not valid";
    }
  }
  if (type == "Phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "Phone not valid";
    }
  }
  if (val.isEmpty) {
    return "can't be Empty";
  }
  if (val.length < min) {
    return "can't be less then $min";
  }
  if (val.length > max) {
    return "can't be larger then $max";
  }
}

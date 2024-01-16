import 'package:final_ecommerce/core/class/statusrequest.dart';
import 'package:final_ecommerce/core/constant/routes.dart';
import 'package:final_ecommerce/data/datasource/dynamic/checkout_data.dart';
import 'package:get/get.dart';

import '../core/functions/handling.dart';
import '../core/services/services.dart';
import '../data/datasource/dynamic/address_data.dart';
import '../data/model/address_model.dart';

class CheckoutController extends GetxController {
  String? paymentMethod;
  String? deliveryType;
  String shippingAddress = "0";
  StatusRequest statusRequest = StatusRequest.none;
  AddressData addressData = AddressData(Get.find());
  MyServices myServices = Get.find();
  CheckOutData checkOutData = CheckOutData(Get.find());

  List<AddressModel> addressdata = [];
  late String totalprice;

  late String couponid;
  late String coupondiscount;
  getAddressId() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.viewaddress(
      myServices.sharedPreferences.getString("id")!,
    );
    print(response);
    statusRequest = handlingRequset(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List dataresponse = response['data'];
        addressdata.addAll(dataresponse.map((e) => AddressModel.fromJson(e)));
        shippingAddress = addressdata[0].addressId.toString();

        if (addressdata.isEmpty) {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      print("not valid");
    }
  }

  checkout() async {
    if (paymentMethod == null)
      return Get.snackbar("error", "please select payment method");
    if (addressdata.isEmpty)
      return Get.snackbar("error", "please Add Address to delivery orders");
    if (deliveryType == null)
      return Get.snackbar("error", "please select delivery Type ");
    statusRequest = StatusRequest.loading;
    Map data = {
      "usersid": myServices.sharedPreferences.getString("id"),
      "address": shippingAddress.toString(),
      "ordertype": deliveryType.toString(),
      "pricedelivery": "10",
      "price": totalprice,
      "paymentmethod": paymentMethod.toString(),
      "ordercoupon": couponid,
      "coupondiscount": coupondiscount,
    };
    update();
    var response = await checkOutData.checkout(data);
    print(response);
    statusRequest = handlingRequset(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        print("success orsera");
        Get.snackbar("success", "the order successfully");
        Get.offAllNamed(Approutes.homepage);
      }
      update();
    } else {
      // print(coupondiscount);
      statusRequest = StatusRequest.none;
      Get.snackbar("error", "the error find ");
    }
  }

  chosepaymentMethod(String val) {
    paymentMethod = val;
    update();
  }

  choseshippingAddress(String val) {
    shippingAddress = val;
    update();
  }

  chosedeliveryType(String val) {
    deliveryType = val;
    update();
  }

  @override
  void onInit() {
    totalprice = Get.arguments['totalprice'];
    couponid = Get.arguments['couponid'];
    coupondiscount = Get.arguments['coupondiscount'];
    getAddressId();
    super.onInit();
  }
}

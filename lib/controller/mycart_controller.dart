import 'package:final_ecommerce/core/constant/routes.dart';
import 'package:final_ecommerce/data/datasource/dynamic/mycart.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handling.dart';
import '../core/services/services.dart';
import '../data/model/cart_model.dart';
import '../data/model/coupon_model.dart';

class MyCartController extends GetxController {
  // Map isFavorite = {};
  MyServices myServices = Get.find();
  MyCartData myCartData = MyCartData(Get.find());
  TextEditingController? coupon;
  CouponModel? couponModel;
  late CartModel cartModel;
  //late ItemsModel itemsModel;
  List<CartModel> mycart = [];
  double totalcount = 0.0;
  double totalprice = 0.0;
  int discountcoupon = 0;
  String? nameCoupon;
  String? couponid;
  StatusRequest statusRequest = StatusRequest.none;

  addCart(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await myCartData.addcart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print(response);
    statusRequest = handlingRequset(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        // Get.snackbar("success", "add success to cart");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteCart(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await myCartData.deletecart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print(response);
    statusRequest = handlingRequset(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        // Get.snackbar("success", "delete success from cart");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  resetVarData() {
    totalcount = 0.0;
    totalprice = 0.0;
    mycart.clear();
  }

  refreshdata() {
    resetVarData();
    viewitemscart();
  }

  countitems(String itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await myCartData.countitems(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print(response);
    statusRequest = handlingRequset(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        var countitems = 0;
        countitems = int.parse(response['data']);
        print("============================================");
        print("$countitems");
        return countitems;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  viewitemscart() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await myCartData
        .viewcart(myServices.sharedPreferences.getString("id")!);
    print(response);
    statusRequest = handlingRequset(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        print(response);
        if (response["datacart"]['status'] == "success") {
          List dataresponse = response['datacart']["data"];
          Map dataresponsecountprice = response['countprice'];
          mycart.clear();
          mycart.addAll(dataresponse.map((e) => CartModel.fromJson(e)));
          totalprice = double.parse(dataresponsecountprice['pricetotal']);
          totalcount = double.parse(dataresponsecountprice['counttotal']);
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  couponcode() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await myCartData.couponCode(coupon!.text);
    print(response);
    statusRequest = handlingRequset(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        Map<String, dynamic> responsecoupon = response['data'];
        couponModel = CouponModel.fromJson(responsecoupon);
        discountcoupon = int.parse(couponModel!.couponDiscount!);
        nameCoupon = couponModel!.couponName;
        couponid = couponModel!.couponId;
      } else {
        discountcoupon = 0;
        nameCoupon = null;
        couponid = null;
      }
    }
    update();
  }

  priceaftercoupon() {
    return (totalprice - totalprice * discountcoupon / 100);
  }

  gotocheckout() {
    if (mycart.isEmpty) {
      Get.snackbar("error", "cart is empty");
    } else {
      Get.toNamed(Approutes.checkout, arguments: {
        "couponid": couponid ?? "0",
        "totalprice": totalprice.toString(),
        "coupondiscount": discountcoupon.toString(),
      });
    }
  }

  @override
  void onInit() {
    coupon = TextEditingController();
    viewitemscart();
    super.onInit();
  }
}

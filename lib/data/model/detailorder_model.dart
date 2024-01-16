class DetailsOrderModel {
  String? itemspice;
  String? countitems;
  String? cartUsersId;
  String? cartItemsId;
  String? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsImage;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsCount;
  String? itemsActive;
  String? itemsPrice;
  String? itemsDiscount;
  String? itemsDate;
  String? itemsCat;
  String? ordersId;
  String? ordersUsersId;
  String? ordersAddress;
  String? ordersType;
  String? ordersPricedelivery;
  String? ordersPrice;
  String? ordersTotalPrice;
  String? ordersCoupon;
  String? ordersDatetime;
  String? ordersPaymentmethod;
  String? ordersStatus;
  String? addressId;
  String? addressUsersId;
  String? addressCity;
  String? addressStreet;
  String? addressName;

  DetailsOrderModel(
      {this.itemspice,
      this.countitems,
      this.cartUsersId,
      this.cartItemsId,
      this.itemsId,
      this.itemsName,
      this.itemsNameAr,
      this.itemsImage,
      this.itemsDesc,
      this.itemsDescAr,
      this.itemsCount,
      this.itemsActive,
      this.itemsPrice,
      this.itemsDiscount,
      this.itemsDate,
      this.itemsCat,
      this.ordersId,
      this.ordersUsersId,
      this.ordersAddress,
      this.ordersType,
      this.ordersPricedelivery,
      this.ordersPrice,
      this.ordersTotalPrice,
      this.ordersCoupon,
      this.ordersDatetime,
      this.ordersPaymentmethod,
      this.ordersStatus,
      this.addressId,
      this.addressUsersId,
      this.addressCity,
      this.addressStreet,
      this.addressName});

  DetailsOrderModel.fromJson(Map<String, dynamic> json) {
    itemspice = json['itemspice'];
    countitems = json['countitems'];
    cartUsersId = json['cart_users_id'];
    cartItemsId = json['cart_items_id'];
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsImage = json['items_image'];
    itemsDesc = json['items_desc'];
    itemsDescAr = json['items_desc_ar'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsDate = json['items_date'];
    itemsCat = json['items_cat'];
    ordersId = json['orders_id'];
    ordersUsersId = json['orders_users_id'];
    ordersAddress = json['orders_address'];
    ordersType = json['orders_type'];
    ordersPricedelivery = json['orders_pricedelivery'];
    ordersPrice = json['orders_price'];
    ordersTotalPrice = json['orders_total_price'];
    ordersCoupon = json['orders_coupon'];
    ordersDatetime = json['orders_datetime'];
    ordersPaymentmethod = json['orders_paymentmethod'];
    ordersStatus = json['orders_status'];
    addressId = json['address_id'];
    addressUsersId = json['address_users_id'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressName = json['address_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemspice'] = this.itemspice;
    data['countitems'] = this.countitems;
    data['cart_users_id'] = this.cartUsersId;
    data['cart_items_id'] = this.cartItemsId;
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_name_ar'] = this.itemsNameAr;
    data['items_image'] = this.itemsImage;
    data['items_desc'] = this.itemsDesc;
    data['items_desc_ar'] = this.itemsDescAr;
    data['items_count'] = this.itemsCount;
    data['items_active'] = this.itemsActive;
    data['items_price'] = this.itemsPrice;
    data['items_discount'] = this.itemsDiscount;
    data['items_date'] = this.itemsDate;
    data['items_cat'] = this.itemsCat;
    data['orders_id'] = this.ordersId;
    data['orders_users_id'] = this.ordersUsersId;
    data['orders_address'] = this.ordersAddress;
    data['orders_type'] = this.ordersType;
    data['orders_pricedelivery'] = this.ordersPricedelivery;
    data['orders_price'] = this.ordersPrice;
    data['orders_total_price'] = this.ordersTotalPrice;
    data['orders_coupon'] = this.ordersCoupon;
    data['orders_datetime'] = this.ordersDatetime;
    data['orders_paymentmethod'] = this.ordersPaymentmethod;
    data['orders_status'] = this.ordersStatus;
    data['address_id'] = this.addressId;
    data['address_users_id'] = this.addressUsersId;
    data['address_city'] = this.addressCity;
    data['address_street'] = this.addressStreet;
    data['address_name'] = this.addressName;
    return data;
  }
}

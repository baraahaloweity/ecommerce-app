class PendingModel {
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
  String? ordersRating;
  String? ordersNotrating;
  String? addressId;
  String? addressUsersId;
  String? addressCity;
  String? addressStreet;
  String? addressName;

  PendingModel(
      {this.ordersId,
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
      this.ordersRating,
      this.ordersNotrating,
      this.addressId,
      this.addressUsersId,
      this.addressCity,
      this.addressStreet,
      this.addressName});

  PendingModel.fromJson(Map<String, dynamic> json) {
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
    ordersRating = json['orders_rating'];
    ordersNotrating = json['orders_notrating'];
    addressId = json['address_id'];
    addressUsersId = json['address_users_id'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressName = json['address_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    data['orders_rating'] = this.ordersRating;
    data['orders_notrating'] = this.ordersNotrating;
    data['address_id'] = this.addressId;
    data['address_users_id'] = this.addressUsersId;
    data['address_city'] = this.addressCity;
    data['address_street'] = this.addressStreet;
    data['address_name'] = this.addressName;
    return data;
  }
}

class CartModel {
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

  CartModel(
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
      this.itemsCat});

  CartModel.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}

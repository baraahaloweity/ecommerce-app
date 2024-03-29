class AddressModel {
  String? addressId;
  String? addressUsersId;
  String? addressCity;
  String? addressStreet;
  String? addressName;

  AddressModel(
      {this.addressId,
      this.addressUsersId,
      this.addressCity,
      this.addressStreet,
      this.addressName});

  AddressModel.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'];
    addressUsersId = json['address_users_id'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressName = json['address_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address_id'] = this.addressId;
    data['address_users_id'] = this.addressUsersId;
    data['address_city'] = this.addressCity;
    data['address_street'] = this.addressStreet;
    data['address_name'] = this.addressName;
    return data;
  }
}

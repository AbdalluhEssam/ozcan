class AddressModel {
  String? addressId;
  String? addressUsersid;
  String? addressName;
  String? addressCityid;
  String? addressStreet;
  String? addressLat;
  String? addressLong;
  String? governorateId;
  String? governorateNameAr;
  String? governorateNameEn;
  String? delivery;

  AddressModel(
      {this.addressId,
        this.addressUsersid,
        this.addressName,
        this.addressCityid,
        this.addressStreet,
        this.addressLat,
        this.addressLong,
        this.governorateId,
        this.governorateNameAr,
        this.governorateNameEn,
        this.delivery});

  AddressModel.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'];
    addressUsersid = json['address_usersid'];
    addressName = json['address_name'];
    addressCityid = json['address_cityid'];
    addressStreet = json['address_street'];
    addressLat = json['address_lat'];
    addressLong = json['address_long'];
    governorateId = json['governorate_id'];
    governorateNameAr = json['governorate_name_ar'];
    governorateNameEn = json['governorate_name_en'];
    delivery = json['delivery'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address_id'] = this.addressId;
    data['address_usersid'] = this.addressUsersid;
    data['address_name'] = this.addressName;
    data['address_cityid'] = this.addressCityid;
    data['address_street'] = this.addressStreet;
    data['address_lat'] = this.addressLat;
    data['address_long'] = this.addressLong;
    data['governorate_id'] = this.governorateId;
    data['governorate_name_ar'] = this.governorateNameAr;
    data['governorate_name_en'] = this.governorateNameEn;
    data['delivery'] = this.delivery;
    return data;
  }
}
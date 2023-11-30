class GovernoratesModel {
  String? governorateId;
  String? governorateNameAr;
  String? governorateNameEn;
  String? delivery;

  GovernoratesModel(
      {this.governorateId,
        this.governorateNameAr,
        this.governorateNameEn,
        this.delivery});

  GovernoratesModel.fromJson(Map<String, dynamic> json) {
    governorateId = json['governorate_id'];
    governorateNameAr = json['governorate_name_ar'];
    governorateNameEn = json['governorate_name_en'];
    delivery = json['delivery'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['governorate_id'] = this.governorateId;
    data['governorate_name_ar'] = this.governorateNameAr;
    data['governorate_name_en'] = this.governorateNameEn;
    data['delivery'] = this.delivery;
    return data;
  }
}
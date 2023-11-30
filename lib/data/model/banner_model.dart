class BannerModel {
  int? bannerId;
  String? bannerName;
  String? bannerImage;

  BannerModel({this.bannerId, this.bannerName, this.bannerImage});

  BannerModel.fromJson(Map<String, dynamic> json) {
    bannerId = json['banner_id'];
    bannerName = json['banner_name'];
    bannerImage = json['banner_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['banner_id'] = this.bannerId;
    data['banner_name'] = this.bannerName;
    data['banner_image'] = this.bannerImage;
    return data;
  }
}
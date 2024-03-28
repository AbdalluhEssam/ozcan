class SocialAccountsModel {
  String? id;
  String? name;
  String? phone;
  String? facebook;
  String? instagram;
  String? image;
  String? description;

  SocialAccountsModel(
      {this.id,
        this.name,
        this.phone,
        this.facebook,
        this.instagram,
        this.image,
        this.description});

  SocialAccountsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    name = json['name'];
    phone = json['phone'];
    facebook = json['facebook'];
    instagram = json['instagram'];
    image = json['image'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['facebook'] = this.facebook;
    data['instagram'] = this.instagram;
    data['image'] = this.image;
    data['description'] = this.description;
    return data;
  }
}

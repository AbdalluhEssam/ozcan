class AboutUsModel {
  String? image;
  String? body;

  AboutUsModel({this.image, this.body});

  AboutUsModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['body'] = this.body;
    return data;
  }
}

class ItemsModel {
  String? count;
  String? usersId;
  String? itemsId;
  String? itemsName;
  String? itemsDesc;
  String? itemsImage;
  String? qty;
  String? size;
  String? itemsActive;
  String? itemsPrice;
  String? itemsDescount;
  String? itemsDate;
  String? itemsCat;
  String? days;
  String? itemsOrderedTimes;
  String? linkShare;
  String? color;
  String? itemsLikes;

  ItemsModel(
      {this.count,
        this.usersId,
        this.itemsId,
        this.itemsName,
        this.itemsDesc,
        this.itemsImage,
        this.qty,
        this.size,
        this.itemsActive,
        this.itemsPrice,
        this.itemsDescount,
        this.itemsDate,
        this.itemsCat,
        this.days,
        this.itemsOrderedTimes,
        this.linkShare,
        this.color,
        this.itemsLikes});

  ItemsModel.fromJson(Map<String, dynamic> json) {
    count = json['count'].toString();
    usersId = json['users_id'].toString();
    itemsId = json['items_id'].toString();
    itemsName = json['items_name'].toString();
    itemsDesc = json['items_desc'].toString();
    itemsImage = json['items_image'].toString();
    qty = json['qty'].toString();
    size = json['size'].toString();
    itemsActive = json['items_active'].toString();
    itemsPrice = json['items_price'].toString();
    itemsDescount = json['items_descount'].toString();
    itemsDate = json['items_date'].toString();
    itemsCat = json['items_cat'].toString();
    days = json['days'].toString();
    itemsOrderedTimes = json['items_ordered_times'].toString();
    linkShare = json['link_share'].toString();
    color = json['color'].toString();
    itemsLikes = json['items_likes'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['users_id'] = this.usersId;
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_desc'] = this.itemsDesc;
    data['items_image'] = this.itemsImage;
    data['qty'] = this.qty;
    data['size'] = this.size;
    data['items_active'] = this.itemsActive;
    data['items_price'] = this.itemsPrice;
    data['items_descount'] = this.itemsDescount;
    data['items_date'] = this.itemsDate;
    data['items_cat'] = this.itemsCat;
    data['days'] = this.days;
    data['items_ordered_times'] = this.itemsOrderedTimes;
    data['link_share'] = this.linkShare;
    data['color'] = this.color;
    data['items_likes'] = this.itemsLikes;
    return data;
  }
}

class ImagesProduct {
  int? imageId;
  String? image;
  int? itemsId;

  ImagesProduct({this.imageId, this.image, this.itemsId});

  ImagesProduct.fromJson(Map<String, dynamic> json) {
    imageId = json['image_id'];
    image = json['image'];
    itemsId = json['items_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image_id'] = this.imageId;
    data['image'] = this.image;
    data['items_id'] = this.itemsId;
    return data;
  }
}

class ItemsModel {
  String? itemsId;
  String? itemsName;
  String? itemsDesc;
  String? itemsImage;
  String? itemsCount;
  String? items_ordered_times;
  String? itemsActive;
  String? itemsPrice;
  String? itemsDescount;
  String? size;
  String? itemsDate;
  String? itemsCat;
  String? color;
  String? itemsPriceDiscount;
  String? categoriesId;
  String? categoriesName;
  String? categoriesNameAr;
  String? categoriesImage;
  String? categoriesDatetime;
  String? favorite;
  String? link_share;

  ItemsModel(
      {this.itemsId,
        this.itemsName,
        this.itemsDesc,
        this.size,
        this.itemsImage,
        this.itemsCount,
        this.itemsActive,
        this.itemsPrice,
        this.itemsDescount,
        this.itemsDate,
        this.color,
        this.itemsPriceDiscount,
        this.itemsCat,
        this.categoriesId,
        this.categoriesName,
        this.items_ordered_times,
        this.categoriesNameAr,
        this.categoriesImage,
        this.categoriesDatetime,
        this.link_share,
        this.favorite});

  ItemsModel.fromJson(Map<String, dynamic> json) {
    itemsId = json['items_id'].toString();
    itemsName = json['items_name'].toString();
    itemsDesc = json['items_desc'].toString();
    itemsImage = json['items_image'].toString();
    itemsCount = json['qty'].toString();
    color = json['color'].toString();
    size = json['size'].toString();
    itemsActive = json['items_active'].toString();
    itemsPrice = json['items_price'].toString();
    itemsDescount = json['items_descount'].toString();
    itemsPriceDiscount = json['itemspricedisount'].toString();
    itemsDate = json['items_date'].toString();
    itemsCat = json['items_cat'].toString();
    categoriesId = json['categories_id'].toString();
    categoriesName = json['categories_name'].toString();
    categoriesNameAr = json['categories_name_ar'].toString();
    categoriesImage = json['categories_image'].toString();
    categoriesDatetime = json['categories_datetime'].toString();
    items_ordered_times = json['items_ordered_times'].toString();
    link_share = json['link_share'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['size'] = this.size;
    data['items_desc'] = this.itemsDesc;
    data['items_image'] = this.itemsImage;
    data['qty'] = this.itemsCount;
    data['items_active'] = this.itemsActive;
    data['items_price'] = this.itemsPrice;
    data['color'] = this.color;
    data['items_descount'] = this.itemsDescount;
    data['itemspricedisount'] = this.itemsPriceDiscount;
    data['items_date'] = this.itemsDate;
    data['items_cat'] = this.itemsCat;
    data['categories_id'] = this.categoriesId;
    data['categories_name'] = this.categoriesName;
    data['items_ordered_times'] = this.items_ordered_times;
    data['categories_name_ar'] = this.categoriesNameAr;
    data['categories_image'] = this.categoriesImage;
    data['categories_datetime'] = this.categoriesDatetime;
    data['link_share'] = this.link_share;
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

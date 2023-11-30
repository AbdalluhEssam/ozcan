class ItemsModel {
  String? itemsId;
  String? itemsName;
  String? itemsDesc;
  String? itemsImage;
  String? itemsCount;
  String? itemsActive;
  String? itemsPrice;
  String? itemsDescount;
  String? size;
  String? itemsDate;
  String? itemsCat;
  String? itemsPriceDiscount;
  String? categoriesId;
  String? categoriesName;
  String? categoriesNameAr;
  String? categoriesImage;
  String? categoriesDatetime;
  String? favorite;

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
        this.itemsPriceDiscount,
        this.itemsCat,
        this.categoriesId,
        this.categoriesName,
        this.categoriesNameAr,
        this.categoriesImage,
        this.categoriesDatetime,
        this.favorite});

  ItemsModel.fromJson(Map<String, dynamic> json) {
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsDesc = json['items_desc'];
    itemsImage = json['items_image'];
    itemsCount = json['items_count'];
    size = json['size'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'];
    itemsDescount = json['items_descount'];
    itemsPriceDiscount = json['itemspricedisount'];
    itemsDate = json['items_date'];
    itemsCat = json['items_cat'];
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesNameAr = json['categories_name_ar'];
    categoriesImage = json['categories_image'];
    categoriesDatetime = json['categories_datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['size'] = this.size;
    data['items_desc'] = this.itemsDesc;
    data['items_image'] = this.itemsImage;
    data['items_count'] = this.itemsCount;
    data['items_active'] = this.itemsActive;
    data['items_price'] = this.itemsPrice;
    data['items_descount'] = this.itemsDescount;
    data['itemspricedisount'] = this.itemsPriceDiscount;
    data['items_date'] = this.itemsDate;
    data['items_cat'] = this.itemsCat;
    data['categories_id'] = this.categoriesId;
    data['categories_name'] = this.categoriesName;
    data['categories_name_ar'] = this.categoriesNameAr;
    data['categories_image'] = this.categoriesImage;
    data['categories_datetime'] = this.categoriesDatetime;
    return data;
  }
}
class ItemsModel {
  int? id;
  String? name;
  String? slug;
  int? price;
  int? categoryId;
  String? categoryName;
  int? isActive;
  int? likes_count;
  String? image;
  String? description;
  String? link;
  String? likes;

  ItemsModel(
      {this.id,
        this.name,
        this.slug,
        this.price,
        this.categoryId,
        this.categoryName,
        this.isActive,
        this.likes_count,
        this.image,
        this.description,
        this.likes,
        this.link});

  ItemsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    price = json['price'];
    categoryId = json['category_id'];
    likes_count = json['likes_count'];
    categoryName = json['category_name'];
    isActive = json['is_active'];
    image = json['image'];
    description = json['description'];
    link = json['link'];
    likes = json['likes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['price'] = this.price;
    data['category_id'] = this.categoryId;
    data['likes_count'] = this.likes_count;
    data['category_name'] = this.categoryName;
    data['is_active'] = this.isActive;
    data['image'] = this.image;
    data['description'] = this.description;
    data['link'] = this.link;
    data['likes'] = this.likes;
    return data;
  }
}


class ItemsDetailsModel {
  String? id;
  String? name;
  String? slug;
  String? price;
  String? categoryId;
  String? categoryName;
  String? isActive;
  String? image;
  String? description;
  String? link;
  int? likes_count;
  int? NumberSales;
  List<Images>? images;
  List<Stock>? stock;
  String? likes;

  ItemsDetailsModel(
      {this.id,
        this.name,
        this.slug,
        this.price,
        this.categoryId,
        this.categoryName,
        this.isActive,
        this.image,
        this.description,
        this.link,
        this.images,
        this.likes_count,
        this.NumberSales,
        this.stock});

  ItemsDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    name = json['name'].toString();
    slug = json['slug'].toString();
    price = json['price'].toString();
    categoryId = json['category_id'].toString();
    categoryName = json['category_name'].toString();
    isActive = json['is_active'].toString();
    image = json['image'].toString();
    description = json['description'].toString();
    likes_count = json['likes_count'];
    NumberSales = json['number_sales'];
    link = json['link'].toString();
    likes = json['likes'].toString();
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    if (json['stock'] != null) {
      stock = <Stock>[];
      json['stock'].forEach((v) {
        stock!.add(new Stock.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['price'] = this.price;
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['is_active'] = this.isActive;
    data['image'] = this.image;
    data['description'] = this.description;
    data['likes_count'] = this.likes_count;
    data['link'] = this.link;
    data['number_sales'] = this.NumberSales;
    data['likes'] = this.likes;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    if (this.stock != null) {
      data['stock'] = this.stock!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images {
  int? id;
  String? image;

  Images({this.id, this.image});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    return data;
  }
}

class Stock {
  int? id;
  int? price;
  int? qty;
  String? size;

  Stock({this.id, this.price, this.qty, this.size});

  Stock.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    qty = json['qty'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['price'] = this.price;
    data['qty'] = this.qty;
    data['size'] = this.size;
    return data;
  }
}

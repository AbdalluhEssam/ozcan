class OrdersModel {
  String? id;
  String? adminId;
  String? userId;
  String? categoryId;
  String? categoryName;
  String? name;
  String? size;
  String? price;
  String? color;
  String? quantity;
  String? totalPrice;
  String? adminName;
  String? userName;
  String? userPhone;
  String? userEmail;
  String? paid;
  String? status;
  String? link;
  String? helperLink;
  String? shippingAddress;
  String? createdAt;

  OrdersModel(
      {this.id,
        this.adminId,
        this.userId,
        this.categoryId,
        this.categoryName,
        this.name,
        this.size,
        this.price,
        this.color,
        this.quantity,
        this.totalPrice,
        this.adminName,
        this.userName,
        this.userPhone,
        this.userEmail,
        this.paid,
        this.status,
        this.link,
        this.helperLink,
        this.shippingAddress,
        this.createdAt});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    adminId = json['admin_id'].toString();
    userId = json['user_id'].toString();
    categoryId = json['category_id'].toString();
    categoryName = json['category_name'].toString();
    name = json['name'].toString();
    size = json['size'].toString();
    price = json['price'].toString();
    color = json['color'].toString();
    quantity = json['quantity'].toString();
    totalPrice = json['total_price'].toString();
    adminName = json['admin_name'].toString();
    userName = json['user_name'].toString();
    userPhone = json['user_phone'].toString();
    userEmail = json['user_email'].toString();
    paid = json['paid'].toString();
    status = json['status'].toString();
    link = json['link'].toString();
    helperLink = json['helper_link'].toString();
    shippingAddress = json['shipping_address'].toString();
    createdAt = json['created_at'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['admin_id'] = this.adminId;
    data['user_id'] = this.userId;
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['name'] = this.name;
    data['size'] = this.size;
    data['price'] = this.price;
    data['color'] = this.color;
    data['quantity'] = this.quantity;
    data['total_price'] = this.totalPrice;
    data['admin_name'] = this.adminName;
    data['user_name'] = this.userName;
    data['user_phone'] = this.userPhone;
    data['user_email'] = this.userEmail;
    data['paid'] = this.paid;
    data['status'] = this.status;
    data['link'] = this.link;
    data['helper_link'] = this.helperLink;
    data['shipping_address'] = this.shippingAddress;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class OrdersDetailsModel {
  String? itemsprice;
  String? countitems;
  String? cartId;
  String? cartItemsId;
  String? userId;
  String? cartOrders;
  String? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsImage;
  String? itemsCount;
  String? itemsActive;
  String? itemsPrice;
  String? itemsDescount;
  String? itemsDate;
  String? itemsCat;

  OrdersDetailsModel(
      {this.itemsprice,
      this.countitems,
      this.cartId,
      this.cartItemsId,
      this.userId,
      this.cartOrders,
      this.itemsId,
      this.itemsName,
      this.itemsNameAr,
      this.itemsDesc,
      this.itemsDescAr,
      this.itemsImage,
      this.itemsCount,
      this.itemsActive,
      this.itemsPrice,
      this.itemsDescount,
      this.itemsDate,
      this.itemsCat});

  OrdersDetailsModel.fromJson(Map<String, dynamic> json) {
    itemsprice = json['itemsprice'];
    countitems = json['countitems'];
    cartId = json['cart_id'];
    cartItemsId = json['cart_items_id'];
    userId = json['user_id'];
    cartOrders = json['cart_orders'];
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDesc = json['items_desc'];
    itemsDescAr = json['items_desc_ar'];
    itemsImage = json['items_image'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'];
    itemsDescount = json['items_descount'];
    itemsDate = json['items_date'];
    itemsCat = json['items_cat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemsprice'] = this.itemsprice;
    data['countitems'] = this.countitems;
    data['cart_id'] = this.cartId;
    data['cart_items_id'] = this.cartItemsId;
    data['user_id'] = this.userId;
    data['cart_orders'] = this.cartOrders;
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_name_ar'] = this.itemsNameAr;
    data['items_desc'] = this.itemsDesc;
    data['items_desc_ar'] = this.itemsDescAr;
    data['items_image'] = this.itemsImage;
    data['items_count'] = this.itemsCount;
    data['items_active'] = this.itemsActive;
    data['items_price'] = this.itemsPrice;
    data['items_descount'] = this.itemsDescount;
    data['items_date'] = this.itemsDate;
    data['items_cat'] = this.itemsCat;
    return data;
  }
}

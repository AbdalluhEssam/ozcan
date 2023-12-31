class OrdersModel {
  String? ordersId;
  String? ordersUsersid;
  String? itemsId;
  String? link;
  String? ordersTotalprice;
  String? color;
  String? size;
  String? qty;
  String? address;
  String? ordersStatus;
  String? categoriesId;
  String? ordersTime;
  String? helperLink;
  String? itemsName;
  String? itemsDesc;
  String? itemsImage;
  String? itemsActive;
  String? itemsPrice;
  String? itemsDescount;
  String? itemsDate;
  String? itemsCat;
  String? days;
  String? usersId;
  String? usersName;
  String? usersEmail;
  String? usersPassword;
  String? usersPhone;
  String? usersVerfiycode;
  String? usersApprove;
  String? usersCreate;
  String? items_ordered_times;

  OrdersModel(
      {this.ordersId,
        this.ordersUsersid,
        this.itemsId,
        this.link,
        this.ordersTotalprice,
        this.color,
        this.size,
        this.qty,
        this.address,
        this.ordersStatus,
        this.categoriesId,
        this.ordersTime,
        this.helperLink,
        this.itemsName,
        this.itemsDesc,
        this.itemsImage,
        this.itemsActive,
        this.itemsPrice,
        this.itemsDescount,
        this.itemsDate,
        this.itemsCat,
        this.days,
        this.usersId,
        this.usersName,
        this.usersEmail,
        this.usersPassword,
        this.usersPhone,
        this.usersVerfiycode,
        this.items_ordered_times,
        this.usersApprove,
        this.usersCreate});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'].toString();
    ordersUsersid = json['orders_usersid'].toString();
    itemsId = json['items_id'].toString();
    link = json['link'].toString();
    ordersTotalprice = json['orders_totalprice'].toString();
    color = json['color'].toString();
    size = json['size'].toString();
    qty = json['qty'].toString();
    address = json['Address'].toString();
    ordersStatus = json['orders_status'].toString();
    categoriesId = json['categories_id'].toString();
    ordersTime = json['orders_time'].toString();
    helperLink = json['helper_link'].toString();
    itemsName = json['items_name'].toString();
    itemsDesc = json['items_desc'].toString();
    itemsImage = json['items_image'].toString();
    itemsActive = json['items_active'].toString();
    itemsPrice = json['items_price'].toString();
    itemsDescount = json['items_descount'].toString();
    itemsDate = json['items_date'].toString();
    itemsCat = json['items_cat'].toString();
    days = json['days'].toString();
    usersId = json['users_id'].toString();
    usersName = json['users_name'].toString();
    usersEmail = json['users_email'].toString();
    usersPassword = json['users_password'].toString();
    usersPhone = json['users_phone'].toString();
    usersVerfiycode = json['users_verfiycode'].toString();
    usersApprove = json['users_approve'].toString();
    usersCreate = json['users_create'].toString();
    items_ordered_times = json['items_ordered_times'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orders_id'] = this.ordersId;
    data['orders_usersid'] = this.ordersUsersid;
    data['items_id'] = this.itemsId;
    data['link'] = this.link;
    data['orders_totalprice'] = this.ordersTotalprice;
    data['color'] = this.color;
    data['size'] = this.size;
    data['qty'] = this.qty;
    data['Address'] = this.address;
    data['orders_status'] = this.ordersStatus;
    data['categories_id'] = this.categoriesId;
    data['orders_time'] = this.ordersTime;
    data['helper_link'] = this.helperLink;
    data['items_name'] = this.itemsName;
    data['items_desc'] = this.itemsDesc;
    data['items_image'] = this.itemsImage;
    data['items_active'] = this.itemsActive;
    data['items_price'] = this.itemsPrice;
    data['items_descount'] = this.itemsDescount;
    data['items_date'] = this.itemsDate;
    data['items_cat'] = this.itemsCat;
    data['days'] = this.days;
    data['users_id'] = this.usersId;
    data['users_name'] = this.usersName;
    data['users_email'] = this.usersEmail;
    data['users_password'] = this.usersPassword;
    data['users_phone'] = this.usersPhone;
    data['users_verfiycode'] = this.usersVerfiycode;
    data['users_approve'] = this.usersApprove;
    data['users_create'] = this.usersCreate;
    data['items_ordered_times'] = this.items_ordered_times;
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

import 'package:get/get.dart';
import '../../../../core/class/crud.dart';
import '../../../../likeapi.dart';
import '../../../../core/services/services.dart';


class CartData {
  Crud crud;
  MyServices myServices = Get.find();
  CartData(this.crud);
  addCart(String id) async {
    var response = await crud.postData(AppLink.cardAdd, {
      "items_id": id.toString(),
      "user_id": myServices.sharedPreferences.getString("id"),
    });
    return response.fold((l) => l, (r) => r);
  }
  deleteCart(String id) async {
    var response = await crud.postData(AppLink.cardDelete, {
      "items_id": id.toString(),
      "user_id": myServices.sharedPreferences.getString("id"),
    });
    return response.fold((l) => l, (r) => r);
  }
  getCountCart(String id) async {
    var response = await crud.postData(AppLink.cardCount, {
      "items_id": id.toString(),
      "user_id": myServices.sharedPreferences.getString("id"),
    });
    return response.fold((l) => l, (r) => r);
  }
  viewCart() async {
    var response = await crud.postData(AppLink.cardView, {
      "user_id": myServices.sharedPreferences.getString("id"),
    });
    return response.fold((l) => l, (r) => r);
  }
  checkCoupon(String couponName) async {
    var response = await crud.postData(AppLink.couponView, {
      "couponname": couponName.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}

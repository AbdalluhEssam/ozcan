import 'package:get/get.dart';
import 'package:ozcan/core/services/services.dart';

import '../../../core/class/crud.dart';
import '../../../likeapi.dart';

class FavoriteData {
  Crud crud;
  MyServices myServices = Get.find();
  FavoriteData(this.crud);
  addFavorite(String id) async {
    var response = await crud.postData(AppLink.addFavorite, {
      "user_id": myServices.sharedPreferences.getString("id"),
      "items_id": id,
    });
    return response.fold((l) => l, (r) => r);
  }
  deleteFavorite(String id) async {
    var response = await crud.postData(AppLink.deleteFavorite, {
      "user_id": myServices.sharedPreferences.getString("id"),
      "items_id": id,
    });
    return response.fold((l) => l, (r) => r);
  }
}

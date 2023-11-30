import 'package:get/get.dart';
import '../../../../core/class/crud.dart';
import '../../../../likeapi.dart';

import '../../../../core/services/services.dart';

class CheckOutData {
  Crud crud;
  MyServices myServices = Get.find();

  CheckOutData(this.crud);
  // getData() async {
  //   var response = await crud.postData(AppLink.orderView, {
  //     "id": myServices.sharedPreferences.getString("id").toString(),
  //   });
  //   return response.fold((l) => l, (r) => r);
  // }
  checkOut(Map data) async {
    var response = await crud.postData(AppLink.checkOutAdd, data);
    return response.fold((l) => l, (r) => r);
  }
}

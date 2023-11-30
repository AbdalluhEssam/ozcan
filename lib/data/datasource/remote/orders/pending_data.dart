import 'package:ozcan/core/class/crud.dart';
import 'package:ozcan/likeapi.dart';

class OrdersData {
  Crud crud;

  OrdersData(this.crud);

  Future getPendingDate(String userId) async {
    var response = await crud.postData(AppLink.pendingOrders, {"id": userId});
    return response.fold((l) => l, (r) => r);
  }

  Future getArchiveDate(String userId) async {
    var response = await crud.postData(AppLink.archiveOrders, {"id": userId});
    return response.fold((l) => l, (r) => r);
  }

  Future addRaring(String id,String rating, String note) async {
    var response = await crud.postData(AppLink.addRatingOrders, {
      "id": id,
      "rating": rating,
      "note": note,
    });
    return response.fold((l) => l, (r) => r);
  }
}

class OrdersDetailsData {
  Crud crud;

  OrdersDetailsData(this.crud);

  Future getDate(String orderId) async {
    var response = await crud.postData(AppLink.detailsOrders, {"id": orderId});
    return response.fold((l) => l, (r) => r);
  }
}

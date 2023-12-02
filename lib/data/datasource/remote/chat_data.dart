import '../../../core/class/crud.dart';
import '../../../likeapi.dart';

class ChatData {
  Crud crud;

  ChatData(this.crud);

  getData(String adminId, String usersId) async {
    var response = await crud.postData(AppLink.viewChat, {
      "admin_id": adminId,
      "users_id": usersId,
    });
    return response.fold((l) => l, (r) => r);
  }

  addMassage(String adminId,String usersId, String senderId, String text) async {
    var response = await crud.postData(AppLink.addChat, {
      "admin_id": adminId,
      "users_id": usersId,
      "senderId": senderId,
      "text": text,
    });
    return response.fold((l) => l, (r) => r);
  }

  Future getNotificationData(String usersId) async {
    var response = await crud
        .postData(AppLink.notification, {"user_id": usersId.toString()});
    return response.fold((l) => l, (r) => r);
  }
}

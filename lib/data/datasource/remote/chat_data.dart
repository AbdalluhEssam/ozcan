import '../../../core/class/crud.dart';
import '../../../likeapi.dart';

class ChatData {
  Crud crud;

  ChatData(this.crud);

  // getData(String adminId, String usersId) async {
  //   var response = await crud.postData(AppLink.viewChat, {
  //     "admin_id": adminId,
  //     "users_id": usersId,
  //   });
  //   return response.fold((l) => l, (r) => r);
  // }
  //
  // addMassage(String adminId,String usersId, String senderId, String text) async {
  //   var response = await crud.postData(AppLink.addChat, {
  //     "admin_id": adminId,
  //     "users_id": usersId,
  //     "senderId": senderId,
  //     "text": text,
  //   });
  //   return response.fold((l) => l, (r) => r);
  // }
  getData(String adminId, String usersId) async {
    var response = await crud.getData("https://ozcan.almirsystem.com/chatapi/api/chat/single.php?from=$usersId&to=0", {});
    return response.fold((l) => l, (r) => r);
  }

  addFirstAcc(String usersId, String userName) async {
    var response = await crud.postData(AppLink.addChatBot, {
      "id ": usersId,
      "email ": userName,
    });
    return response.fold((l) => l, (r) => r);
  }
  addMassage(
      String adminId, String usersId, String text) async {
    var response = await crud.postData(AppLink.addMassageBot, {
      "from": usersId,
      "to": adminId,
      "message": text,
    });
    return response.fold((l) => l, (r) => r);
  }

  Future getNotificationData(String usersId) async {
    var response = await crud
        .postData(AppLink.notification, {"user_id": usersId.toString()});
    return response.fold((l) => l, (r) => r);
  }
}

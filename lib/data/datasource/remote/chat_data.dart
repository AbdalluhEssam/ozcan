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
  getData(String usersId) async {
    var response = await crud.getData("https://ozcan.almirsystem.com/chatapi/api/msg/single.php?tickid=$usersId", {});
    return response.fold((l) => l, (r) => r);
  }
  getTicketData(String usersId,String category) async {
    var response = await crud.getData("https://ozcan.almirsystem.com/chatapi/api/tikc/tick.php?crtby=$usersId&category=$category", {});
    return response.fold((l) => l, (r) => r);
  }

  addFirstAcc(String name, String email, String category, String priority, String subject, String status, String description, String createdBy) async {
    var response = await crud.postData(AppLink.addChatBot, {
      "name": name,
      "email": email,
      "category": category,
      "priority": priority,
      "subject": subject,
      "status": status,
      "description": description,
      "created_by": createdBy,
    });
    return response.fold((l) => l, (r) => r);
  }
  addMassage(
      String ticketId, String text) async {
    var response = await crud.postData(AppLink.addMassageBot, {
      "ticket_id": ticketId,
      "description": text,
      "attachments": "",
    });
    return response.fold((l) => l, (r) => r);
  }

  Future getNotificationData(String usersId) async {
    var response = await crud
        .postData(AppLink.notification, {"user_id": usersId.toString()});
    return response.fold((l) => l, (r) => r);
  }
}

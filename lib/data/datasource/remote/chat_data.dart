import 'dart:io';

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
  getData(String tickId) async {
    var response = await crud.getData(
        "https://ozcan.almirsystem.com/chatapi/api/msg/single.php?tickid=$tickId",
        {});
    return response.fold((l) => l, (r) => r);
  }

  // getTicketData(String userId,String categoriesId) async {
  //   var response = await crud.postData("https://ozcan.almirsystem.com/chatapi/api/tikc/tick.php?crtby=$userId&category=$categoriesId", {
  //   });
  //   return response.fold((l) => l, (r) => r);
  // }
  getConversationsData(String token, String category) async {
    var response = await crud.getData(
        "${AppLink.serverLink}/messages/${category}/conversations", {},
        token: token);
    return response.fold((l) => l, (r) => r);
  }

  addFirstAcc(
      String name,
      String email,
      String category,
      String priority,
      String subject,
      String status,
      String description,
      String createdBy) async {
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
      String token, String category, String text, String type, file) async {
    var response = await crud.postData(
        "${AppLink.serverLink}/messages/$category",
        {
          "content": text,
          "type": type,
          "file": file,
        },
        token: token);
    return response.fold((l) => l, (r) => r);
  }

  editStatus(String orderId, userId) async {
    var response = await crud.postData(AppLink.editStatus, {
      "order_id": orderId,
      "orders_status": "1",
      "user_id": userId,
    });
    return response.fold((l) => l, (r) => r);
  }

  orderId(orderId, token) async {
    var response = await crud.postData(
        "${AppLink.serverLink}/orders/$orderId",
        {
          "status": "confirmed",
        },
        token: token);
    return response.fold((l) => l, (r) => r);
  }

  Future getNotificationData(String usersId) async {
    var response = await crud
        .postData(AppLink.notification, {"user_id": usersId.toString()});
    return response.fold((l) => l, (r) => r);
  }

  Future addImage(String token, String category, String text, String type,
      File myFile) async {
    var response = await crud.postRequestWithFiles(
        "${AppLink.serverLink}/messages/$category",
        {
          // "content": text,
          "type": type,
        },
        myFile,
        "file",
        token: token);
    return response;
  }

  Future addAudio(String token, String category, String text, String type,
      File myFile) async {
    var response = await crud.postRequestWithFiles(
        "${AppLink.serverLink}/messages/$category",
        {
          // "content": text,
          "type": type,
        },
        myFile,
        "file",
        token: token);
    return response;
  }
}

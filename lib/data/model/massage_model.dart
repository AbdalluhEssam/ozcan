class MassageModel {
  String? conversationId;
  String? adminId;
  String? usersId;
  String? senderId;
  String? text;
  String? createAt;

  MassageModel(
      {this.conversationId,
        this.adminId,
        this.usersId,
        this.senderId,
        this.text,
        this.createAt});

  MassageModel.fromJson(Map<String, dynamic> json) {
    conversationId = json['conversation_id'].toString();
    adminId  = json['admin_id'].toString();
    usersId  = json['users_id'].toString();
    usersId = json['senderId'].toString();
    text = json['text'];
    createAt = json['createAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['conversation_id'] = this.conversationId;
    data['admin_id'] = this.adminId;
    data['users_id'] = this.usersId;
    data['senderId'] = this.senderId;
    data['text'] = this.text;
    data['createAt'] = this.createAt;
    return data;
  }
}
// class MassageBotModel {
//   String? id;
//   String? from;
//   String? to;
//   String? message;
//   String? isRead;
//   String? createdAt;
//   String? updatedAt;
//
//   MassageBotModel(
//       {this.id,
//         this.from,
//         this.to,
//         this.message,
//         this.isRead,
//         this.createdAt,
//         this.updatedAt});
//
//   MassageBotModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'].toString();
//     from = json['from'].toString();
//     to = json['to'].toString();
//     message = json['message'];
//     isRead = json['is_read'].toString();
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['from'] = this.from;
//     data['to'] = this.to;
//     data['message'] = this.message;
//     data['is_read'] = this.isRead;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }
class MassageBotModel {
  int? id;
  int? ticketId;
  String? description;
  String? attachments;
  String? sender;
  String? createdAt;
  String? updatedAt;

  MassageBotModel(
      {this.id,
        this.ticketId,
        this.description,
        this.attachments,
        this.sender,
        this.createdAt,
        this.updatedAt});

  MassageBotModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ticketId = json['ticket_id'];
    description = json['description'];
    attachments = json['attachments'];
    sender = json['sender'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ticket_id'] = this.ticketId;
    data['description'] = this.description;
    data['attachments'] = this.attachments;
    data['sender'] = this.sender;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}


class Messages {
  int? id;
  int? ticketId;
  String? description;
  String? attachments;
  String? sender;
  String? createdAt;
  String? updatedAt;

  Messages(
      {this.id,
        this.ticketId,
        this.description,
        this.attachments,
        this.sender,
        this.createdAt,
        this.updatedAt});

  Messages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ticketId = json['ticket_id'];
    description = json['description'];
    attachments = json['attachments'];
    sender = json['sender'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ticket_id'] = this.ticketId;
    data['description'] = this.description;
    data['attachments'] = this.attachments;
    data['sender'] = this.sender;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}


class UserTicketsModel {
  int? id;
  String? ticketId;
  String? name;
  String? email;
  int? category;
  int? priority;
  String? subject;
  String? status;
  String? description;
  String? createdBy;
  String? attachments;
  Null? resloveAt;
  Null? note;
  String? createdAt;
  String? updatedAt;

  UserTicketsModel(
      {this.id,
        this.ticketId,
        this.name,
        this.email,
        this.category,
        this.priority,
        this.subject,
        this.status,
        this.description,
        this.createdBy,
        this.attachments,
        this.resloveAt,
        this.note,
        this.createdAt,
        this.updatedAt});

  UserTicketsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ticketId = json['ticket_id'];
    name = json['name'];
    email = json['email'];
    category = json['category'];
    priority = json['priority'];
    subject = json['subject'];
    status = json['status'];
    description = json['description'];
    createdBy = json['created_by'];
    attachments = json['attachments'];
    resloveAt = json['reslove_at'];
    note = json['note'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ticket_id'] = this.ticketId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['category'] = this.category;
    data['priority'] = this.priority;
    data['subject'] = this.subject;
    data['status'] = this.status;
    data['description'] = this.description;
    data['created_by'] = this.createdBy;
    data['attachments'] = this.attachments;
    data['reslove_at'] = this.resloveAt;
    data['note'] = this.note;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

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
class Ticket {
  String category;
  String? msg;
  String reply;
  String send;
  String status;
  String t;
  String ticketId;
  String usr;

  Ticket({
    required this.category,
    required this.msg,
    required this.reply,
    required this.send,
    required this.status,
    required this.t,
    required this.ticketId,
    required this.usr,
  });

  // Named constructor to create a Ticket instance from a Map
  factory Ticket.fromJson(Map<String, dynamic> json) {
    return Ticket(
      category: json['category'].toString() ?? '', // Provide a default value if it's null
      msg: json['msg'].toString(),
      reply: json['reply'].toString() ?? '', // Provide a default value if it's null
      send: json['send'].toString() ?? '', // Provide a default value if it's null
      status: json['status'].toString() ?? '', // Provide a default value if it's null
      t: json['t'].toString() ?? '', // Provide a default value if it's null
      ticketId: json['ticketId'].toString() ?? '', // Provide a default value if it's null
      usr: json['usr'].toString() ?? '', // Provide a default value if it's null
    );
  }

  // Method to convert a Ticket instance to a Map
  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'msg': msg,
      'reply': reply,
      'send': send,
      'status': status,
      't': t,
      'ticketId': ticketId,
      'usr': usr,
    };
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
  String? id;
  String? ticketId;
  String? name;
  String? email;
  String? category;
  String? priority;
  String? subject;
  String? status;
  String? description;
  String? createdBy;
  String? attachments;
  String? resloveAt;
  String? note;
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
    id = json['id'].toString();
    ticketId = json['ticket_id'].toString();
    name = json['name'];
    email = json['email'];
    category = json['category'].toString();
    priority = json['priority'].toString();
    subject = json['subject'].toString();
    status = json['status'].toString();
    description = json['description'];
    createdBy = json['created_by'].toString();
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

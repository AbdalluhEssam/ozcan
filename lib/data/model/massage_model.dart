class ConversationsModel {
  String? id;
  String? senderId;
  String? senderUsername;
  String? content;
  String? type;
  String? file;
  String? created;
  String? conversation_id;
  String? orderId;
  String? orderStatus;

  ConversationsModel(
      {this.id,
        this.senderId,
        this.senderUsername,
        this.content,
        this.type,
        this.file,
        this.conversation_id,
        this.orderId,
        this.orderStatus,
        this.created});

  ConversationsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    senderId = json['sender_id'].toString();
    senderUsername = json['sender_username'].toString();
    content = json['content'].toString();
    type = json['type'].toString();
    file = json['file'].toString();
    created = json['created'].toString();
    conversation_id = json['conversation_id'].toString();
    orderStatus = json['order_status'].toString();
    orderId = json['order_id'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sender_id'] = this.senderId;
    data['sender_username'] = this.senderUsername;
    data['content'] = this.content;
    data['type'] = this.type;
    data['file'] = this.file;
    data['created'] = this.created;
    data['conversation_id'] = this.conversation_id;
    data['order_id'] = this.orderId;
    data['order_status'] = this.orderStatus;
    return data;
  }
}


class Conversation {
  String? id;
  String? categoryId;
  String? userId;
  String? currentAdminId;
  String? lastMessageId;
  String? status;
  String? createdAt;
  String? updatedAt;

  Conversation(
      {this.id,
        this.categoryId,
        this.userId,
        this.currentAdminId,
        this.lastMessageId,
        this.status,
        this.createdAt,
        this.updatedAt});

  Conversation.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    categoryId = json['category_id'].toString();
    userId = json['user_id'].toString();
    currentAdminId = json['current_admin_id'].toString();
    lastMessageId = json['last_message_id'].toString();
    status = json['status'].toString();
    createdAt = json['created_at'].toString();
    updatedAt = json['updated_at'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['user_id'] = this.userId;
    data['current_admin_id'] = this.currentAdminId;
    data['last_message_id'] = this.lastMessageId;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

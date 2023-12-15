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
class MassageBotModel {
  String? id;
  String? from;
  String? to;
  String? message;
  String? isRead;
  String? createdAt;
  String? updatedAt;

  MassageBotModel(
      {this.id,
        this.from,
        this.to,
        this.message,
        this.isRead,
        this.createdAt,
        this.updatedAt});

  MassageBotModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    from = json['from'].toString();
    to = json['to'].toString();
    message = json['message'];
    isRead = json['is_read'].toString();
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['from'] = this.from;
    data['to'] = this.to;
    data['message'] = this.message;
    data['is_read'] = this.isRead;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

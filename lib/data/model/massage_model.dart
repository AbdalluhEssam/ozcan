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
    conversationId = json['conversation_id'];
    adminId  = json['admin_id'];
    adminId  = json['users_id'];
    usersId = json['senderId'];
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

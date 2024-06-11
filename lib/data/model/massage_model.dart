class ConversationsModel {
  int? id;
  int? senderId;
  String? senderUsername;
  String? content;
  String? type;
  Null? file;
  String? created;

  ConversationsModel(
      {this.id,
        this.senderId,
        this.senderUsername,
        this.content,
        this.type,
        this.file,
        this.created});

  ConversationsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    senderId = json['sender_id'];
    senderUsername = json['sender_username'];
    content = json['content'];
    type = json['type'];
    file = json['file'];
    created = json['created'];
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
    return data;
  }
}



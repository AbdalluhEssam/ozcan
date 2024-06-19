class NotificationModel {
  String? id;
  String? userName;
  String? userImage;
  String? topic;
  String? topicId;
  String? url;
  String? title;
  String? body;
  String? read;
  String? created;

  NotificationModel(
      {this.id,
        this.userName,
        this.userImage,
        this.topic,
        this.topicId,
        this.url,
        this.title,
        this.body,
        this.read,
        this.created});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    userName = json['user_name'].toString();
    userImage = json['user_image'].toString();
    topic = json['topic'].toString();
    topicId = json['topic_id'].toString();
    url = json['url'].toString();
    title = json['title'].toString();
    body = json['body'].toString();
    read = json['read'].toString();
    created = json['created'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_name'] = this.userName;
    data['user_image'] = this.userImage;
    data['topic'] = this.topic;
    data['topic_id'] = this.topicId;
    data['url'] = this.url;
    data['title'] = this.title;
    data['body'] = this.body;
    data['read'] = this.read;
    data['created'] = this.created;
    return data;
  }
}

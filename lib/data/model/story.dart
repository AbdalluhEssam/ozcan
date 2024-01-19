class StoryModel {
  String? count;
  String? userId;
  String? storyId;
  String? image;
  String? categoriesId;
  String? note;
  String? likes;
  String? video;
  String? createAt;

  StoryModel(
      {this.count,
        this.userId,
        this.storyId,
        this.image,
        this.categoriesId,
        this.note,
        this.likes,
        this.video,
        this.createAt});

  StoryModel.fromJson(Map<String, dynamic> json) {
    count = json['count'].toString();
    userId = json['user_id'].toString();
    storyId = json['story_id'].toString();
    image = json['image'].toString();
    categoriesId = json['categories_id'].toString();
    note = json['note'].toString();
    likes = json['likes'].toString();
    video = json['video'].toString();
    createAt = json['createAt'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['user_id'] = this.userId;
    data['story_id'] = this.storyId;
    data['image'] = this.image;
    data['categories_id'] = this.categoriesId;
    data['note'] = this.note;
    data['likes'] = this.likes;
    data['video'] = this.video;
    data['createAt'] = this.createAt;
    return data;
  }
}

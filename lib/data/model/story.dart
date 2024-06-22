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


class HighlightsModel {
  int? id;
  int? categoryId;
  String? type;
  String? note;
  String? mediaType;
  String? mediaPath;
  String? created;

  HighlightsModel(
      {this.id,
        this.categoryId,
        this.type,
        this.note,
        this.mediaType,
        this.mediaPath,
        this.created});

  HighlightsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    type = json['type'];
    note = json['note'];
    mediaType = json['media_type'];
    mediaPath = json['media_path'];
    created = json['created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['type'] = this.type;
    data['note'] = this.note;
    data['media_type'] = this.mediaType;
    data['media_path'] = this.mediaPath;
    data['created'] = this.created;
    return data;
  }
}


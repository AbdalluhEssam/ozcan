class ItemsModel {
  int? id;
  String? name;
  String? slug;
  int? categoryId;
  String? categoryName;
  int? isActive;
  String? image;
  String? description;

  ItemsModel(
      {this.id,
        this.name,
        this.slug,
        this.categoryId,
        this.categoryName,
        this.isActive,
        this.image,
        this.description});

  ItemsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    isActive = json['is_active'];
    image = json['image'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['is_active'] = this.isActive;
    data['image'] = this.image;
    data['description'] = this.description;
    return data;
  }
}

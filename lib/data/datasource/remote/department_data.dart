import '../../../core/class/crud.dart';
import '../../../likeapi.dart';

class DepartmentViewData {
  Crud crud;

  DepartmentViewData(this.crud);

  getData(String categoriesId) async {
    var response = await crud.postData(AppLink.departmentView, {
      "categories_id": categoriesId,
    });
    return response.fold((l) => l, (r) => r);
  }
  storyView(String categoriesId) async {
    var response = await crud.postData(AppLink.story, {
      "categories_id": categoriesId,
    });
    return response.fold((l) => l, (r) => r);
  }
  addLikes(String categoriesId) async {
    var response = await crud.postData(AppLink.updateLike, {
      "story_id": categoriesId,
    });
    return response.fold((l) => l, (r) => r);
  }
}

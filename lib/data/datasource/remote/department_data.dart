import 'package:get/get.dart';

import '../../../core/class/crud.dart';
import '../../../core/services/services.dart';
import '../../../likeapi.dart';

class DepartmentViewData {
  Crud crud;
  MyServices myServices = Get.find();

  DepartmentViewData(this.crud);

  getData(String categoriesId) async {
    var response = await crud.postData(AppLink.departmentView, {
      "categories_id": categoriesId,
    });
    return response.fold((l) => l, (r) => r);
  }

  getTicketData(String userId,String categoriesId) async {
    var response = await crud.postData("https://ozcan.almirsystem.com/chatapi/api/tikc/tick.php?crtby=$userId&category=$categoriesId", {
    });
    return response.fold((l) => l, (r) => r);
  }
  storyView(String categoriesId) async {
    var response = await crud.postData(AppLink.story, {
      "categories_id": categoriesId,
    });
    return response.fold((l) => l, (r) => r);
  }
  storyTop(String departmentId) async {
    var response = await crud.postData(AppLink.storyTop, {
      "department_id": departmentId,
    });
    return response.fold((l) => l, (r) => r);
  }
  addLike(String id) async {
    var response = await crud.postData(AppLink.addLike, {
      "user_id": myServices.sharedPreferences.getString("id"),
      "item_id": id,
    });
    return response.fold((l) => l, (r) => r);
  }
  deleteLike(String id) async {
    var response = await crud.postData(AppLink.deleteLikes, {
      "user_id": myServices.sharedPreferences.getString("id"),
      "item_id": id,
    });
    return response.fold((l) => l, (r) => r);
  }

  addLikeStory(String id) async {
    var response = await crud.postData(AppLink.addLikeStory, {
      "user_id": myServices.sharedPreferences.getString("id"),
      "story_id": id,
    });
    return response.fold((l) => l, (r) => r);
  }
  deleteLikeStory(String id) async {
    var response = await crud.postData(AppLink.deleteLikesStory, {
      "user_id": myServices.sharedPreferences.getString("id"),
      "story_id": id,
    });
    return response.fold((l) => l, (r) => r);
  }
}

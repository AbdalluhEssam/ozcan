

import '../../../core/class/crud.dart';
import '../../../likeapi.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);
  getData() async {
    var response = await crud.getData(AppLink.homePage, {});
    return response.fold((l) => l, (r) => r);
  }
  getCategoriesData() async {
    var response = await crud.getData(AppLink.categories, {});
    return response.fold((l) => l, (r) => r);
  }
  aboutUs(String aboutUs) async {
    var response = await crud.getData("${AppLink.aboutUs}?page_name=$aboutUs", {});
    return response.fold((l) => l, (r) => r);
  }

  infoData() async {
    var response = await crud.getData(AppLink.infoPage, {});
    return response.fold((l) => l, (r) => r);
  }
  getOffersData() async {
    var response = await crud.postData(AppLink.offers, {});
    return response.fold((l) => l, (r) => r);
  }
  search(String search) async {
    var response = await crud.postData(AppLink.search, {
      "search":search.toString()
    });
    return response.fold((l) => l, (r) => r);
  }
  Future getNotificationData(String usersId) async {
    var response = await crud
        .postData(AppLink.notification, {"user_id": usersId.toString()});
    return response.fold((l) => l, (r) => r);
  }
}


class SearchData {
  Crud crud;
  SearchData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.searchPage, {});
    return response.fold((l) => l, (r) => r);
  }
}

class SenpData {
  Crud crud;
  SenpData(this.crud);
  getData(String q) async {
    var response = await crud.postData(AppLink.senp, {"query": q.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
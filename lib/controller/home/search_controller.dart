import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/homedata.dart';

abstract class SearchController extends GetxController {
  initialData();

  getData(query);
}

class SearchControllerImp extends SearchController {
  MyServices myServices = Get.find();
  SearchData searchData = SearchData(Get.find());
  SenpData senpData = SenpData(Get.find());
  List search = [];
  List snap = [];

  late StatusRequest statusRequest;

  String? username;
  String? email;
  String? id;

  @override
  initialData() {
    username = myServices.sharedPreferences.getString("username");
    email = myServices.sharedPreferences.getString("email");
    id = myServices.sharedPreferences.getString("id");
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  Future getData(query) async {
    search.clear();
    statusRequest = StatusRequest.loading;
    var response = await searchData.getData(query);
    // print(
    //     "========================================================================$response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      search.addAll(response['data']);

      print(
          "search ============================================ ${search.length} =======================");
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
    return search;
  }
}

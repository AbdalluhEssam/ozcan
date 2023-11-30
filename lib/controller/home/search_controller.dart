import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/homedata.dart';


abstract class SearchController extends GetxController {
  initialData();
  getData();
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
  String? query;

  @override
  initialData() {
    username = myServices.sharedPreferences.getString("username");
    email = myServices.sharedPreferences.getString("email");
    id = myServices.sharedPreferences.getString("id");
  }

  @override
  void onInit() {
    getData();
    // suggestion(query!);
    initialData();
    super.onInit();
  }


  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await searchData.getData();
    // print(
    //     "========================================================================$response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        search.addAll(response['0']);

      } else {
        statusRequest = StatusRequest.failure;
      }
          print("search ============================================ ${search.length} =======================");

      }
    update();
  }


}

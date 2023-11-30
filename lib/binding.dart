import 'package:get/get.dart';
import 'controller/auth/signup_controller.dart';
import 'controller/cart/cart_controller.dart';
import 'controller/home/personinformation_controller.dart';
import 'controller/home/productdetalis_controller.dart';
import 'core/class/crud.dart';


class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
    Get.lazyPut(() => SignUpControllerImp(), fenix: true);
    Get.lazyPut(() => ProductDetailsControllerImp(), fenix: true);
    Get.lazyPut(() => PersonInfoControllerImp(), fenix: true);
    Get.lazyPut(() => CartControllerImp(), fenix: true);
  }
}

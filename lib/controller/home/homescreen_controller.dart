import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ozcan/view/screen/home/categories.dart';
import 'package:ozcan/view/screen/home/homePage.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/translatedordatabase.dart';
import '../../core/services/services.dart';
import '../../view/screen/home/settings.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentPage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int i = 0;
  MyServices myServices = Get.find();
  int currentIndex = 0;
  late StatusRequest statusRequest;
  List<Widget> listPage = [
    const HomePageView(),
    const CategoriesPage(),
    const Settings(),
  ];
  List bottomAppBar = [
    {"title": translateDataBase("الصفحة الرئسية", "Home"), "icon": Icons.home},
    {
      "title": translateDataBase("الاقسام", "Notifications"),
      "icon": Icons.category
    },
    {
      "title": translateDataBase("الاعدادات", "Settings"),
      "icon": Icons.settings
    },
  ];

  @override
  changePage(currentPage) {
    i = currentPage;
    update();
  }

  @override
  void onInit() {
    statusRequest = StatusRequest.success;
    super.onInit();
  }
}

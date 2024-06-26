import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:ozcan/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:ozcan/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:ozcan/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:ozcan/view/screen/auth/forgetpassword/verfiycode.dart';
import 'package:ozcan/view/screen/auth/login.dart';
import 'package:ozcan/view/screen/auth/signup.dart';
import 'package:ozcan/view/screen/auth/success_signup.dart';
import 'package:ozcan/view/screen/auth/verfiycodesignup.dart';
import 'package:ozcan/view/screen/cart/cartview.dart';
import 'package:ozcan/view/screen/cart/checkout.dart';
import 'package:ozcan/view/screen/chat/chats_details.dart';
import 'package:ozcan/view/screen/home/homeScreen.dart';
import 'package:ozcan/view/screen/home/items.dart';
import 'package:ozcan/view/screen/home/splash_screen.dart';
import 'package:ozcan/view/screen/home/stories.dart';
import 'package:ozcan/view/screen/home/storiesTop.dart';
import 'package:ozcan/view/screen/items/department.dart';
import 'package:ozcan/view/screen/items/department_ordeer.dart';
import 'package:ozcan/view/screen/items/productdetails.dart';
import 'package:ozcan/view/screen/language.dart';
import 'package:ozcan/view/screen/munesetting/aboutus.dart';
import 'package:ozcan/view/screen/munesetting/helppage.dart';
import 'package:ozcan/view/screen/munesetting/policy.dart';
import 'package:ozcan/view/screen/notification_screen.dart';
import 'package:ozcan/view/screen/onboarding.dart';
import 'package:ozcan/view/screen/orders/orderall.dart';
import 'package:ozcan/view/screen/orders/pending.dart';
import 'core/constant/routes.dart';
import 'core/middleware/mymiddleware.dart';


List<GetPage<dynamic>>? routes = [
  //Auth
  GetPage(
      name: "/", page: () => const OnBoarding(), middlewares: [MyMiddleWare()]),
  // GetPage(name: "/", page: () => const TestView()),
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.language, page: () => const Language()),
  GetPage(name: AppRoute.signup, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoute.successResetPassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(
      name: AppRoute.verfiyCodeSignUp, page: () => const VerfiyCodeSignUp()),
  GetPage(
      name: AppRoute.verfiyCodeResetPassword, page: () => const VerfiyCode()),

  //OnBoarding
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),

  GetPage(name: AppRoute.mySplashScreen, page: () => const MySplashScreen()),
  // HOME
  GetPage(name: AppRoute.homeScreen, page: () => const HomeScreen()),
  GetPage(name: AppRoute.departmentView, page: () => const DepartmentView()),
  GetPage(name: AppRoute.departmentOrderView, page: () => const DepartmentOrderView()),
  GetPage(name: AppRoute.departmentOrderAllView, page: () => const DepartmentOrderAllView()),
  GetPage(name: AppRoute.productDetails, page: () => const ProductDetails()),
  GetPage(name: AppRoute.storiesDepartment, page: () => const StoriesDepartment()),
  GetPage(name: AppRoute.storiesTopDepartment, page: () => const StoriesTopDepartment()),
  GetPage(name: AppRoute.chatsDetailsScreen, page: () => const ChatsDetailsScreen()),
  GetPage(name: AppRoute.notificationScreen, page: () => const NotificationScreen()),
  // GetPage(name: AppRoute.chatScreenWeb, page: () => const ChatScreenWeb()),
  GetPage(name: AppRoute.cart, page: () => const CartView()),
  GetPage(name: AppRoute.aboutUs, page: () => const AboutUs()),
  GetPage(name: AppRoute.helpPage, page: () => const HelpPage()),
  GetPage(name: AppRoute.itemsView, page: () => const ItemsView()),
  GetPage(name: AppRoute.checkOut, page: () => const CheckOut()),
  // GetPage(name: AppRoute.listItem, page: () => const ListCategoriesItems()),
  GetPage(name: AppRoute.policyReturn, page: () => const PolicyReturn()),
  // GetPage(name: AppRoute.search, page: () =>  SearchScreen()),
  // ORDERS
  GetPage(name: AppRoute.ordersPending, page: () => const OrdersPending()),
  GetPage(name: AppRoute.ordersAll, page: () => const OrdersAll()),
  GetPage(name: AppRoute.notificationScreen, page: () => const NotificationScreen()),

];

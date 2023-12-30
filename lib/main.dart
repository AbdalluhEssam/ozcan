import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'binding.dart';
import 'core/localization/changelocal.dart';
import 'core/localization/translation.dart';
import 'core/services/services.dart';
import 'firebase_options.dart';
import 'routes.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> _backgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  log("Message from background : ${message.notification?.body}");
}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
  await initFcm();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await initialServices();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    Get.toNamed(event.data['pagename']);
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Ozcan',
      locale: controller.language,
      theme: controller.appTheme,
      initialBinding: MyBinding(),
      // home:  PortfolioPage(),
      getPages: routes,
      // routes: routes,
    );
  }
}

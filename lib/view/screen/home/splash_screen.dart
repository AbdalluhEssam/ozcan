import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:ozcan/core/constant/color.dart';
import '../../../core/constant/routes.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen>  with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 4),
    vsync: this,
  )..repeat();
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void initState() {
    Future.delayed(Duration(seconds: 4)).then((value) {
      Get.toNamed(AppRoute.homeScreen);
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle:
        const SystemUiOverlayStyle(statusBarColor: AppColor.white,statusBarIconBrightness: Brightness.dark),
      ),
      body: SafeArea(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizeTransition(
              sizeFactor: _animation,
              axis: Axis.horizontal,
              axisAlignment: 0.0123456789,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  //color: Colors.pink,
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.height * 0.18,
                  child: Image(
                    image: AssetImage("assets/images/1.png"),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            SpinKitSpinningLines(
              color: Colors.black,
              size: 35,
              controller: AnimationController(
                  vsync: this, duration: const Duration(milliseconds: 1200)),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class Splash_screen extends StatefulWidget {
  const Splash_screen({super.key});

  @override
  State<Splash_screen> createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 8),
    vsync: this,
  )..repeat();
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void initState() {
    Future.delayed(Duration(seconds: 8)).then((value) {
      Get;
      print("sucess");
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
      body: Column(
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
                  image: AssetImage("images/1.png"),
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
    );
  }
}

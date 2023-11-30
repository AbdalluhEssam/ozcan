import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ozcan/Constants.dart';
import 'package:ozcan/view/widget/home/department_widget.dart';
import 'package:ozcan/view/widget/view/Baio_user_home.dart';
import 'package:ozcan/View/Call_us_home.dart';
import 'package:ozcan/view/widget/view/Ozcan_home.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'Chat_home.dart';
import 'Creat_new_stories_home.dart';

class BottomNav_home extends StatefulWidget {
  const BottomNav_home({super.key});

  @override
  State<BottomNav_home> createState() => _BottomNav_homeState();
}

class _BottomNav_homeState extends State<BottomNav_home> {
  @override
  Widget build(BuildContext context) {
    List<Widget> _buildScreens() {
      return [
        Call_us_home(),
        Ozcan_home(),
      ];
    }

    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: Icon(Icons.support_agent_sharp),
          title: ("من نحن"),
          activeColorPrimary: Colors.grey,
          inactiveColorPrimary: Colors.black,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.menu),
          title: ("القائمة"),
          activeColorPrimary: Colors.grey,
          inactiveColorPrimary: Colors.black,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.home),
          title: ("الرئيسية"),
          activeColorPrimary: Colors.grey,
          inactiveColorPrimary: Colors.black,
        ),
      ];
    }

    PersistentTabController _controller;

    _controller = PersistentTabController(initialIndex: 2);
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      // Default is Colors.white.
      handleAndroidBackButtonPress: true,
      // Default is true.
      resizeToAvoidBottomInset: true,
      // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true,
      // Default is true.
      hideNavigationBarWhenKeyboardShows: true,
      // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style6, // Choose the nav bar style with this property.
    );
  }
}

class Ozcan_home extends StatefulWidget {
  const Ozcan_home({super.key});

  @override
  State<Ozcan_home> createState() => _Ozcan_homeState();
}

class _Ozcan_homeState extends State<Ozcan_home> {
  final List<String> images = [
    'images/35.jpg',
    'images/35.jpg',
  ];

  final List<String> places = [
    '35',
    '35',
  ];

  List<Widget> genarateImagesTiles() {
    return images
        .map((element) => ClipRRect(
              child: Image.asset(
                element,
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              borderRadius: BorderRadius.circular(15.0),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            // Get.to(Choose_your_department());
            print("success");
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.2,
          //color: Colors.pink,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icons_images_home(
                photo: "images/5.png",
                ontap: () {
                  Get.to(Chat_home());
                  print("success");
                },
              ),
              Container(
                //width: MediaQuery.of(context).size.width * 0.115,
                //height: MediaQuery.of(context).size.height * 0.1,
                //color: Colors.green,
                child: IconButton(
                  onPressed: () {
                    print("success");
                  },
                  icon: Image(
                    width: MediaQuery.of(context).size.width * 0.08,
                    height: MediaQuery.of(context).size.height * 0.03,
                    image: AssetImage("images/17.png"),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Spacer(),
              Baio_user_home(
                name_user: 'مرام احمد',
                Biao_user: 'صباح الخير',
              ),
              IconButton(
                  onPressed: () {
                    Get.to(Creat_new_stories_home());
                    print("success");
                  },
                  icon: Photo_user_home(
                    user_photo: "images/8.png",
                  )),

              // Image_user_home(
              //   photo: "images/8.png",
              //   ontap: () {
              //     Get.to(Creat_new_stories_home());
              //     print("success");
              //   },
              // ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.15,
              //color: Colors.green,
              child: SingleChildScrollView(
                reverse: true,
                scrollDirection: Axis.horizontal,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(
                    children: [
                      // StoresWidgetAfter(
                      //   photo: 'assets/images/8.png',
                      //   onTap: () {
                      //     // Get.to(Stories_users_home());
                      //     print("success");
                      //   },
                      // ),
                      // Astoris_users_home_before(
                      //   photo: 'images/8.png',
                      //   ontap: () {
                      //     print("success");
                      //   },
                      // ),
                      // Astoris_users_home_before(
                      //   photo: 'images/8.png',
                      //   ontap: () {
                      //     print("success");
                      //   },
                      // ),
                      // Astoris_users_home_before(
                      //   photo: 'images/8.png',
                      //   ontap: () {
                      //     print("success");
                      //   },
                      // ),
                      // Astoris_users_home_before(
                      //   photo: 'images/8.png',
                      //   ontap: () {
                      //     print("success");
                      //   },
                      // ),
                      // Astoris_users_home_before(
                      //   photo: 'images/8.png',
                      //   ontap: () {
                      //     print("success");
                      //   },
                      // ),
                    ],
                  ),
                ),
              ),
            ),
            Form_field_home(
              text: "ابحث هنا",
              photo1: 'images/18.png',
              photo2: 'images/19.png',
              ontap1: () {},
              ontap2: () {},
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "اظهار الكل",
                      style: Main_font1,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "العروض الخاصة",
                      style: Main_font2_home,
                    ),
                  ),
                ],
              ),
            ),
            MaterialButton(
              onPressed: () {},
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.21,
                decoration: BoxDecoration(
                  //color: Colors.pink,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Stack(
                  children: [
                    CarouselSlider(
                        items: genarateImagesTiles(),
                        options: CarouselOptions(
                          enlargeCenterPage: true,
                          autoPlay: true,
                          reverse: true,
                          //aspectRatio: 50/12,
                          height: MediaQuery.of(context).size.height * 0.196,
                        )),
                  ],
                ),
              ),
            ),
            // Container(
            //   width: MediaQuery.of(context).size.width,
            //   height: MediaQuery.of(context).size.height * 0.15,
            //   //color: Colors.green,
            //   child: MaterialButton(
            //     onPressed: () {},
            //     child: Image(
            //       image: AssetImage("images/10.png"),
            //       fit: BoxFit.contain,
            //     ),
            //   ),
            // ),
            Small_space(),

            Posts_ozcan_home(
              comment: () {},
              like: () {},
              save: () {},
              send: () {},
              photo: 'images/11.png',
              text1: 'عطور شانيل من احدث العطور واصدار',
              url: 'https://flutter.dev/',
            ),
            Small_space(),

            Posts_ozcan_home(
              comment: () {},
              like: () {},
              save: () {},
              send: () {},
              photo: 'images/11.png',
              text1: 'عطور شانيل من احدث العطور واصدار',
              url: 'https://flutter.dev/',
            ),

            Small_space(),
          ],
        ),
      ),
    );
  }
}

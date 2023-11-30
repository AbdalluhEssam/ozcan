import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../Constants.dart';
import 'widget/view/Welcome_1.dart';
import 'Call_us.dart';
import 'Search.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    List<Widget> _buildScreens() {
      return [
        Call_us(),
        Welcome_1(),
      ];
    }

    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: Icon(Icons.support_agent_sharp),
          title: ("من نحن"),
          activeColorPrimary: Colors.amber,
          inactiveColorPrimary: Colors.black,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.menu),
          title: ("القائمة"),
          activeColorPrimary: Colors.amber,
          inactiveColorPrimary: Colors.black,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.home),
          title: ("الرئيسية"),
          activeColorPrimary: Colors.amber,
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

class Welcome_1 extends StatefulWidget {
  const Welcome_1({super.key});

  @override
  State<Welcome_1> createState() => _Welcome_1State();
}

class _Welcome_1State extends State<Welcome_1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Center(
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.92,
                    decoration: BoxDecoration(
                        ),
                    child:
                        Stack(
                      children: [
                        ListWheelScrollView(
                          scrollBehavior: ScrollBehavior(
                              androidOverscrollIndicator:
                                  AndroidOverscrollIndicator.stretch),
                          //scrollBehavior: MaterialScrollBehavior(),
                          itemExtent: MediaQuery.of(context).size.height,
                          physics: FixedExtentScrollPhysics(),
                          perspective: 0.009,
                          diameterRatio: 5.5,
                          //offAxisFraction: -1.5,
                          //squeeze: 0.1,
                          //magnification: 200,
                          //renderChildrenOutsideViewport: true,
                          //useMagnifier: true,
                          //onSelectedItemChanged: (index) => showToast('Select items: ${ index + 1 }'),
                          children: [
                            PhotoProdects(
                              photo_prodect: 'images/39.webp',
                            ),
                            PhotoProdects(
                              photo_prodect: 'images/43.jpg',
                            ),
                            PhotoProdects(
                              photo_prodect: 'images/42.jpg',
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    //color: Colors.white,

                                    border: Border.all(
                                        width: 2, color: Colors.white)),
                                child: MaterialButton(
                                  onPressed: () {
                                    Get.to(Search());
                                    print("success");
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        " ... ابحث هنا",
                                        style: Fourth_font,
                                      )
                                    ],
                                  ),
                                ),
                                // child: TextFormField(
                                //   textAlign: TextAlign.end,
                                //   keyboardType: TextInputType.emailAddress,
                                //   style: TextStyle(
                                //       fontSize: 14,
                                //       color: Colors.black,
                                //       fontWeight: FontWeight.bold),
                                //   toolbarOptions: ToolbarOptions(
                                //       selectAll: true,
                                //       copy: true,
                                //       cut: true,
                                //       paste: true),
                                //   enabled: true,
                                //   focusNode: FocusNode(canRequestFocus: true),
                                //   cursorColor: Colors.white,
                                //   cursorHeight: 20,
                                //   cursorWidth: 3,
                                //   decoration: InputDecoration(
                                //       enabled: true,
                                //       focusedBorder: UnderlineInputBorder(
                                //         borderSide: BorderSide(
                                //           color: Colors.white,
                                //         ),
                                //       ),
                                //       border: UnderlineInputBorder(
                                //           borderRadius: BorderRadius.circular(10),
                                //           borderSide:
                                //               BorderSide(color: Colors.white)),
                                //       focusColor: Colors.white,
                                //       hintText: ("ابحث هنا.."),
                                //       hintStyle: TextStyle(
                                //         color: Colors.white,
                                //       )),
                                // ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.07,
                              //color: Colors.red,
                            ),
                          ],
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:cv_builder/Animations/Menu.dart';
import 'package:cv_builder/Bottom_Navigation/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class Zoom2 extends StatefulWidget {
  const Zoom2({Key? key}) : super(key: key);

  @override
  State<Zoom2> createState() => _ZoomState();
}

class _ZoomState extends State<Zoom2> {
  Menuitem currentItem = Menuitems.home;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: ZoomDrawer(
        openCurve: Curves.fastOutSlowIn,
        closeCurve: Curves.bounceIn,
        style: DrawerStyle.defaultStyle,
        slideWidth: MediaQuery.of(context).size.width * 0.65,
        androidCloseOnBackTap: true,
        angle: -1.0,
        showShadow: true,
        isRtl: false,
        moveMenuScreen: false,
        // drawerShadowsBackgroundColor: appColor,
        menuBackgroundColor: const Color.fromARGB(255, 255, 248, 221),
        menuScreen: Builder(builder: (context) {
          return Menu(
              currentItem: currentItem,
              onSelectedItem: (item) {
                setState(() {
                  currentItem = item;
                  ZoomDrawer.of(context)!.close();
                });
              });
        }),
        mainScreen: getScreen(),
      ),
    );
  }

  Widget getScreen() {
    switch (currentItem) {
      case Menuitems.home:
        return const BottomNavigation();
      case Menuitems.templates:
      default:
        return const BottomNavigation();
    }
  }
}

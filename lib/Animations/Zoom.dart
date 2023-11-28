import 'package:cv_builder/Animations/Menu.dart';
import 'package:cv_builder/presintation/Screens/home_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class Zoom extends StatefulWidget {
  const Zoom({Key? key}) : super(key: key);

  @override
  State<Zoom> createState() => _ZoomState();
}

class _ZoomState extends State<Zoom> {
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
        angle: 0.0,
        showShadow: true,
        isRtl: true,
        moveMenuScreen: false,
        drawerShadowsBackgroundColor: const Color(0xFFf4e6ae),
        menuBackgroundColor: Colors.lightBlue,
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
        return const HomeScreen();
      case Menuitems.templates:
      default:
        return const HomeScreen();
    }
  }
}

import 'package:cv_builder/Constants/myIcons.dart';
import 'package:cv_builder/Constants/strings.dart';
import 'package:cv_builder/presintation/Screens/home_Screen.dart';
import 'package:cv_builder/presintation/Screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int pageIndex = 0;
  final screenPages = [
    const HomeScreen(),
    const Profile(),
    const HomeScreen(),
  ];

  // final _textController = TextEditingController();

  Widget tit() {
    return SizedBox(
      height: 96,
      width: double.infinity,
      child: Row(
        //zmainAxisAlignment: MainAxisAlignment.start,
        children: [
          Builder(builder: (BuildContext context) {
            return SizedBox(
              width: 40,
              height: 40,
              child: IconButton(
                onPressed: () => ZoomDrawer.of(context)!.toggle(),
                iconSize: 24.0,
                //tooltip: 'search',
                color: backColor,
                icon: const Icon(Icons.menu),
                // icon: Image.asset(
                //   "images/menu.png",
                //   fit: BoxFit.cover,
                // ),
                // icon: const Icon(
                //   Icons.menu_rounded,
                //   color: Colors.black,
                // ),
              ),
            );
          }),

          const Text(
            'CV Builder',
            style: TextStyle(color: Colors.white),
          )

          // Container(
          //     //color: Colors.transparent,
          //     height: 48,
          //     width: MediaQuery.of(context).size.width / 1.13,
          //     decoration: BoxDecoration(
          //         border: Border.all(color: Colors.grey.shade300, width: 1),
          //         borderRadius: BorderRadius.circular(8)),
          //     child: TextField(
          //       controller: _textController,
          //       cursorColor: Colors.grey.shade300,
          //       decoration: InputDecoration(
          //         hintText: 'Search',
          //         icon: IconButton(
          //             onPressed: () {
          //               _textController.clear();
          //             },
          //             icon: Icon(
          //               Icons.search_rounded,
          //               color: Colors.grey.shade300,
          //             )),
          //         enabledBorder: const OutlineInputBorder(
          //             borderSide: BorderSide(color: Colors.transparent)),
          //         focusedBorder: const OutlineInputBorder(
          //             borderSide: BorderSide(color: Colors.transparent)),
          //       ),
          //     ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backColor,
        appBar: AppBar(
          toolbarHeight: 64,
          backgroundColor: appColor1,
          flexibleSpace: tit(),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(24),
            ),
          ),
        ),
        body: screenPages[pageIndex],
        bottomNavigationBar: Container(
          color: backColor,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: NavigationBarTheme(
              data: NavigationBarThemeData(
                  surfaceTintColor: backColor,
                  indicatorColor: backColor,
                  labelTextStyle: MaterialStateProperty.all(TextStyle(
                      color: textColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500))),
              child: NavigationBar(
                  backgroundColor: backColor,
                  labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
                  height: 48,
                  selectedIndex: pageIndex,
                  onDestinationSelected: (index) {
                    setState(() {
                      pageIndex = index;
                    });
                  },
                  destinations: [
                    NavigationDestination(
                      icon: const Icon(Icons.home_outlined),
                      label: 'Hone',
                      selectedIcon: Icon(
                        Icons.home,
                        color: textColor,
                      ),
                    ),
                    NavigationDestination(
                      icon: const Icon(Icons.person_2_outlined),
                      label: 'Profile',
                      selectedIcon: Icon(
                        Icons.person_2,
                        color: textColor,
                      ),
                    ),
                    NavigationDestination(
                      icon: const Icon(MyFlutterApp.slack),
                      label: 'Templates',
                      selectedIcon: Icon(
                        MyFlutterApp.slack,
                        color: textColor,
                      ),
                    ),
                  ]),
            ),
          ),
        ));
  }
}

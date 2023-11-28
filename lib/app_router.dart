import 'package:cv_builder/Animations/Zoom2.dart';
import 'package:cv_builder/Constants/strings.dart';

import 'package:cv_builder/presintation/Screens/home_Screen.dart';
import 'package:cv_builder/presintation/Screens/onBoarding_Screens.dart';
import 'package:cv_builder/presintation/Screens/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings) {
      // ignore: constant_pattern_never_matches_value_type
      case homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      // ignore: constant_pattern_never_matches_value_type
      case onbord:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreens());
      // ignore: constant_pattern_never_matches_value_type
      case zoom:
        return MaterialPageRoute(builder: (_) => const Zoom2());
      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}

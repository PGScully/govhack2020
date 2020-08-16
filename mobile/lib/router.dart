import 'package:flutter/material.dart';
import 'package:twp/not_implemented_screen.dart';
import 'package:twp/splash_screen.dart';
import 'package:twp/ui_auth/login_screen.dart';
import 'package:twp/ui_checkin/checkin_screen.dart';
import 'package:twp/ui_nearby/nearby_screen.dart';

const String splashRoute = '/';
const String loginRoute = 'login';
const String offersRoute = 'offers';
const String nearbyRoute = 'nearby';
const String checkinRoute = 'checkin';
const String progressRoute = 'progress';
const String redeemRoute = 'redeem';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute<dynamic>(builder: (_) => SplashScreen());

      case loginRoute:
        return MaterialPageRoute<dynamic>(builder: (_) => LoginScreen());

      case offersRoute:
        return MaterialPageRoute<dynamic>(
            builder: (_) => NotImplementedScreen());

      case nearbyRoute:
        return MaterialPageRoute<dynamic>(builder: (_) => NearbyScreen());

      case checkinRoute:
        {
          final int id = settings.arguments as int;
          return MaterialPageRoute<dynamic>(
              builder: (_) => CheckinScreen(id: id));
        }

      case progressRoute:
        return MaterialPageRoute<dynamic>(
            builder: (_) => NotImplementedScreen());

      case redeemRoute:
        return MaterialPageRoute<dynamic>(
            builder: (_) => NotImplementedScreen());

      default:
        return MaterialPageRoute<dynamic>(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}

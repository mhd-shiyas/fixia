import 'package:fixia_app/routes/routes_name.dart';
import 'package:fixia_app/view/screens/auth_screen.dart';
import 'package:fixia_app/view/screens/home_screen.dart';
import 'package:fixia_app/view/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        //var data = settings.arguments as String; //This line is used for arguments
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => const AuthScreen());
        case homeRoute:
        return MaterialPageRoute(builder: (_)=> HomeScreen());
      // case '/feed':
      // return MaterialPageRoute(builder: (_) => Feed());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}

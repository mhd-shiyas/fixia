import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fixia_app/constants/image_path.dart';
import 'package:fixia_app/view/screens/auth_screen.dart';
import 'package:fixia_app/view/screens/getstart_screen.dart';
import 'package:fixia_app/view/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FlutterSplashScreen.scale(
      backgroundColor: const Color(0xff00002C),
      childWidget: SizedBox(
        height: 100,
        child: Image.asset(
          ImagePath.fixiaWhiteLogo,
          fit: BoxFit.cover,
        ),
      ),
      duration: const Duration(milliseconds: 3000),
      animationDuration: const Duration(milliseconds: 1000),
      onAnimationEnd: () => debugPrint("On Scale End"),
      defaultNextScreen: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return HomeScreen();
            } else {
              return GetStartScreen();
            }
          }),
    ));
  }
}

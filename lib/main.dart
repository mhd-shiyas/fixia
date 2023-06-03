import 'package:fixia_app/routes/routers.dart';
import 'package:fixia_app/routes/routes_name.dart';
import 'package:fixia_app/view/screens/splash_screen.dart';
import 'package:flutter/material.dart';

import 'constants/app_strings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: Routers.generateRoute,
      initialRoute: homeRoute,
    );
  }
}

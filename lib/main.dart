
import 'package:diu_transit/Presentation_Layer/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'Screens/bus_list.dart';
import 'Screens/home_page.dart';
import 'Screens/login_page.dart';
import 'Screens/registration_page.dart';
import 'Screens/bus_route.dart';
import 'Screens/splash_page.dart';
import 'Screens/user_select.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor:ColorManager.primary),
        useMaterial3: true,
      ),
      home:  SplashScreen(),
    );
  }
}

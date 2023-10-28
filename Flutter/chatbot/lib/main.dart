import 'package:chatbot/Screens/home/Home.dart';
import 'package:chatbot/Screens/home/WelcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:chatbot/Constants/constants.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

void main() {
  runApp(GetMaterialApp(
    title: title,
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    getPages: [
      // GetPage(name: '/', page: () => const SplashScreen()),
      GetPage(name: '/', page: () => const WelcomeScreen()),
      GetPage(
          name: '/home',
          page: () => const ChatScreen(),
          transition: Transition.rightToLeftWithFade,
          transitionDuration: const Duration(milliseconds: 700)),
    ],
  ));
}

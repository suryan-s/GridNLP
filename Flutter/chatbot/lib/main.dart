import 'package:chatbot/Screens/Home.dart';
import 'package:chatbot/Screens/SplashScreen.dart';
import 'package:chatbot/Screens/WelcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:chatbot/Constants/constants.dart';

void main() {
  runApp(GetMaterialApp(
    title: title,
    debugShowCheckedModeBanner: false,
    initialRoute: '/', // Set the initial route
    getPages: [
      GetPage(name: '/', page: () => const SplashScreen()),
      GetPage(name: '/home', page: () => const WelcomeScreen()),
      GetPage(name: '/chatscreen', page: () => const ChatScreen())
    ],
  ));
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/typingText.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      Get.offNamed('/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: TypingTextAnimation(
              text: "Welcome to GridNLP",
              style: TextStyle(fontSize: 24.0, color: Colors.white),
              duration: Duration(milliseconds: 100),
            ),
          ),
          const SizedBox(height: 40),
          LoadingAnimationWidget.twistingDots(
            leftDotColor: const Color(0xFF1A1A3F),
            rightDotColor: const Color(0xFFEA3799),
            size: 50,
          ),
        ],
      ),
    );
  }
}

import 'dart:async';
import 'package:flutter/material.dart';

class TypingTextAnimation extends StatefulWidget {
  final String text;
  final TextStyle style;
  final Duration duration;

  const TypingTextAnimation({super.key, 
    required this.text,
    this.style = const TextStyle(fontSize: 16.0, color: Colors.black),
    this.duration = const Duration(milliseconds: 100),
  });

  @override
  _TypingTextAnimationState createState() => _TypingTextAnimationState();
}

class _TypingTextAnimationState extends State<TypingTextAnimation> {
  String displayedText = '';
  int currentIndex = 0;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(widget.duration, _typeText);
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void _typeText(Timer timer) {
    if (currentIndex <= widget.text.length) {
      setState(() {
        displayedText = widget.text.substring(0, currentIndex);
        currentIndex++;
      });
    } else {
      timer.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      displayedText,
      style: widget.style,
    );
  }
}


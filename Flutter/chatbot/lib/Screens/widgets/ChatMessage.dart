import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final bool isUser;

  ChatMessage({
    Key? key,
    required this.text,
    required this.backgroundColor,
    required this.isUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Align(
        alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
        child: Row(
          mainAxisAlignment:
          isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!isUser)
              Container(
                width: 30, // Adjust the size as needed
                height: 30, // Adjust the size as needed
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFEA3799), // Customize the color for bots
                ),
                child: const Icon(Icons.android,
                    color: Colors.white, size: 20), // Customize the icon
              ),
            if (!isUser)
              const SizedBox(width: 8), // Spacing between icon and message
            Flexible(
              child: Container(
                // margin: const EdgeInsets.only(top: 8, bottom: 8),
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(isUser ? 12 : 0),
                    topRight: Radius.circular(isUser ? 0 : 12),
                    bottomLeft: const Radius.circular(12),
                    bottomRight: const Radius.circular(12),
                  ),
                ),
                child: Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    overflow: TextOverflow.clip,
                  ),
                ),
              ),
            ),
            if (isUser)
              const SizedBox(width: 8), // Spacing between icon and message
            if (isUser)
                Container(
                  width: 30, // Adjust the size as needed
                  height: 30, // Adjust the size as needed
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF1A1A3F), // Customize the color for users
                  ),
                  child: const Icon(Icons.person,
                      color: Colors.white, size: 20), // Customize the icon
                ),
          ],
        ),
      ),
    );
  }
}

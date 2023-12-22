import 'dart:convert';

import 'package:chatbot/Constants/constants.dart';
import 'package:chatbot/Screens/widgets/ChatMessage.dart';
import 'package:chatbot/Screens/widgets/Drawer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  ChatScreenState createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> _messages = [];
  final TextEditingController _textController = TextEditingController();
  bool isFilled = false;
  bool isWaiting = false;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      backgroundColor: primaryColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: primaryColor,
          elevation: 0,
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      drawer: const AppDrawer(),
      body: Stack(
        children: [
          Container(
            decoration:  BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [scaffoldBackgroundColor, cardColor],
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  color: primaryColor,
                  child: ListView.builder(
                    controller: _scrollController,
                    reverse: true,
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                        final reversedIndex = _messages.length - 1 - index;
                        return _messages[reversedIndex];
                    },
                  ),
                ),
              ),
              _buildMessageComposer(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMessageComposer() {
    return Container(
      padding: const EdgeInsets.all(12.0),
      color: primaryColor,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                color: const Color(0xFF1A1A3F),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            isFilled = value.isNotEmpty;
                          });
                        },
                        maxLines: null,
                        controller: _textController,
                        decoration: const InputDecoration(
                          hintText: "Start typing...",
                          hintStyle: TextStyle(color: Colors.white54),
                          border: InputBorder.none,
                        ),
                        style: const TextStyle(color: Colors.white54),
                        onSubmitted: _handleSubmitted,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          Container(
            decoration: BoxDecoration(
              color: isFilled
                  ? const Color(0xFFEA3799)
                  : const Color(0xFF1A1A3F),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.send_rounded,
                color: Colors.white54,
              ),
              onPressed: () => _handleSubmitted(_textController.text),
            ),
          ),
        ],
      ),
    );
  }

  void _handleSubmitted(String text) async {
    _textController.clear();
    ChatMessage message = ChatMessage(
      text: text.trim(),
      backgroundColor: Colors.redAccent,
      isUser: true,
    );
    setState(() {
      isWaiting = true;
      _messages.add(message);
    });

    _scrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );

    ChatMessage waitingMessage = ChatMessage(
      text: 'Loading...',
      backgroundColor: Colors.white70,
      isUser: false,
      isWaiting: true,
    );
    setState(() {
      _messages.add(waitingMessage);
    });

    final responseText = await _fetchResponseFromAPI(text);
    ChatMessage responseMessage = ChatMessage(
      text: responseText,
      backgroundColor: Colors.white70,
      isUser: false,
    );
    setState(() {
      isWaiting = false;
      _messages.removeLast();
      _messages.add(responseMessage);
    });
  }

  Future<String> _fetchResponseFromAPI(String text) async {
    final apiUrl = '${baseURL}chatbot/';
    final response = await http.get(
      Uri.parse('$apiUrl?question=$text'),
    );
    if (response.statusCode == 200) {
      final jsonResponseList = json.decode(response.body) as List;
      if (jsonResponseList.isNotEmpty) {
        final jsonResponse = jsonResponseList.first as Map<String, dynamic>;
        final answer = jsonResponse['response'];
        if (answer != null) {
          return answer;
        } else {
          return 'Response not found in JSON';
        }
      } else {
        return 'Empty JSON response';
      }
    } else {
      return 'Failed to fetch response from the API';
    }
  }

  Widget _loadingIndicator() {
    return Center(
      child: Row(
        children: [
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
            const SizedBox(width: 8), // Spacing between icon and message
          Flexible(
            child: Container(
              // margin: const EdgeInsets.only(top: 8, bottom: 8),
              padding: const EdgeInsets.all(12.0),
              decoration: const BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: const Text(
                'Loading...',
                style: TextStyle(
                  color: Colors.black,
                  overflow: TextOverflow.clip,
                ),
              ),
            ),
          ),
        ]
      ),
    );
  }

}

import 'package:flutter/material.dart';

class ChatMessages extends StatelessWidget {
  final List<Map<String, String>> messages;
  final bool isProcessing;

  ChatMessages({required this.messages, required this.isProcessing});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: false,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                String sender = messages[index].keys.first;
                String message = messages[index][sender]!;
                bool isUser = sender == "user";
                return Align(
                  alignment:
                      isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.all(30),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isUser
                          ? Colors.cyanAccent.withOpacity(0.7)
                          : const Color.fromARGB(121, 224, 224, 224),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      message,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                );
              },
            ),
          ),
          if (isProcessing)
            Column(
              children: [
                CircularProgressIndicator(color: Colors.cyanAccent),
                SizedBox(height: 10),
                Text("Loading...", style: TextStyle(fontSize: 18)),
              ],
            ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:secusight/Widgets/ChatMsg.dart';
import 'package:secusight/Widgets/MsgInput.dart';
import 'package:secusight/Functions/ChatFunctions.dart';

class UploadFiles extends StatefulWidget {
  @override
  _ReportUploadScreenState createState() => _ReportUploadScreenState();
}

class _ReportUploadScreenState extends State<UploadFiles> {
  List<Map<String, String>> messages = [];
  bool isProcessing = false;

  void _handleUserMessage(String message) {
    handleUserMessage(message, setState, messages, () {
      setState(() {
        isProcessing = true;
      });
    }, () {
      setState(() {
        isProcessing = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: screenWidth,
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Image.asset(
                    'assets/AppLogo.png',
                    height: 100,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Upload File',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Expanded(
              child:
                  ChatMessages(messages: messages, isProcessing: isProcessing),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: MessageInput(onSend: _handleUserMessage),
            ),
          ],
        ),
      ),
    );
  }
}

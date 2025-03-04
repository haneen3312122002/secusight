import 'package:flutter/material.dart';
import 'package:secusight/Widgets/ChatMsg.dart';
import 'package:secusight/Widgets/MsgInput.dart';
import 'package:secusight/Functions/ChatFunctions.dart';

class UploadFiles extends StatefulWidget {
  @override
  _ReportUploadScreenState createState() => _ReportUploadScreenState();
}

class _ReportUploadScreenState extends State<UploadFiles> {
  List<Map<String, String>> messages = []; //list of maps for msgs
  //def value:
  bool isProcessing =
      false; //if we have process such as: sending msg or process file
  //only define to send it to the msginput class and save it in onsend pas:
  void _handleUserMessage(String message) {
    //in chatmsgs file :
    //add msgs to the list and update the state
    //i send the pars to the function
    handleUserMessage(message, setState, messages, () {
      //onprocessingStart
      setState(() {
        isProcessing = true;
      }); //after finish the process:
    }, () {
      //onprocessingEnd
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
              child: MessageInput(
                  onSend: _handleUserMessage), //send the function as par
            ),
          ],
        ),
      ),
    );
  }
}

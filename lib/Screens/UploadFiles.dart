import 'package:flutter/material.dart';
import 'package:secusight/Functions/ScreenSize.dart';
import 'package:secusight/Widgets/ChatMsg.dart';
import 'package:secusight/Widgets/MsgInput.dart';
import 'package:secusight/Functions/ChatFunctions.dart';
import 'package:secusight/Screens/MyReports.dart';

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
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: EdgeInsets.only(left: 30, top: 20),
                width: 100,
                height: 100,
                child: IconButton(
                  icon:
                      Icon(Icons.history), // أيقونة تعبر عن التقارير التاريخية
                  tooltip: 'My Reports',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyReports()),
                    );
                  },
                ),
              ),
            ),
            if (messages.isEmpty)
              Expanded(
                flex: 7,
                child: Container(
                  alignment: Alignment.center,
                  // color: Colors.red,
                  // margin: EdgeInsets.all(2),
                  width: screenWidth,

                  // padding: EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/AppLogo.png',
                        height: ScreenSize.getHeight(context) * 0.3,
                        width: ScreenSize.getWidth(context) * 0.5,
                      ),
                    ],
                  ),
                ),
              ),
            Expanded(
              flex: 3,
              child: messages.isEmpty
                  ? SizedBox()
                  : ChatMessages(
                      messages: messages, isProcessing: isProcessing),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
              child: MessageInput(
                  onSend: _handleUserMessage), //send the function as par
            ),
          ],
        ),
      ),
    );
  }
}

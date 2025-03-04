import 'dart:async';
import 'package:flutter/material.dart';

void handleUserMessage(
  String message,
  Function setState,
  List<Map<String, String>> messages,
  Function onProcessingStart,
  Function onProcessingEnd,
) {
  setState(() {
    messages.add({"user": message}); //key: user, val:message
    onProcessingStart();
  });
  //after 3sec:
  Future.delayed(Duration(seconds: 3), () {
    //function
    setState(() {
      onProcessingEnd();
      messages.add({"bot": "تم تحليل التقرير. مستوى المخاطر: منخفض"});
    });
  });
}

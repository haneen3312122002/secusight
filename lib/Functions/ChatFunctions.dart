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
    messages.add({"user": message});
    onProcessingStart();
  });

  Future.delayed(Duration(seconds: 3), () {
    setState(() {
      onProcessingEnd();
      messages.add({"bot": "تم تحليل التقرير. مستوى المخاطر: منخفض"});
    });
  });
}

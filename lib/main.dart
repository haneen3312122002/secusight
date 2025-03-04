import 'package:flutter/material.dart';
import 'Screens/LogIn.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      // الوضع العادي (فاتح)
      themeMode: ThemeMode.system, // يحدد الثيم بناءً على إعدادات النظام
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor:
            const Color(0xFF1A1D2A), // تغيير خلفية التطبيق في الوضع الداكن
      ),
      home: const Login(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:secusight/Screens/UploadFiles.dart';

class AuthButtons extends StatelessWidget {
  const AuthButtons({super.key});

  void _handleLogin() {
    print('تم الضغط على تسجيل الدخول');
  }

  void _handleSignUp(BuildContext context) {
    print('تم الضغط على إنشاء حساب');
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => UploadFiles()));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.15,
          child: ElevatedButton(
            onPressed: _handleLogin,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent, // زر تسجيل الدخول شفاف
              foregroundColor: Colors.white, // لون النص
              padding: const EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: const BorderSide(color: Colors.cyanAccent, width: 2),
              ),
            ),
            child: const Text(
              'LogIn',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
        const SizedBox(width: 10),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.15,
          child: ElevatedButton(
            //when pressed call the function
            onPressed: () => _handleSignUp(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent, // زر إنشاء الحساب أزرق
              foregroundColor: Colors.white, // لون النص
              padding: const EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text(
              'SignUp',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}

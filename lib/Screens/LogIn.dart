import 'package:flutter/material.dart';
import 'package:secusight/Widgets/EPTextFields.dart';
import '../Widgets/AppLogo.dart';
import '../Widgets/AuthButtons.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: constraints.maxHeight * 0.1),
                  const AppLogo(),
                  SizedBox(height: constraints.maxHeight * 0.05),
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width *
                          0.9, // تحديد عرض الحقول بناءً على حجم الشاشة
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          //  borderRadius: BorderRadius.circular(15),
                          // color: Colors.grey[200],
                          ),
                      child: const EmailPasswordFields(),
                    ),
                  ),
                  SizedBox(height: constraints.maxHeight * 0.00001),
                  Center(
                    child: Container(
                      width: MediaQuery.of(context)
                          .size
                          .width, // تحديد عرض الحقول بناءً على حجم الشاشة
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          //  borderRadius: BorderRadius.circular(15),
                          // color: Colors.grey[200],
                          ),
                      child: const AuthButtons(),
                    ),
                  ),
                  SizedBox(height: constraints.maxHeight * 0.1),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

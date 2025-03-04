import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        constraints: const BoxConstraints(
          maxHeight: 250, // تحديد أقصى ارتفاع ممكن
          minHeight: 150, // تحديد الحد الأدنى للارتفاع
        ),
        width: double.infinity,
        child: Image.asset(
          'assets/AppLogo.png',
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            return const Center(
              child: Text(
                'تعذر تحميل الصورة',
                style: TextStyle(color: Colors.red),
              ),
            );
          },
        ),
      ),
    );
  }
}
